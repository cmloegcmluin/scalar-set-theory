module ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Settings.SettingValue exposing (SettingValues)


type alias AnalysisSetting =
    { analysis : Analysis
    , settingValues : SettingValues
    }


type alias AnalysisSettings =
    List AnalysisSetting
