module ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)

import Html exposing (Html, div, text)
import List exposing (map)
import ScalarSetTheory.Components.TableCell exposing (sstCell)
import ScalarSetTheory.Components.TableRow exposing (htmlMsgListToTableRow)
import ScalarSetTheory.Msg exposing (Msg)


tableHeaderRow : List String -> Html Msg
tableHeaderRow sectionNames =
    sstCell (htmlMsgListToTableRow ([ sectionNameToDiv "section" ] ++ map sectionNameToDiv sectionNames))


sectionNameToDiv : String -> Html Msg
sectionNameToDiv sectionName =
    text sectionName
