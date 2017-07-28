module ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)

import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.Setting.Setting exposing (Setting)
import ScalarSetTheory.Utilities exposing (find)


getValueOfSetting : LensSettingValues -> Setting -> Int
getValueOfSetting lensSettingValues setting =
    let
        settingValueIsForSetting =
            \settingValue -> settingValue.setting == setting

        maybeSettingValue =
            find settingValueIsForSetting lensSettingValues.settingValues
    in
    case maybeSettingValue of
        Nothing ->
            0

        Just settingValue ->
            settingValue.value
