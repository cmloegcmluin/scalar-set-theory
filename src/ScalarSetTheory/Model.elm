module ScalarSetTheory.Model exposing (Model, model)

import Html exposing (Html, text)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings, defaultSectionSettings)


type alias Model =
    { sectionSettings : SectionSettings }


model : Model
model =
    { sectionSettings =
        defaultSectionSettings
    }
