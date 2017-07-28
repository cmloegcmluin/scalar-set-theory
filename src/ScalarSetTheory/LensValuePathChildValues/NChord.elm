module ScalarSetTheory.LensValuePathChildValues.NChord exposing (nChordChildValuesGetter)

import List exposing (map, range)
import ScalarSetTheory.Lens.Lens exposing (Lens(EqualDivision))
import ScalarSetTheory.LensValuePathChildValues.LensValuePathChildValues exposing (LensValuePathChildValuesGetter)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (findLensValueStepInPath)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Utilities exposing (parseInt)
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


nChordChildValuesGetter : LensValuePathChildValuesGetter
nChordChildValuesGetter lensValuePath nChordSettingValues =
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

        childValuesMin =
            nChordMin

        childValuesMax =
            min edValue nChordMax

        childValues =
            range childValuesMin childValuesMax
    in
    map toString childValues
