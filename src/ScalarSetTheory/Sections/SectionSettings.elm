module ScalarSetTheory.Sections.SectionSettings exposing (SectionSetting, SectionSettings, defaultSectionSettings, getFirstSectionSetting, getNextSectionSetting, getSectionSettingBySection)

import List exposing (head)
import Maybe exposing (withDefault)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Utilities exposing (find)


type alias SectionSetting =
    { section : Section
    , min : Int
    , max : Int
    }


type alias SectionSettings =
    List SectionSetting


getSectionSettingBySection : Section -> SectionSettings -> SectionSetting
getSectionSettingBySection section sectionSettings =
    withDefault (SectionSetting EqualDivision 9999999 9999999) (find (\sectionSetting -> sectionSettingIsForSection sectionSetting section) sectionSettings)


sectionSettingIsForSection : SectionSetting -> Section -> Bool
sectionSettingIsForSection sectionSetting section =
    sectionSetting.section == section


getFirstSectionSetting : SectionSettings -> SectionSetting
getFirstSectionSetting sectionSettings =
    withDefault (SectionSetting EqualDivision 999999 999999) (head sectionSettings)


getNextSectionSetting : Section -> SectionSettings -> Maybe SectionSetting
getNextSectionSetting section sectionSettings =
    case sectionSettings of
        [] ->
            Nothing

        first :: rest ->
            if section == first.section then
                head rest
            else
                getNextSectionSetting section rest


defaultSectionSettings : SectionSettings
defaultSectionSettings =
    [ SectionSetting EqualDivision 3 3
    , SectionSetting NChord 2 100
    ]
