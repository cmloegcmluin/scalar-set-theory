module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSettings, getNextAnalysisSetting)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, AnalysisValueStep)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    let
        analysisSettings =
            model.analysisSettings

        maybeFirstAnalysisSetting =
            head analysisSettings
    in
    case maybeFirstAnalysisSetting of
        Nothing ->
            TableNode
                { cellItself = text "0"
                , cellChildren = []
                }

        Just firstAnalysisSetting ->
            let
                firstAnalysis =
                    firstAnalysisSetting.analysis

                analysisValuePath =
                    []

                firstAnalysisRange =
                    range firstAnalysisSetting.min firstAnalysisSetting.max

                convertValuesToAnalysisValueSteps =
                    \value -> AnalysisValueStep firstAnalysis (toString value)

                analysisValueStepsForFirstAnalysis =
                    map convertValuesToAnalysisValueSteps firstAnalysisRange

                convertAnalysisValueStepsToTableNodes =
                    \cellChildAnalysisValueStep -> analysisValueStepToTableNode cellChildAnalysisValueStep analysisValuePath analysisSettings

                cellChildren =
                    map convertAnalysisValueStepsToTableNodes analysisValueStepsForFirstAnalysis

                childCount =
                    cellChildren |> length |> toString |> text
            in
            TableNode
                { cellItself = childCount
                , cellChildren = cellChildren
                }


analysisValueStepToTableNode : AnalysisValueStep -> AnalysisValuePath -> AnalysisSettings -> TableNode
analysisValueStepToTableNode analysisValueStep analysisValuePath analysisSettings =
    let
        maybeNextAnalysisSetting =
            getNextAnalysisSetting analysisValueStep.analysis analysisSettings
    in
    case maybeNextAnalysisSetting of
        Nothing ->
            TableNode
                { cellItself = text analysisValueStep.value
                , cellChildren = []
                }

        Just nextAnalysisSetting ->
            let
                nextAnalysis =
                    nextAnalysisSetting.analysis

                nextAnalysisProperties =
                    getAnalysisProperties nextAnalysis

                nextAnalysisChildrenValuesGetter =
                    nextAnalysisProperties.childrenValues

                deeperAnalysisValuePath =
                    analysisValuePath ++ [ analysisValueStep ]

                cellChildrenValues =
                    nextAnalysisChildrenValuesGetter deeperAnalysisValuePath nextAnalysisSetting

                convertValuesToAnalysisValueSteps =
                    \value -> AnalysisValueStep nextAnalysis value

                cellChildAnalysisValueSteps =
                    map convertValuesToAnalysisValueSteps cellChildrenValues

                convertAnalysisValueStepsToTableNodes =
                    \cellChildAnalysisValueStep -> analysisValueStepToTableNode cellChildAnalysisValueStep deeperAnalysisValuePath analysisSettings

                cellChildren =
                    map convertAnalysisValueStepsToTableNodes cellChildAnalysisValueSteps
            in
            TableNode
                { cellItself = text analysisValueStep.value
                , cellChildren = cellChildren
                }
