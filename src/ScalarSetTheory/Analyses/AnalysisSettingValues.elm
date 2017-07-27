module ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Settings.SettingValue exposing (SettingValues)


type alias AnalysisSettingValues =
    { analysis : Analysis
    , settingValues : SettingValues
    }
