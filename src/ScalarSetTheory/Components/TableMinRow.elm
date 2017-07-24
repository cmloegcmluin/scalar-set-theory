module ScalarSetTheory.Components.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Components.TableRow exposing (htmlMsgListToTableRow)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))
import Tuple exposing (first, second)


tableMinRow : Model -> TableNode
tableMinRow model =
    htmlMsgListToTableRow
        ([ div
            []
            [ text "min" ]
         ]
            ++ map sectionNameToMinDropdown (nameAndMinPerSection model)
        )


sectionNameToMinDropdown : ( String, String ) -> Html Msg
sectionNameToMinDropdown nameAndMin =
    minDropdown (first nameAndMin) (second nameAndMin)


minDropdown : String -> String -> Html Msg
minDropdown sectionName selectedOption =
    select
        (minAttributes sectionName)
        (dropdownOptions sectionName selectedOption)


minAttributes : String -> List (Attribute Msg)
minAttributes sectionName =
    [ onInput (\newMin -> minOnInputHandler newMin sectionName) ]


minOnInputHandler : String -> String -> Msg
minOnInputHandler newMin sectionName =
    UpdateSectionMin newMin sectionName


nameAndMinPerSection : Model -> List ( String, String )
nameAndMinPerSection model =
    map (\name -> nameAndMin name model) model.activeSections


nameAndMin : String -> Model -> ( String, String )
nameAndMin name model =
    case name of
        "ed" ->
            ( name, model.ed.min )

        "nChord" ->
            ( name, model.nChord.min )

        _ ->
            ( name, "" )
