module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSettingValue))
import ScalarSetTheory.Settings.Setting exposing (Setting)
import ScalarSetTheory.Settings.SettingValue exposing (updateSettingValues)


maybeUpdateAnalysisSettingValue : AnalysisSettingValues -> Analysis -> Setting -> Int -> AnalysisSettingValues
maybeUpdateAnalysisSettingValue oldAnalysisSettingValues analysisToUpdate settingToUpdate newValue =
    case oldAnalysisSettingValues.analysis == analysisToUpdate of
        True ->
            { oldAnalysisSettingValues | settingValues = updateSettingValues oldAnalysisSettingValues.settingValues settingToUpdate newValue }

        False ->
            oldAnalysisSettingValues


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateAnalysisSettingValue analysisToUpdate settingToUpdate newValue ->
            let
                updateTargetAnalysisSettingValues =
                    \memberOfOldActiveAnalysisSettingValues -> maybeUpdateAnalysisSettingValue memberOfOldActiveAnalysisSettingValues analysisToUpdate settingToUpdate newValue

                updatedActiveAnalysisSettingValues =
                    map updateTargetAnalysisSettingValues model.activeAnalysisSettingValues
            in
            { model | activeAnalysisSettingValues = updatedActiveAnalysisSettingValues }
