module ScalarSetTheory.Sections.SectionChildrenValues exposing (valueWithItsSectionAndItsParentValueWithItsSectionFiltersToChildrenValues)

import ScalarSetTheory.Sections.EqualDivision exposing (equalDivisionsWithinValueWithItsSectionFilters)
import ScalarSetTheory.Sections.NChord exposing (nChordsWithinValueWithItsSectionFilters)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings)
import ScalarSetTheory.Sections.ValueWithItsSection exposing (ValueWithItsSectionFilters)


valueWithItsSectionAndItsParentValueWithItsSectionFiltersToChildrenValues : Section -> ValueWithItsSectionFilters -> List SectionAndItsCurrentSettings -> List String
valueWithItsSectionAndItsParentValueWithItsSectionFiltersToChildrenValues section parentValueWithItsSectionFilters sectionsAndTheirCurrentSettings =
    let
        sectionChildrenValues =
            case section of
                EqualDivision ->
                    equalDivisionsWithinValueWithItsSectionFilters

                NChord ->
                    nChordsWithinValueWithItsSectionFilters
    in
    sectionChildrenValues parentValueWithItsSectionFilters sectionsAndTheirCurrentSettings
