module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings, getFirstSectionSetting, getNextSectionSetting)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath, SectionValueStep)
import ScalarSetTheory.Sections.Sections exposing (sectionChildrenValues)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    let
        sectionSettings =
            model.sectionSettings

        firstSectionSetting =
            getFirstSectionSetting sectionSettings

        firstSection =
            firstSectionSetting.section

        sectionValuePath =
            []

        firstSectionRange =
            range firstSectionSetting.min firstSectionSetting.max

        valuesWithTheirSectionForFirstSection =
            map (\value -> SectionValueStep firstSection (toString value)) firstSectionRange

        cellChildren =
            map (\cellChildSectionValueStep -> sectionValueStepToTableNode cellChildSectionValueStep sectionValuePath sectionSettings) valuesWithTheirSectionForFirstSection

        childCount =
            length cellChildren
    in
    TableNode
        { cellItself = text (toString childCount)
        , cellChildren = cellChildren
        }


sectionValueStepToTableNode : SectionValueStep -> SectionValuePath -> SectionSettings -> TableNode
sectionValueStepToTableNode sectionValueStep sectionValuePath sectionSettings =
    let
        maybeNextSectionSetting =
            getNextSectionSetting sectionValueStep.section sectionSettings
    in
    case maybeNextSectionSetting of
        Nothing ->
            TableNode
                { cellItself = text sectionValueStep.value
                , cellChildren = []
                }

        Just nextSectionSetting ->
            let
                nextSection =
                    nextSectionSetting.section

                nextSectionChildrenValuesGetter =
                    sectionChildrenValues nextSection

                deeperSectionValuePath =
                    sectionValuePath ++ [ sectionValueStep ]

                cellChildrenValues =
                    nextSectionChildrenValuesGetter deeperSectionValuePath sectionSettings

                cellChildValuesWithTheirSection =
                    map (\value -> SectionValueStep nextSection value) cellChildrenValues

                cellChildren =
                    map (\cellChildSectionValueStep -> sectionValueStepToTableNode cellChildSectionValueStep deeperSectionValuePath sectionSettings) cellChildValuesWithTheirSection
            in
            TableNode
                { cellItself = text sectionValueStep.value
                , cellChildren = cellChildren
                }
