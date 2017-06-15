module ScalarSetTheoryTests.Sections.EqualDivisionTests exposing (equalDivisionTests)

import Expect exposing (equal)
import Html exposing (Html, option, text)
import Html.Attributes exposing (value)
import ScalarSetTheory.Sections.EqualDivision exposing (edRangeFilterOptions)
import ScalarSetTheory.Update exposing (Msg)
import Test exposing (Test, describe, test)


equalDivisionTests : Test
equalDivisionTests =
    describe "equal divisions section"
        [ describe "edRangeFilterOptions"
            [ test "returns a list of options with values and text between 2 and 100" <|
                \() ->
                    let
                        expected =
                            expectedRangeOptions

                        actual =
                            edRangeFilterOptions
                    in
                    equal expected actual
            ]
        ]


expectedRangeOptions : List (Html Msg)
expectedRangeOptions =
    [ option [ value "2" ] [ text "2" ]
    , option [ value "3" ] [ text "3" ]
    , option [ value "4" ] [ text "4" ]
    , option [ value "5" ] [ text "5" ]
    , option [ value "6" ] [ text "6" ]
    , option [ value "7" ] [ text "7" ]
    , option [ value "8" ] [ text "8" ]
    , option [ value "9" ] [ text "9" ]
    , option [ value "10" ] [ text "10" ]
    , option [ value "11" ] [ text "11" ]
    , option [ value "12" ] [ text "12" ]
    , option [ value "13" ] [ text "13" ]
    , option [ value "14" ] [ text "14" ]
    , option [ value "15" ] [ text "15" ]
    , option [ value "16" ] [ text "16" ]
    , option [ value "17" ] [ text "17" ]
    , option [ value "18" ] [ text "18" ]
    , option [ value "19" ] [ text "19" ]
    , option [ value "20" ] [ text "20" ]
    , option [ value "21" ] [ text "21" ]
    , option [ value "22" ] [ text "22" ]
    , option [ value "23" ] [ text "23" ]
    , option [ value "24" ] [ text "24" ]
    , option [ value "25" ] [ text "25" ]
    , option [ value "26" ] [ text "26" ]
    , option [ value "27" ] [ text "27" ]
    , option [ value "28" ] [ text "28" ]
    , option [ value "29" ] [ text "29" ]
    , option [ value "30" ] [ text "30" ]
    , option [ value "31" ] [ text "31" ]
    , option [ value "32" ] [ text "32" ]
    , option [ value "33" ] [ text "33" ]
    , option [ value "34" ] [ text "34" ]
    , option [ value "35" ] [ text "35" ]
    , option [ value "36" ] [ text "36" ]
    , option [ value "37" ] [ text "37" ]
    , option [ value "38" ] [ text "38" ]
    , option [ value "39" ] [ text "39" ]
    , option [ value "40" ] [ text "40" ]
    , option [ value "41" ] [ text "41" ]
    , option [ value "42" ] [ text "42" ]
    , option [ value "43" ] [ text "43" ]
    , option [ value "44" ] [ text "44" ]
    , option [ value "45" ] [ text "45" ]
    , option [ value "46" ] [ text "46" ]
    , option [ value "47" ] [ text "47" ]
    , option [ value "48" ] [ text "48" ]
    , option [ value "49" ] [ text "49" ]
    , option [ value "50" ] [ text "50" ]
    , option [ value "51" ] [ text "51" ]
    , option [ value "52" ] [ text "52" ]
    , option [ value "53" ] [ text "53" ]
    , option [ value "54" ] [ text "54" ]
    , option [ value "55" ] [ text "55" ]
    , option [ value "56" ] [ text "56" ]
    , option [ value "57" ] [ text "57" ]
    , option [ value "58" ] [ text "58" ]
    , option [ value "59" ] [ text "59" ]
    , option [ value "60" ] [ text "60" ]
    , option [ value "61" ] [ text "61" ]
    , option [ value "62" ] [ text "62" ]
    , option [ value "63" ] [ text "63" ]
    , option [ value "64" ] [ text "64" ]
    , option [ value "65" ] [ text "65" ]
    , option [ value "66" ] [ text "66" ]
    , option [ value "67" ] [ text "67" ]
    , option [ value "68" ] [ text "68" ]
    , option [ value "69" ] [ text "69" ]
    , option [ value "70" ] [ text "70" ]
    , option [ value "71" ] [ text "71" ]
    , option [ value "72" ] [ text "72" ]
    , option [ value "73" ] [ text "73" ]
    , option [ value "74" ] [ text "74" ]
    , option [ value "75" ] [ text "75" ]
    , option [ value "76" ] [ text "76" ]
    , option [ value "77" ] [ text "77" ]
    , option [ value "78" ] [ text "78" ]
    , option [ value "79" ] [ text "79" ]
    , option [ value "80" ] [ text "80" ]
    , option [ value "81" ] [ text "81" ]
    , option [ value "82" ] [ text "82" ]
    , option [ value "83" ] [ text "83" ]
    , option [ value "84" ] [ text "84" ]
    , option [ value "85" ] [ text "85" ]
    , option [ value "86" ] [ text "86" ]
    , option [ value "87" ] [ text "87" ]
    , option [ value "88" ] [ text "88" ]
    , option [ value "89" ] [ text "89" ]
    , option [ value "90" ] [ text "90" ]
    , option [ value "91" ] [ text "91" ]
    , option [ value "92" ] [ text "92" ]
    , option [ value "93" ] [ text "93" ]
    , option [ value "94" ] [ text "94" ]
    , option [ value "95" ] [ text "95" ]
    , option [ value "96" ] [ text "96" ]
    , option [ value "97" ] [ text "97" ]
    , option [ value "98" ] [ text "98" ]
    , option [ value "99" ] [ text "99" ]
    , option [ value "100" ] [ text "100" ]
    ]
