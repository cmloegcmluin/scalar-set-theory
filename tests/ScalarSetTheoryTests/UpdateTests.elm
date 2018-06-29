module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Msg exposing (Msg(UpdateLensSettingValue))
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)
import ScalarSetTheory.Types.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.Types.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Update exposing (update)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update"
        [ test "UpdateLensSetting can update the min for a lens" <|
            \() ->
                let
                    expected =
                        { activeLensSettingValues =
                            [ { lens = EqualDivision
                              , settingValues =
                                    [ SettingValue Min 5
                                    , SettingValue Max 7
                                    ]
                              }
                            , { lens = NChord
                              , settingValues =
                                    [ SettingValue Min 4
                                    , SettingValue Max 6
                                    ]
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateLensSettingValue EqualDivision Min 5)
                            { activeLensSettingValues =
                                [ { lens = EqualDivision
                                  , settingValues =
                                        [ SettingValue Min 7
                                        , SettingValue Max 7
                                        ]
                                  }
                                , { lens = NChord
                                  , settingValues =
                                        [ SettingValue Min 4
                                        , SettingValue Max 6
                                        ]
                                  }
                                ]
                            }
                in
                equal expected actual
        , test "UpdateLensSetting can update the max for a lens" <|
            \() ->
                let
                    expected =
                        { activeLensSettingValues =
                            [ { lens = EqualDivision
                              , settingValues =
                                    [ SettingValue Min 5
                                    , SettingValue Max 7
                                    ]
                              }
                            , { lens = NChord
                              , settingValues =
                                    [ SettingValue Min 4
                                    , SettingValue Max 8
                                    ]
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateLensSettingValue NChord Max 8)
                            { activeLensSettingValues =
                                [ { lens = EqualDivision
                                  , settingValues =
                                        [ SettingValue Min 5
                                        , SettingValue Max 7
                                        ]
                                  }
                                , { lens = NChord
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
