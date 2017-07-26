module ScalarSetTheory.Table.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Section exposing (Section)
import ScalarSetTheory.Sections.SectionSettings exposing (SectionSettings, getSectionSettingBySection)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import Tuple exposing (first, second)


tableMinRow : Model -> TableNode
tableMinRow model =
    tableRow
        ([ text "min" ]
            ++ map sectionToMinDropdown (sectionAndMinPerSection model.sectionSettings)
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


sectionAndMinPerSection : SectionSettings -> List ( Section, Int )
sectionAndMinPerSection sectionSettings =
    map (\sectionSetting -> sectionAndMin sectionSetting.section sectionSettings) sectionSettings


sectionAndMin : Section -> SectionSettings -> ( Section, Int )
sectionAndMin section sectionSettings =
    let
        sectionSetting =
            getSectionSettingBySection section sectionSettings
    in
    ( section, sectionSetting.min )
