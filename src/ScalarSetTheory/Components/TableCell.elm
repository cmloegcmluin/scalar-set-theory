module ScalarSetTheory.Components.TableCell exposing (tableCell)

import Html exposing (Html, div)
import List exposing (map)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.TableStyles exposing (tableCellAndChildren, tableCellChildrenContainer, tableCellItself)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))


tableCell : TableNode -> Html Msg
tableCell (TableNode tableNode) =
    div
        [ tableCellAndChildren ]
        [ div
            [ tableCellItself ]
            [ tableNode.cellItself ]
        , div
            [ tableCellChildrenContainer ]
            (map tableCell tableNode.cellChildren)
        ]
