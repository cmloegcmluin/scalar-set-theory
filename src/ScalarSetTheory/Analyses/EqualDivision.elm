module ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionChildValuesGetter)

import List exposing (map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(NChord))
import ScalarSetTheory.Analyses.AnalysisValuePathChildValues exposing (AnalysisValuePathChildValuesGetter)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (findAnalysisValueStepInPath)
import ScalarSetTheory.Settings.GetSettingValue exposing (getValueOfSetting)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionChildValuesGetter : AnalysisValuePathChildValuesGetter
equalDivisionChildValuesGetter analysisValuePath equalDivisionSettingValues =
    let
        equalDivisionMin =
            getValueOfSetting equalDivisionSettingValues Min

        equalDivisionMax =
            getValueOfSetting equalDivisionSettingValues Max

        -- and eventually other section values and their effects on the values for equal divisions here
        nChordValue =
            case findAnalysisValueStepInPath NChord analysisValuePath of
                Just nChordAnalysisValueStep ->
                    parseInt nChordAnalysisValueStep.value

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
