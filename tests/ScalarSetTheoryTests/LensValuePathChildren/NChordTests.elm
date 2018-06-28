module ScalarSetTheoryTests.LensValuePathChildren.NChordTests exposing (nChordTests)

import Expect exposing (equal)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValuePathChildren.NChord exposing (nChordChildrenGetter)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValueStep)
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)
import ScalarSetTheory.Types.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.Types.Setting exposing (Setting(Max, Min))
import Test exposing (Test, describe, test)


nChordTests : Test
nChordTests =
    describe "n-chord child values getter"
        [ test "gives the n-chords which support the value for equal division and other lenses that it is within" <|
            \() ->
                let
                    expected =
                        LensValuePathChildren NChord [ "2", "3", "4", "5" ]

                    lensValuePath =
                        [ LensValueStep EqualDivision "5" ]

                    nChordSettingValues =
                        LensSettingValues NChord [ SettingValue Min 2, SettingValue Max 9 ]

                    actual =
                        nChordChildrenGetter lensValuePath nChordSettingValues
                in
                equal expected actual
        ]
