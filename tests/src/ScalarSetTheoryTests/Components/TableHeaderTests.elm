module ScalarSetTheoryTests.Components.TableHeaderTests exposing (tableHeaderTests)

import Css exposing (border3, px, rgb, solid)
import Expect exposing (equal)
import Html exposing (text, th, tr)
import ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)
import ScalarSetTheory.Styles.Styles exposing (styles)
import Test exposing (Test, describe, test)


tableHeaderTests : Test
tableHeaderTests =
    describe "tableHeaderRow"
        [ test "returns a table row with a list of the section titles in table headers, plus one additional table header at the beginning that says 'section'" <|
            \() ->
                let
                    expected =
                        tr []
                            [ th
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                [ text "section" ]
                            , th
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                [ text "ed" ]
                            , th
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                [ text "nChord" ]
                            ]

                    actual =
                        tableHeaderRow [ "ed", "nChord" ]
                in
                equal expected actual
        ]
