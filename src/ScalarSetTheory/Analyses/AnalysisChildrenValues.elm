module ScalarSetTheory.Analyses.AnalysisChildrenValues exposing (AnalysisChildrenValues)

import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath)


type alias AnalysisChildrenValues =
    AnalysisValuePath -> AnalysisSetting -> List String
