module ScalarSetTheoryTests.ViewTests exposing (viewTests)

import Expect
import Html exposing (..)
import Html.Attributes exposing (rowspan, value)
import Html.Events exposing (onInput)
import ScalarSetTheory.Main exposing (..)
import Test exposing (..)


viewTests : Test
viewTests =
    describe "view"
        [ test "includes a table row for each equal division in the chosen range" <|
            \() ->
                let
                    expected =
                        div
                            []
                            [ h1 [] [ text "Scalar Set Theory" ]
                            , table
                                []
                                [ tr
                                    []
                                    [ th [] [ text "section" ]
                                    , th [] [ text "ed" ]
                                    ]
                                , tr
                                    []
                                    [ td [] [ text "min" ]
                                    , td [] [ select [ onInput edMinOnInputHandler ] [ option [ value "5" ] [ text "5" ] ] ]
                                    ]
                                , tr
                                    []
                                    [ td [] [ text "max" ]
                                    , td [] [ select [] [ option [ value "7" ] [ text "7" ] ] ]
                                    ]
                                , tr
                                    []
                                    [ td [ rowspan 3 ] [ text "count (3)" ]
                                    , td [] [ text "5" ]
                                    ]
                                , tr
                                    []
                                    [ td [] [ text "6" ]
                                    ]
                                , tr
                                    []
                                    [ td [] [ text "7" ]
                                    ]
                                ]
                            ]

                    actual =
                        view { ed = { min = "5", max = "7" } }
                in
                Expect.equal expected actual
        , test "edRangeToTableRows returns a list of table rows with a count spanning them vertically" <|
            \() ->
                let
                    expected =
                        [ tr
                            []
                            [ td [ rowspan 3 ] [ text "count (3)" ]
                            , td [] [ text "2" ]
                            ]
                        , tr
                            []
                            [ td [] [ text "3" ]
                            ]
                        , tr
                            []
                            [ td [] [ text "4" ]
                            ]
                        ]

                    actual =
                        edRangeToTableRows "2" "4"
                in
                Expect.equal expected actual
        ]
