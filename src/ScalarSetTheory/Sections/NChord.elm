module ScalarSetTheory.Sections.NChord exposing (nChordsWithinSectionValuePath)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings, getSectionSettingBySection)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath, findSectionValueStepInPath)
import ScalarSetTheory.Utilities exposing (parseInt)


nChordsWithinSectionValuePath : SectionValuePath -> SectionSettings -> List String
nChordsWithinSectionValuePath sectionValuePath sectionSettings =
    let
        nChordSetting =
            getSectionSettingBySection NChord sectionSettings

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
