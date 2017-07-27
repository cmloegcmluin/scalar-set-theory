module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSettingValue))
import ScalarSetTheory.Settings.Setting exposing (Setting)
import ScalarSetTheory.Settings.SettingValue exposing (updateSettingValues)


maybeUpdateAnalysisSettingField : AnalysisSettingValues -> Analysis -> Setting -> Int -> AnalysisSettingValues
maybeUpdateAnalysisSettingField oldAnalysisSetting analysisToUpdate settingToUpdate newSetting =
    case oldAnalysisSetting.analysis == analysisToUpdate of
        True ->
            { oldAnalysisSetting | settingValues = updateSettingValues oldAnalysisSetting.settingValues settingToUpdate newSetting }

        False ->
            oldAnalysisSetting


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateAnalysisSettingValue settingToUpdate newSetting analysisToUpdate ->
            let
                updateTargetAnalysisSettingValues =
                    \oldAnalysisSettingValues -> maybeUpdateAnalysisSettingField oldAnalysisSettingValues analysisToUpdate settingToUpdate newSetting

                updatedAnalysisSettingValues =
                    map updateTargetAnalysisSettingValues model.activeAnalysisSettingValues
            in
            { model | activeAnalysisSettingValues = updatedAnalysisSettingValues }
