module ScalarSetTheory.Sections.SectionChildrenValues exposing (valueWithItsSectionAndItsParentValueWithItsSectionFiltersToChildrenValues)

import ScalarSetTheory.Sections.EqualDivision exposing (equalDivisionsWithinValueWithItsSectionFilters)
import ScalarSetTheory.Sections.NChord exposing (nChordsWithinValueWithItsSectionFilters)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings)
import ScalarSetTheory.Sections.Sections exposing (sectionChildrenValues)
import ScalarSetTheory.Sections.ValueWithItsSection exposing (ValueWithItsSectionFilters)


valueWithItsSectionAndItsParentValueWithItsSectionFiltersToChildrenValues : Section -> ValueWithItsSectionFilters -> List SectionAndItsCurrentSettings -> List String
valueWithItsSectionAndItsParentValueWithItsSectionFiltersToChildrenValues section parentValueWithItsSectionFilters sectionsAndTheirCurrentSettings =
    let
        sectionChildrenValuesThing =
            sectionChildrenValues section
    in
    sectionChildrenValuesThing parentValueWithItsSectionFilters sectionsAndTheirCurrentSettings
