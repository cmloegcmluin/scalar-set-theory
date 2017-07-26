module ScalarSetTheory.Msg exposing (..)

import ScalarSetTheory.Sections.Section exposing (Section)


type Msg
    = UpdateSectionMin Int Section
    | UpdateSectionMax Int Section
