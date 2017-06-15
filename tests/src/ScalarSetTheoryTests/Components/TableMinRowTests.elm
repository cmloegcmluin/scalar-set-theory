module ScalarSetTheoryTests.Components.TableMinRowTests exposing (tableMinRowTests)

import Css exposing (border3, px, rgb, solid)
import Expect exposing (equal)
import Html exposing (td, text, tr)
import ScalarSetTheory.Components.TableMinRow exposing (minDropdown, tableMinRow)
import ScalarSetTheory.Styles.Styles exposing (styles)
import Test exposing (Test, describe, test)


tableMinRowTests : Test
tableMinRowTests =
    describe "tableMinRow"
        [ test "returns a table row with a list of min dropdowns in table data (though each dropdown controls ed still), plus one additional table datum at the beginning that says 'min'" <|
            \() ->
                let
                    expected =
                        tr []
                            [ td
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                [ text "min" ]
                            , td
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                (minDropdown "ed")
                            , td
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                (minDropdown "n-chord")
                            ]

                    actual =
                        tableMinRow [ "ed", "n-chord" ]
                in
                equal expected actual
        ]
