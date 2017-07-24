module ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)

import Html exposing (Html, div, text)
import List exposing (map)
import ScalarSetTheory.Components.TableRow exposing (tableRow)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))


tableHeaderRow : Model -> TableNode
tableHeaderRow model =
    tableRow (map text ([ "section" ] ++ model.activeSections))
