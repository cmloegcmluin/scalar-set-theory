module ScalarSetTheory.TableNode.TableSettingRow exposing (tableSettingRow)

import Html exposing (text)
import List exposing (map)
import ScalarSetTheory.Html.Dropdown exposing (settingDropdown)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Types.Setting exposing (Setting)
import ScalarSetTheory.SettingProperties.SettingProperties exposing (getSettingProperties)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)


tableSettingRow : Setting -> Model -> TableNode
tableSettingRow setting model =
    let
        settingProperties =
            getSettingProperties setting

        settingName =
            settingProperties.name

        settingDropdownUsingSettingField =
            \activeLensSettingValues -> settingDropdown setting activeLensSettingValues

        settingDropdowns =
            map settingDropdownUsingSettingField model.activeLensSettingValues

        settingDropdownsPlusSettingHeading =
            text settingName :: settingDropdowns
    in
    tableRow settingDropdownsPlusSettingHeading
