module ScalarSetTheory.Table.TableSettingRow exposing (settingDropdown, tableSettingRow)

import Html exposing (Html, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisSetting))
import ScalarSetTheory.Settings.Setting exposing (Setting)
import ScalarSetTheory.Settings.SettingProperties exposing (getSettingProperties)
import ScalarSetTheory.Settings.SettingValue exposing (getSettingValue)
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
            \analysisSetting -> settingDropdown setting analysisSetting

        settingDropdowns =
            map settingDropdownUsingSettingField model.analysisSettings

        settingDropdownsPlusSettingHeading =
            text settingName :: settingDropdowns
    in
    tableRow settingDropdownsPlusSettingHeading


settingDropdown : Setting -> AnalysisSetting -> Html Msg
settingDropdown setting analysisSetting =
    let
        maybeSelectedOption =
            getSettingValue analysisSetting.settingValues setting

        selectedOption =
            case maybeSelectedOption of
                Nothing ->
                    "0"

                Just selectedOptionAsInt ->
                    toString selectedOptionAsInt.value

        analysis =
            analysisSetting.analysis

        handler =
            \newSetting -> UpdateAnalysisSetting setting (parseInt newSetting) analysis

        attributes =
            [ onInput handler ]

        options =
            dropdownOptions analysis selectedOption
    in
    select attributes options
