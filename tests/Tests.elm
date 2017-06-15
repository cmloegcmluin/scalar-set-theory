module Tests exposing (..)

import Expect
import ScalarSetTheory.Main exposing (main)
import ScalarSetTheoryTests.Components.TableHeaderTests exposing (tableHeaderTests)
import ScalarSetTheoryTests.Components.TableMaxRowTests exposing (tableMaxRowTests)
import ScalarSetTheoryTests.Components.TableMinRowTests exposing (tableMinRowTests)
import ScalarSetTheoryTests.Sections.EqualDivisionTests exposing (equalDivisionTests)
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
        , equalDivisionTests
        , tableHeaderTests
        , tableMinRowTests
        , tableMaxRowTests
        ]
