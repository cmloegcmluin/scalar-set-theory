module ScalarSetTheory.TableNode.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.GetSectionData exposing (getSectionDataBySection)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections exposing (..)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import Tuple exposing (first, second)


tableMinRow : Model -> TableNode
tableMinRow model =
    tableRow
        ([ text "min" ]
            ++ map sectionToMinDropdown (sectionAndMinPerSection model)
        )


sectionToMinDropdown : ( Section, Int ) -> Html Msg
sectionToMinDropdown sectionAndMin =
    minDropdown (first sectionAndMin) (second sectionAndMin)


minDropdown : Section -> Int -> Html Msg
minDropdown section selectedOption =
    select
        (minAttributes section)
        (dropdownOptions section (toString selectedOption))


minAttributes : Section -> List (Attribute Msg)
minAttributes section =
    [ onInput (\newMin -> minOnInputHandler newMin section) ]


minOnInputHandler : String -> Section -> Msg
minOnInputHandler newMin section =
    UpdateSectionMin (parseInt newMin) section


sectionAndMinPerSection : Model -> List ( Section, Int )
sectionAndMinPerSection model =
    map (\sectionData -> sectionAndMin sectionData.section model) model.sectionData


sectionAndMin : Section -> Model -> ( Section, Int )
sectionAndMin section model =
    let
        sectionData =
            getSectionDataBySection section model
    in
    ( section, sectionData.min )
