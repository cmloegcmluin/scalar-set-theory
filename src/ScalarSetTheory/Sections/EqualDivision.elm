module ScalarSetTheory.Sections.EqualDivision exposing (equalDivisionsWithinSectionValuePath)

import List exposing (foldr, map, range)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Sections.SectionChildrenValues exposing (SectionChildrenValues)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings, getSectionSetting)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath, findSectionValueStepInPath)
import ScalarSetTheory.Utilities exposing (parseInt)


equalDivisionsWithinSectionValuePath : SectionChildrenValues
equalDivisionsWithinSectionValuePath sectionValuePath sectionSettings =
    let
        edSetting =
            getSectionSetting EqualDivision sectionSettings

        edMin =
            edSetting.min

        edMax =
            edSetting.max

        nChordValue =
            case findSectionValueStepInPath NChord sectionValuePath of
                Just nChordSectionValueStep ->
                    parseInt nChordSectionValueStep.value

                Nothing ->
                    0
    in
    map toString (range (max edMin nChordValue) edMax)
