module ScalarSetTheory.TableNode.TableSettingRow exposing (tableSettingRow)

import Html exposing (Html, text)
import List exposing (map)
import ScalarSetTheory.Html.Dropdown exposing (settingDropdown)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateLensSettingValue))
import ScalarSetTheory.Setting.Setting exposing (Setting)
import ScalarSetTheory.SettingProperties.SettingProperties exposing (getSettingProperties)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


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
