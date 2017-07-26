module ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath, SectionValueStep, findSectionValueStepInPath)

import ScalarSetTheory.Sections.Section exposing (Section)
import ScalarSetTheory.Utilities exposing (find)


type alias SectionValueStep =
    { section : Section
    , value : String
    }


type alias SectionValuePath =
    List SectionValueStep


findSectionValueStepInPath : Section -> SectionValuePath -> Maybe SectionValueStep
findSectionValueStepInPath section sectionValuePath =
    find (\sectionValueStep -> sectionValueStepIsForSection sectionValueStep section) sectionValuePath


sectionValueStepIsForSection : SectionValueStep -> Section -> Bool
sectionValueStepIsForSection sectionValueStep section =
    sectionValueStep.section == section
