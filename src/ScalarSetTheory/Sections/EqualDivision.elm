module ScalarSetTheory.Sections.EqualDivision exposing (equalDivisionsWithinSectionValuePath)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getSectionAndItsCurrentSettingsBySection)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath, findSectionValueStepInPath)
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionsWithinSectionValuePath : SectionValuePath -> List SectionAndItsCurrentSettings -> List String
equalDivisionsWithinSectionValuePath sectionValuePath sectionsAndTheirCurrentSettings =
    let
        edSectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection EqualDivision sectionsAndTheirCurrentSettings

        edMin =
            edSectionAndItsCurrentSettings.min

        edMax =
            edSectionAndItsCurrentSettings.max

        nChordValue =
            case findSectionValueStepInPath NChord sectionValuePath of
                Just nChordSectionValueStep ->
                    parseInt nChordSectionValueStep.value

                Nothing ->
                    0
    in
    map toString (range (max edMin nChordValue) edMax)
