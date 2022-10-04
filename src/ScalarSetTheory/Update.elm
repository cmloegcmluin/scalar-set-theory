module ScalarSetTheory.Update exposing (update)

import List exposing (filterMap, map)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(..))
import ScalarSetTheory.SettingValue.SettingValue exposing (updateSettingValues)
import ScalarSetTheory.Types.Lens exposing (Lens)
import ScalarSetTheory.Types.Setting exposing (Setting)
import ScalarSetTheory.Utilities exposing (find)


maybeUpdateLensSettingValue : LensSettingValues -> Lens -> Setting -> Int -> LensSettingValues
maybeUpdateLensSettingValue oldLensSettingValues lensToUpdate settingToUpdate newValue =
    if oldLensSettingValues.lens == lensToUpdate then
        { oldLensSettingValues | settingValues = updateSettingValues oldLensSettingValues.settingValues settingToUpdate newValue }

    else
        oldLensSettingValues


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateLensSettingValue lensToUpdate settingToUpdate newValue ->
            let
                updateTargetLensSettingValues =
                    \activeLensSettingValues -> maybeUpdateLensSettingValue activeLensSettingValues lensToUpdate settingToUpdate newValue

                updatedActiveLensSettingValues =
                    map updateTargetLensSettingValues model.activeLensSettingValues
            in
            { model | activeLensSettingValues = updatedActiveLensSettingValues }

        ToggleCollapsedLensValuePath lensValuePath ->
            let
                lensValuePathIsAlreadyCollapsed =
                    \collapsedLensValuePath -> collapsedLensValuePath == lensValuePath

                isNotIt =
                    \collapsedLensValuePath ->
                        if collapsedLensValuePath == lensValuePath then
                            Nothing

                        else
                            Just collapsedLensValuePath

                updatedCollapsedLensValuePaths =
                    case find lensValuePathIsAlreadyCollapsed model.collapsedLensValuePaths of
                        Nothing ->
                            lensValuePath :: model.collapsedLensValuePaths

                        _ ->
                            filterMap isNotIt model.collapsedLensValuePaths
            in
            { model | collapsedLensValuePaths = updatedCollapsedLensValuePaths }
