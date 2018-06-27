module ScalarSetTheory.View exposing (view)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)
import List exposing (map)
import ScalarSetTheory.Css.AppStyles exposing (appStyle)
import ScalarSetTheory.Css.TableStyles exposing (tableStyle)
import ScalarSetTheory.Html.TableNodeToHtml exposing (tableNodeToHtml)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Types.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.TableNode.TableBody exposing (tableBody)
import ScalarSetTheory.TableNode.TableHeaderRow exposing (tableHeaderRow)
import ScalarSetTheory.TableNode.TableSettingRow exposing (tableSettingRow)


view : Model -> Html Msg
view model =
    let
        table =
            [ tableHeaderRow model
            , tableSettingRow Min model
            , tableSettingRow Max model
            , tableBody model
            ]

        tableHtml =
            map tableNodeToHtml table
    in
    div
        [ appStyle ]
        [ h1 [] [ text "Scalar Set Theory" ]
        , div
            [ tableStyle, class "phoropter" ]
            tableHtml
        ]
