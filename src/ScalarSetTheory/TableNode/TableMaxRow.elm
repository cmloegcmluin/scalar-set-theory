module ScalarSetTheory.TableNode.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections exposing (..)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import Tuple exposing (first, second)


tableMaxRow : Model -> TableNode
tableMaxRow model =
    tableRow
        ([ text "max" ]
            ++ map sectionToMaxDropdown (sectionAndMaxPerSection model)
        )


sectionToMaxDropdown : ( Section, String ) -> Html Msg
sectionToMaxDropdown sectionAndMax =
    maxDropdown (first sectionAndMax) (second sectionAndMax)


maxDropdown : Section -> String -> Html Msg
maxDropdown section selectedOption =
    select
        (maxAttributes section)
        (dropdownOptions section selectedOption)


maxAttributes : Section -> List (Attribute Msg)
maxAttributes section =
    [ onInput (\newMax -> maxOnInputHandler newMax section) ]


maxOnInputHandler : String -> Section -> Msg
maxOnInputHandler newMax section =
    UpdateSectionMax newMax section


sectionAndMaxPerSection : Model -> List ( Section, String )
sectionAndMaxPerSection model =
    map (\section -> sectionAndMax section model) model.activeSections


sectionAndMax : Section -> Model -> ( Section, String )
sectionAndMax section model =
    case section of
        Ed ->
            ( section, model.ed.max )

        NChord ->
            ( section, model.nChord.max )
