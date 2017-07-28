module ScalarSetTheory.Html.TableNodeToHtml exposing (tableNodeToHtml)

import Css exposing (backgroundColor)
import Html exposing (Html, div)
import List exposing (map)
import ScalarSetTheory.Css.Styles exposing (styles)
import ScalarSetTheory.Css.TableStyles exposing (blankTableCellStyle, tableCellAndChildrenStyle, tableCellChildrenContainerStyle, tableCellItselfStyle)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))


tableNodeToHtml : TableNode -> Html Msg
tableNodeToHtml (TableNode tableNode) =
    let
        cellItselfHtml =
            case tableNode.cellItself of
                Nothing ->
                    div
                        [ blankTableCellStyle ]
                        []

                Just cellItself ->
                    div
                        [ tableCellItselfStyle, styles [ backgroundColor cellItself.color ] ]
                        [ cellItself.content ]

        cellChildren =
            map tableNodeToHtml tableNode.cellChildren

        cellChildrenHtml =
            div
                [ tableCellChildrenContainerStyle ]
                cellChildren
    in
    div
        [ tableCellAndChildrenStyle ]
        [ cellItselfHtml
        , cellChildrenHtml
        ]
