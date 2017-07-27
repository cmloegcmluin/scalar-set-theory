module ScalarSetTheory.Analyses.AnalysisValuePathChildValues exposing (AnalysisValuePathChildValues)

import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath)


type alias AnalysisValuePathChildValues =
    AnalysisValuePath -> AnalysisSettingValues -> List String
