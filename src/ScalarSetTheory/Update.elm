module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisMax, UpdateAnalysisMin))


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
                updateTargetAnalysis =
                    \oldAnalysisSetting -> maybeUpdateAnalysisSettingMin oldAnalysisSetting analysis newMin

                updatedAnalysisSettings =
                    map updateTargetAnalysis model.analysisSettings
            in
            { model | analysisSettings = updatedAnalysisSettings }

        UpdateAnalysisMax newMax analysis ->
            let
                updateTargetAnalysis =
                    \oldAnalysisSetting -> maybeUpdateAnalysisSettingMax oldAnalysisSetting analysis newMax

                updatedAnalysisSettings =
                    map updateTargetAnalysis model.analysisSettings
            in
            { model | analysisSettings = updatedAnalysisSettings }
