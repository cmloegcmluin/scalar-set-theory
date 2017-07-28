module ScalarSetTheory.Msg exposing (Msg(UpdateLensSettingValue))

import ScalarSetTheory.Lens.Lens exposing (Lens)
import ScalarSetTheory.Setting.Setting exposing (Setting)


type Msg
    = UpdateLensSettingValue Lens Setting Int
