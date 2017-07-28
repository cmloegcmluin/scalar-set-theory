module ScalarSetTheory.LensValuePathChildren.NChord exposing (nChordChildrenGetter)

import List exposing (map, range)
import ScalarSetTheory.Lens.Lens exposing (Lens(EqualDivision))
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildrenGetter)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (findLensValueStepInPath)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Utilities exposing (parseInt)
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


nChordChildrenGetter : LensValuePathChildrenGetter
nChordChildrenGetter lensValuePath nChordSettingValues =
    let
        nChordMin =
            getValueOfSetting nChordSettingValues Min

        nChordMax =
            getValueOfSetting nChordSettingValues Max

        -- and eventually other section values and their effects on the values for nChords here
        edValue =
            case findLensValueStepInPath EqualDivision lensValuePath of
                Just edLensValueStep ->
                    parseInt edLensValueStep.value

                Nothing ->
                    99999

        childrenMin =
            nChordMin

        childrenMax =
            min edValue nChordMax

        children =
            range childrenMin childrenMax
    in
    map toString children
