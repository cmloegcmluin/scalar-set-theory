module ScalarSetTheory.View exposing (..)

import Css exposing (asPairs, border3, borderCollapse, collapse, px, rgb, solid)
import Html exposing (..)
import Html.Attributes exposing (rowspan, value)
import Html.Events exposing (onInput)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Update exposing (..)
import ScalarSetTheory.Utilities exposing (parseInt)
import String exposing (concat)


styles =
    Css.asPairs >> Html.Attributes.style


tableBorder =
    styles [ border3 (px 1) solid (rgb 128 128 128) ]


tableBorderCollapse =
    styles [ borderCollapse collapse ]


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Scalar Set Theory" ]
        , table
            [ tableBorderCollapse ]
            ([ tableHeaderRow [ "ed" ] ]
                ++ [ tr
                        []
                        [ td
                            [ tableBorder ]
                            [ text "min" ]
                        , td
                            [ tableBorder ]
                            [ select [ onInput edMinOnInputHandler ] edRangeFilterOptions ]
                        ]
                   , tr
                        []
                        [ td
                            [ tableBorder ]
                            [ text "max" ]
                        , td
                            [ tableBorder ]
                            [ select [ onInput edMaxOnInputHandler ] edRangeFilterOptions ]
                        ]
                   ]
                ++ edRangeToTableRows model.ed.min model.ed.max
            )
        ]


tableHeaderRow : List String -> Html Msg
tableHeaderRow sectionNames =
    tr []
        ([ th
            [ tableBorder ]
            [ text "section" ]
         ]
            ++ List.map sectionNameToTableHeader sectionNames
        )


sectionNameToTableHeader : String -> Html Msg
sectionNameToTableHeader sectionName =
    th
        [ tableBorder ]
        [ text sectionName ]


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
            [ rowspan edCount, tableBorder ]
            [ text (concat [ "count (", toString edCount, ")" ]) ]
        , td [ tableBorder ] [ text ed ]
        ]


tailEdRow : Int -> Html Msg
tailEdRow ed =
    tr
        []
        [ td [ tableBorder ] [ text (toString ed) ] ]


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
