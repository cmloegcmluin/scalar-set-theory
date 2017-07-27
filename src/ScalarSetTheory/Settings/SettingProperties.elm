module ScalarSetTheory.Settings.SettingProperties exposing (SettingProperties, getSettingProperties)

import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisMax, UpdateAnalysisMin))
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Settings.SettingUpdater exposing (SettingUpdater)


type alias SettingProperties =
    { name : String
    , field : AnalysisSetting -> Int
    , updater : SettingUpdater
    }


getSettingProperties : Setting -> SettingProperties
getSettingProperties setting =
    case setting of
        Min ->
            minProperties

        Max ->
            maxProperties


minProperties : SettingProperties
minProperties =
    { name = "min"
    , field = .min
    , updater = UpdateAnalysisMin
    }


maxProperties : SettingProperties
maxProperties =
    { name = "max"
    , field = .max
    , updater = UpdateAnalysisMax
    }
