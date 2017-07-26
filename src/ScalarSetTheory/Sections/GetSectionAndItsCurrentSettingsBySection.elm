module ScalarSetTheory.Sections.GetSectionAndItsCurrentSettingsBySection exposing (getSectionAndItsCurrentSettingsBySection)

import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.Utilities exposing (find)


getSectionAndItsCurrentSettingsBySection : Section -> Model -> SectionAndItsCurrentSettings
getSectionAndItsCurrentSettingsBySection section model =
    withDefault (SectionAndItsCurrentSettings Ed 9999999 9999999) (find (\sectionAndItsCurrentSettings -> sectionAndItsCurrentSettingsIsForSection sectionAndItsCurrentSettings section) model.sectionsAndTheirCurrentSettings)


sectionAndItsCurrentSettingsIsForSection : SectionAndItsCurrentSettings -> Section -> Bool
sectionAndItsCurrentSettingsIsForSection sectionAndItsCurrentSettings section =
    sectionAndItsCurrentSettings.section == section
