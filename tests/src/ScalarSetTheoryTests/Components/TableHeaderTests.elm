module ScalarSetTheoryTests.Components.TableHeaderTests exposing (tableHeaderTests)

import Css exposing (border3, px, rgb, solid)
import Expect exposing (equal)
import Html exposing (text, div)
import ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)
import ScalarSetTheory.Styles.Styles exposing (styles)
import Test exposing (Test, describe, test)
import ScalarSetTheory.Styles.TableStyles exposing (sstTableCellBorder, sstCellAndChildren, sstCellItself, sstCellChildrenContainer)


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
                                [ sstCellItself, sstTableCellBorder ]
                                [ text "section" ]
                            , div
                                [ sstCellChildrenContainer ]
                                [ div
                                    [ sstCellAndChildren ]
                                    [ div
                                        [ sstCellItself, sstTableCellBorder ]
                                        [ text "ed" ]
                                    , div
                                        [ sstCellChildrenContainer ]
                                        [ div
                                            [ sstCellAndChildren ]
                                            [ div
                                                [ sstCellItself, sstTableCellBorder ]
                                                [ text "nChord" ]
                                            , div
                                                [ sstCellChildrenContainer ]
                                                [ ]
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
