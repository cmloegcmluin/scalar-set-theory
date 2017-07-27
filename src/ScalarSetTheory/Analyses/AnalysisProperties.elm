module ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision, NChord))
import ScalarSetTheory.Analyses.AnalysisValuePathChildValues exposing (AnalysisValuePathChildValues)
import ScalarSetTheory.Analyses.EqualDivision exposing (equalDivisionChildValues)
import ScalarSetTheory.Analyses.NChord exposing (nChordChildValues)


type alias AnalysisProperties =
    { name : String
    , ultimateMin : Int
    , ultimateMax : Int
    , initialMin : Int
    , initialMax : Int
    , analysisValuePathChildValues : AnalysisValuePathChildValues
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
    , analysisValuePathChildValues = equalDivisionChildValues
    }


nChordProperties : AnalysisProperties
nChordProperties =
    { name = "n-chord"
    , ultimateMin = 2
    , ultimateMax = 100
    , initialMin = 2
    , initialMax = 100
    , analysisValuePathChildValues = nChordChildValues
    }
