module ScalarSetTheory.Sections.SectionChildrenValues exposing (SectionChildrenValues)

import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings)
import ScalarSetTheory.Sections.SectionValueStep exposing (SectionValuePath)


type alias SectionChildrenValues =
    SectionValuePath -> SectionSettings -> List String
