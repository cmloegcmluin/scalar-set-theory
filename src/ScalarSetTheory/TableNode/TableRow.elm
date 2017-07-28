module ScalarSetTheory.TableNode.TableRow exposing (tableRow)

import Html exposing (Html, div)
import List exposing (head, length, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.Css.TableStyles exposing (defaultGrey)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))


tableRow : List (Html Msg) -> TableNode
tableRow cells =
    let
        emptyDiv =
            div [] []

        headCell =
            withDefault emptyDiv (head cells)

        tailCells =
            withDefault [ emptyDiv ] (tail cells)

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
