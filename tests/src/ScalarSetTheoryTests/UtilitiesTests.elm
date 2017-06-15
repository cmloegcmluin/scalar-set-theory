module ScalarSetTheoryTests.UtilitiesTests exposing (utilitiesTests)

import Expect exposing (equal)
import ScalarSetTheory.Utilities exposing (inclusiveCount, parseInt)
import Test exposing (Test, describe, test)


utilitiesTests : Test
utilitiesTests =
    describe "utilities"
        [ describe "parseInt"
            [ test "defaults to 0 if the string is not parseable as an int" <|
                \() ->
                    let
                        expected =
                            0

                        actual =
                            parseInt "four"
                    in
                    equal expected actual
            ]
        , describe "inclusiveCount"
            [ test "is inclusive" <|
                \() ->
                    let
                        expected =
                            4

                        actual =
                            inclusiveCount 3 6
                    in
                    equal expected actual
            ]
        ]
