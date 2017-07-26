module ScalarSetTheory.Table.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Section exposing (Section)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings, getSectionSetting)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import Tuple exposing (first, second)


tableMaxRow : Model -> TableNode
tableMaxRow model =
    tableRow
        ([ text "max" ]
            ++ map sectionToMaxDropdown (sectionAndMaxPerSection model.sectionSettings)
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


sectionAndMaxPerSection : SectionSettings -> List ( Section, Int )
sectionAndMaxPerSection sectionSettings =
    map (\sectionSetting -> sectionAndMax sectionSetting.section sectionSettings) sectionSettings


sectionAndMax : Section -> SectionSettings -> ( Section, Int )
sectionAndMax section sectionSettings =
    let
        sectionSetting =
            getSectionSetting section sectionSettings
    in
    ( section, sectionSetting.max )
