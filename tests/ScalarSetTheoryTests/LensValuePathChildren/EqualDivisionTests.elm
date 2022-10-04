module ScalarSetTheoryTests.LensValuePathChildren.EqualDivisionTests exposing (equalDivisionTests)

import Expect exposing (equal)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.EqualDivision exposing (equalDivisionChildrenGetter)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValueStep)
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)
import ScalarSetTheory.Types.Lens exposing (Lens(..))
import ScalarSetTheory.Types.Setting exposing (Setting(..))
import Test exposing (Test, describe, test)


equalDivisionTests : Test
equalDivisionTests =
    describe "equal division child values getter"
        [ test "when at the top of the lens value path, filters all but any equal division allowed by its setting values" <|
            \() ->
                let
                    expected =
                        LensValuePathChildren EqualDivision [ "2", "3", "4", "5", "6", "7", "8", "9" ]

                    lensValuePath =
                        []

                    equalDivisionSettingValues =
                        LensSettingValues EqualDivision [ SettingValue Min 2, SettingValue Max 9 ]

                    actual =
                        equalDivisionChildrenGetter lensValuePath equalDivisionSettingValues
                in
                equal expected actual
        , test "when underneath an n-chord value in the lens value path, filters all but equal divisions greater than that n-chord value (also still filters by equal division's setting values as always)" <|
            \() ->
                let
                    expected =
                        LensValuePathChildren EqualDivision [ "5", "6", "7", "8", "9" ]

                    lensValuePath =
                        [ LensValueStep NChord "5" ]

                    equalDivisionSettingValues =
                        LensSettingValues EqualDivision [ SettingValue Min 2, SettingValue Max 9 ]

                    actual =
                        equalDivisionChildrenGetter lensValuePath equalDivisionSettingValues
                in
                equal expected actual
        ]
