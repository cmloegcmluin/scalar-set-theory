module ScalarSetTheoryTests.Analyses.AnalysisNodeTests exposing (analysisNodeTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Analyses.AnalysisNode exposing (analysisNode)
import ScalarSetTheory.Styles.TableStyles exposing (defaultGrey)
import ScalarSetTheory.Table.TableCell exposing (TableCell)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import Test exposing (Test, describe, test)


analysisNodeTests : Test
analysisNodeTests =
    describe "analysis node tests"
        [ test "includes the children count" <|
            \() ->
                let
                    expected =
                        TableNode
                            { cellItself = Just (TableCell (text "555") defaultGrey)
                            , cellChildren =
                                [ TableNode
                                    { cellItself = Just (TableCell (text "3") defaultGrey)
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = Just (TableCell (text "333") defaultGrey)
                                            , cellChildren = []
                                            }
                                        , TableNode
                                            { cellItself = Just (TableCell (text "444") defaultGrey)
                                            , cellChildren = []
                                            }
                                        , TableNode
                                            { cellItself = Just (TableCell (text "555") defaultGrey)
                                            , cellChildren = []
                                            }
                                        ]
                                    }
                                ]
                            }

                    cellChildren =
                        [ TableNode
                            { cellItself = Just (TableCell (text "333") defaultGrey)
                            , cellChildren = []
                            }
                        , TableNode
                            { cellItself = Just (TableCell (text "444") defaultGrey)
                            , cellChildren = []
                            }
                        , TableNode
                            { cellItself = Just (TableCell (text "555") defaultGrey)
                            , cellChildren = []
                            }
                        ]

                    actual =
                        analysisNode (TableCell (text "555") defaultGrey) cellChildren
                in
                equal expected actual
        ]
