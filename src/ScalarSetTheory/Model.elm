module ScalarSetTheory.Model exposing (Model, model)

import Html exposing (Html, text)
import List exposing (..)
import ScalarSetTheory.Sections exposing (..)


type alias Model =
    { ed :
        { min : Int
        , max : Int
        }
    , nChord :
        { min : Int
        , max : Int
        }
    , activeSections : List Section
    }


model : Model
model =
    { ed =
        { min = 3
        , max = 3
        }
    , nChord =
        { min = 2
        , max = 100
        }
    , activeSections = [ Ed, NChord ]
    }
