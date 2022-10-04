module ScalarSetTheory.Html.TableNodeToHtml exposing (tableNodeToHtml)

import Html.Styled exposing (Attribute, Html, div, styled)
import List exposing (concat, map)
import ScalarSetTheory.Css.TableStyles exposing (blankTableCellStyle, tableCellAndChildrenStyle, tableCellChildrenContainerStyle, tableCellItselfStyle)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(..))


tableNodeToHtml : TableNode -> Html Msg
tableNodeToHtml (TableNode tableNode) =
    let
        cellItselfHtml =
            case tableNode.cellItself of
                Nothing ->
                    styled div
                        blankTableCellStyle
                        []
                        []

                Just cellItself ->
                    styled div
                        (concat [ tableCellItselfStyle, cellItself.styles ])
                        []
                        [ cellItself.content ]

        cellChildren =
            map tableNodeToHtml tableNode.cellChildren

        cellChildrenHtml =
            styled div
                tableCellChildrenContainerStyle
                []
                cellChildren
    in
    styled div
        tableCellAndChildrenStyle
        []
        [ cellItselfHtml
        , cellChildrenHtml
        ]
