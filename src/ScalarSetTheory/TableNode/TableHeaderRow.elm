module ScalarSetTheory.TableNode.TableHeaderRow exposing (tableHeaderRow)

import Html exposing (Html, div, text)
import List exposing (map)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)


tableHeaderRow : Model -> TableNode
tableHeaderRow model =
    tableRow (map text ([ "section" ] ++ map sectionNamesFromData model.sectionData))
