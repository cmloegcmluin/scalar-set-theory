module ScalarSetTheory.Model exposing (Model, model)

import Html exposing (Html, text)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSettings, defaultAnalysisSettings)


type alias Model =
    { analysisSettings : AnalysisSettings }


model : Model
model =
    { analysisSettings =
        defaultAnalysisSettings
    }
