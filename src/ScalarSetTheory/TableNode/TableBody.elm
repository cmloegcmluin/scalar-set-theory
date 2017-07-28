module ScalarSetTheory.TableNode.TableBody exposing (tableBody)

import Html exposing (text)
import List exposing (length, map, range)
import ScalarSetTheory.Css.TableStyles exposing (defaultGrey)
import ScalarSetTheory.Lens.Lens exposing (Lens)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.GetLensValuePathChildren exposing (getLensValuePathChildren)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath, LensValueStep)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Setting.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.LensNode exposing (lensNode)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


tableBody : Model -> TableNode
tableBody model =
    case model.activeLensSettingValues of
        [] ->
            TableNode
                { cellItself = Nothing
                , cellChildren = []
                }

        firstActiveLensSettingValues :: remainingActiveLensSettingValues ->
            let
                lensValuePath =
                    []

                cellChildren =
                    getCellChildren firstActiveLensSettingValues remainingActiveLensSettingValues lensValuePath

                rootTableCell =
                    TableCell (text "root") defaultGrey
            in
            lensNode rootTableCell cellChildren


lensValuePathChildValueToTableNode : LensValuePath -> Lens -> String -> List LensSettingValues -> TableNode
lensValuePathChildValueToTableNode previousLensValuePath lens childValue previousRemainingActiveLensSettingValues =
    let
        lensProperties =
            getLensProperties lens

        lensColor =
            lensProperties.color
    in
    case previousRemainingActiveLensSettingValues of
        [] ->
            TableNode
                { cellItself = Just (TableCell (text childValue) lensColor)
                , cellChildren = []
                }

        thisLensSettingValues :: remainingActiveLensSettingValues ->
            let
                lensValueStep =
                    LensValueStep lens childValue

                lensValuePath =
                    previousLensValuePath ++ [ lensValueStep ]

                cellChildren =
                    getCellChildren thisLensSettingValues remainingActiveLensSettingValues lensValuePath

                tableCell =
                    TableCell (text lensValueStep.value) lensColor
            in
            lensNode tableCell cellChildren


getCellChildren : LensSettingValues -> List LensSettingValues -> LensValuePath -> List TableNode
getCellChildren thisLensSettingValues remainingActiveLensSettingValues lensValuePath =
    let
        lensValuePathChildren =
            getLensValuePathChildren lensValuePath thisLensSettingValues

        lens =
            lensValuePathChildren.lens

        lensValuePathChildValuesToTableNodes =
            \lensValuePathChildValue -> lensValuePathChildValueToTableNode lensValuePath lens lensValuePathChildValue remainingActiveLensSettingValues
    in
    map lensValuePathChildValuesToTableNodes lensValuePathChildren.values
