module ScalarSetTheoryTests.TableNode.LensNodeTests exposing (lensNodeTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Css.TableStyles exposing (collapseToggleCellStyle, defaultGreyBackground)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.LensNode exposing (lensNode)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import Test exposing (Test, describe, test)


lensNodeTests : Test
lensNodeTests =
    describe "lens node tests"
        [ test "includes the children count and a collapse toggle" <|
            \() ->
                let
                    expected =
                        TableNode
                            { cellItself = Just (TableCell (text "555") defaultGreyBackground)
                            , cellChildren =
                                [ TableNode
                                    { cellItself = Just (TableCell (text "^") collapseToggleCellStyle)
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = Just (TableCell (text "3") defaultGreyBackground)
                                            , cellChildren =
                                                [ TableNode
                                                    { cellItself = Just (TableCell (text "333") defaultGreyBackground)
                                                    , cellChildren = []
                                                    }
                                                , TableNode
                                                    { cellItself = Just (TableCell (text "444") defaultGreyBackground)
                                                    , cellChildren = []
                                                    }
                                                , TableNode
                                                    { cellItself = Just (TableCell (text "555") defaultGreyBackground)
                                                    , cellChildren = []
                                                    }
                                                ]
                                            }
                                        ]
                                    }
                                ]
                            }

                    cellChildren =
                        [ TableNode
                            { cellItself = Just (TableCell (text "333") defaultGreyBackground)
                            , cellChildren = []
                            }
                        , TableNode
                            { cellItself = Just (TableCell (text "444") defaultGreyBackground)
                            , cellChildren = []
                            }
                        , TableNode
                            { cellItself = Just (TableCell (text "555") defaultGreyBackground)
                            , cellChildren = []
                            }
                        ]

                    actual =
                        lensNode (TableCell (text "555") defaultGreyBackground) cellChildren
                in
                equal expected actual
        ]
