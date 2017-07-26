module ScalarSetTheory.Sections.Sections exposing (sectionChildrenValues, sectionNames, sectionRanges)

import List exposing (range)
import ScalarSetTheory.Sections.EqualDivision exposing (equalDivisionsWithinValueWithItsSectionFilters)
import ScalarSetTheory.Sections.NChord exposing (nChordsWithinValueWithItsSectionFilters)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings)
import ScalarSetTheory.Sections.ValueWithItsSection exposing (ValueWithItsSectionFilters)


sectionNames : Section -> String
sectionNames section =
    case section of
        EqualDivision ->
            "equal division"

        NChord ->
            "n-chord"


sectionRanges : Section -> List Int
sectionRanges section =
    case section of
        EqualDivision ->
            range 3 100

        NChord ->
            range 2 100


sectionChildrenValues : Section -> ValueWithItsSectionFilters -> List SectionAndItsCurrentSettings -> List String
sectionChildrenValues section =
    case section of
        EqualDivision ->
            equalDivisionsWithinValueWithItsSectionFilters

        NChord ->
            nChordsWithinValueWithItsSectionFilters
