module ScalarSetTheory.LensValuePathChildren.EqualDivision exposing (equalDivisionChildrenGetter)

import List exposing (map, range)
import ScalarSetTheory.Lens.Lens exposing (Lens(NChord))
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildrenGetter exposing (LensValuePathChildrenGetter)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (findLensValueStepInPath)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Utilities exposing (parseInt)
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


equalDivisionChildrenGetter : LensValuePathChildrenGetter
equalDivisionChildrenGetter lensValuePath equalDivisionSettingValues =
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

        childrenMin =
            max equalDivisionMin nChordValue

        childrenMax =
            equalDivisionMax

        children =
            range childrenMin childrenMax
    in
    map toString children
