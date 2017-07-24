module ScalarSetTheory.Update exposing (update)

import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateSectionMin newMin section ->
            case section of
                Ed ->
                    let
                        oldEd =
                            model.ed

                        newEd =
                            { oldEd | min = newMin }
                    in
                    { model | ed = newEd }

                NChord ->
                    let
                        oldNChord =
                            model.nChord

                        newNChord =
                            { oldNChord | min = newMin }
                    in
                    { model | nChord = newNChord }

        UpdateSectionMax newMax section ->
            case section of
                Ed ->
                    let
                        oldEd =
                            model.ed

                        newEd =
                            { oldEd | max = newMax }
                    in
                    { model | ed = newEd }

                NChord ->
                    let
                        oldNChord =
                            model.nChord

                        newNChord =
                            { oldNChord | max = newMax }
                    in
                    { model | nChord = newNChord }
