module ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)

import Html exposing (Html)
import ScalarSetTheory.Components.SstTable exposing (sstCell, stringListToTableRow)
import ScalarSetTheory.Msg exposing (Msg)


tableHeaderRow : List String -> Html Msg
tableHeaderRow sectionNames =
    sstCell (stringListToTableRow ([ "section" ] ++ sectionNames))
