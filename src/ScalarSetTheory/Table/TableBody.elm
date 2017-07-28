module ScalarSetTheory.Table.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (length, map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisNode exposing (analysisNode)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Analyses.AnalysisValuePathChildValues exposing (AnalysisValuePathChildValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, AnalysisValueStep)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Settings.GetSettingValue exposing (getValueOfSetting)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Styles.TableStyles exposing (defaultGrey)
import ScalarSetTheory.Table.TableCell exposing (TableCell)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


tableBody : Model -> TableNode
tableBody model =
    case model.activeAnalysisSettingValues of
        [] ->
            TableNode
                { cellItself = Nothing
                , cellChildren = []
                }

        firstActiveAnalysisSettingValues :: remainingActiveAnalysisSettingValues ->
            let
                analysisValuePath =
                    []

                cellChildren =
                    getCellChildren firstActiveAnalysisSettingValues remainingActiveAnalysisSettingValues analysisValuePath

                rootTableCell =
                    TableCell (text "root") defaultGrey
            in
            analysisNode rootTableCell cellChildren


analysisValuePathChildValueToTableNode : AnalysisValuePath -> Analysis -> String -> List AnalysisSettingValues -> TableNode
analysisValuePathChildValueToTableNode previousAnalysisValuePath analysis childValue previousRemainingActiveAnalysisSettingValues =
    let
        analysisProperties =
            getAnalysisProperties analysis

        analysisColor =
            analysisProperties.color
    in
    case previousRemainingActiveAnalysisSettingValues of
        [] ->
            TableNode
                { cellItself = Just (TableCell (text childValue) analysisColor)
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

                tableCell =
                    TableCell (text analysisValueStep.value) analysisColor
            in
            analysisNode tableCell cellChildren


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
    let
        analysis =
            thisAnalysisSettingValues.analysis

        childValues =
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
                            getAnalysisProperties analysis

                        analysisValuePathChildValuesGetter =
                            analysisProperties.analysisValuePathChildValuesGetter
                    in
                    analysisValuePathChildValuesGetter analysisValuePath thisAnalysisSettingValues
    in
    AnalysisValuePathChildValues analysis childValues
