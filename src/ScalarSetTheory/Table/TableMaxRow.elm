module ScalarSetTheory.Table.TableMaxRow exposing (maxDropdown, tableMaxRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import Tuple exposing (first, second)


tableMaxRow : Model -> TableNode
tableMaxRow model =
    tableRow
        ([ text "max" ]
            ++ map analysisToMaxDropdown (analysisAndMaxPerAnalysis model.analysisSettings)
        )


analysisToMaxDropdown : ( Analysis, Int ) -> Html Msg
analysisToMaxDropdown analysisAndMax =
    maxDropdown (first analysisAndMax) (second analysisAndMax)


maxDropdown : Analysis -> Int -> Html Msg
maxDropdown analysis selectedOption =
    select
        (maxAttributes analysis)
        (dropdownOptions analysis (toString selectedOption))


maxAttributes : Analysis -> List (Attribute Msg)
maxAttributes analysis =
    [ onInput (\newMax -> maxOnInputHandler newMax analysis) ]


maxOnInputHandler : String -> Analysis -> Msg
maxOnInputHandler newMax analysis =
    UpdateAnalysisMax (parseInt newMax) analysis


analysisAndMaxPerAnalysis : AnalysisSettings -> List ( Analysis, Int )
analysisAndMaxPerAnalysis analysisSettings =
    map analysisAndMax analysisSettings


analysisAndMax : AnalysisSetting -> ( Analysis, Int )
analysisAndMax analysisSetting =
    ( analysisSetting.analysis, analysisSetting.max )
