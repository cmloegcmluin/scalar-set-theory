module ScalarSetTheory.Components.TableRow exposing (tableRow)

import Html exposing (Html, div)
import List exposing (head, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))


tableRow : List (Html Msg) -> TableNode
tableRow cells =
    case tail cells of
        Nothing ->
            defTableNode cells

        Just cellsTail ->
            case tail cellsTail of
                Nothing ->
                    defTableNode cells

                Just _ ->
                    TableNode
                        { cellItself = getCellItself cells
                        , cellChildren = [ tableRow cellsTail ]
                        }


getCellItself : List (Html Msg) -> Html Msg
getCellItself cells =
    withDefault (div [] []) (head cells)


defTableNode : List (Html Msg) -> TableNode
defTableNode cells =
    TableNode
        { cellItself = getCellItself cells
        , cellChildren = []
        }
