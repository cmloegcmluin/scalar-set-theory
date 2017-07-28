module ScalarSetTheoryTests.LensValuePathChildren.EqualDivisionTests exposing (equalDivisionTests)

import Expect exposing (equal)
import ScalarSetTheory.Lens.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.EqualDivision exposing (equalDivisionChildrenGetter)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValueStep)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)
import Test exposing (Test, describe, test)


equalDivisionTests : Test
equalDivisionTests =
    describe "equal division child values getter"
        [ test "gives the equal divisions which support the value for n-chord and other lenses that its within" <|
            \() ->
                let
                    expected =
                        LensValuePathChildren EqualDivision [ "3", "4", "5", "6", "7", "8", "9" ]

                    lensValuePath =
                        [ LensValueStep NChord "3" ]

                    equalDivisionSettingValues =
                        LensSettingValues EqualDivision [ SettingValue Min 2, SettingValue Max 9 ]

                    actual =
                        equalDivisionChildrenGetter lensValuePath equalDivisionSettingValues
                in
                equal expected actual
        , test "" <|
            \() ->
                let
                    expected =
                        ""

                    actual =
                        ""
                in
                equal expected actual
        ]
