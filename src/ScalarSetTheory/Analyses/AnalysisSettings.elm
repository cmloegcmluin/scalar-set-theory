module ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings, getNextAnalysisSetting)

import List exposing (head)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Utilities exposing (find)


type alias AnalysisSetting =
    { analysis : Analysis
    , min : Int
    , max : Int
    }


type alias AnalysisSettings =
    List AnalysisSetting


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
