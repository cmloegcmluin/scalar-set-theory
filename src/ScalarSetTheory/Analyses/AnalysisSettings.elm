module ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)


type alias AnalysisSetting =
    { analysis : Analysis
    , min : Int
    , max : Int
    }


type alias AnalysisSettings =
    List AnalysisSetting
