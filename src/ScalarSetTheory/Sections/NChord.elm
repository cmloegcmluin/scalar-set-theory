module ScalarSetTheory.Sections.NChord exposing (nChordsWithinValueWithItsSectionFilters)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getSectionAndItsCurrentSettingsBySection)
import ScalarSetTheory.Sections.ValueWithItsSection exposing (ValueWithItsSectionFilters, getValueWithItsSectionFromValuesAndTheirSectionsByItsSection)
import ScalarSetTheory.Utilities exposing (parseInt)


nChordsWithinValueWithItsSectionFilters : ValueWithItsSectionFilters -> List SectionAndItsCurrentSettings -> List String
nChordsWithinValueWithItsSectionFilters valueWithItsSectionFilters sectionsAndTheirCurrentSettings =
    let
        nChordSectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection NChord sectionsAndTheirCurrentSettings

        nChordMin =
            nChordSectionAndItsCurrentSettings.min

        nChordMax =
            nChordSectionAndItsCurrentSettings.max

        edValue =
            case getValueWithItsSectionFromValuesAndTheirSectionsByItsSection EqualDivision valueWithItsSectionFilters of
                Just edValueWithItsSection ->
                    parseInt edValueWithItsSection.value

                Nothing ->
                    99999
    in
    map toString (range nChordMin (min edValue nChordMax))
