module ScalarSetTheoryTests.Components.TableMaxRowTests exposing (tableMaxRowTests)

import Css exposing (border3, px, rgb, solid)
import Expect exposing (equal)
import Html exposing (td, text, tr)
import ScalarSetTheory.Components.TableMaxRow exposing (maxDropdown, tableMaxRow)
import ScalarSetTheory.Styles.Styles exposing (styles)
import Test exposing (Test, describe, test)


tableMaxRowTests : Test
tableMaxRowTests =
    describe "tableMaxRow"
        [ test "returns a table row with a list of max dropdowns in table data (though each dropdown controls ed still), plus one additional table datum at the beginning that says 'max'" <|
            \() ->
                let
                    expected =
                        tr []
                            [ td
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                [ text "max" ]
                            , td
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                (maxDropdown "ed")
                            , td
                                [ styles [ border3 (px 1) solid (rgb 128 128 128) ] ]
                                (maxDropdown "n-chord")
                            ]

                    actual =
                        tableMaxRow [ "ed", "n-chord" ]
                in
                equal expected actual
        ]
