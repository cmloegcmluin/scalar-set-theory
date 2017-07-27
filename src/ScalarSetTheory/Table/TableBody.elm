module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (length, map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, AnalysisValuePathChildValues, AnalysisValueStep)
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

        firstActiveAnalysisSettingValues :: remainingActiveAnalysisSettingValues ->
            let
                analysisValuePath =
                    []

                cellChildren =
                    getCellChildren firstActiveAnalysisSettingValues remainingActiveAnalysisSettingValues analysisValuePath
            in
            TableNode
                { cellItself = cellChildren |> length |> toString |> text
                , cellChildren = cellChildren
                }


analysisValuePathChildValueToTableNode : AnalysisValuePath -> Analysis -> String -> List AnalysisSettingValues -> TableNode
analysisValuePathChildValueToTableNode previousAnalysisValuePath analysis childValue previousRemainingActiveAnalysisSettingValues =
    case previousRemainingActiveAnalysisSettingValues of
        [] ->
            TableNode
                { cellItself = text childValue
                , cellChildren = []
                }

        thisAnalysisSettingValues :: remainingActiveAnalysisSettingValues ->
            let
                analysisValueStep =
                    AnalysisValueStep analysis childValue

                analysisValuePath =
                    previousAnalysisValuePath ++ [ analysisValueStep ]

                cellChildren =
                    getCellChildren thisAnalysisSettingValues remainingActiveAnalysisSettingValues analysisValuePath
            in
            TableNode
                { cellItself = text analysisValueStep.value
                , cellChildren = cellChildren
                }


getCellChildren : AnalysisSettingValues -> List AnalysisSettingValues -> AnalysisValuePath -> List TableNode
getCellChildren thisAnalysisSettingValues remainingActiveAnalysisSettingValues analysisValuePath =
    let
        analysisValuePathChildValues =
            getAnalysisValuePathChildValues analysisValuePath thisAnalysisSettingValues

        analysis =
            analysisValuePathChildValues.analysis

        convertAnalysisValuePathChildValuesToTableNodesWhichMayRecurse =
            \analysisValuePathChildValue -> analysisValuePathChildValueToTableNode analysisValuePath analysis analysisValuePathChildValue remainingActiveAnalysisSettingValues
    in
    map convertAnalysisValuePathChildValuesToTableNodesWhichMayRecurse analysisValuePathChildValues.values


getAnalysisValuePathChildValues : AnalysisValuePath -> AnalysisSettingValues -> AnalysisValuePathChildValues
getAnalysisValuePathChildValues analysisValuePath thisAnalysisSettingValues =
    case length analysisValuePath of
        0 ->
            let
                thisAnalysisSettingValuesMin =
                    getValueOfSetting thisAnalysisSettingValues Min

                thisAnalysisSettingValuesMax =
                    getValueOfSetting thisAnalysisSettingValues Max

                firstAnalysisRange =
                    range thisAnalysisSettingValuesMin thisAnalysisSettingValuesMax

                childValues =
                    map toString firstAnalysisRange

                analysis =
                    thisAnalysisSettingValues.analysis
            in
            AnalysisValuePathChildValues analysis childValues

        _ ->
            let
                analysisProperties =
                    getAnalysisProperties thisAnalysisSettingValues.analysis

                analysisValuePathChildValues =
                    analysisProperties.analysisValuePathChildValues

                childValues =
                    analysisValuePathChildValues analysisValuePath thisAnalysisSettingValues

                analysis =
                    thisAnalysisSettingValues.analysis
            in
            AnalysisValuePathChildValues analysis childValues
