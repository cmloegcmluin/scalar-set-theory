module Tests exposing (..)

import Expect
import ScalarSetTheory.Main exposing (main)
import ScalarSetTheoryTests.Components.DropdownTests exposing (dropdownTests)
import ScalarSetTheoryTests.UpdateTests exposing (updateTests)
import ScalarSetTheoryTests.UtilitiesTests exposing (utilitiesTests)
import Test exposing (..)


all : Test
all =
    describe "Scalar Set Theory Test Suite"
        [ updateTests
        , utilitiesTests
        , dropdownTests
        ]
