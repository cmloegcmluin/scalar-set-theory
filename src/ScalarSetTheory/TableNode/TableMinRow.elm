module ScalarSetTheory.TableNode.TableMinRow exposing (minDropdown, tableMinRow)

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


tableMinRow : Model -> TableNode
tableMinRow model =
    tableRow
        ([ text "min" ]
            ++ map sectionToMinDropdown (sectionAndMinPerSection model)
        )


sectionToMinDropdown : ( Section, String ) -> Html Msg
sectionToMinDropdown sectionAndMin =
    minDropdown (first sectionAndMin) (second sectionAndMin)


minDropdown : Section -> String -> Html Msg
minDropdown section selectedOption =
    select
        (minAttributes section)
        (dropdownOptions section selectedOption)


minAttributes : Section -> List (Attribute Msg)
minAttributes section =
    [ onInput (\newMin -> minOnInputHandler newMin section) ]


minOnInputHandler : String -> Section -> Msg
minOnInputHandler newMin section =
    UpdateSectionMin newMin section


sectionAndMinPerSection : Model -> List ( Section, String )
sectionAndMinPerSection model =
    map (\section -> sectionAndMin section model) model.activeSections


sectionAndMin : Section -> Model -> ( Section, String )
sectionAndMin section model =
    case section of
        Ed ->
            ( section, model.ed.min )

        NChord ->
            ( section, model.nChord.min )
