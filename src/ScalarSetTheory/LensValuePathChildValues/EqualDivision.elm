module ScalarSetTheory.LensValuePathChildValues.EqualDivision exposing (equalDivisionChildValuesGetter)

import List exposing (map, range)
import ScalarSetTheory.Lens.Lens exposing (Lens(NChord))
import ScalarSetTheory.LensValuePathChildValues.LensValuePathChildValues exposing (LensValuePathChildValuesGetter)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (findLensValueStepInPath)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Utilities exposing (parseInt)
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


equalDivisionChildValuesGetter : LensValuePathChildValuesGetter
equalDivisionChildValuesGetter lensValuePath equalDivisionSettingValues =
    let
        equalDivisionMin =
            getValueOfSetting equalDivisionSettingValues Min

        equalDivisionMax =
            getValueOfSetting equalDivisionSettingValues Max

        -- and eventually other section values and their effects on the values for equal divisions here
        nChordValue =
            case findLensValueStepInPath NChord lensValuePath of
                Just nChordLensValueStep ->
                    parseInt nChordLensValueStep.value

                Nothing ->
                    0

        childValuesMin =
            max equalDivisionMin nChordValue

        childValuesMax =
            equalDivisionMax

        childValues =
            range childValuesMin childValuesMax
    in
    map toString childValues
