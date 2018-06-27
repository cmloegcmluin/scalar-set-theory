module ScalarSetTheory.Msg exposing (Msg(UpdateLensSettingValue))

import ScalarSetTheory.Types.Lens exposing (Lens)
import ScalarSetTheory.Types.Setting exposing (Setting)


type Msg
    = UpdateLensSettingValue Lens Setting Int
