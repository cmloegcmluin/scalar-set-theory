module ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)

import Html exposing (Attribute, Html, option, text)
import Html.Attributes exposing (selected, value)
import List exposing (map, range)
import ScalarSetTheory.Msg exposing (Msg)


dropdownOptions : String -> String -> List (Html Msg)
dropdownOptions sectionName selectedOption =
    map (\optionIndex -> dropdownOption optionIndex selectedOption) (ranges sectionName)


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


ranges : String -> List Int
ranges sectionName =
    case sectionName of
        "ed" ->
            range 3 100

        "nChord" ->
            range 2 100

        _ ->
            range 0 0
