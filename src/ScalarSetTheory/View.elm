module ScalarSetTheory.View exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)
import List exposing (map)
import ScalarSetTheory.Components.TableCell exposing (tableCell)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.AppStyles exposing (appStyle)
import ScalarSetTheory.Styles.TableStyles exposing (tableStyle)
import ScalarSetTheory.TableNode.TableBody exposing (tableBody)
import ScalarSetTheory.TableNode.TableHeaderRow exposing (tableHeaderRow)
import ScalarSetTheory.TableNode.TableMaxRow exposing (tableMaxRow)
import ScalarSetTheory.TableNode.TableMinRow exposing (tableMinRow)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))


view : Model -> Html Msg
view model =
    div
        [ appStyle ]
        [ h1 [] [ text "Scalar Set Theory" ]
        , div
            [ tableStyle, class "explorationTable" ]
            (map tableCell
                [ tableHeaderRow model
                , tableMinRow model
                , tableMaxRow model
                , tableBody model
                ]
            )
        ]
