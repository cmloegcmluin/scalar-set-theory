module ScalarSetTheory.Main exposing (..)

import Html exposing (div, h1, table, td, text, th, tr)


main =
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
                , td [] [ text "7" ]
                ]
            , tr
                []
                [ td [] [ text "min" ]
                , td [] [ text "7" ]
                ]
            , tr
                []
                [ td [] [ text "count (1)" ]
                , td [] [ text "7" ]
                ]
            ]
        ]
