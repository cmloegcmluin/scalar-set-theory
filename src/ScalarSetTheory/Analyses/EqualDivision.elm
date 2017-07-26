module ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionsWithinAnalysisValuePath)

import List exposing (foldr, map, range)
import ScalarSetTheory.Analyses.Analysis exposing (..)
import ScalarSetTheory.Analyses.AnalysisChildrenValues exposing (AnalysisChildrenValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, findAnalysisValueStepInPath)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionsWithinAnalysisValuePath : AnalysisChildrenValues
equalDivisionsWithinAnalysisValuePath analysisValuePath equalDivisionSetting =
    let
        equalDivisionMin =
            equalDivisionSetting.min

        equalDivisionMax =
            equalDivisionSetting.max

        nChordValue =
            case findAnalysisValueStepInPath NChord analysisValuePath of
                Just nChordAnalysisValueStep ->
                    parseInt nChordAnalysisValueStep.value

                Nothing ->
                    0
    in
    map toString (range (max equalDivisionMin nChordValue) equalDivisionMax)
