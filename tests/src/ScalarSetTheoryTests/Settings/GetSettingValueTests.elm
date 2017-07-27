module ScalarSetTheoryTests.Settings.GetSettingValueTests exposing (getSettingValueTests)

import Expect exposing (equal)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision))
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Settings.GetSettingValue exposing (getValueOfSetting)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Settings.SettingValue exposing (SettingValue)
import Test exposing (Test, describe, test)


getSettingValueTests : Test
getSettingValueTests =
    describe "get value of setting"
        [ test "when an analysis has the requested setting set for it, returns the value it's set to" <|
            \() ->
                let
                    expected =
                        45

                    analysisSettingValues =
                        AnalysisSettingValues EqualDivision
                            [ SettingValue Min 33
                            , SettingValue Max 45
                            ]

                    actual =
                        getValueOfSetting analysisSettingValues Max
                in
                equal expected actual
        , test "when an analysis does not have the requested setting set for it, returns 0" <|
            \() ->
                let
                    expected =
                        0

                    analysisSettingValues =
                        AnalysisSettingValues EqualDivision
                            [ SettingValue Min 33
                            ]

                    actual =
                        getValueOfSetting analysisSettingValues Max
                in
                equal expected actual
        ]
