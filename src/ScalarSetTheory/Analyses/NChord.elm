module ScalarSetTheory.Analyses.NChord exposing (nChordsWithinAnalysisValuePath)

import List exposing (map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision))
import ScalarSetTheory.Analyses.AnalysisChildrenValuesGetter exposing (AnalysisChildrenValuesGetter)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (findAnalysisValueStepInPath)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Settings.SettingValue exposing (getSettingValue)
import ScalarSetTheory.Utilities exposing (parseInt)


nChordsWithinAnalysisValuePath : AnalysisChildrenValuesGetter
nChordsWithinAnalysisValuePath analysisValuePath nChordSetting =
    let
        maybeNChordMinSettingValue =
            getSettingValue nChordSetting.settings Min

        nChordMin =
            case maybeNChordMinSettingValue of
                Nothing ->
                    0

                Just nChordMinSettingValue ->
                    nChordMinSettingValue.value

        maybeNChordMaxSettingValue =
            getSettingValue nChordSetting.settings Max

        nChordMax =
            case maybeNChordMaxSettingValue of
                Nothing ->
                    99999

                Just nChordMaxSettingValue ->
                    nChordMaxSettingValue.value

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
