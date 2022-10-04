module ScalarSetTheory.LensValuePathChildren.NChord exposing (nChordChildrenGetter)

import Debug exposing (toString)
import List exposing (map, range)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildrenGetter exposing (LensValuePathChildrenGetter)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (findLensValueStepInPath)
import ScalarSetTheory.Types.Lens exposing (Lens(..))
import ScalarSetTheory.Types.Setting exposing (Setting(..))
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

        childrenAsStrings =
            map toString children
    in
    LensValuePathChildren NChord childrenAsStrings
