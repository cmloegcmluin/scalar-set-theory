module ScalarSetTheory.Analyses.NChord exposing (nChordChildValues)

import List exposing (map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision))
import ScalarSetTheory.Analyses.AnalysisValuePathChildValues exposing (AnalysisValuePathChildValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (findAnalysisValueStepInPath)
import ScalarSetTheory.Settings.GetSettingValue exposing (getValueOfSetting)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Utilities exposing (parseInt)


nChordChildValues : AnalysisValuePathChildValues
nChordChildValues analysisValuePath nChordSettingValues =
    let
        nChordMin =
            getValueOfSetting nChordSettingValues Min

        nChordMax =
            getValueOfSetting nChordSettingValues Max

        -- and eventually other section values and their effects on the values for nChords here
        edValue =
            case findAnalysisValueStepInPath EqualDivision analysisValuePath of
                Just edAnalysisValueStep ->
                    parseInt edAnalysisValueStep.value

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
