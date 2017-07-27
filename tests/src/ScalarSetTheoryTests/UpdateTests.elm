module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision, NChord))
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSetting))
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
                        { analysisSettings =
                            [ { analysis = EqualDivision
                              , settings =
                                    [ SettingValue Min 5
                                    , SettingValue Max 7
                                    ]
                              }
                            , { analysis = NChord
                              , settings =
                                    [ SettingValue Min 4
                                    , SettingValue Max 6
                                    ]
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateAnalysisSetting Min 5 EqualDivision)
                            { analysisSettings =
                                [ { analysis = EqualDivision
                                  , settings =
                                        [ SettingValue Min 7
                                        , SettingValue Max 7
                                        ]
                                  }
                                , { analysis = NChord
                                  , settings =
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
                        { analysisSettings =
                            [ { analysis = EqualDivision
                              , settings =
                                    [ SettingValue Min 5
                                    , SettingValue Max 7
                                    ]
                              }
                            , { analysis = NChord
                              , settings =
                                    [ SettingValue Min 4
                                    , SettingValue Max 8
                                    ]
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateAnalysisSetting Max 8 NChord)
                            { analysisSettings =
                                [ { analysis = EqualDivision
                                  , settings =
                                        [ SettingValue Min 5
                                        , SettingValue Max 7
                                        ]
                                  }
                                , { analysis = NChord
                                  , settings =
                                        [ SettingValue Min 4
                                        , SettingValue Max 6
                                        ]
                                  }
                                ]
                            }
                in
                equal expected actual
        ]
