module Tests exposing (..)

import Expect
import ScalarSetTheory.Main exposing (main)
import ScalarSetTheoryTests.UpdateTests exposing (updateTests)
import ScalarSetTheoryTests.UtilitiesTests exposing (utilitiesTests)
import ScalarSetTheoryTests.ViewTests exposing (viewTests)
import Test exposing (..)


all : Test
all =
    describe "Scalar Set Theory Test Suite"
        [ viewTests
        , updateTests
        , utilitiesTests
        ]
