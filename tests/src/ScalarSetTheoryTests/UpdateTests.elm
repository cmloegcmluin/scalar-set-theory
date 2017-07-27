module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision, NChord))
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSettingValue))
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Settings.SettingValue exposing (SettingValue)
import ScalarSetTheory.Update exposing (update)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update"
        [ test "UpdateAnalysisSetting can update the min for an analysis" <|
            \() ->
                let
                    expected =
                        { activeAnalysisSettingValues =
                            [ { analysis = EqualDivision
                              , settingValues =
                                    [ SettingValue Min 5
                                    , SettingValue Max 7
                                    ]
                              }
                            , { analysis = NChord
                              , settingValues =
                                    [ SettingValue Min 4
                                    , SettingValue Max 6
                                    ]
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateAnalysisSettingValue Min 5 EqualDivision)
                            { activeAnalysisSettingValues =
                                [ { analysis = EqualDivision
                                  , settingValues =
                                        [ SettingValue Min 7
                                        , SettingValue Max 7
                                        ]
                                  }
                                , { analysis = NChord
                                  , settingValues =
                                        [ SettingValue Min 4
                                        , SettingValue Max 6
                                        ]
                                  }
                                ]
                            }
                in
                equal expected actual
        , test "UpdateAnalysisSetting can update the max for an analysis" <|
            \() ->
                let
                    expected =
                        { activeAnalysisSettingValues =
                            [ { analysis = EqualDivision
                              , settingValues =
                                    [ SettingValue Min 5
                                    , SettingValue Max 7
                                    ]
                              }
                            , { analysis = NChord
                              , settingValues =
                                    [ SettingValue Min 4
                                    , SettingValue Max 8
                                    ]
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateAnalysisSettingValue Max 8 NChord)
                            { activeAnalysisSettingValues =
                                [ { analysis = EqualDivision
                                  , settingValues =
                                        [ SettingValue Min 5
                                        , SettingValue Max 7
                                        ]
                                  }
                                , { analysis = NChord
                                  , settingValues =
                                        [ SettingValue Min 4
                                        , SettingValue Max 6
                                        ]
                                  }
                                ]
                            }
                in
                equal expected actual
        ]
