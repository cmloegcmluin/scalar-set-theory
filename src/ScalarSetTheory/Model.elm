module ScalarSetTheory.Model exposing (Model, model)

import Html exposing (Html, text)
import ScalarSetTheory.Sections.Sections exposing (..)


type alias Model =
    { sectionsAndTheirCurrentSettings : List SectionAndItsCurrentSettings }


model : Model
model =
    { sectionsAndTheirCurrentSettings =
        [ SectionAndItsCurrentSettings Ed 3 3
        , SectionAndItsCurrentSettings NChord 2 100
        ]
    }
