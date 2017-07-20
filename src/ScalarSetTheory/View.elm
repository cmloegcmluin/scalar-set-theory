module ScalarSetTheory.View exposing (..)

import Html exposing (Html, div, h1, text)
import ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)
import ScalarSetTheory.Components.TableMaxRow exposing (tableMaxRow)
import ScalarSetTheory.Components.TableMinRow exposing (tableMinRow)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Types.TableNode exposing (TableNode, TableNode(TableNode))
import ScalarSetTheory.Components.SstTable exposing (sstCell)

view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Scalar Set Theory" ]
        , div
            [ ]
            [ tableHeaderRow model.activeSections
            , tableMinRow model
            , tableMaxRow model
            , sstCell model.tableBody
            ]
        ]
