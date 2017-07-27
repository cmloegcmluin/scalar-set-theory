module ScalarSetTheory.Settings.GetSettingValue exposing (getValueOfSetting)

import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Settings.Setting exposing (Setting)
import ScalarSetTheory.Utilities exposing (find)


getValueOfSetting : AnalysisSettingValues -> Setting -> Int
getValueOfSetting analysisSettingValues setting =
    let
        settingValueIsForSetting =
            \settingValue -> settingValue.setting == setting

        maybeSettingValue =
            find settingValueIsForSetting analysisSettingValues.settingValues
    in
    case maybeSettingValue of
        Nothing ->
            0

        Just settingValue ->
            settingValue.value
