module ScalarSetTheory.Sections.Section exposing (..)

import List exposing (range)


type Section
    = EqualDivision
    | NChord


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
