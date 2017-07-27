module ScalarSetTheory.Table.TableSettingRow exposing (settingDropdown, tableSettingRow)

import Html exposing (Html, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Settings.Setting exposing (Setting)
import ScalarSetTheory.Settings.SettingProperties exposing (SettingProperties, getSettingProperties)
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

        settingDropdownUsingSettingProperties =
            \analysisSetting -> settingDropdown settingProperties analysisSetting

        settingDropdowns =
            map settingDropdownUsingSettingProperties model.analysisSettings

        settingDropdownsPlusSettingHeading =
            text settingName :: settingDropdowns
    in
    tableRow settingDropdownsPlusSettingHeading


settingDropdown : SettingProperties -> AnalysisSetting -> Html Msg
settingDropdown settingProperties analysisSetting =
    let
        settingUpdater =
            settingProperties.updater

        settingField =
            settingProperties.field

        selectedOption =
            toString (settingField analysisSetting)

        analysis =
            analysisSetting.analysis

        handler =
            \newSetting -> settingUpdater (parseInt newSetting) analysis

        attributes =
            [ onInput handler ]

        options =
            dropdownOptions analysis selectedOption
    in
    select attributes options
