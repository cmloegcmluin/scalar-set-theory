module ScalarSetTheory.Sections.Sections exposing (..)


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


sectionNamesFromSectionsAndTheirCurrentSettings : SectionAndItsCurrentSettings -> String
sectionNamesFromSectionsAndTheirCurrentSettings sectionAndItsCurrentSettings =
    sectionNames sectionAndItsCurrentSettings.section


type alias SectionAndItsCurrentSettings =
    { section : Section
    , min : Int
    , max : Int
    }


type alias ValueWithItsSection =
    { section : Section
    , value : String
    }



-- the section is different in each one of these


type alias ValueWithItsSectionFilters =
    List ValueWithItsSection



-- the section is the same in all of these


type alias ValueWithItsSectionChildren =
    List ValueWithItsSection
