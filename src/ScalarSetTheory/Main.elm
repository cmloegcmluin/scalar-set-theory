module ScalarSetTheory.Main exposing (main)

import Html exposing (beginnerProgram)
import ScalarSetTheory.Model exposing (Model, model)
import ScalarSetTheory.Update exposing (update)
import ScalarSetTheory.View exposing (view)


main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }
