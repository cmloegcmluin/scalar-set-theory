module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import ScalarSetTheory.Main exposing (..)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update"
        [ test "UpdateEdMin" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" } }

                    actual =
                        update (UpdateEdMin "5") { ed = { min = "7", max = "7" } }
                in
                equal expected actual
        , test "UpdateEdMax" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "11" } }

                    actual =
                        update (UpdateEdMax "11") { ed = { min = "5", max = "7" } }
                in
                equal expected actual
        ]
