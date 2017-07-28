module ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren, LensValuePathChildrenGetter)

import ScalarSetTheory.Lens.Lens exposing (Lens)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)


type alias LensValuePathChildren =
    { lens : Lens
    , values : List String
    }


type alias LensValuePathChildrenGetter =
    LensValuePath -> LensSettingValues -> List String
