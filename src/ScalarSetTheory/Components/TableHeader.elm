module ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)

import Html exposing (Html, div, text)
import List exposing (map)
import ScalarSetTheory.Components.TableRow exposing (htmlMsgListToTableRow)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))


tableHeaderRow : Model -> TableNode
tableHeaderRow model =
    htmlMsgListToTableRow ([ sectionNameToDiv "section" ] ++ map sectionNameToDiv model.activeSections)


sectionNameToDiv : String -> Html Msg
sectionNameToDiv sectionName =
    text sectionName
