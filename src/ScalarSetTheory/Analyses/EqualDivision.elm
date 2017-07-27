module ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionsWithinAnalysisValuePath)

import List exposing (map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(NChord))
import ScalarSetTheory.Analyses.AnalysisChildrenValuesGetter exposing (AnalysisChildrenValuesGetter)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (findAnalysisValueStepInPath)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Settings.SettingValue exposing (getSettingValue)
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionsWithinAnalysisValuePath : AnalysisChildrenValuesGetter
equalDivisionsWithinAnalysisValuePath analysisValuePath equalDivisionSetting =
    let
        maybeEqualDivisionMinSettingValue =
            getSettingValue equalDivisionSetting.settingValues Min

        equalDivisionMin =
            case maybeEqualDivisionMinSettingValue of
                Nothing ->
                    0

                Just equalDivisionMinSettingValue ->
                    equalDivisionMinSettingValue.value

        maybeEqualDivisionMaxSettingValue =
            getSettingValue equalDivisionSetting.settingValues Max

        equalDivisionMax =
            case maybeEqualDivisionMaxSettingValue of
                Nothing ->
                    0

                Just equalDivisionMaxSettingValue ->
                    equalDivisionMaxSettingValue.value

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
