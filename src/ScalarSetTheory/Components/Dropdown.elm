module ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)

import Html exposing (Attribute, Html, option, text)
import Html.Attributes exposing (selected, value)
import List exposing (map, range)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Sections.Sections exposing (..)


dropdownOptions : Section -> String -> List (Html Msg)
dropdownOptions section selectedOption =
    map (\optionIndex -> dropdownOption optionIndex selectedOption) (ranges section)


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


ranges : Section -> List Int
ranges section =
    case section of
        EqualDivision ->
            range 3 100

        NChord ->
            range 2 100
