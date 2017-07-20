module ScalarSetTheory.Actions.NewTableBody exposing (newTableBody)

import ScalarSetTheory.Types.TableNode exposing (TableNode, TableNode(TableNode), emptyTableNodeList)
import ScalarSetTheory.Model exposing (Model)
import Html exposing (text)
import List exposing (head, map, range)
import Maybe exposing (withDefault)

newTableBody : Model -> TableNode
newTableBody model =
    TableNode
        { cellItself = text (countMessage (getFirstSection model.activeSections) model)
        , cellChildren = sectionNameToCellChildren (getFirstSection model.activeSections) model
        }


countMessage : String -> Model -> String
countMessage sectionName model =
    case sectionName of
        "ed" ->
            "count(" ++ (toString (((parseInt model.ed.max) - (parseInt model.ed.min)) + 1 )) ++ ")"
        "nChord" ->
            "count()"
        _ ->
            "count()"


getFirstSection : List String -> String
getFirstSection activeSections =
    withDefault "" (head activeSections)


sectionNameToCellChildren : String -> Model -> List TableNode
sectionNameToCellChildren sectionName model =
    case sectionName of
        "ed" ->
            map (\n -> edToTableNode n model) (range (parseInt model.ed.min) (parseInt model.ed.max))
        "nChord" ->
            emptyTableNodeList
        _ ->
            emptyTableNodeList


edToTableNode : Int -> Model -> TableNode
edToTableNode ed model =
    TableNode
        { cellItself = text (toString ed)
        , cellChildren = map (\n -> nChordToTableNode n model) (range (parseInt model.nChord.min) (min ed (parseInt model.nChord.max)))
        }


nChordToTableNode : Int -> Model -> TableNode
nChordToTableNode nChord model =
    TableNode
        { cellItself = text (toString nChord)
        , cellChildren = emptyTableNodeList
        }


parseInt : String -> Int
parseInt string =
    String.toInt string |> Result.toMaybe |> Maybe.withDefault 0
