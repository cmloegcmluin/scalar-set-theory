module ScalarSetTheory.Sections.EqualDivision exposing (equalDivisionsWithinValueWithItsSectionFilters)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getSectionAndItsCurrentSettingsBySection)
import ScalarSetTheory.Sections.ValueWithItsSection exposing (ValueWithItsSectionFilters, getValueWithItsSectionFromValuesAndTheirSectionsByItsSection)
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionsWithinValueWithItsSectionFilters : ValueWithItsSectionFilters -> List SectionAndItsCurrentSettings -> List String
equalDivisionsWithinValueWithItsSectionFilters valueWithItsSectionFilters sectionsAndTheirCurrentSettings =
    let
        edSectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection EqualDivision sectionsAndTheirCurrentSettings

        edMin =
            edSectionAndItsCurrentSettings.min

        edMax =
            edSectionAndItsCurrentSettings.max

        nChordValue =
            case getValueWithItsSectionFromValuesAndTheirSectionsByItsSection NChord valueWithItsSectionFilters of
                Just nChordValueWithItsSection ->
                    parseInt nChordValueWithItsSection.value

                Nothing ->
                    0
    in
    map toString (range (max edMin nChordValue) edMax)
