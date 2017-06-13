module Tests exposing (..)

import Expect
import ScalarSetTheory.Main exposing (main)
import Test exposing (..)


all : Test
all =
    describe "Scalar Set Theory Test Suite"
        [ test "true is true" <|
            \() ->
                Expect.equal True True
        ]
