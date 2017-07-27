module Tests exposing (all)

import Expect
import ScalarSetTheory.Main exposing (main)
import ScalarSetTheoryTests.Analyses.AnalysisValueStepTests exposing (analysisValueStepTests)
import ScalarSetTheoryTests.Analyses.EqualDivisionTests exposing (equalDivisionTests)
import ScalarSetTheoryTests.Analyses.NChordTests exposing (nChordTests)
import ScalarSetTheoryTests.Components.DropdownTests exposing (dropdownTests)
import ScalarSetTheoryTests.Settings.GetSettingValueTests exposing (getSettingValueTests)
import ScalarSetTheoryTests.Settings.SettingValueTests exposing (settingValueTests)
import ScalarSetTheoryTests.UpdateTests exposing (updateTests)
import ScalarSetTheoryTests.UtilitiesTests exposing (utilitiesTests)
import Test exposing (Test, describe)


all : Test
all =
    describe "Scalar Set Theory Test Suite"
        [ updateTests
        , utilitiesTests
        , dropdownTests
        , analysisValueStepTests
        , getSettingValueTests
        , settingValueTests
        , equalDivisionTests
        , nChordTests
        ]
