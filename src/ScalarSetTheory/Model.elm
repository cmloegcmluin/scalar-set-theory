module ScalarSetTheory.Model exposing (Model, model)


type alias Model =
    { ed :
        { min : String
        , max : String
        }
    , nChord :
        { min : String
        , max : String
        }
    , activeSections : List String
    }


model : Model
model =
    { ed =
        { min = "3"
        , max = "3"
        }
    , nChord =
        { min = "1"
        , max = "100"
        }
    , activeSections = [ "ed", "nChord" ]
    }
