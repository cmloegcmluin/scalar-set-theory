module ScalarSetTheory.Settings.SettingUpdater exposing (SettingUpdater)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Msg exposing (Msg)


type alias SettingUpdater =
    Int -> Analysis -> Msg
