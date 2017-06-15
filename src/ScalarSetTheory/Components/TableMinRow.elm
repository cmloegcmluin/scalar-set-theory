module ScalarSetTheory.Components.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Attribute, Html, select, td, text, tr)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Sections.EqualDivision exposing (edRangeFilterOptions)
import ScalarSetTheory.Styles.TableStyles exposing (tableBorder)
import ScalarSetTheory.Update exposing (..)


tableMinRow : List String -> Html Msg
tableMinRow sectionNames =
    tr []
        ([ td
            [ tableBorder ]
            [ text "min" ]
         ]
            ++ map sectionNameToMinDropdown sectionNames
        )


sectionNameToMinDropdown : String -> Html Msg
sectionNameToMinDropdown sectionName =
    td
        [ tableBorder ]
        (minDropdown sectionName)


minDropdown : String -> List (Html Msg)
minDropdown sectionName =
    [ select
        edMinAttributes
        edRangeFilterOptions
    ]


edMinAttributes : List (Attribute Msg)
edMinAttributes =
    [ onInput edMinOnInputHandler ]


edMinOnInputHandler : String -> Msg
edMinOnInputHandler newMin =
    UpdateEdMin newMin
