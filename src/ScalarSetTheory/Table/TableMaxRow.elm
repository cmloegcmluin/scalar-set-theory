module ScalarSetTheory.Table.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Html, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
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
            [ text "max" ] ++ maxDropdowns
    in
    tableRow maxDropdownsPlusMaxHeading


maxDropdown : AnalysisSetting -> Html Msg
maxDropdown analysisSetting =
    let
        selectedOption =
            toString analysisSetting.max

        analysis =
            analysisSetting.analysis

        attributes =
            [ onInput (\newMax -> maxOnInputHandler newMax analysis) ]

        options =
            dropdownOptions analysis selectedOption
    in
    select attributes options


maxOnInputHandler : String -> Analysis -> Msg
maxOnInputHandler newMax analysis =
    UpdateAnalysisMax (parseInt newMax) analysis
