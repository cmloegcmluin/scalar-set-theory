module ScalarSetTheory.Model exposing (Model, model)

import Html exposing (Html, text)
import ScalarSetTheory.Sections.Sections exposing (..)


type alias Model =
    { sectionData : List SectionData }


model : Model
model =
    { sectionData =
        [ SectionData Ed 3 3
        , SectionData NChord 2 100
        ]
    }
