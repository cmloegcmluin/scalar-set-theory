module ScalarSetTheory.Sections.NChord exposing (nChordsWithinSectionValuePath)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionChildrenValues exposing (SectionChildrenValues)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings, getSectionSetting)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath, findSectionValueStepInPath)
import ScalarSetTheory.Utilities exposing (parseInt)


nChordsWithinSectionValuePath : SectionChildrenValues
nChordsWithinSectionValuePath sectionValuePath sectionSettings =
    let
        nChordSetting =
            getSectionSetting NChord sectionSettings

        nChordMin =
            nChordSetting.min

        nChordMax =
            nChordSetting.max

        edValue =
            case findSectionValueStepInPath EqualDivision sectionValuePath of
                Just edSectionValueStep ->
                    parseInt edSectionValueStep.value

                Nothing ->
                    99999
    in
    map toString (range nChordMin (min edValue nChordMax))
