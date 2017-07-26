module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)


maybeUpdateAnalysisSettingMin : AnalysisSetting -> Analysis -> Int -> AnalysisSetting
maybeUpdateAnalysisSettingMin oldAnalysisSetting analysisToUpdate newMin =
    case oldAnalysisSetting.analysis == analysisToUpdate of
        True ->
            { oldAnalysisSetting | min = newMin }

        False ->
            oldAnalysisSetting


maybeUpdateAnalysisSettingMax : AnalysisSetting -> Analysis -> Int -> AnalysisSetting
maybeUpdateAnalysisSettingMax oldAnalysisSetting analysisToUpdate newMax =
    case oldAnalysisSetting.analysis == analysisToUpdate of
        True ->
            { oldAnalysisSetting | max = newMax }

        False ->
            oldAnalysisSetting


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateAnalysisMin newMin analysis ->
            let
                updatedAnalysisSetting =
                    map (\oldAnalysisSetting -> maybeUpdateAnalysisSettingMin oldAnalysisSetting analysis newMin) model.analysisSettings
            in
            { model | analysisSettings = updatedAnalysisSetting }

        UpdateAnalysisMax newMax analysis ->
            let
                updatedAnalysisSetting =
                    map (\oldAnalysisSetting -> maybeUpdateAnalysisSettingMax oldAnalysisSetting analysis newMax) model.analysisSettings
            in
            { model | analysisSettings = updatedAnalysisSetting }
