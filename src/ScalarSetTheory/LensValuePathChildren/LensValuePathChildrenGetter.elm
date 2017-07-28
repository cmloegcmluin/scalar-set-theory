module ScalarSetTheory.LensValuePathChildren.LensValuePathChildrenGetter exposing (LensValuePathChildrenGetter)

import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)


type alias LensValuePathChildrenGetter =
    LensValuePath -> LensSettingValues -> List String
