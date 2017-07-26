module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getFirstSectionAndItsCurrentSettings, getNextSectionAndItsCurrentSettings)
import ScalarSetTheory.Sections.Sections exposing (sectionChildrenValues)
import ScalarSetTheory.Sections.ValueWithItsSection exposing (ValueWithItsSection, ValueWithItsSectionFilters)
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

        parentValueWithItsSectionFilters =
            []

        firstSectionRange =
            range firstSectionAndItsCurrentSettings.min firstSectionAndItsCurrentSettings.max

        valuesWithTheirSectionForFirstSection =
            map (\value -> ValueWithItsSection firstSection (toString value)) firstSectionRange

        cellChildren =
            map (\cellChildValueWithItsSection -> valueWithItsSectionToCell cellChildValueWithItsSection parentValueWithItsSectionFilters sectionsAndTheirCurrentSettings) valuesWithTheirSectionForFirstSection

        childCount =
            length cellChildren
    in
    TableNode
        { cellItself = text (toString childCount)
        , cellChildren = cellChildren
        }


valueWithItsSectionToCell : ValueWithItsSection -> ValueWithItsSectionFilters -> List SectionAndItsCurrentSettings -> TableNode
valueWithItsSectionToCell valueWithItsSection parentValueWithItsSectionFilters sectionsAndTheirCurrentSettings =
    let
        maybeNextSectionAndItsCurrentSettings =
            getNextSectionAndItsCurrentSettings valueWithItsSection.section sectionsAndTheirCurrentSettings
    in
    case maybeNextSectionAndItsCurrentSettings of
        Nothing ->
            TableNode
                { cellItself = text valueWithItsSection.value
                , cellChildren = []
                }

        Just nextSectionAndItsCurrentSettings ->
            let
                nextSection =
                    nextSectionAndItsCurrentSettings.section

                nextSectionChildrenValuesGetter =
                    sectionChildrenValues nextSection

                deeperParentValueWithItsSectionFilters =
                    parentValueWithItsSectionFilters ++ [ valueWithItsSection ]

                cellChildrenValues =
                    nextSectionChildrenValuesGetter deeperParentValueWithItsSectionFilters sectionsAndTheirCurrentSettings

                cellChildValuesWithTheirSection =
                    map (\value -> ValueWithItsSection nextSection value) cellChildrenValues

                cellChildren =
                    map (\cellChildValueWithItsSection -> valueWithItsSectionToCell cellChildValueWithItsSection deeperParentValueWithItsSectionFilters sectionsAndTheirCurrentSettings) cellChildValuesWithTheirSection
            in
            TableNode
                { cellItself = text valueWithItsSection.value
                , cellChildren = cellChildren
                }
