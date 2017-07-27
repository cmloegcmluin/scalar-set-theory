module ScalarSetTheory.Analyses.AnalysisValuePathChildValues exposing (AnalysisValuePathChildValues, AnalysisValuePathChildValuesGetter)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath)


type alias AnalysisValuePathChildValues =
    { analysis : Analysis
    , values : List String
    }


type alias AnalysisValuePathChildValuesGetter =
    AnalysisValuePath -> AnalysisSettingValues -> List String
