module ScalarSetTheory.Components.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Components.TableRow exposing (htmlMsgListToTableRow)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))
import Tuple exposing (first, second)


tableMaxRow : Model -> TableNode
tableMaxRow model =
    htmlMsgListToTableRow
        ([ div
            []
            [ text "max" ]
         ]
            ++ map sectionNameToMaxDropdown (nameAndMaxPerSection model)
        )


sectionNameToMaxDropdown : ( String, String ) -> Html Msg
sectionNameToMaxDropdown nameAndMax =
    maxDropdown (first nameAndMax) (second nameAndMax)


maxDropdown : String -> String -> Html Msg
maxDropdown sectionName selectedOption =
    select
        (maxAttributes sectionName)
        (dropdownOptions sectionName selectedOption)


maxAttributes : String -> List (Attribute Msg)
maxAttributes sectionName =
    [ onInput (\newMax -> maxOnInputHandler newMax sectionName) ]


maxOnInputHandler : String -> String -> Msg
maxOnInputHandler newMax sectionName =
    UpdateSectionMax newMax sectionName


nameAndMaxPerSection : Model -> List ( String, String )
nameAndMaxPerSection model =
    map (\name -> nameAndMax name model) model.activeSections


nameAndMax : String -> Model -> ( String, String )
nameAndMax name model =
    case name of
        "ed" ->
            ( name, model.ed.max )

        "nChord" ->
            ( name, model.nChord.max )

        _ ->
            ( name, "" )
