module ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisMax, UpdateAnalysisMin))

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)


type Msg
    = UpdateAnalysisMin Int Analysis
    | UpdateAnalysisMax Int Analysis
