module ScalarSetTheory.Update exposing (update)

import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Actions.NewTableBody exposing (newTableBody)


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

                        newModel =
                            { model | ed = newEd }
                    in
                    { model
                        | ed = newEd
                        , tableBody = newTableBody newModel
                    }

                "nChord" ->
                    let
                        oldNChord =
                            model.nChord

                        newNChord =
                            { oldNChord | min = newMin }

                        newModel =
                            { model | nChord = newNChord }
                    in
                    { model
                        | nChord = newNChord
                        , tableBody = newTableBody newModel
                    }

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

                        newModel =
                            { model | ed = newEd }
                    in
                    { model
                        | ed = newEd
                        , tableBody = newTableBody newModel
                    }

                "nChord" ->
                    let
                        oldNChord =
                            model.nChord

                        newNChord =
                            { oldNChord | max = newMax }

                        newModel =
                            { model | nChord = newNChord }
                    in
                    { model
                        | nChord = newNChord
                        , tableBody = newTableBody newModel
                    }

                _ ->
                    model
