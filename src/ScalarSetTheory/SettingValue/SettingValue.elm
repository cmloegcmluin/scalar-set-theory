module ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue, SettingValues, updateSettingValues)

import List exposing (map)
import ScalarSetTheory.Setting.Setting exposing (Setting)


type alias SettingValue =
    { setting : Setting
    , value : Int
    }


type alias SettingValues =
    List SettingValue


maybeUpdateSettingValue : SettingValue -> Setting -> Int -> SettingValue
maybeUpdateSettingValue oldSettingValue settingToUpdate newValue =
    case oldSettingValue.setting == settingToUpdate of
        True ->
            { oldSettingValue | value = newValue }

        False ->
            oldSettingValue


updateSettingValues : SettingValues -> Setting -> Int -> SettingValues
updateSettingValues settingValues setting newValue =
    let
        updateTargetSettingValue =
            \oldSettingValue -> maybeUpdateSettingValue oldSettingValue setting newValue
    in
    map updateTargetSettingValue settingValues
