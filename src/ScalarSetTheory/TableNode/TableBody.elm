module ScalarSetTheory.TableNode.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections exposing (..)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    let
        firstSection =
            getFirstSection model.activeSections

        cellChildren =
            sectionToCellChildren firstSection model

        childCount =
            length cellChildren
    in
    TableNode
        { cellItself = text (toString childCount)
        , cellChildren = cellChildren
        }


getFirstSection : List Section -> Section
getFirstSection activeSections =
    withDefault Ed (head activeSections)


sectionToCellChildren : Section -> Model -> List TableNode
sectionToCellChildren section model =
    case section of
        Ed ->
            map (\n -> edToTableNode n model) (range model.ed.min model.ed.max)

        NChord ->
            []


edToTableNode : Int -> Model -> TableNode
edToTableNode ed model =
    TableNode
        { cellItself = text (toString ed)
        , cellChildren = map (\n -> nChordToTableNode n model) (range model.nChord.min (min ed model.nChord.max))
        }


nChordToTableNode : Int -> Model -> TableNode
nChordToTableNode nChord model =
    TableNode
        { cellItself = text (toString nChord)
        , cellChildren = []
        }
