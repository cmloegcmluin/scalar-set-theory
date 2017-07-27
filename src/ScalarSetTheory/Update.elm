module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSetting))
import ScalarSetTheory.Settings.Setting exposing (Setting)
import ScalarSetTheory.Settings.SettingValue exposing (updateSettingValues)


maybeUpdateAnalysisSettingField : AnalysisSetting -> Analysis -> Setting -> Int -> AnalysisSetting
maybeUpdateAnalysisSettingField oldAnalysisSetting analysisToUpdate settingToUpdate newSetting =
    case oldAnalysisSetting.analysis == analysisToUpdate of
        True ->
            { oldAnalysisSetting | settingValues = updateSettingValues oldAnalysisSetting.settingValues settingToUpdate newSetting }

        False ->
            oldAnalysisSetting


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateAnalysisSetting settingToUpdate newSetting analysisToUpdate ->
            let
                updateTargetAnalysis =
                    \oldAnalysisSetting -> maybeUpdateAnalysisSettingField oldAnalysisSetting analysisToUpdate settingToUpdate newSetting

                updatedAnalysisSettings =
                    map updateTargetAnalysis model.analysisSettings
            in
            { model | analysisSettings = updatedAnalysisSettings }
