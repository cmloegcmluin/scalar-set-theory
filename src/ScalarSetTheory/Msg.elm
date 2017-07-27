module ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSetting))

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Settings.Setting exposing (Setting)


type Msg
    = UpdateAnalysisSetting Setting Int Analysis
