module ScalarSetTheory.Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (rowspan, value)
import Html.Events exposing (onInput)
import String exposing (concat)


type alias Model =
    { ed :
        { min : String
        , max : String
        }
    }


main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }


model : Model
model =
    { ed =
        { min = "5"
        , max = "7"
        }
    }


type Msg
    = UpdateEdMin String


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


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Scalar Set Theory" ]
        , table
            []
            ([ tr
                []
                [ th [] [ text "section" ]
                , th [] [ text "ed" ]
                ]
             , tr
                []
                [ td [] [ text "min" ]
                , td []
                    [ select
                        [ onInput edMinOnInputHandler ]
                        [ option [ value "5" ] [ text "5" ]
                        , option [ value "6" ] [ text "6" ]
                        , option [ value "7" ] [ text "7" ]
                        ]
                    ]
                ]
             , tr
                []
                [ td [] [ text "max" ]
                , td [] [ select [] [ option [ value "7" ] [ text "7" ] ] ]
                ]
             ]
                ++ edRangeToTableRows model.ed.min model.ed.max
            )
        ]


edMinOnInputHandler : String -> Msg
edMinOnInputHandler newMin =
    UpdateEdMin newMin


headEdRow : String -> Int -> Html Msg
headEdRow ed edCount =
    tr
        []
        [ td
            [ rowspan edCount ]
            [ text (concat [ "count (", toString edCount, ")" ]) ]
        , td [] [ text ed ]
        ]


tailEdRow : Int -> Html Msg
tailEdRow ed =
    tr
        []
        [ td [] [ text (toString ed) ] ]


edRangeToTableRows : String -> String -> List (Html Msg)
edRangeToTableRows min max =
    let
        rowCount =
            (parseInt max - parseInt min) + 1

        rangeIgnoringFirst =
            List.range (parseInt min + 1) (parseInt max)
    in
    [ headEdRow min rowCount ]
        ++ List.map tailEdRow rangeIgnoringFirst


parseInt : String -> Int
parseInt string =
    String.toInt string |> Result.toMaybe |> Maybe.withDefault 0
