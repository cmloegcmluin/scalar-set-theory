module ScalarSetTheory.TableNode.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getFirstSectionAndItsCurrentSettings, getNextSectionAndItsCurrentSettings)
import ScalarSetTheory.Sections.Sections exposing (sectionChildrenValues)
import ScalarSetTheory.Sections.ValueWithItsSection exposing (ValueWithItsSection, ValueWithItsSectionFilters)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    let
        firstSectionAndItsCurrentSettings =
            getFirstSectionAndItsCurrentSettings model.sectionsAndTheirCurrentSettings

        firstSection =
            firstSectionAndItsCurrentSettings.section

        parentValueWithItsSectionFilters =
            []

        firstSectionRange =
            range firstSectionAndItsCurrentSettings.min firstSectionAndItsCurrentSettings.max

        valuesWithTheirSectionForFirstSection =
            map (\value -> ValueWithItsSection firstSection (toString value)) firstSectionRange

        cellChildren =
            map (\cellChildValueWithItsSection -> valueWithItsSectionToCell cellChildValueWithItsSection parentValueWithItsSectionFilters model) valuesWithTheirSectionForFirstSection

        childCount =
            length cellChildren
    in
    TableNode
        { cellItself = text (toString childCount)
        , cellChildren = cellChildren
        }


valueWithItsSectionToCell : ValueWithItsSection -> ValueWithItsSectionFilters -> Model -> TableNode
valueWithItsSectionToCell valueWithItsSection parentValueWithItsSectionFilters model =
    let
        maybeNextSectionAndItsCurrentSettings =
            getNextSectionAndItsCurrentSettings valueWithItsSection.section model.sectionsAndTheirCurrentSettings
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
                    nextSectionChildrenValuesGetter deeperParentValueWithItsSectionFilters model.sectionsAndTheirCurrentSettings

                cellChildValuesWithTheirSection =
                    map (\value -> ValueWithItsSection nextSection value) cellChildrenValues

                cellChildren =
                    map (\cellChildValueWithItsSection -> valueWithItsSectionToCell cellChildValueWithItsSection deeperParentValueWithItsSectionFilters model) cellChildValuesWithTheirSection
            in
            TableNode
                { cellItself = text valueWithItsSection.value
                , cellChildren = cellChildren
                }
