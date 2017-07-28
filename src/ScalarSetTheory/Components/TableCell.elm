module ScalarSetTheory.Components.TableCell exposing (tableCell)

import Html exposing (Html, div)
import List exposing (map)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.TableStyles exposing (blankTableCellStyle, tableCellAndChildrenStyle, tableCellChildrenContainerStyle, tableCellItselfStyle)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableCell : TableNode -> Html Msg
tableCell (TableNode tableNode) =
    let
        cellItselfHtml =
            case tableNode.cellItself of
                Nothing ->
                    div
                        [ blankTableCellStyle ]
                        []

                Just cellItself ->
                    div
                        [ tableCellItselfStyle ]
                        [ cellItself ]

        cellChildren =
            map tableCell tableNode.cellChildren

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
