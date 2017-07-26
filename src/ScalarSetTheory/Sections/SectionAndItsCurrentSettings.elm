module ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, defaultSectionsAndTheirCurrentSettings, getFirstSectionAndItsCurrentSettings, getNextSectionAndItsCurrentSettings, getSectionAndItsCurrentSettingsBySection)

import List exposing (head)
import Maybe exposing (withDefault)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Utilities exposing (find)


type alias SectionAndItsCurrentSettings =
    { section : Section
    , min : Int
    , max : Int
    }


getSectionAndItsCurrentSettingsBySection : Section -> List SectionAndItsCurrentSettings -> SectionAndItsCurrentSettings
getSectionAndItsCurrentSettingsBySection section sectionsAndTheirCurrentSettings =
    withDefault (SectionAndItsCurrentSettings EqualDivision 9999999 9999999) (find (\sectionAndItsCurrentSettings -> sectionAndItsCurrentSettingsIsForSection sectionAndItsCurrentSettings section) sectionsAndTheirCurrentSettings)


sectionAndItsCurrentSettingsIsForSection : SectionAndItsCurrentSettings -> Section -> Bool
sectionAndItsCurrentSettingsIsForSection sectionAndItsCurrentSettings section =
    sectionAndItsCurrentSettings.section == section


getFirstSectionAndItsCurrentSettings : List SectionAndItsCurrentSettings -> SectionAndItsCurrentSettings
getFirstSectionAndItsCurrentSettings sectionsAndTheirCurrentSettings =
    withDefault (SectionAndItsCurrentSettings EqualDivision 999999 999999) (head sectionsAndTheirCurrentSettings)


getNextSectionAndItsCurrentSettings : Section -> List SectionAndItsCurrentSettings -> Maybe SectionAndItsCurrentSettings
getNextSectionAndItsCurrentSettings section sectionsAndTheirCurrentSettings =
    case sectionsAndTheirCurrentSettings of
        [] ->
            Nothing

        first :: rest ->
            if section == first.section then
                head rest
            else
                getNextSectionAndItsCurrentSettings section rest


defaultSectionsAndTheirCurrentSettings : List SectionAndItsCurrentSettings
defaultSectionsAndTheirCurrentSettings =
    [ SectionAndItsCurrentSettings EqualDivision 3 3
    , SectionAndItsCurrentSettings NChord 2 100
    ]
