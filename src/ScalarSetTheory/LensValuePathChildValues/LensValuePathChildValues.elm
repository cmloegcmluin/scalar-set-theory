module ScalarSetTheory.LensValuePathChildValues.LensValuePathChildValues exposing (LensValuePathChildValues, LensValuePathChildValuesGetter)

import ScalarSetTheory.Lens.Lens exposing (Lens)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)


type alias LensValuePathChildValues =
    { lens : Lens
    , values : List String
    }


type alias LensValuePathChildValuesGetter =
    LensValuePath -> LensSettingValues -> List String
