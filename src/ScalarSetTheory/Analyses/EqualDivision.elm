module ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionsWithinAnalysisValuePath)

import List exposing (foldr, map, range)
import ScalarSetTheory.Analyses.Analysis exposing (..)
import ScalarSetTheory.Analyses.AnalysisChildrenValues exposing (AnalysisChildrenValues)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSettings, getAnalysisSetting)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, findAnalysisValueStepInPath)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionsWithinAnalysisValuePath : AnalysisChildrenValues
equalDivisionsWithinAnalysisValuePath analysisValuePath analysisSettings =
    let
        edSetting =
            getAnalysisSetting EqualDivision analysisSettings

        edMin =
            edSetting.min

        edMax =
            edSetting.max

        nChordValue =
            case findAnalysisValueStepInPath NChord analysisValuePath of
                Just nChordAnalysisValueStep ->
                    parseInt nChordAnalysisValueStep.value

                Nothing ->
                    0
    in
    map toString (range (max edMin nChordValue) edMax)
