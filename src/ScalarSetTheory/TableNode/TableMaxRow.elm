module ScalarSetTheory.TableNode.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Section exposing (Section)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getSectionAndItsCurrentSettingsBySection)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import Tuple exposing (first, second)


tableMaxRow : Model -> TableNode
tableMaxRow model =
    tableRow
        ([ text "max" ]
            ++ map sectionToMaxDropdown (sectionAndMaxPerSection model.sectionsAndTheirCurrentSettings)
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


sectionAndMaxPerSection : List SectionAndItsCurrentSettings -> List ( Section, Int )
sectionAndMaxPerSection sectionsAndTheirCurrentSettings =
    map (\sectionAndItsCurrentSettings -> sectionAndMax sectionAndItsCurrentSettings.section sectionsAndTheirCurrentSettings) sectionsAndTheirCurrentSettings


sectionAndMax : Section -> List SectionAndItsCurrentSettings -> ( Section, Int )
sectionAndMax section sectionsAndTheirCurrentSettings =
    let
        sectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection section sectionsAndTheirCurrentSettings
    in
    ( section, sectionAndItsCurrentSettings.max )
