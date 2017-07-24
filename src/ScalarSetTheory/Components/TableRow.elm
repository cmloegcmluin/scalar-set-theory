module ScalarSetTheory.Components.TableRow exposing (tableRow)

import Html exposing (Html, div)
import List exposing (head, length, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))


tableRow : List (Html Msg) -> TableNode
tableRow cells =
    case length (cellsTail cells) of
        0 ->
            defTableNode cells

        _ ->
            TableNode
                { cellItself = cellsHead cells
                , cellChildren = [ tableRow (cellsTail cells) ]
                }


cellsHead : List (Html Msg) -> Html Msg
cellsHead cells =
    withDefault emptyDiv (head cells)


cellsTail : List (Html Msg) -> List (Html Msg)
cellsTail cells =
    withDefault [ emptyDiv ] (tail cells)


defTableNode : List (Html Msg) -> TableNode
defTableNode cells =
    TableNode
        { cellItself = cellsHead cells
        , cellChildren = []
        }


emptyDiv : Html Msg
emptyDiv =
    div [] []
