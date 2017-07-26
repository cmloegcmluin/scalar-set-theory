module ScalarSetTheory.Table.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSettings, getAnalysisSetting)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import Tuple exposing (first, second)


tableMinRow : Model -> TableNode
tableMinRow model =
    tableRow
        ([ text "min" ]
            ++ map analysisToMinDropdown (analysisAndMinPerAnalysis model.analysisSettings)
        )


analysisToMinDropdown : ( Analysis, Int ) -> Html Msg
analysisToMinDropdown analysisAndMin =
    minDropdown (first analysisAndMin) (second analysisAndMin)


minDropdown : Analysis -> Int -> Html Msg
minDropdown analysis selectedOption =
    select
        (minAttributes analysis)
        (dropdownOptions analysis (toString selectedOption))


minAttributes : Analysis -> List (Attribute Msg)
minAttributes analysis =
    [ onInput (\newMin -> minOnInputHandler newMin analysis) ]


minOnInputHandler : String -> Analysis -> Msg
minOnInputHandler newMin analysis =
    UpdateAnalysisMin (parseInt newMin) analysis


analysisAndMinPerAnalysis : AnalysisSettings -> List ( Analysis, Int )
analysisAndMinPerAnalysis analysisSettings =
    map (\analysisSetting -> analysisAndMin analysisSetting.analysis analysisSettings) analysisSettings


analysisAndMin : Analysis -> AnalysisSettings -> ( Analysis, Int )
analysisAndMin analysis analysisSettings =
    let
        analysisSetting =
            getAnalysisSetting analysis analysisSettings
    in
    ( analysis, analysisSetting.min )
