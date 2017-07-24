module ScalarSetTheory.View exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)
import List exposing (map)
import ScalarSetTheory.Components.TableBody exposing (tableBodyRow)
import ScalarSetTheory.Components.TableCell exposing (tableCell)
import ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)
import ScalarSetTheory.Components.TableMaxRow exposing (tableMaxRow)
import ScalarSetTheory.Components.TableMinRow exposing (tableMinRow)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.AppStyles exposing (appStyle)
import ScalarSetTheory.Styles.TableStyles exposing (tableStyle)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))


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
                , tableBodyRow model
                ]
            )
        ]
