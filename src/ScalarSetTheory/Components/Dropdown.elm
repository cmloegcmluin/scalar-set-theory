module ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)

import Html exposing (Attribute, Html, option, text)
import Html.Attributes exposing (selected, value)
import List exposing (map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Msg exposing (Msg)


dropdownOptions : Analysis -> String -> List (Html Msg)
dropdownOptions analysis selectedOption =
    let
        analysisProperties =
            getAnalysisProperties analysis

        rangeForAnalysis =
            range analysisProperties.ultimateMin analysisProperties.ultimateMax

        indexToOption =
            \index -> dropdownOption index selectedOption
    in
    map indexToOption rangeForAnalysis


dropdownOption : Int -> String -> Html Msg
dropdownOption indexAsInt selectedOption =
    let
        index =
            toString indexAsInt
    in
    option
        [ value index
        , selected (isSelected index selectedOption)
        ]
        [ text index ]


isSelected : String -> String -> Bool
isSelected index selectedOption =
    index == selectedOption
