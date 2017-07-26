module ScalarSetTheory.Sections.EqualDivision exposing (equalDivisionsWithinValueWithItsSectionFilters)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionsWithinValueWithItsSectionFilters : ValueWithItsSectionFilters -> Model -> List String
equalDivisionsWithinValueWithItsSectionFilters valueWithItsSectionFilters model =
    let
        edSectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection EqualDivision model.sectionsAndTheirCurrentSettings

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
