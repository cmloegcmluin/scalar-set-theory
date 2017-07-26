module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Analyses.Analysis exposing (..)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Update exposing (update)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update"
        [ test "UpdateAnalysisMin updates the min for the correct analysis" <|
            \() ->
                let
                    expected =
                        { analysisSettings =
                            [ { analysis = EqualDivision
                              , min = 5
                              , max = 7
                              }
                            , { analysis = NChord
                              , min = 4
                              , max = 6
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateAnalysisMin 5 EqualDivision)
                            { analysisSettings =
                                [ { analysis = EqualDivision
                                  , min = 7
                                  , max = 7
                                  }
                                , { analysis = NChord
                                  , min = 4
                                  , max = 6
                                  }
                                ]
                            }
                in
                equal expected actual
        , test "UpdateAnalysisMax updates the max for the correct analysis" <|
            \() ->
                let
                    expected =
                        { analysisSettings =
                            [ { analysis = EqualDivision
                              , min = 5
                              , max = 7
                              }
                            , { analysis = NChord
                              , min = 4
                              , max = 8
                              }
                            ]
                        }

                    actual =
                        update
                            (UpdateAnalysisMax 8 NChord)
                            { analysisSettings =
                                [ { analysis = EqualDivision
                                  , min = 5
                                  , max = 7
                                  }
                                , { analysis = NChord
                                  , min = 4
                                  , max = 6
                                  }
                                ]
                            }
                in
                equal expected actual
        ]
