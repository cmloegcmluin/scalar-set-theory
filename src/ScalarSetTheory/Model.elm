module ScalarSetTheory.Model exposing (Model, model)

import Html exposing (Html, text)
import List exposing (..)
import ScalarSetTheory.Sections exposing (..)


type alias Model =
    { ed :
        { min : String
        , max : String
        }
    , nChord :
        { min : String
        , max : String
        }
    , activeSections : List Section
    }


model : Model
model =
    { ed =
        { min = "3"
        , max = "3"
        }
    , nChord =
        { min = "2"
        , max = "100"
        }
    , activeSections = [ Ed, NChord ]
    }
