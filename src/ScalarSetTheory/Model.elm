module ScalarSetTheory.Model exposing (Model, model)


type alias Model =
    { ed :
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
    , sections = [ "ed", "n-chord" ]
    }
