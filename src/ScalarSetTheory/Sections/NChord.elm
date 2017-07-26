module ScalarSetTheory.Sections.NChord exposing (nChordsWithinSectionValuePath)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getSectionAndItsCurrentSettingsBySection)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath, findSectionValueStepInPath)
import ScalarSetTheory.Utilities exposing (parseInt)


nChordsWithinSectionValuePath : SectionValuePath -> List SectionAndItsCurrentSettings -> List String
nChordsWithinSectionValuePath sectionValuePath sectionsAndTheirCurrentSettings =
    let
        nChordSectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection NChord sectionsAndTheirCurrentSettings

        nChordMin =
            nChordSectionAndItsCurrentSettings.min

        nChordMax =
            nChordSectionAndItsCurrentSettings.max

        edValue =
            case findSectionValueStepInPath EqualDivision sectionValuePath of
                Just edSectionValueStep ->
                    parseInt edSectionValueStep.value

                Nothing ->
                    99999
    in
    map toString (range nChordMin (min edValue nChordMax))
