module ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)

import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValues)
import ScalarSetTheory.Types.Lens exposing (Lens)


type alias LensSettingValues =
    { lens : Lens
    , settingValues : SettingValues
    }
