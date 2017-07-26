module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getFirstSectionAndItsCurrentSettings, getNextSectionAndItsCurrentSettings)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath, SectionValueStep)
import ScalarSetTheory.Sections.Sections exposing (sectionChildrenValues)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    let
        sectionsAndTheirCurrentSettings =
            model.sectionsAndTheirCurrentSettings

        firstSectionAndItsCurrentSettings =
            getFirstSectionAndItsCurrentSettings sectionsAndTheirCurrentSettings

        firstSection =
            firstSectionAndItsCurrentSettings.section

        sectionValuePath =
            []

        firstSectionRange =
            range firstSectionAndItsCurrentSettings.min firstSectionAndItsCurrentSettings.max

        valuesWithTheirSectionForFirstSection =
            map (\value -> SectionValueStep firstSection (toString value)) firstSectionRange

        cellChildren =
            map (\cellChildSectionValueStep -> sectionValueStepToTableNode cellChildSectionValueStep sectionValuePath sectionsAndTheirCurrentSettings) valuesWithTheirSectionForFirstSection

        childCount =
            length cellChildren
    in
    TableNode
        { cellItself = text (toString childCount)
        , cellChildren = cellChildren
        }


sectionValueStepToTableNode : SectionValueStep -> SectionValuePath -> List SectionAndItsCurrentSettings -> TableNode
sectionValueStepToTableNode sectionValueStep sectionValuePath sectionsAndTheirCurrentSettings =
    let
        maybeNextSectionAndItsCurrentSettings =
            getNextSectionAndItsCurrentSettings sectionValueStep.section sectionsAndTheirCurrentSettings
    in
    case maybeNextSectionAndItsCurrentSettings of
        Nothing ->
            TableNode
                { cellItself = text sectionValueStep.value
                , cellChildren = []
                }

        Just nextSectionAndItsCurrentSettings ->
            let
                nextSection =
                    nextSectionAndItsCurrentSettings.section

                nextSectionChildrenValuesGetter =
                    sectionChildrenValues nextSection

                deeperSectionValuePath =
                    sectionValuePath ++ [ sectionValueStep ]

                cellChildrenValues =
                    nextSectionChildrenValuesGetter deeperSectionValuePath sectionsAndTheirCurrentSettings

                cellChildValuesWithTheirSection =
                    map (\value -> SectionValueStep nextSection value) cellChildrenValues

                cellChildren =
                    map (\cellChildSectionValueStep -> sectionValueStepToTableNode cellChildSectionValueStep deeperSectionValuePath sectionsAndTheirCurrentSettings) cellChildValuesWithTheirSection
            in
            TableNode
                { cellItself = text sectionValueStep.value
                , cellChildren = cellChildren
                }
