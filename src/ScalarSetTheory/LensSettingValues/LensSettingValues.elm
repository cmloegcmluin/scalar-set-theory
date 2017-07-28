module ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)

import ScalarSetTheory.Lens.Lens exposing (Lens)
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValues)


type alias LensSettingValues =
    { lens : Lens
    , settingValues : SettingValues
    }
