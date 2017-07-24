module ScalarSetTheory.Components.TableCell exposing (sstCell)

import Html exposing (Html, div)
import List exposing (map)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.TableStyles exposing (sstCellAndChildren, sstCellChildrenContainer, sstCellItself)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))


sstCell : TableNode -> Html Msg
sstCell (TableNode tableNode) =
    div
        [ sstCellAndChildren ]
        [ div
            [ sstCellItself ]
            [ tableNode.cellItself ]
        , div
            [ sstCellChildrenContainer ]
            (map sstCell tableNode.cellChildren)
        ]
