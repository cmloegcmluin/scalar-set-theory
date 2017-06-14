module ScalarSetTheory.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (rowspan, value)
import Html.Events exposing (onInput)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Update exposing (..)
import ScalarSetTheory.Utilities exposing (parseInt)
import String exposing (concat)


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
                , td [] [ select [ onInput edMinOnInputHandler ] edRangeFilterOptions ]
                ]
             , tr
                []
                [ td [] [ text "max" ]
                , td [] [ select [ onInput edMaxOnInputHandler ] edRangeFilterOptions ]
                ]
             ]
                ++ edRangeToTableRows model.ed.min model.ed.max
            )
        ]


edRangeFilterOptions : List (Html Msg)
edRangeFilterOptions =
    List.map edRangeFilterOption (List.range 2 100)


edRangeFilterOption : Int -> Html Msg
edRangeFilterOption ed =
    option [ value (toString ed) ] [ text (toString ed) ]


edMinOnInputHandler : String -> Msg
edMinOnInputHandler newMin =
    UpdateEdMin newMin


edMaxOnInputHandler : String -> Msg
edMaxOnInputHandler newMax =
    UpdateEdMax newMax


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
