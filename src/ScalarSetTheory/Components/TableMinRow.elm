module ScalarSetTheory.Components.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Attribute, Html, select, td, text, tr)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Styles.TableStyles exposing (tableBorder)
import ScalarSetTheory.Update exposing (..)
import Tuple exposing (first, second)


tableMinRow : List ( String, String ) -> Html Msg
tableMinRow nameAndMinPerSection =
    tr []
        ([ td
            [ tableBorder ]
            [ text "min" ]
         ]
            ++ map sectionNameToMinDropdown nameAndMinPerSection
        )


sectionNameToMinDropdown : ( String, String ) -> Html Msg
sectionNameToMinDropdown nameAndMin =
    td
        [ tableBorder ]
        (minDropdown (first nameAndMin) (second nameAndMin))


minDropdown : String -> String -> List (Html Msg)
minDropdown sectionName selectedOption =
    [ select
        (edMinAttributes sectionName)
        (dropdownOptions sectionName selectedOption)
    ]


edMinAttributes : String -> List (Attribute Msg)
edMinAttributes sectionName =
    [ onInput (\newMin -> edMinOnInputHandler newMin sectionName) ]


edMinOnInputHandler : String -> String -> Msg
edMinOnInputHandler newMin sectionName =
    UpdateSectionMin newMin sectionName
