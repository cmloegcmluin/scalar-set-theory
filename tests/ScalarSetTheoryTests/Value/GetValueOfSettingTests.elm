module ScalarSetTheoryTests.Value.GetValueOfSettingTests exposing (getValueOfSettingTests)

import Expect exposing (equal)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)
import ScalarSetTheory.Types.Lens exposing (Lens(..))
import ScalarSetTheory.Types.Setting exposing (Setting(..))
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)
import Test exposing (Test, describe, test)


getValueOfSettingTests : Test
getValueOfSettingTests =
    describe "get value of setting"
        [ test "when a lens has the requested setting set for it, returns the value it's set to" <|
            \() ->
                let
                    expected =
                        45

                    lensSettingValues =
                        LensSettingValues EqualDivision
                            [ SettingValue Min 33
                            , SettingValue Max 45
                            ]

                    actual =
                        getValueOfSetting lensSettingValues Max
                in
                equal expected actual
        , test "when a lens does not have the requested setting set for it, returns 0" <|
            \() ->
                let
                    expected =
                        0

                    lensSettingValues =
                        LensSettingValues EqualDivision
                            [ SettingValue Min 33
                            ]

                    actual =
                        getValueOfSetting lensSettingValues Max
                in
                equal expected actual
        ]
