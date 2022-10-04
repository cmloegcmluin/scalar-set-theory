module ScalarSetTheory.TableNode.TableBody exposing (tableBody)

import Html.Styled exposing (Html, text)
import List exposing (map)
import ScalarSetTheory.Css.TableStyles exposing (background, defaultGreyBackground)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValuePathChildren.GetLensValuePathChildren exposing (getLensValuePathChildren)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath, LensValueStep)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.LensNode exposing (lensNode)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(..))
import ScalarSetTheory.TableNode.TerminalNode exposing (terminalNode)
import ScalarSetTheory.Types.Lens exposing (Lens)


rootText : Html Msg
rootText =
    text "root"


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
                    TableCell rootText defaultGreyBackground
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
            terminalNode childValue lensColor

        thisLensSettingValues :: remainingActiveLensSettingValues ->
            let
                lensValueStep =
                    LensValueStep lens childValue

                lensValuePath =
                    previousLensValuePath ++ [ lensValueStep ]

                cellChildren =
                    getCellChildren thisLensSettingValues remainingActiveLensSettingValues lensValuePath

                tableCell =
                    TableCell (text lensValueStep.value) (background lensColor)
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
