module ScalarSetTheory.View exposing (view)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)
import List exposing (map)
import ScalarSetTheory.Components.TableNodeToHtml exposing (tableNodeToHtml)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Styles.AppStyles exposing (appStyle)
import ScalarSetTheory.Styles.TableStyles exposing (tableStyle)
import ScalarSetTheory.Table.TableBody exposing (tableBody)
import ScalarSetTheory.Table.TableHeaderRow exposing (tableHeaderRow)
import ScalarSetTheory.Table.TableSettingRow exposing (tableSettingRow)


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
            [ tableStyle, class "explorationTable" ]
            tableHtml
        ]
