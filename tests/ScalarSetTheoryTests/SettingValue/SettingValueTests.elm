module ScalarSetTheoryTests.SettingValue.SettingValueTests exposing (settingValueTests)

import Expect exposing (equal)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue, updateSettingValues)
import Test exposing (Test, describe, test)


settingValueTests : Test
settingValueTests =
    describe "update setting values"
        [ test "returns the setting values with the value updated for the requested setting" <|
            \() ->
                let
                    expected =
                        [ SettingValue Min 45
                        , SettingValue Max 55
                        ]

                    settingValues =
                        [ SettingValue Min 45
                        , SettingValue Max 56
                        ]

                    actual =
                        updateSettingValues settingValues Max 55
                in
                equal expected actual
        ]
