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
    , sections : List String
    }


model : Model
model =
    { ed =
        { min = "2"
        , max = "2"
        }
    , nChord =
        { min = "1"
        , max = "100"
        }
    , sections = [ "ed", "n-chord" ]
    }
