module ScalarSetTheory.Analyses.AnalysisChildrenValuesGetter exposing (AnalysisChildrenValuesGetter)

import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath)


type alias AnalysisChildrenValuesGetter =
    AnalysisValuePath -> AnalysisSetting -> List String
