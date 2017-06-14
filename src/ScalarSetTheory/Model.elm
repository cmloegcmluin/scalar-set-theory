module ScalarSetTheory.Model exposing (Model, model)


type alias Model =
    { ed :
        { min : String
        , max : String
        }
    }


model : Model
model =
    { ed =
        { min = "2"
        , max = "2"
        }
    }
