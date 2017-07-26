module ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)

import Html exposing (Attribute, Html, option, text)
import Html.Attributes exposing (selected, value)
import List exposing (map, range)
import ScalarSetTheory.Analyses.Analyses exposing (analysisRanges)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Msg exposing (Msg)


dropdownOptions : Analysis -> String -> List (Html Msg)
dropdownOptions analysis selectedOption =
    map (\optionIndex -> dropdownOption optionIndex selectedOption) (analysisRanges analysis)


dropdownOption : Int -> String -> Html Msg
dropdownOption index selectedOption =
    option
        [ value (toString index)
        , selected (isSelected index selectedOption)
        ]
        [ text (toString index) ]


isSelected : Int -> String -> Bool
isSelected optionIndex selectedOption =
    toString optionIndex == selectedOption
