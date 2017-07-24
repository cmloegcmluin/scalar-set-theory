module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Sections exposing (..)


maybeUpdateSectionDataMin : SectionData -> Section -> Int -> SectionData
maybeUpdateSectionDataMin oldSectionData sectionToUpdate newMin =
    case oldSectionData.section == sectionToUpdate of
        True ->
            { oldSectionData | min = newMin }

        False ->
            oldSectionData


maybeUpdateSectionDataMax : SectionData -> Section -> Int -> SectionData
maybeUpdateSectionDataMax oldSectionData sectionToUpdate newMax =
    case oldSectionData.section == sectionToUpdate of
        True ->
            { oldSectionData | max = newMax }

        False ->
            oldSectionData


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateSectionMin newMin section ->
            let
                updatedSectionData =
                    map (\oldSectionData -> maybeUpdateSectionDataMin oldSectionData section newMin) model.sectionData
            in
            { model | sectionData = updatedSectionData }

        UpdateSectionMax newMax section ->
            let
                updatedSectionData =
                    map (\oldSectionData -> maybeUpdateSectionDataMax oldSectionData section newMax) model.sectionData
            in
            { model | sectionData = updatedSectionData }
