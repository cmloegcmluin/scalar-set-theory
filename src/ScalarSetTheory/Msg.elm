module ScalarSetTheory.Msg exposing (..)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)


type Msg
    = UpdateAnalysisMin Int Analysis
    | UpdateAnalysisMax Int Analysis
