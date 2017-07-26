module ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)

import Html exposing (Attribute, Html, option, text)
import Html.Attributes exposing (selected, value)
import List exposing (map, range)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Sections.Section exposing (Section, sectionRanges)


dropdownOptions : Section -> String -> List (Html Msg)
dropdownOptions section selectedOption =
    map (\optionIndex -> dropdownOption optionIndex selectedOption) (sectionRanges section)


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
