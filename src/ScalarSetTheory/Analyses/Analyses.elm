module ScalarSetTheory.Analyses.Analyses exposing (analysisChildrenValues, analysisNames, analysisRanges)

import List exposing (range)
import ScalarSetTheory.Analyses.Analysis exposing (..)
import ScalarSetTheory.Analyses.AnalysisChildrenValues exposing (AnalysisChildrenValues)
import ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionsWithinAnalysisValuePath)
import ScalarSetTheory.Analyses.NChord exposing (nChordsWithinAnalysisValuePath)


analysisNames : Analysis -> String
analysisNames analysis =
    case analysis of
        EqualDivision ->
            "equal division"

        NChord ->
            "n-chord"


analysisRanges : Analysis -> List Int
analysisRanges analysis =
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
