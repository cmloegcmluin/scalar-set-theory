module ScalarSetTheory.Table.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Html, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisMin))
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)


tableMinRow : Model -> TableNode
tableMinRow model =
    let
        minDropdowns =
            map minDropdown model.analysisSettings

        minDropdownsPlusMinHeading =
            text "min" :: minDropdowns
    in
    tableRow minDropdownsPlusMinHeading


minDropdown : AnalysisSetting -> Html Msg
minDropdown analysisSetting =
    let
        selectedOption =
            toString analysisSetting.min

        analysis =
            analysisSetting.analysis

        handler =
            \newMin -> UpdateAnalysisMin (parseInt newMin) analysis

        attributes =
            [ onInput handler ]

        options =
            dropdownOptions analysis selectedOption
    in
    select attributes options
