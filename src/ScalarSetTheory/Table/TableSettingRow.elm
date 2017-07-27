module ScalarSetTheory.Table.TableSettingRow exposing (settingDropdown, tableSettingRow)

import Html exposing (Html, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSettingValue))
import ScalarSetTheory.Settings.GetSettingValue exposing (getValueOfSetting)
import ScalarSetTheory.Settings.Setting exposing (Setting)
import ScalarSetTheory.Settings.SettingProperties exposing (getSettingProperties)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)


tableSettingRow : Setting -> Model -> TableNode
tableSettingRow setting model =
    let
        settingProperties =
            getSettingProperties setting

        settingName =
            settingProperties.name

        settingDropdownUsingSettingField =
            \activeAnalysisSettingValues -> settingDropdown setting activeAnalysisSettingValues

        settingDropdowns =
            map settingDropdownUsingSettingField model.activeAnalysisSettingValues

        settingDropdownsPlusSettingHeading =
            text settingName :: settingDropdowns
    in
    tableRow settingDropdownsPlusSettingHeading


settingDropdown : Setting -> AnalysisSettingValues -> Html Msg
settingDropdown setting analysisSettingValues =
    let
        selectedOption =
            getValueOfSetting analysisSettingValues setting

        analysis =
            analysisSettingValues.analysis

        handler =
            \newValue -> UpdateAnalysisSettingValue analysis setting (parseInt newValue)

        attributes =
            [ onInput handler ]

        options =
            dropdownOptions analysisSettingValues setting (toString selectedOption)
    in
    select attributes options
