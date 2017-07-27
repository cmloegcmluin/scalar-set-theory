module ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSettingValue))

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Settings.Setting exposing (Setting)


type Msg
    = UpdateAnalysisSettingValue Analysis Setting Int
