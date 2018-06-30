module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValueStep)
import ScalarSetTheory.Msg exposing (Msg(ToggleCollapsedLensValuePath, UpdateLensSettingValue))
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)
import ScalarSetTheory.Types.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.Types.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Update exposing (update)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update"
        [ describe "UpdateLensSetting"
            [ test "can update the min for a lens" <|
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
                            , collapsedLensValuePaths = []
                            }

                        msg =
                            UpdateLensSettingValue EqualDivision Min 5

                        model =
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
                            , collapsedLensValuePaths = []
                            }

                        actual =
                            update msg model
                    in
                    equal expected actual
            , test "can update the max for a lens" <|
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
                            , collapsedLensValuePaths = []
                            }

                        msg =
                            UpdateLensSettingValue NChord Max 8

                        model =
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
                            , collapsedLensValuePaths = []
                            }

                        actual =
                            update msg model
                    in
                    equal expected actual
            ]
        , describe "ToggleCollapsedLensValuePath"
            [ test "can mark a lens value path as collapsed" <|
                \() ->
                    let
                        expected =
                            { activeLensSettingValues = []
                            , collapsedLensValuePaths = [ lensValuePath, otherExistingLensValuePath ]
                            }

                        lensValuePath =
                            [ LensValueStep EqualDivision "5"
                            , LensValueStep NChord "3"
                            ]

                        otherExistingLensValuePath =
                            [ LensValueStep EqualDivision "8" ]

                        msg =
                            ToggleCollapsedLensValuePath lensValuePath

                        model =
                            { activeLensSettingValues = []
                            , collapsedLensValuePaths = [ otherExistingLensValuePath ]
                            }

                        actual =
                            update msg model
                    in
                    equal expected actual
            , test "can mark a collapsed lens value path as no longer collapsed" <|
                \() ->
                    let
                        expected =
                            { activeLensSettingValues = []
                            , collapsedLensValuePaths = [ otherExistingLensValuePath ]
                            }

                        lensValuePath =
                            [ LensValueStep EqualDivision "5"
                            , LensValueStep NChord "3"
                            ]

                        otherExistingLensValuePath =
                            [ LensValueStep EqualDivision "8" ]

                        msg =
                            ToggleCollapsedLensValuePath lensValuePath

                        model =
                            { activeLensSettingValues = []
                            , collapsedLensValuePaths = [ lensValuePath, otherExistingLensValuePath ]
                            }

                        actual =
                            update msg model
                    in
                    equal expected actual
            ]
        ]
