module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (length, map, range)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, AnalysisValueStep)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    case model.analysisSettings of
        [] ->
            TableNode
                { cellItself = text "0"
                , cellChildren = []
                }

        firstAnalysisSetting :: remainingAnalysisSettings ->
            let
                analysisValuePath =
                    []

                cellChildren =
                    getCellChildren firstAnalysisSetting remainingAnalysisSettings analysisValuePath
            in
            TableNode
                { cellItself = cellChildren |> length |> toString |> text
                , cellChildren = cellChildren
                }


analysisValueStepToTableNode : AnalysisValueStep -> AnalysisValuePath -> AnalysisSettings -> TableNode
analysisValueStepToTableNode analysisValueStep previousAnalysisValuePath previousRemainingAnalysisSettings =
    case previousRemainingAnalysisSettings of
        [] ->
            TableNode
                { cellItself = text analysisValueStep.value
                , cellChildren = []
                }

        thisAnalysisSetting :: remainingAnalysisSettings ->
            let
                analysisValuePath =
                    previousAnalysisValuePath ++ [ analysisValueStep ]

                cellChildren =
                    getCellChildren thisAnalysisSetting remainingAnalysisSettings analysisValuePath
            in
            TableNode
                { cellItself = text analysisValueStep.value
                , cellChildren = cellChildren
                }


getCellChildren : AnalysisSetting -> AnalysisSettings -> AnalysisValuePath -> List TableNode
getCellChildren thisAnalysisSetting remainingAnalysisSettings analysisValuePath =
    let
        cellChildrenValues =
            getCellChildrenValues thisAnalysisSetting analysisValuePath

        convertValuesToAnalysisValueSteps =
            \value -> AnalysisValueStep thisAnalysisSetting.analysis value

        cellChildAnalysisValueSteps =
            map convertValuesToAnalysisValueSteps cellChildrenValues

        convertAnalysisValueStepsToTableNodesWhichMayRecurse =
            \cellChildAnalysisValueStep -> analysisValueStepToTableNode cellChildAnalysisValueStep analysisValuePath remainingAnalysisSettings
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
