module ScalarSetTheory.Table.TableRow exposing (tableRow)

import Html exposing (Html, div, text)
import List exposing (head, length, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableRow : List (Html Msg) -> TableNode
tableRow cells =
    let
        headCell =
            cellsHead cells

        tailCells =
            cellsTail cells
    in
    case length tailCells of
        0 ->
            TableNode
                { cellItself = headCell
                , cellChildren = []
                }

        _ ->
            TableNode
                { cellItself = headCell
                , cellChildren =
                    [ TableNode
                        { cellItself = text ""
                        , cellChildren = [ tableRow tailCells ]
                        }
                    ]
                }


cellsHead : List (Html Msg) -> Html Msg
cellsHead cells =
    withDefault emptyDiv (head cells)


cellsTail : List (Html Msg) -> List (Html Msg)
cellsTail cells =
    withDefault [ emptyDiv ] (tail cells)


emptyDiv : Html Msg
emptyDiv =
    div [] []
