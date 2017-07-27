module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (length, map, range)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, AnalysisValueStep)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Settings.GetSettingValue exposing (getValueOfSetting)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    case model.activeAnalysisSettingValues of
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


analysisValueStepToTableNode : AnalysisValueStep -> AnalysisValuePath -> List AnalysisSettingValues -> TableNode
analysisValueStepToTableNode analysisValueStep previousAnalysisValuePath previousRemainingAnalysisSettingValues =
    case previousRemainingAnalysisSettingValues of
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


getCellChildren : AnalysisSettingValues -> List AnalysisSettingValues -> AnalysisValuePath -> List TableNode
getCellChildren thisAnalysisSettingValues remainingAnalysisSettings analysisValuePath =
    let
        cellChildrenValues =
            getCellChildrenValues thisAnalysisSettingValues analysisValuePath

        convertValuesToAnalysisValueSteps =
            \value -> AnalysisValueStep thisAnalysisSettingValues.analysis value

        cellChildAnalysisValueSteps =
            map convertValuesToAnalysisValueSteps cellChildrenValues

        convertAnalysisValueStepsToTableNodesWhichMayRecurse =
            \cellChildAnalysisValueStep -> analysisValueStepToTableNode cellChildAnalysisValueStep analysisValuePath remainingAnalysisSettings
    in
    map convertAnalysisValueStepsToTableNodesWhichMayRecurse cellChildAnalysisValueSteps


getCellChildrenValues : AnalysisSettingValues -> AnalysisValuePath -> List String
getCellChildrenValues thisAnalysisSettingValues analysisValuePath =
    case length analysisValuePath of
        0 ->
            let
                thisAnalysisSettingValuesMin =
                    getValueOfSetting thisAnalysisSettingValues Min

                thisAnalysisSettingValuesMax =
                    getValueOfSetting thisAnalysisSettingValues Max

                firstAnalysisRange =
                    range thisAnalysisSettingValuesMin thisAnalysisSettingValuesMax
            in
            map toString firstAnalysisRange

        _ ->
            let
                analysisProperties =
                    getAnalysisProperties thisAnalysisSettingValues.analysis

                analysisChildrenValuesGetter =
                    analysisProperties.childrenValuesGetter
            in
            analysisChildrenValuesGetter analysisValuePath thisAnalysisSettingValues
