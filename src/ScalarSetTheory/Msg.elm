module ScalarSetTheory.Msg exposing (Msg(..))

import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)
import ScalarSetTheory.Types.Lens exposing (Lens)
import ScalarSetTheory.Types.Setting exposing (Setting)


type Msg
    = UpdateLensSettingValue Lens Setting Int
    | ToggleCollapsedLensValuePath LensValuePath
