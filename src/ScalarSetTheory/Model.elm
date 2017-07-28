module ScalarSetTheory.Model exposing (Model, model)

import ScalarSetTheory.LensSettingValues.DefaultActiveLensSettingValues exposing (defaultActiveLensSettingValues)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)


type alias Model =
    { activeLensSettingValues : List LensSettingValues
    }


model : Model
model =
    { activeLensSettingValues = defaultActiveLensSettingValues
    }
