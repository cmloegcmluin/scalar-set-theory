module ScalarSetTheory.Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (value)


type alias Model =
    { ed :
        { min : Int
        , max : Int
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
        { min = 7
        , max = 7
        }
    }


update : Cmd msg -> Model -> Model
update message model =
    model


view : Model -> Html msg
view model =
    div
        []
        [ h1 [] [ text "Scalar Set Theory" ]
        , table
            []
            [ tr
                []
                [ th [] [ text "section" ]
                , th [] [ text "ed" ]
                ]
            , tr
                []
                [ td [] [ text "max" ]
                , td [] [ select [] [ option [ value "7" ] [ text "7" ] ] ]
                ]
            , tr
                []
                [ td [] [ text "min" ]
                , td [] [ select [] [ option [ value "7" ] [ text "7" ] ] ]
                ]
            , tr
                []
                [ td [] [ text "count (1)" ]
                , td [] [ text "7" ]
                ]
            ]
        ]
