module ScalarSetTheory.Components.TableHeader exposing (sectionNameToTableHeader, tableHeaderRow)

import Html exposing (Html, text, th, tr)
import List exposing (map)
import ScalarSetTheory.Styles.TableStyles exposing (tableBorder)
import ScalarSetTheory.Update exposing (Msg)


tableHeaderRow : List String -> Html Msg
tableHeaderRow sectionNames =
    tr []
        ([ th
            [ tableBorder ]
            [ text "section" ]
         ]
            ++ map sectionNameToTableHeader sectionNames
        )


sectionNameToTableHeader : String -> Html Msg
sectionNameToTableHeader sectionName =
    th
        [ tableBorder ]
        [ text sectionName ]
