module ScalarSetTheory.Main exposing (main)

import Browser exposing (sandbox)
import Html.Styled exposing (toUnstyled)
import ScalarSetTheory.Model exposing (Model, model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Update exposing (update)
import ScalarSetTheory.View exposing (view)


main : Program () Model Msg
main =
    sandbox
        { init = model
        , view = view >> toUnstyled
        , update = update
        }
