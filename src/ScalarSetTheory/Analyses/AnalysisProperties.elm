module ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)

import List exposing (range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision, NChord))
import ScalarSetTheory.Analyses.AnalysisChildrenValues exposing (AnalysisChildrenValues)
import ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionsWithinAnalysisValuePath)
import ScalarSetTheory.Analyses.NChord exposing (nChordsWithinAnalysisValuePath)


type alias AnalysisProperties =
    { name : String
    , ultimateMin : Int
    , ultimateMax : Int
    , initialMin : Int
    , initialMax : Int
    , childrenValues : AnalysisChildrenValues
    }


getAnalysisProperties : Analysis -> AnalysisProperties
getAnalysisProperties analysis =
    case analysis of
        EqualDivision ->
            equalDivisionProperties

        NChord ->
            nChordProperties


equalDivisionProperties : AnalysisProperties
equalDivisionProperties =
    { name = "equal division"
    , ultimateMin = 3
    , ultimateMax = 100
    , initialMin = 3
    , initialMax = 3
    , childrenValues = equalDivisionsWithinAnalysisValuePath
    }


nChordProperties : AnalysisProperties
nChordProperties =
    { name = "n-chord"
    , ultimateMin = 2
    , ultimateMax = 100
    , initialMin = 2
    , initialMax = 100
    , childrenValues = nChordsWithinAnalysisValuePath
    }
