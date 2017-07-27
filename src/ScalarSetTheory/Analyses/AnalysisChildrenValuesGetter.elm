module ScalarSetTheory.Analyses.AnalysisChildrenValuesGetter exposing (AnalysisChildrenValuesGetter)

import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath)


type alias AnalysisChildrenValuesGetter =
    AnalysisValuePath -> AnalysisSettingValues -> List String
