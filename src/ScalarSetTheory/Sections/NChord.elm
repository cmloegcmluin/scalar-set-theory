module ScalarSetTheory.Sections.NChord exposing (nChordsWithinValueWithItsSectionFilters)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.Utilities exposing (parseInt)


nChordsWithinValueWithItsSectionFilters : ValueWithItsSectionFilters -> Model -> List String
nChordsWithinValueWithItsSectionFilters valueWithItsSectionFilters model =
    let
        nChordSectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection NChord model.sectionsAndTheirCurrentSettings

        nChordMin =
            nChordSectionAndItsCurrentSettings.min

        nChordMax =
            nChordSectionAndItsCurrentSettings.max

        edValue =
            case getValueWithItsSectionFromValuesAndTheirSectionsByItsSection Ed valueWithItsSectionFilters of
                Just edValueWithItsSection ->
                    parseInt edValueWithItsSection.value

                Nothing ->
                    99999
    in
    map toString (range nChordMin (min edValue nChordMax))
