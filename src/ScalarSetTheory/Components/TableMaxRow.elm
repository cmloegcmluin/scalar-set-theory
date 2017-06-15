module ScalarSetTheory.Components.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Attribute, Html, select, td, text, tr)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Sections.EqualDivision exposing (edRangeFilterOptions)
import ScalarSetTheory.Styles.TableStyles exposing (tableBorder)
import ScalarSetTheory.Update exposing (..)


tableMaxRow : List String -> Html Msg
tableMaxRow sectionNames =
    tr []
        ([ td
            [ tableBorder ]
            [ text "max" ]
         ]
            ++ map sectionNameToMaxDropdown sectionNames
        )


sectionNameToMaxDropdown : String -> Html Msg
sectionNameToMaxDropdown sectionName =
    td
        [ tableBorder ]
        (maxDropdown sectionName)


maxDropdown : String -> List (Html Msg)
maxDropdown sectionName =
    [ select
        edMaxAttributes
        edRangeFilterOptions
    ]


edMaxAttributes : List (Attribute Msg)
edMaxAttributes =
    [ onInput edMaxOnInputHandler ]


edMaxOnInputHandler : String -> Msg
edMaxOnInputHandler newMax =
    UpdateEdMax newMax
