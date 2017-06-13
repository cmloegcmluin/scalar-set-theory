module ScalarSetTheoryTests.ViewTests exposing (viewTests)

import Expect
import Html exposing (..)
import Html.Attributes exposing (value)
import ScalarSetTheory.Main exposing (view)
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
                                    [ td [] [ text "max" ]
                                    , td [] [ select [] [ option [ value "7" ] [ text "7" ] ] ]
                                    ]
                                , tr
                                    []
                                    [ td [] [ text "min" ]
                                    , td [] [ select [] [ option [ value "7" ] [ text "7" ] ] ]
                                    ]
                                , tr
                                    []
                                    [ td [] [ text "count (1)" ]
                                    , td [] [ text "7" ]
                                    ]
                                ]
                            ]

                    actual =
                        view { ed = { min = 7, max = 7 } }
                in
                Expect.equal expected actual
        ]
