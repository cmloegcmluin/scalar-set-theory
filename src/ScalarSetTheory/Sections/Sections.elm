module ScalarSetTheory.Sections.Sections exposing (sectionChildrenValues, sectionNames, sectionRanges)

import List exposing (range)
import ScalarSetTheory.Sections.EqualDivision exposing (equalDivisionsWithinSectionValuePath)
import ScalarSetTheory.Sections.NChord exposing (nChordsWithinSectionValuePath)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath)


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


sectionChildrenValues : Section -> SectionValuePath -> SectionSettings -> List String
sectionChildrenValues section =
    case section of
        EqualDivision ->
            equalDivisionsWithinSectionValuePath

        NChord ->
            nChordsWithinSectionValuePath
