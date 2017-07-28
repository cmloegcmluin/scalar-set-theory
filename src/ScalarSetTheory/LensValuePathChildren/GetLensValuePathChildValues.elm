module ScalarSetTheory.LensValuePathChildren.GetLensValuePathChildren exposing (getLensValuePathChildren)

import List exposing (length, map, range)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


getLensValuePathChildren : LensValuePath -> LensSettingValues -> LensValuePathChildren
getLensValuePathChildren lensValuePath thisLensSettingValues =
    let
        lens =
            thisLensSettingValues.lens

        children =
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

                        lensValuePathChildrenGetter =
                            lensProperties.lensValuePathChildrenGetter
                    in
                    lensValuePathChildrenGetter lensValuePath thisLensSettingValues
    in
    LensValuePathChildren lens children
