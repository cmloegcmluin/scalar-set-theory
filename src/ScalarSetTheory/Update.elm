module ScalarSetTheory.Update exposing (..)

import ScalarSetTheory.Model exposing (Model)


type Msg
    = UpdateEdMin String
    | UpdateEdMax String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateEdMin newMin ->
            let
                oldEd =
                    model.ed

                newEd =
                    { oldEd | min = newMin }
            in
            { model | ed = newEd }

        UpdateEdMax newMax ->
            let
                oldEd =
                    model.ed

                newEd =
                    { oldEd | max = newMax }
            in
            { model | ed = newEd }
