module ScalarSetTheory.Settings.SettingValue exposing (SettingValue, SettingValues, getSettingValue, updateSettingValues)

import List exposing (map)
import ScalarSetTheory.Settings.Setting exposing (Setting)
import ScalarSetTheory.Utilities exposing (find)


type alias SettingValue =
    { setting : Setting
    , value : Int
    }


type alias SettingValues =
    List SettingValue


getSettingValue : SettingValues -> Setting -> Maybe SettingValue
getSettingValue settingValues setting =
    let
        settingValueIsForSetting =
            \settingValue -> settingValue.setting == setting
    in
    find settingValueIsForSetting settingValues


updateSettingValues : SettingValues -> Setting -> Int -> SettingValues
updateSettingValues settingValues setting newValue =
    let
        updateTargetSettingValue =
            \oldSettingValue -> maybeUpdateSettingValue oldSettingValue setting newValue
    in
    map updateTargetSettingValue settingValues


maybeUpdateSettingValue : SettingValue -> Setting -> Int -> SettingValue
maybeUpdateSettingValue oldSettingValue settingToUpdate newValue =
    case oldSettingValue.setting == settingToUpdate of
        True ->
            { oldSettingValue | value = newValue }

        False ->
            oldSettingValue
