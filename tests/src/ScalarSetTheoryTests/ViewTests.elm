module ScalarSetTheoryTests.ViewTests exposing (viewTests)

import Css exposing (border3, borderCollapse, collapse, px, rgb, solid)
import Expect exposing (equal)
import Html exposing (div, h1, table, td, text, tr)
import Html.Attributes exposing (rowspan, value)
import Html.Events exposing (onInput)
import ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)
import ScalarSetTheory.Components.TableMaxRow exposing (tableMaxRow)
import ScalarSetTheory.Components.TableMinRow exposing (tableMinRow)
import ScalarSetTheory.Styles.Styles exposing (styles)
import ScalarSetTheory.Update exposing (Msg)
import ScalarSetTheory.View exposing (edHeadRows, edRangeToTableRows, edTailRows, nChordHeadRow, nChordTailRow, view)
import Test exposing (Test, describe, test)


viewTests : Test
viewTests =
    describe "view module"
        [ describe "view" []

        --            [ test "includes a title and a table with a header and min and max dropdowns for both sections, plus the main table body arising from the ed range" <|
        --                \() ->
        --                    let
        --                        expected =
        --                            div
        --                                []
        --                                [ h1 [] [ text "Scalar Set Theory" ]
        --                                , table
        --                                    [ styles [ borderCollapse collapse ] ]
        --                                    ([ tableHeaderRow [ "ed", "nChord" ] ]
        --                                        ++ [ tableMinRow [ ( "ed", "2" ), ( "nChord", "1" ) ] ]
        --                                        ++ [ tableMaxRow [ ( "ed", "3" ), ( "nChord", "100" ) ] ]
        --                                        ++ edRangeToTableRows "2" "3" "1" "100"
        --                                    )
        --                                ]
        --
        --                        actual =
        --                            view
        --                                { ed = { min = "2", max = "3" }
        --                                , nChord = { min = "1", max = "100" }
        --                                , activeSections = [ "ed", "nChord" ]
        --                                }
        --                    in
        --                    equal expected actual
        --            ]
        , describe "edRangeToTableRows"
            [ test "returns rows for the head of the ed range, plus sets of rows for each member of the tail of the ed range" <|
                \() ->
                    let
                        expected =
                            edHeadRows 2 4 2 100 ++ edTailRows 3 2 100 ++ edTailRows 4 2 100

                        actual =
                            edRangeToTableRows "2" "4" "2" "100"
                    in
                    equal expected actual
            ]
        , describe "edHeadRows"
            [ test "returns a td for all eds vertically spanning all of them, plus the smallest ed vertically spanning all of its possible nChords, plus a td for each of those nChords" <|
                \() ->
                    let
                        expected =
                            [ tr
                                []
                                [ td
                                    [ rowspan 9999, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "count (3)" ]
                                , td
                                    [ rowspan 3, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "3" ]
                                , td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "1" ]
                                ]
                            , tr
                                []
                                [ td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "2" ]
                                ]
                            , tr
                                []
                                [ td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "3" ]
                                ]
                            ]

                        actual =
                            edHeadRows 3 5 1 100
                    in
                    equal expected actual
            , test "cuts off at the nChord max if it is less than the edMin" <|
                \() ->
                    let
                        expected =
                            [ tr
                                []
                                [ td
                                    [ rowspan 9999, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "count (3)" ]
                                , td
                                    [ rowspan 2, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "3" ]
                                , td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "2" ]
                                ]
                            , tr
                                []
                                [ td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "3" ]
                                ]
                            ]

                        actual =
                            edHeadRows 3 5 2 3
                    in
                    equal expected actual
            ]
        , describe "edTailRows"
            [ test "returns a td for an ed vertically spanning all of its possible nChords, plus a td for each of its nChords" <|
                \() ->
                    let
                        expected =
                            [ tr
                                []
                                [ td
                                    [ rowspan 3, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "3" ]
                                , td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "1" ]
                                ]
                            , tr
                                []
                                [ td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "2" ]
                                ]
                            , tr
                                []
                                [ td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "3" ]
                                ]
                            ]

                        actual =
                            edTailRows 3 1 100
                    in
                    equal expected actual
            , test "cuts off at the nChord max if it is less than the ed" <|
                \() ->
                    let
                        expected =
                            [ tr
                                []
                                [ td
                                    [ rowspan 3, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "3" ]
                                , td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "1" ]
                                ]
                            , tr
                                []
                                [ td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "2" ]
                                ]
                            ]

                        actual =
                            edTailRows 3 1 2
                    in
                    equal expected actual
            ]
        , describe "nChordHeadRow"
            [ test "returns a single tr with one td for the parent ed and one td for the min of its nChords" <|
                \() ->
                    let
                        expected =
                            tr
                                []
                                [ td
                                    [ rowspan 7, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "8" ]
                                , td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "2" ]
                                ]

                        actual =
                            nChordHeadRow 8 2
                    in
                    equal expected actual
            ]
        , describe "nChordTailRow"
            [ test "returns a single tr with a single td for the nChord" <|
                \() ->
                    let
                        expected =
                            tr
                                []
                                [ td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "6" ]
                                ]

                        actual =
                            nChordTailRow 6
                    in
                    equal expected actual
            ]
        ]
