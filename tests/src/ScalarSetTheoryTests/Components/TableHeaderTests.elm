module ScalarSetTheoryTests.Components.TableHeaderTests exposing (tableHeaderTests)

import Css exposing (border3, px, rgb, solid)
import Expect exposing (equal)
import Html exposing (div, text)
import ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)
import ScalarSetTheory.Styles.Styles exposing (styles)
import ScalarSetTheory.Styles.TableStyles exposing (sstCellAndChildren, sstCellChildrenContainer, sstCellItself)
import Test exposing (Test, describe, test)


tableHeaderTests : Test
tableHeaderTests =
    describe "tableHeaderRow"
        [ test "returns a table row with a list of the section titles in table headers, plus one additional table header at the beginning that says 'section'" <|
            \() ->
                let
                    expected =
                        div
                            [ sstCellAndChildren ]
                            [ div
                                [ sstCellItself ]
                                [ text "section" ]
                            , div
                                [ sstCellChildrenContainer ]
                                [ div
                                    [ sstCellAndChildren ]
                                    [ div
                                        [ sstCellItself ]
                                        [ text "ed" ]
                                    , div
                                        [ sstCellChildrenContainer ]
                                        [ div
                                            [ sstCellAndChildren ]
                                            [ div
                                                [ sstCellItself ]
                                                [ text "nChord" ]
                                            , div
                                                [ sstCellChildrenContainer ]
                                                []
                                            ]
                                        ]
                                    ]
                                ]
                            ]

                    actual =
                        tableHeaderRow [ "ed", "nChord" ]
                in
                equal expected actual
        ]
