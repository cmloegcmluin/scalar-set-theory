module ScalarSetTheoryTests.Analyses.AnalysisNodeTests exposing (analysisNodeTests)

import Expect exposing (equal)
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
                            { cellItself = "555"
                            , cellChildren =
                                [ TableNode
                                    { cellItself = "3"
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = "333"
                                            , cellChildren = []
                                            }
                                        , TableNode
                                            { cellItself = "444"
                                            , cellChildren = []
                                            }
                                        , TableNode
                                            { cellItself = "555"
                                            , cellChildren = []
                                            }
                                        ]
                                    }
                                ]
                            }

                    cellChildren =
                        [ TableNode
                            { cellItself = "333"
                            , cellChildren = []
                            }
                        , TableNode
                            { cellItself = "444"
                            , cellChildren = []
                            }
                        , TableNode
                            { cellItself = "555"
                            , cellChildren = []
                            }
                        ]

                    actual =
                        analysisNode "555" cellChildren
                in
                equal expected actual
        ]
