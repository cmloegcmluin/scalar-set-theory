module ScalarSetTheory.Update exposing (update)

import List exposing (map)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateLensSettingValue))
import ScalarSetTheory.SettingValue.SettingValue exposing (updateSettingValues)
import ScalarSetTheory.Types.Lens exposing (Lens)
import ScalarSetTheory.Types.Setting exposing (Setting)


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
