module ScalarSetTheory.TableNode.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.GetSectionData exposing (getSectionDataBySection)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import Tuple exposing (first, second)


tableMaxRow : Model -> TableNode
tableMaxRow model =
    tableRow
        ([ text "max" ]
            ++ map sectionToMaxDropdown (sectionAndMaxPerSection model)
        )


sectionToMaxDropdown : ( Section, Int ) -> Html Msg
sectionToMaxDropdown sectionAndMax =
    maxDropdown (first sectionAndMax) (second sectionAndMax)


maxDropdown : Section -> Int -> Html Msg
maxDropdown section selectedOption =
    select
        (maxAttributes section)
        (dropdownOptions section (toString selectedOption))


maxAttributes : Section -> List (Attribute Msg)
maxAttributes section =
    [ onInput (\newMax -> maxOnInputHandler newMax section) ]


maxOnInputHandler : String -> Section -> Msg
maxOnInputHandler newMax section =
    UpdateSectionMax (parseInt newMax) section


sectionAndMaxPerSection : Model -> List ( Section, Int )
sectionAndMaxPerSection model =
    map (\sectionData -> sectionAndMax sectionData.section model) model.sectionData


sectionAndMax : Section -> Model -> ( Section, Int )
sectionAndMax section model =
    let
        sectionData =
            getSectionDataBySection section model
    in
    ( section, sectionData.max )
