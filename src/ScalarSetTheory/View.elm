module ScalarSetTheory.View exposing (..)

import Html exposing (Html, div, h1, text)
import ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)
import ScalarSetTheory.Components.TableMaxRow exposing (tableMaxRow)
import ScalarSetTheory.Components.TableMinRow exposing (tableMinRow)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Types.TableNode exposing (TableNode, TableNode(TableNode))
import ScalarSetTheory.Components.SstTable exposing (sstCell)
import ScalarSetTheory.Styles.TableStyles exposing (tableStyle)
import ScalarSetTheory.Styles.AppStyles exposing (appStyle)

view : Model -> Html Msg
view model =
    div
        [ appStyle ]
        [ h1 [] [ text "Scalar Set Theory" ]
        , div
            [ tableStyle ]
            [ tableHeaderRow model.activeSections
            , tableMinRow model
            , tableMaxRow model
            , sstCell model.tableBody
            ]
        ]
