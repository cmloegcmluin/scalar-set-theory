module ScalarSetTheoryTests.Components.TableCellTests exposing (tableCellTests)

import Css exposing (alignItems, center, column, display, displayFlex, flexDirection, inlineBlock, justifyContent, marginLeft, marginTop, outline3, px, rgb, solid, stretch, width)
import Expect exposing (equal)
import Html exposing (div, text)
import ScalarSetTheory.Components.TableCell exposing (tableCell)
import ScalarSetTheory.Styles.Styles exposing (styles)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import Test exposing (Test, describe, test)


tableCellTests : Test
tableCellTests =
    describe "table cell tests"
        [ test "when the cell itself is nothing, put an empty space in the table" <|
            \() ->
                let
                    expected =
                        div
                            [ styles [ displayFlex, alignItems stretch ] ]
                            [ div
                                [ styles [ marginTop (px 1), marginLeft (px 1), displayFlex, width (px 100) ] ]
                                []
                            , div
                                [ styles [ displayFlex, flexDirection column ] ]
                                []
                            ]

                    tableNode =
                        TableNode
                            { cellItself = Nothing
                            , cellChildren = []
                            }

                    actual =
                        tableCell tableNode
                in
                equal expected actual
        , test "when the cell itself is something, put a table cell in the table" <|
            \() ->
                let
                    expected =
                        div
                            [ styles [ displayFlex, alignItems stretch ] ]
                            [ div
                                [ styles
                                    [ marginTop (px 1)
                                    , marginLeft (px 1)
                                    , displayFlex
                                    , width (px 100)
                                    , outline3 (px 1) solid (rgb 128 128 128)
                                    , alignItems center
                                    , justifyContent center
                                    ]
                                ]
                                [ text "bob" ]
                            , div
                                [ styles [ displayFlex, flexDirection column ] ]
                                []
                            ]

                    tableNode =
                        TableNode
                            { cellItself = Just (text "bob")
                            , cellChildren = []
                            }

                    actual =
                        tableCell tableNode
                in
                equal expected actual
        ]
