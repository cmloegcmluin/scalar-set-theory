module ScalarSetTheory.Main exposing (main)

import Html exposing (beginnerProgram)
import ScalarSetTheory.Model exposing (Model, model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Update exposing (update)
import ScalarSetTheory.View exposing (view)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }
