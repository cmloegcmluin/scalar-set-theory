module ScalarSetTheory.Sections.Ed exposing (edsWithinValueWithItsSectionFilters)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.Utilities exposing (parseInt)


edsWithinValueWithItsSectionFilters : ValueWithItsSectionFilters -> Model -> List String
edsWithinValueWithItsSectionFilters valueWithItsSectionFilters model =
    let
        edSectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection Ed model.sectionsAndTheirCurrentSettings

        edMin =
            edSectionAndItsCurrentSettings.min

        edMax =
            edSectionAndItsCurrentSettings.max

        nChordValue =
            case getValueWithItsSectionFromValuesAndTheirSectionsByItsSection NChord valueWithItsSectionFilters of
                Just nChordValueWithItsSection ->
                    parseInt nChordValueWithItsSection.value

                Nothing ->
                    0
    in
    map toString (range (max edMin nChordValue) edMax)
