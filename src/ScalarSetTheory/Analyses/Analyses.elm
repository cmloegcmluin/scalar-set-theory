module ScalarSetTheory.Analyses.Analyses exposing (analysisChildrenValues, analysisName, analysisRange)

import List exposing (range)
import ScalarSetTheory.Analyses.Analysis exposing (..)
import ScalarSetTheory.Analyses.AnalysisChildrenValues exposing (AnalysisChildrenValues)
import ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionsWithinAnalysisValuePath)
import ScalarSetTheory.Analyses.NChord exposing (nChordsWithinAnalysisValuePath)


analysisName : Analysis -> String
analysisName analysis =
    case analysis of
        EqualDivision ->
            "equal division"

        NChord ->
            "n-chord"


analysisRange : Analysis -> List Int
analysisRange analysis =
    case analysis of
        EqualDivision ->
            range 3 100

        NChord ->
            range 2 100


analysisChildrenValues : Analysis -> AnalysisChildrenValues
analysisChildrenValues analysis =
    case analysis of
        EqualDivision ->
            equalDivisionsWithinAnalysisValuePath

        NChord ->
            nChordsWithinAnalysisValuePath
