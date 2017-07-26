module ScalarSetTheory.Model exposing (Model, model)

import Html exposing (Html, text)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, defaultSectionsAndTheirCurrentSettings)


type alias Model =
    { sectionsAndTheirCurrentSettings : List SectionAndItsCurrentSettings }


model : Model
model =
    { sectionsAndTheirCurrentSettings =
        defaultSectionsAndTheirCurrentSettings
    }
