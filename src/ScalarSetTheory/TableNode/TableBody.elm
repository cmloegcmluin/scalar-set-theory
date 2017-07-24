module ScalarSetTheory.TableNode.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.GetSectionData exposing (getSectionDataBySection)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    let
        firstSection =
            getFirstSection model.sectionData

        cellChildren =
            sectionToCellChildren firstSection model

        childCount =
            length cellChildren
    in
    TableNode
        { cellItself = text (toString childCount)
        , cellChildren = cellChildren
        }


getFirstSection : List SectionData -> Section
getFirstSection sectionData =
    .section (withDefault (SectionData Ed 0 0) (head sectionData))


sectionToCellChildren : Section -> Model -> List TableNode
sectionToCellChildren section model =
    let
        edSectionData =
            getSectionDataBySection Ed model
    in
    case section of
        Ed ->
            map (\n -> edToTableNode n model) (range edSectionData.min edSectionData.max)

        NChord ->
            []


edToTableNode : Int -> Model -> TableNode
edToTableNode ed model =
    let
        nChordSectionData =
            getSectionDataBySection NChord model
    in
    TableNode
        { cellItself = text (toString ed)
        , cellChildren = map (\n -> nChordToTableNode n model) (range nChordSectionData.min (min ed nChordSectionData.max))
        }


nChordToTableNode : Int -> Model -> TableNode
nChordToTableNode nChord model =
    TableNode
        { cellItself = text (toString nChord)
        , cellChildren = []
        }
