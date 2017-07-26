module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Section exposing (Section)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings)


maybeUpdateSectionAndItsCurrentSettingsMin : SectionAndItsCurrentSettings -> Section -> Int -> SectionAndItsCurrentSettings
maybeUpdateSectionAndItsCurrentSettingsMin oldSectionAndItsCurrentSettings sectionToUpdate newMin =
    case oldSectionAndItsCurrentSettings.section == sectionToUpdate of
        True ->
            { oldSectionAndItsCurrentSettings | min = newMin }

        False ->
            oldSectionAndItsCurrentSettings


maybeUpdateSectionAndItsCurrentSettingsMax : SectionAndItsCurrentSettings -> Section -> Int -> SectionAndItsCurrentSettings
maybeUpdateSectionAndItsCurrentSettingsMax oldSectionAndItsCurrentSettings sectionToUpdate newMax =
    case oldSectionAndItsCurrentSettings.section == sectionToUpdate of
        True ->
            { oldSectionAndItsCurrentSettings | max = newMax }

        False ->
            oldSectionAndItsCurrentSettings


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateSectionMin newMin section ->
            let
                updatedSectionAndItsCurrentSettings =
                    map (\oldSectionAndItsCurrentSettings -> maybeUpdateSectionAndItsCurrentSettingsMin oldSectionAndItsCurrentSettings section newMin) model.sectionsAndTheirCurrentSettings
            in
            { model | sectionsAndTheirCurrentSettings = updatedSectionAndItsCurrentSettings }

        UpdateSectionMax newMax section ->
            let
                updatedSectionAndItsCurrentSettings =
                    map (\oldSectionAndItsCurrentSettings -> maybeUpdateSectionAndItsCurrentSettingsMax oldSectionAndItsCurrentSettings section newMax) model.sectionsAndTheirCurrentSettings
            in
            { model | sectionsAndTheirCurrentSettings = updatedSectionAndItsCurrentSettings }
