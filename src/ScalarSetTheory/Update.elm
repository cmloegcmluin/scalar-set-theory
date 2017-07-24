module ScalarSetTheory.Update exposing (update)

import ScalarSetTheory.Components.TableBody exposing (tableBody)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateSectionMin newMin section ->
            case section of
                "ed" ->
                    let
                        oldEd =
                            model.ed

                        newEd =
                            { oldEd | min = newMin }
                    in
                    { model | ed = newEd }

                "nChord" ->
                    let
                        oldNChord =
                            model.nChord

                        newNChord =
                            { oldNChord | min = newMin }
                    in
                    { model | nChord = newNChord }

                _ ->
                    model

        UpdateSectionMax newMax section ->
            case section of
                "ed" ->
                    let
                        oldEd =
                            model.ed

                        newEd =
                            { oldEd | max = newMax }
                    in
                    { model | ed = newEd }

                "nChord" ->
                    let
                        oldNChord =
                            model.nChord

                        newNChord =
                            { oldNChord | max = newMax }
                    in
                    { model | nChord = newNChord }

                _ ->
                    model
