module ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath, LensValueStep, findLensValueStepInPath)

import ScalarSetTheory.Lens.Lens exposing (Lens)
import ScalarSetTheory.Utilities exposing (find)


type alias LensValueStep =
    { lens : Lens
    , value : String
    }


type alias LensValuePath =
    List LensValueStep


findLensValueStepInPath : Lens -> LensValuePath -> Maybe LensValueStep
findLensValueStepInPath lens lensValuePath =
    let
        stepIsForLens =
            \lensValueStep -> lensValueStep.lens == lens
    in
    find stepIsForLens lensValuePath
