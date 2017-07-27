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
        allAnalysisSettings =
            model.analysisSettings

        maybeAnalysisSetting =
            head allAnalysisSettings
    in
    case maybeAnalysisSetting of
        Nothing ->
            TableNode
                { cellItself = text "0"
                , cellChildren = []
                }

        Just thisAnalysisSetting ->
            let
                analysisValuePath =
                    []

                cellChildren =
                    getCellChildren thisAnalysisSetting allAnalysisSettings analysisValuePath
            in
            TableNode
                { cellItself = cellChildren |> length |> toString |> text
                , cellChildren = cellChildren
                }


analysisValueStepToTableNode : AnalysisValueStep -> AnalysisValuePath -> AnalysisSettings -> TableNode
analysisValueStepToTableNode analysisValueStep previousAnalysisValuePath allAnalysisSettings =
    let
        maybeAnalysisSetting =
            getNextAnalysisSetting analysisValueStep.analysis allAnalysisSettings
    in
    case maybeAnalysisSetting of
        Nothing ->
            TableNode
                { cellItself = text analysisValueStep.value
                , cellChildren = []
                }

        Just thisAnalysisSetting ->
            let
                analysisValuePath =
                    previousAnalysisValuePath ++ [ analysisValueStep ]

                cellChildren =
                    getCellChildren thisAnalysisSetting allAnalysisSettings analysisValuePath
            in
            TableNode
                { cellItself = text analysisValueStep.value
                , cellChildren = cellChildren
                }


getCellChildren : AnalysisSetting -> AnalysisSettings -> AnalysisValuePath -> List TableNode
getCellChildren thisAnalysisSetting allAnalysisSettings analysisValuePath =
    let
        cellChildrenValues =
            getCellChildrenValues thisAnalysisSetting analysisValuePath

        convertValuesToAnalysisValueSteps =
            \value -> AnalysisValueStep thisAnalysisSetting.analysis value

        cellChildAnalysisValueSteps =
            map convertValuesToAnalysisValueSteps cellChildrenValues

        convertAnalysisValueStepsToTableNodesWhichMayRecurse =
            \cellChildAnalysisValueStep -> analysisValueStepToTableNode cellChildAnalysisValueStep analysisValuePath allAnalysisSettings
    in
    map convertAnalysisValueStepsToTableNodesWhichMayRecurse cellChildAnalysisValueSteps


getCellChildrenValues : AnalysisSetting -> AnalysisValuePath -> List String
getCellChildrenValues thisAnalysisSetting analysisValuePath =
    case length analysisValuePath of
        0 ->
            let
                firstAnalysisRange =
                    range thisAnalysisSetting.min thisAnalysisSetting.max
            in
            map toString firstAnalysisRange

        _ ->
            let
                analysisProperties =
                    getAnalysisProperties thisAnalysisSetting.analysis

                analysisChildrenValuesGetter =
                    analysisProperties.childrenValuesGetter
            in
            analysisChildrenValuesGetter analysisValuePath thisAnalysisSetting
