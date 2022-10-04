module ScalarSetTheory.LensValuePathChildren.GetLensValuePathChildren exposing (getLensValuePathChildren)

import Debug exposing (toString)
import List exposing (length, map, range)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)
import ScalarSetTheory.Types.Setting exposing (Setting(..))
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


getLensValuePathChildren : LensValuePath -> LensSettingValues -> LensValuePathChildren
getLensValuePathChildren lensValuePath thisLensSettingValues =
    let
        lens =
            thisLensSettingValues.lens
    in
    case length lensValuePath of
        0 ->
            let
                thisLensSettingValuesMin =
                    getValueOfSetting thisLensSettingValues Min

                thisLensSettingValuesMax =
                    getValueOfSetting thisLensSettingValues Max

                firstLensRange =
                    range thisLensSettingValuesMin thisLensSettingValuesMax

                children =
                    map toString firstLensRange
            in
            LensValuePathChildren lens children

        _ ->
            let
                lensProperties =
                    getLensProperties lens

                lensValuePathChildrenGetter =
                    lensProperties.lensValuePathChildrenGetter
            in
            lensValuePathChildrenGetter lensValuePath thisLensSettingValues
