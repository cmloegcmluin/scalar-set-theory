module ScalarSetTheory.Msg exposing (..)

import ScalarSetTheory.Sections.Sections exposing (..)


type Msg
    = UpdateSectionMin Int Section
    | UpdateSectionMax Int Section
