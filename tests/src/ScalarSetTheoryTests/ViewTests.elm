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
import ScalarSetTheory.View exposing (..)
import Test exposing (Test, describe, test)


viewTests : Test
viewTests =
    describe "view module"
        [ describe "view"
            [ test "includes a title and a table with a header and min and max dropdowns for both sections, plus the main table body arising from the ed range" <|
                \() ->
                    let
                        expected =
                            div
                                []
                                [ h1 [] [ text "Scalar Set Theory" ]
                                , table
                                    [ styles [ borderCollapse collapse ] ]
                                    ([ tableHeaderRow [ "ed", "n-chord" ] ]
                                        ++ [ tableMinRow [ "ed", "n-chord" ] ]
                                        ++ [ tableMaxRow [ "ed", "n-chord" ] ]
                                        ++ edRangeToTableRows "2" "3"
                                    )
                                ]

                        actual =
                            view
                                { ed = { min = "2", max = "3" }
                                , nChord = { min = "1", max = "100" }
                                , sections = [ "ed", "n-chord" ]
                                }
                    in
                    equal expected actual
            ]
        , describe "edRangeToTableRows"
            [ test "returns rows for the head of the ed range, plus sets of rows for each member of the tail of the ed range" <|
                \() ->
                    let
                        expected =
                            edHeadRows 2 4 ++ edTailRows 3 ++ edTailRows 4

                        actual =
                            edRangeToTableRows "2" "4"
                    in
                    equal expected actual
            ]
        , describe "edHeadRows"
            [ test "returns a td for all eds vertically spanning all of them, plus the smallest ed vertically spanning all of its possible n-chords, plus a td for each of those n-chords" <|
                \() ->
                    let
                        expected =
                            [ tr
                                []
                                [ td
                                    [ rowspan 12, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
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
                            edHeadRows 3 5
                    in
                    equal expected actual
            ]
        , describe "edHeadRowSpan"
            [ test "returns the rowspan to cover all eds (each of which spans some number of nchords)" <|
                \() ->
                    let
                        expected =
                            14

                        actual =
                            edHeadRowSpan 2 5
                    in
                    equal expected actual
            , test "(another example)" <|
                \() ->
                    let
                        expected =
                            7

                        actual =
                            edHeadRowSpan 3 4
                    in
                    equal expected actual
            ]
        , describe "edTailRows"
            [ test "returns a td for an ed vertically spanning all of its possible n-chords, plus a td for each of its n-chords" <|
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
                            edTailRows 3
                    in
                    equal expected actual
            ]
        , describe "nChordHeadRow"
            [ test "returns a single tr with one td for the parent ed and one td for the min of its n-chords" <|
                \() ->
                    let
                        expected =
                            tr
                                []
                                [ td
                                    [ rowspan 8, styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "8" ]
                                , td
                                    [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                    [ text "1" ]
                                ]

                        actual =
                            nChordHeadRow 8
                    in
                    equal expected actual
            ]
        , describe "nChordTailRow"
            [ test "returns a single tr with a single td for the n-chord" <|
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
