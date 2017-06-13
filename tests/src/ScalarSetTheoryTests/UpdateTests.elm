module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (..)
import ScalarSetTheory.Main exposing (..)
import Test exposing (..)


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
                Expect.equal expected actual
        ]
