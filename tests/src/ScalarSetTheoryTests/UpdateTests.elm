module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import ScalarSetTheory.Update exposing (update)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Types.TableNode exposing (TableNode, TableNode(TableNode), emptyTableNodeList, emptyTableNode)
import Test exposing (Test, describe, test)
import Html exposing (text)

updateTests : Test
updateTests =
    describe "update"
        [ test "UpdateSectionMin updates the min for the correct section" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" }
                        , nChord = { min = "4", max = "6" }
                        , activeSections = [ "ed", "nChord" ]
                        , tableBody = TableNode
                            { cellItself = text "count(3)"
                            , cellChildren =
                                [ TableNode
                                    { cellItself = text "5"
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = text "4"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "5"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        ]
                                    }
                                , TableNode
                                    { cellItself = text "6"
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = text "4"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "5"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "6"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        ]
                                    }
                                , TableNode
                                    { cellItself = text "7"
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = text "4"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "5"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "6"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        ]
                                    }
                                ]
                            }
                        }

                    actual =
                        update
                            ( UpdateSectionMin "5" "ed" )
                            { ed = { min = "7", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , activeSections = [ "ed", "nChord" ]
                            , tableBody = emptyTableNode
                            }
                in
                equal expected actual
        , test "UpdateSectionMax updates the max for the correct section" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" }
                        , nChord = { min = "4", max = "8" }
                        , activeSections = [ "ed", "nChord" ]
                        , tableBody = TableNode
                            { cellItself = text "count(3)"
                            , cellChildren =
                                [ TableNode
                                    { cellItself = text "5"
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = text "4"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "5"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        ]
                                    }
                                , TableNode
                                    { cellItself = text "6"
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = text "4"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "5"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "6"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        ]
                                    }
                                , TableNode
                                    { cellItself = text "7"
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = text "4"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "5"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "6"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        , TableNode
                                            { cellItself = text "7"
                                            , cellChildren = emptyTableNodeList
                                            }
                                        ]
                                    }
                                ]
                            }
                        }

                    actual =
                        update
                            ( UpdateSectionMax "8" "nChord" )
                            { ed = { min = "5", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , activeSections = [ "ed", "nChord" ]
                            , tableBody = emptyTableNode
                            }
                in
                equal expected actual
        ]
