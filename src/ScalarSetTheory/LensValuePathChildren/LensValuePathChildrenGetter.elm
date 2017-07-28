module ScalarSetTheory.LensValuePathChildren.LensValuePathChildrenGetter exposing (LensValuePathChildrenGetter)

import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)


type alias LensValuePathChildrenGetter =
    LensValuePath -> LensSettingValues -> LensValuePathChildren
