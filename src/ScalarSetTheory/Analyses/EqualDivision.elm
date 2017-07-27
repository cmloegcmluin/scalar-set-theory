module ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionsWithinAnalysisValuePath)

import List exposing (map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(NChord))
import ScalarSetTheory.Analyses.AnalysisChildrenValuesGetter exposing (AnalysisChildrenValuesGetter)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (findAnalysisValueStepInPath)
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionsWithinAnalysisValuePath : AnalysisChildrenValuesGetter
equalDivisionsWithinAnalysisValuePath analysisValuePath equalDivisionSetting =
    let
        equalDivisionMin =
            equalDivisionSetting.min

        equalDivisionMax =
            equalDivisionSetting.max

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
