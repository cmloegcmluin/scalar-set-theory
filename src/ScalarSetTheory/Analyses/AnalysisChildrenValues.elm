module ScalarSetTheory.Analyses.AnalysisChildrenValues exposing (AnalysisChildrenValues)

import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSettings)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath)


type alias AnalysisChildrenValues =
    AnalysisValuePath -> AnalysisSettings -> List String
