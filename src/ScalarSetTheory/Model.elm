module ScalarSetTheory.Model exposing (Model, model)

import ScalarSetTheory.Analyses.AnalysisDefaults exposing (defaultActiveAnalysisSettingValues)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)


type alias Model =
    { activeAnalysisSettingValues : List AnalysisSettingValues }


model : Model
model =
    { activeAnalysisSettingValues = defaultActiveAnalysisSettingValues
    }
