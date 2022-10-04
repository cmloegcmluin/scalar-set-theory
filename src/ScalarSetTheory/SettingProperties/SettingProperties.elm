module ScalarSetTheory.SettingProperties.SettingProperties exposing (SettingProperties, getSettingProperties)

import ScalarSetTheory.Types.Setting exposing (Setting(..))


type alias SettingProperties =
    { name : String
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
    }


maxProperties : SettingProperties
maxProperties =
    { name = "max"
    }
