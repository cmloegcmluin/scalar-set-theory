module ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings, defaultAnalysisSettings, getFirstAnalysisSetting, getNextAnalysisSetting)

import List exposing (head)
import Maybe exposing (withDefault)
import ScalarSetTheory.Analyses.Analysis exposing (..)
import ScalarSetTheory.Utilities exposing (find)


type alias AnalysisSetting =
    { analysis : Analysis
    , min : Int
    , max : Int
    }


type alias AnalysisSettings =
    List AnalysisSetting


getFirstAnalysisSetting : AnalysisSettings -> AnalysisSetting
getFirstAnalysisSetting analysisSettings =
    withDefault (AnalysisSetting EqualDivision 999999 999999) (head analysisSettings)


getNextAnalysisSetting : Analysis -> AnalysisSettings -> Maybe AnalysisSetting
getNextAnalysisSetting analysis analysisSettings =
    case analysisSettings of
        [] ->
            Nothing

        first :: rest ->
            if analysis == first.analysis then
                head rest
            else
                getNextAnalysisSetting analysis rest


defaultAnalysisSettings : AnalysisSettings
defaultAnalysisSettings =
    [ AnalysisSetting EqualDivision 3 3
    , AnalysisSetting NChord 2 100
    ]
