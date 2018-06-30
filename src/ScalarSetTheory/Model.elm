module ScalarSetTheory.Model exposing (Model, model)

import ScalarSetTheory.LensSettingValues.DefaultActiveLensSettingValues exposing (defaultActiveLensSettingValues)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (LensValuePath)


type alias Model =
    { activeLensSettingValues : List LensSettingValues
    , collapsedLensValuePaths : List LensValuePath
    }


model : Model
model =
    { activeLensSettingValues = defaultActiveLensSettingValues
    , collapsedLensValuePaths = []
    }
