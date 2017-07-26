module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Section exposing (Section)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSetting, SectionSettings)


maybeUpdateSectionSettingMin : SectionSetting -> Section -> Int -> SectionSetting
maybeUpdateSectionSettingMin oldSectionSetting sectionToUpdate newMin =
    case oldSectionSetting.section == sectionToUpdate of
        True ->
            { oldSectionSetting | min = newMin }

        False ->
            oldSectionSetting


maybeUpdateSectionSettingMax : SectionSetting -> Section -> Int -> SectionSetting
maybeUpdateSectionSettingMax oldSectionSetting sectionToUpdate newMax =
    case oldSectionSetting.section == sectionToUpdate of
        True ->
            { oldSectionSetting | max = newMax }

        False ->
            oldSectionSetting


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateSectionMin newMin section ->
            let
                updatedSectionSetting =
                    map (\oldSectionSetting -> maybeUpdateSectionSettingMin oldSectionSetting section newMin) model.sectionSettings
            in
            { model | sectionSettings = updatedSectionSetting }

        UpdateSectionMax newMax section ->
            let
                updatedSectionSetting =
                    map (\oldSectionSetting -> maybeUpdateSectionSettingMax oldSectionSetting section newMax) model.sectionSettings
            in
            { model | sectionSettings = updatedSectionSetting }
