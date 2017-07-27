module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (head, length, map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings, getNextAnalysisSetting)
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

                cellChildrenValues =
                    getCellChildrenValues firstAnalysisSetting analysisValuePath

                cellChildren =
                    getCellChildren cellChildrenValues firstAnalysis analysisSettings analysisValuePath
            in
            TableNode
                { cellItself = cellChildren |> length |> toString |> text
                , cellChildren = cellChildren
                }


analysisValueStepToTableNode : AnalysisValueStep -> AnalysisValuePath -> AnalysisSettings -> TableNode
analysisValueStepToTableNode analysisValueStep previousAnalysisValuePath analysisSettings =
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

                analysisValuePath =
                    previousAnalysisValuePath ++ [ analysisValueStep ]

                cellChildrenValues =
                    getCellChildrenValues nextAnalysisSetting analysisValuePath

                cellChildren =
                    getCellChildren cellChildrenValues nextAnalysis analysisSettings analysisValuePath
            in
            TableNode
                { cellItself = text analysisValueStep.value
                , cellChildren = cellChildren
                }


getCellChildren : List String -> Analysis -> AnalysisSettings -> AnalysisValuePath -> List TableNode
getCellChildren cellChildrenValues analysis analysisSettings analysisValuePath =
    let
        convertValuesToAnalysisValueSteps =
            \value -> AnalysisValueStep analysis value

        cellChildAnalysisValueSteps =
            map convertValuesToAnalysisValueSteps cellChildrenValues

        convertAnalysisValueStepsToTableNodes =
            \cellChildAnalysisValueStep -> analysisValueStepToTableNode cellChildAnalysisValueStep analysisValuePath analysisSettings
    in
    map convertAnalysisValueStepsToTableNodes cellChildAnalysisValueSteps


getCellChildrenValues : AnalysisSetting -> AnalysisValuePath -> List String
getCellChildrenValues analysisSetting analysisValuePath =
    case length analysisValuePath of
        0 ->
            let
                firstAnalysisRange =
                    range analysisSetting.min analysisSetting.max
            in
            map toString firstAnalysisRange

        _ ->
            let
                analysisProperties =
                    getAnalysisProperties analysisSetting.analysis

                analysisChildrenValuesGetter =
                    analysisProperties.childrenValues
            in
            analysisChildrenValuesGetter analysisValuePath analysisSetting
