module ScalarSetTheoryTests.TableNode.LensNodeTests exposing (lensNodeTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Css.TableStyles exposing (defaultGrey)
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
                            { cellItself = Just (TableCell (text "555") defaultGrey)
                            , cellChildren =
                                [ TableNode
                                    { cellItself = Just (TableCell (text "^") defaultGrey)
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
                        lensNode (TableCell (text "555") defaultGrey) cellChildren
                in
                equal expected actual
        ]
