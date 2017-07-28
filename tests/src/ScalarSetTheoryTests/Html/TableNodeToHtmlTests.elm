module ScalarSetTheoryTests.Html.TableNodeToHtmlTests exposing (tableNodeToHtmlTests)

import Css exposing (alignItems, backgroundColor, center, column, display, displayFlex, flexDirection, inlineBlock, justifyContent, marginLeft, marginTop, outline3, px, rgb, solid, stretch, width)
import Expect exposing (equal)
import Html exposing (div, text)
import ScalarSetTheory.Css.Styles exposing (styles)
import ScalarSetTheory.Html.TableNodeToHtml exposing (tableNodeToHtml)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import Test exposing (Test, describe, test)


tableNodeToHtmlTests : Test
tableNodeToHtmlTests =
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
                        tableNodeToHtml tableNode
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
                                    , backgroundColor (rgb 180 180 180)
                                    ]
                                ]
                                [ text "bob" ]
                            , div
                                [ styles [ displayFlex, flexDirection column ] ]
                                []
                            ]

                    tableNode =
                        TableNode
                            { cellItself = Just (TableCell (text "bob") (rgb 180 180 180))
                            , cellChildren = []
                            }

                    actual =
                        tableNodeToHtml tableNode
                in
                equal expected actual
        ]
