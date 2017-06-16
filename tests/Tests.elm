module Tests exposing (..)

import Expect
import ScalarSetTheory.Main exposing (main)
import ScalarSetTheoryTests.Components.DropdownTests exposing (dropdownTests)
import ScalarSetTheoryTests.Components.TableHeaderTests exposing (tableHeaderTests)
import ScalarSetTheoryTests.Components.TableMaxRowTests exposing (tableMaxRowTests)
import ScalarSetTheoryTests.Components.TableMinRowTests exposing (tableMinRowTests)
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
        , dropdownTests
        , tableHeaderTests
        , tableMinRowTests
        , tableMaxRowTests
        ]
