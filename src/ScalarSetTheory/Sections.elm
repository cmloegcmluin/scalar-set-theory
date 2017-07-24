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


sectionNamesFromData : SectionData -> String
sectionNamesFromData sectionData =
    sectionNames sectionData.section


type alias SectionData =
    { section : Section
    , min : Int
    , max : Int
    }
