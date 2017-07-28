module ScalarSetTheory.LensValuePathChildValues.GetLensValuePathChildValues exposing (getLensValuePathChildValues)

import List exposing (length, map, range)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildValues.LensValuePathChildValues exposing (LensValuePathChildValues)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


getLensValuePathChildValues : LensValuePath -> LensSettingValues -> LensValuePathChildValues
getLensValuePathChildValues lensValuePath thisLensSettingValues =
    let
        lens =
            thisLensSettingValues.lens

        childValues =
            case length lensValuePath of
                0 ->
                    let
                        thisLensSettingValuesMin =
                            getValueOfSetting thisLensSettingValues Min

                        thisLensSettingValuesMax =
                            getValueOfSetting thisLensSettingValues Max

                        firstLensRange =
                            range thisLensSettingValuesMin thisLensSettingValuesMax
                    in
                    map toString firstLensRange

                _ ->
                    let
                        lensProperties =
                            getLensProperties lens

                        lensValuePathChildValuesGetter =
                            lensProperties.lensValuePathChildValuesGetter
                    in
                    lensValuePathChildValuesGetter lensValuePath thisLensSettingValues
    in
    LensValuePathChildValues lens childValues
