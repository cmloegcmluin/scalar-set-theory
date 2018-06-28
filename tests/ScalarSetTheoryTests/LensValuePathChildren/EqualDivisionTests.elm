module ScalarSetTheoryTests.LensValuePathChildren.EqualDivisionTests exposing (equalDivisionTests)

import Expect exposing (equal)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.EqualDivision exposing (equalDivisionChildrenGetter)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValueStep)
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)
import ScalarSetTheory.Types.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.Types.Setting exposing (Setting(Max, Min))
import Test exposing (Test, describe, test)


equalDivisionTests : Test
equalDivisionTests =
    describe "equal division child values getter"
        [ test "gives the equal divisions which support the value for n-chord and other lenses that it is within" <|
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
