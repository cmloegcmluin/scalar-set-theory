module ScalarSetTheory.Components.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Attribute, Html, select, td, text, tr)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Styles.TableStyles exposing (tableBorder)
import ScalarSetTheory.Update exposing (..)
import Tuple exposing (first, second)


tableMaxRow : List ( String, String ) -> Html Msg
tableMaxRow nameAndMaxPerSection =
    tr []
        ([ td
            [ tableBorder ]
            [ text "max" ]
         ]
            ++ map sectionNameToMaxDropdown nameAndMaxPerSection
        )


sectionNameToMaxDropdown : ( String, String ) -> Html Msg
sectionNameToMaxDropdown nameAndMax =
    td
        [ tableBorder ]
        (maxDropdown (first nameAndMax) (second nameAndMax))


maxDropdown : String -> String -> List (Html Msg)
maxDropdown sectionName selectedOption =
    [ select
        (edMaxAttributes sectionName)
        (dropdownOptions sectionName selectedOption)
    ]


edMaxAttributes : String -> List (Attribute Msg)
edMaxAttributes sectionName =
    [ onInput (\newMax -> edMaxOnInputHandler newMax sectionName) ]


edMaxOnInputHandler : String -> String -> Msg
edMaxOnInputHandler newMax sectionName =
    UpdateSectionMax newMax sectionName
