module ScalarSetTheoryTests.LensValueStep.LensValueStepTests exposing (lensValueStepTests)

import Expect exposing (equal)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValueStep, findLensValueStepInPath)
import ScalarSetTheory.Types.Lens exposing (Lens(..))
import Test exposing (Test, describe, test)


lensValueStepTests : Test
lensValueStepTests =
    describe "lens value step tests"
        [ test "when the value path contains a step with the sought lens, returns that step" <|
            \() ->
                let
                    expected =
                        Just (LensValueStep EqualDivision "76")

                    lensValuePath =
                        [ LensValueStep NChord "66"
                        , LensValueStep EqualDivision "76"
                        ]

                    actual =
                        findLensValueStepInPath EqualDivision lensValuePath
                in
                equal expected actual
        , test "when the value path does not contain a step with the sought lens, returns nothing" <|
            \() ->
                let
                    expected =
                        Nothing

                    lensValuePath =
                        [ LensValueStep NChord "66"
                        ]

                    actual =
                        findLensValueStepInPath EqualDivision lensValuePath
                in
                equal expected actual
        ]
