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
    in
    map (\optionIndex -> dropdownOption optionIndex selectedOption) rangeForAnalysis


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
