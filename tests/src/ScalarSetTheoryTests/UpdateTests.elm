module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Update exposing (update)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update"
        [ test "UpdateSectionMin updates the min for the correct section" <|
            \() ->
                let
                    expected =
                        { sectionSettings =
                            [ { section = EqualDivision
                              , min = 5
                              , max = 7
                              }
                            , { section = NChord
                              , min = 4
                              , max = 6
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateSectionMin 5 EqualDivision)
                            { sectionSettings =
                                [ { section = EqualDivision
                                  , min = 7
                                  , max = 7
                                  }
                                , { section = NChord
                                  , min = 4
                                  , max = 6
                                  }
                                ]
                            }
                in
                equal expected actual
        , test "UpdateSectionMax updates the max for the correct section" <|
            \() ->
                let
                    expected =
                        { sectionSettings =
                            [ { section = EqualDivision
                              , min = 5
                              , max = 7
                              }
                            , { section = NChord
                              , min = 4
                              , max = 8
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateSectionMax 8 NChord)
                            { sectionSettings =
                                [ { section = EqualDivision
                                  , min = 5
                                  , max = 7
                                  }
                                , { section = NChord
                                  , min = 4
                                  , max = 6
                                  }
                                ]
                            }
                in
                equal expected actual
        ]
