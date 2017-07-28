module ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)

import ScalarSetTheory.Lens.Lens exposing (Lens)


type alias LensValuePathChildren =
    { lens : Lens
    , values : List String
    }
