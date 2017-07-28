module ScalarSetTheoryTests.Analyses.AnalysisNodeTests exposing (analysisNodeTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Analyses.AnalysisNode exposing (analysisNode)
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
                            { cellItself = Just (text "555")
                            , cellChildren =
                                [ TableNode
                                    { cellItself = Just (text "3")
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = Just (text "333")
                                            , cellChildren = []
                                            }
                                        , TableNode
                                            { cellItself = Just (text "444")
                                            , cellChildren = []
                                            }
                                        , TableNode
                                            { cellItself = Just (text "555")
                                            , cellChildren = []
                                            }
                                        ]
                                    }
                                ]
                            }

                    cellChildren =
                        [ TableNode
                            { cellItself = Just (text "333")
                            , cellChildren = []
                            }
                        , TableNode
                            { cellItself = Just (text "444")
                            , cellChildren = []
                            }
                        , TableNode
                            { cellItself = Just (text "555")
                            , cellChildren = []
                            }
                        ]

                    actual =
                        analysisNode "555" cellChildren
                in
                equal expected actual
        ]
