module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.Lens.Lens exposing (Lens)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateLensSettingValue))
import ScalarSetTheory.Setting.Setting exposing (Setting)
import ScalarSetTheory.SettingValue.SettingValue exposing (updateSettingValues)


maybeUpdateLensSettingValue : LensSettingValues -> Lens -> Setting -> Int -> LensSettingValues
maybeUpdateLensSettingValue oldLensSettingValues lensToUpdate settingToUpdate newValue =
    case oldLensSettingValues.lens == lensToUpdate of
        True ->
            { oldLensSettingValues | settingValues = updateSettingValues oldLensSettingValues.settingValues settingToUpdate newValue }

        False ->
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
