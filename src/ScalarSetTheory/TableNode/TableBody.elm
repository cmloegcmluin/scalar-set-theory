module ScalarSetTheory.TableNode.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, map, range)
import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections exposing (..)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Utilities exposing (parseInt)


tableBody : Model -> TableNode
tableBody model =
    TableNode
        { cellItself = text (countMessage (getFirstSection model.activeSections) model)
        , cellChildren = sectionToCellChildren (getFirstSection model.activeSections) model
        }


getFirstSection : List Section -> Section
getFirstSection activeSections =
    withDefault Ed (head activeSections)


countMessage : Section -> Model -> String
countMessage section model =
    case section of
        Ed ->
            "count (" ++ toString ((parseInt model.ed.max - parseInt model.ed.min) + 1) ++ ")"

        NChord ->
            "count ()"


sectionToCellChildren : Section -> Model -> List TableNode
sectionToCellChildren section model =
    case section of
        Ed ->
            map (\n -> edToTableNode n model) (range (parseInt model.ed.min) (parseInt model.ed.max))

        NChord ->
            []


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
        , cellChildren = []
        }
