module ScalarSetTheory.Update exposing (..)

import ScalarSetTheory.Model exposing (Model)


type Msg
    = UpdateEdMin String
    | UpdateEdMax String
    | UpdateNChordMin String
    | UpdateNChordMax String


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

        UpdateNChordMin newMin ->
            let
                oldNChord =
                    model.nChord

                newNChord =
                    { oldNChord | min = newMin }
            in
            { model | nChord = newNChord }

        UpdateNChordMax newMax ->
            let
                oldNChord =
                    model.nChord

                newNChord =
                    { oldNChord | max = newMax }
            in
            { model | nChord = newNChord }
