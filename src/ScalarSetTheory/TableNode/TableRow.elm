module ScalarSetTheory.TableNode.TableRow exposing (tableRow)

import List exposing (head, length, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (..)


tableRow : List (Maybe TableCell) -> TableNode
tableRow maybeCells =
    let
        headMaybeCell =
            withDefault Nothing <| head maybeCells

        tailMaybeCells =
            withDefault [ Nothing ] <| tail maybeCells

        cellChildren =
            case length tailMaybeCells of
                0 ->
                    []

                _ ->
                    [ tableRow tailMaybeCells ]
    in
    TableNode
        { cellItself = headMaybeCell
        , cellChildren = cellChildren
        }
