module ScalarSetTheory.Sections exposing (..)


type Section
    = Ed
    | NChord


sectionNames : Section -> String
sectionNames section =
    case section of
        Ed ->
            "ed"

        NChord ->
            "nChord"
