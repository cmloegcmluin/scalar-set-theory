module ScalarSetTheory.Sections.EqualDivision exposing (edRangeFilterOptions)

import Html exposing (Html, option, text)
import Html.Attributes exposing (value)
import List exposing (map, range)
import ScalarSetTheory.Update exposing (..)


edRangeFilterOptions : List (Html Msg)
edRangeFilterOptions =
    map edRangeFilterOption (range 2 100)


edRangeFilterOption : Int -> Html Msg
edRangeFilterOption ed =
    option [ value (toString ed) ] [ text (toString ed) ]
