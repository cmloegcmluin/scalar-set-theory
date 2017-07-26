module ScalarSetTheory.Sections.Sections exposing (..)

import Maybe exposing (withDefault)
import ScalarSetTheory.Utilities exposing (find)


type Section
    = Ed
    | NChord


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


getValueWithItsSectionFromValuesAndTheirSectionsByItsSection : Section -> List ValueWithItsSection -> Maybe ValueWithItsSection
getValueWithItsSectionFromValuesAndTheirSectionsByItsSection section valuesWithTheirSections =
    find (\valueWithItsSection -> valueWithItsSectionIsForSection valueWithItsSection section) valuesWithTheirSections


valueWithItsSectionIsForSection : ValueWithItsSection -> Section -> Bool
valueWithItsSectionIsForSection valueWithItsSection section =
    valueWithItsSection.section == section


getSectionAndItsCurrentSettingsBySection : Section -> List SectionAndItsCurrentSettings -> SectionAndItsCurrentSettings
getSectionAndItsCurrentSettingsBySection section sectionsAndTheirCurrentSettings =
    withDefault (SectionAndItsCurrentSettings Ed 9999999 9999999) (find (\sectionAndItsCurrentSettings -> sectionAndItsCurrentSettingsIsForSection sectionAndItsCurrentSettings section) sectionsAndTheirCurrentSettings)


sectionAndItsCurrentSettingsIsForSection : SectionAndItsCurrentSettings -> Section -> Bool
sectionAndItsCurrentSettingsIsForSection sectionAndItsCurrentSettings section =
    sectionAndItsCurrentSettings.section == section
