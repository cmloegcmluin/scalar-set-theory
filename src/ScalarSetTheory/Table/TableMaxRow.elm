module ScalarSetTheory.Table.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Html, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisMax))
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)


tableMaxRow : Model -> TableNode
tableMaxRow model =
    let
        maxDropdowns =
            map maxDropdown model.analysisSettings

        maxDropdownsPlusMaxHeading =
            text "max" :: maxDropdowns
    in
    tableRow maxDropdownsPlusMaxHeading


maxDropdown : AnalysisSetting -> Html Msg
maxDropdown analysisSetting =
    let
        selectedOption =
            toString analysisSetting.max

        analysis =
            analysisSetting.analysis

        handler =
            \newMax -> UpdateAnalysisMax (parseInt newMax) analysis

        attributes =
            [ onInput handler ]

        options =
            dropdownOptions analysis selectedOption
    in
    select attributes options
