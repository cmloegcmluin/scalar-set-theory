module ScalarSetTheory.TableNode.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (getFirstSectionAndItsCurrentSettings, getNextSectionAndItsCurrentSettings)
import ScalarSetTheory.Sections.SectionChildrenValues exposing (valueWithItsSectionAndItsParentValueWithItsSectionFiltersToChildrenValues)
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

        deeperParentValueWithItsSectionFilters =
            parentValueWithItsSectionFilters ++ [ valueWithItsSection ]
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

                cellChildrenValues =
                    valueWithItsSectionAndItsParentValueWithItsSectionFiltersToChildrenValues nextSection deeperParentValueWithItsSectionFilters model.sectionsAndTheirCurrentSettings

                cellChildValuesWithTheirSection =
                    map (\value -> ValueWithItsSection nextSection value) cellChildrenValues

                cellChildren =
                    map (\cellChildValueWithItsSection -> valueWithItsSectionToCell cellChildValueWithItsSection deeperParentValueWithItsSectionFilters model) cellChildValuesWithTheirSection
            in
            TableNode
                { cellItself = text valueWithItsSection.value
                , cellChildren = cellChildren
                }