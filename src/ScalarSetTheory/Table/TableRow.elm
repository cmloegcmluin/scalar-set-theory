module ScalarSetTheory.Table.TableRow exposing (tableRow)

import Html exposing (Html, div)
import List exposing (head, length, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.TableStyles exposing (defaultGrey)
import ScalarSetTheory.Table.TableCell exposing (TableCell)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableRow : List (Html Msg) -> TableNode
tableRow cells =
    let
        headCell =
            cellsHead cells

        tailCells =
            cellsTail cells

        cellItself =
            Just (TableCell headCell defaultGrey)

        cellChildren =
            case length tailCells of
                0 ->
                    []

                _ ->
                    [ TableNode
                        { cellItself = Nothing
                        , cellChildren = [ tableRow tailCells ]
                        }
                    ]
    in
    TableNode
        { cellItself = cellItself
        , cellChildren = cellChildren
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
