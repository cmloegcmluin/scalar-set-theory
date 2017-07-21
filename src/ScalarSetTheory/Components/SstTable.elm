module ScalarSetTheory.Components.SstTable exposing (htmlMsgListToTableRow, sstCell, stringListToTableRow)

import Html exposing (Html, div, text)
import List exposing (head, map, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.TableStyles exposing (sstCellAndChildren, sstCellChildrenContainer, sstCellItself)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))


stringListToTableRow : List String -> TableNode
stringListToTableRow cellTexts =
    case tail cellTexts of
        Nothing ->
            defTableNode cellTexts

        Just cellTextsTail ->
            case tail cellTextsTail of
                Nothing ->
                    defTableNode cellTexts

                Just _ ->
                    TableNode
                        { cellItself = getCellItself cellTexts
                        , cellChildren = [ stringListToTableRow cellTextsTail ]
                        }


htmlMsgListToTableRow : List (Html Msg) -> TableNode
htmlMsgListToTableRow cells =
    case tail cells of
        Nothing ->
            defTableNodeTwo cells

        Just cellsTail ->
            case tail cellsTail of
                Nothing ->
                    defTableNodeTwo cells

                Just _ ->
                    TableNode
                        { cellItself = getCellItselfTwo cells
                        , cellChildren = [ htmlMsgListToTableRow cellsTail ]
                        }


getCellItselfTwo : List (Html Msg) -> Html Msg
getCellItselfTwo cells =
    withDefault (div [] []) (head cells)


defTableNodeTwo : List (Html Msg) -> TableNode
defTableNodeTwo cells =
    TableNode
        { cellItself = getCellItselfTwo cells
        , cellChildren = []
        }


getCellItself : List String -> Html Msg
getCellItself cellTexts =
    text (withDefault "" (head cellTexts))


defTableNode : List String -> TableNode
defTableNode cellTexts =
    TableNode
        { cellItself = getCellItself cellTexts
        , cellChildren = []
        }


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
