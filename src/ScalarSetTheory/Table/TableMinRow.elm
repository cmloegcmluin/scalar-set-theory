module ScalarSetTheory.Table.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateAnalysisMin))
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
    map analysisAndMin analysisSettings


analysisAndMin : AnalysisSetting -> ( Analysis, Int )
analysisAndMin analysisSetting =
    ( analysisSetting.analysis, analysisSetting.min )
