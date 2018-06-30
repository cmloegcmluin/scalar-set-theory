module ScalarSetTheory.Msg exposing (Msg(ToggleCollapsedLensValuePath, UpdateLensSettingValue))

import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)
import ScalarSetTheory.Types.Lens exposing (Lens)
import ScalarSetTheory.Types.Setting exposing (Setting)


type Msg
    = UpdateLensSettingValue Lens Setting Int
    | ToggleCollapsedLensValuePath LensValuePath
