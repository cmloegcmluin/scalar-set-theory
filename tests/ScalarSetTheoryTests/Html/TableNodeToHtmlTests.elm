module ScalarSetTheoryTests.Html.TableNodeToHtmlTests exposing (tableNodeToHtmlTests)

import Css exposing (alignItems, backgroundColor, center, column, displayFlex, flexDirection, justifyContent, marginLeft, marginTop, noWrap, outline3, px, rgb, solid, stretch, whiteSpace, width)
import Expect exposing (equal)
import Html.Styled exposing (div, styled, text)
import ScalarSetTheory.Css.TableStyles exposing (background)
import ScalarSetTheory.Html.TableNodeToHtml exposing (tableNodeToHtml)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(..))
import Test exposing (Test, describe, test)


tableNodeToHtmlTests : Test
tableNodeToHtmlTests =
    describe "table node to html tests"
        [ test "when the cell itself is nothing, put an empty space in the table" <|
            \() ->
                let
                    expected =
                        styled div
                            [ displayFlex, alignItems stretch ]
                            []
                            [ styled div
                                [ marginTop (px 1), marginLeft (px 1), displayFlex, width (px 50) ]
                                []
                                []
                            , styled div
                                [ displayFlex, flexDirection column ]
                                []
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
                        styled div
                            [ displayFlex, alignItems stretch ]
                            []
                            [ styled div
                                [ outline3 (px 1) solid (rgb 128 128 128)
                                , marginTop (px 1)
                                , marginLeft (px 1)
                                , displayFlex
                                , alignItems center
                                , justifyContent center
                                , width (px 50)
                                , whiteSpace noWrap
                                , backgroundColor (rgb 180 180 180)
                                ]
                                []
                                [ text "bob" ]
                            , styled div
                                [ displayFlex, flexDirection column ]
                                []
                                []
                            ]

                    tableNode =
                        TableNode
                            { cellItself = Just (TableCell (text "bob") (background (rgb 180 180 180)))
                            , cellChildren = []
                            }

                    actual =
                        tableNodeToHtml tableNode
                in
                equal expected actual
        ]
