module ScalarSetTheory.Table.TableHeaderRow exposing (tableHeaderRow)

import Html exposing (Html, div, text)
import List exposing (map)
import ScalarSetTheory.Analyses.Analyses exposing (analysisName)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)


tableHeaderRow : Model -> TableNode
tableHeaderRow model =
    tableRow (map text ([ "analysis" ] ++ map analysisName (map .analysis model.analysisSettings)))
