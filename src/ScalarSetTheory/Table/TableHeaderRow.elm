module ScalarSetTheory.Table.TableHeaderRow exposing (tableHeaderRow)

import Html exposing (Html, div, text)
import List exposing (map)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)


tableHeaderRow : Model -> TableNode
tableHeaderRow model =
    let
        analysesInOrder =
            map .analysis model.analysisSettings

        analysisPropertiesInOrder =
            map getAnalysisProperties analysesInOrder

        analysisNames =
            map .name analysisPropertiesInOrder

        analysisNamesPlusAnalysisHeading =
            [ "analysis" ] ++ analysisNames

        analysisNamesPlusAnalysisHeadingAsHtml =
            map text analysisNamesPlusAnalysisHeading
    in
    tableRow analysisNamesPlusAnalysisHeadingAsHtml
