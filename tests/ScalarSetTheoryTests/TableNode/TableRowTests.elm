module ScalarSetTheoryTests.TableNode.TableRowTests exposing (tableRowTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Css.TableStyles exposing (noStyle)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import Test exposing (Test, describe, test)


tableRowTests : Test
tableRowTests =
    describe "table row tests"
        [ test "takes a list of table cells and nests each next one as a single child of the previous" <|
            \() ->
                let
                    firstCell =
                        Just (TableCell (text "1") noStyle)

                    secondCell =
                        Just (TableCell (text "2") noStyle)

                    thirdCell =
                        Just (TableCell (text "3") noStyle)

                    expected =
                        TableNode
                            { cellItself = firstCell
                            , cellChildren =
                                [ TableNode
                                    { cellItself = secondCell
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = thirdCell
                                            , cellChildren = []
                                            }
                                        ]
                                    }
                                ]
                            }

                    actual =
                        tableRow [ firstCell, secondCell, thirdCell ]
                in
                equal expected actual
        , test "supports blank cells" <|
            \() ->
                let
                    firstCell =
                        Nothing

                    secondCell =
                        Nothing

                    thirdCell =
                        Just (TableCell (text "3") noStyle)

                    expected =
                        TableNode
                            { cellItself = firstCell
                            , cellChildren =
                                [ TableNode
                                    { cellItself = secondCell
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = thirdCell
                                            , cellChildren = []
                                            }
                                        ]
                                    }
                                ]
                            }

                    actual =
                        tableRow [ firstCell, secondCell, thirdCell ]
                in
                equal expected actual
        ]
