module ScalarSetTheoryTests.Html.DropdownTests exposing (dropdownTests)

import Expect exposing (equal)
import Html exposing (Html, option, select, text)
import Html.Attributes exposing (selected, value)
import ScalarSetTheory.Html.Dropdown exposing (dropdownOptions, settingDropdown)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)
import ScalarSetTheory.Types.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.Types.Setting exposing (Setting(Max, Min))
import Test exposing (Test, describe, test)


dropdownTests : Test
dropdownTests =
    describe "dropdowns"
        [ describe "dropdown options"
            [ test "for equal divisions, when the lens settings are at their ultimate maxes and mins, and the dropdown is for the min, it returns the full ultimate range (between 3 and 100), with the specified option selected" <|
                \() ->
                    let
                        expected =
                            fullEqualDivisionRange

                        lensSettingValues =
                            LensSettingValues
                                EqualDivision
                                [ SettingValue Min 3
                                , SettingValue Max 100
                                ]

                        actual =
                            dropdownOptions lensSettingValues Min "8"
                    in
                    equal expected actual
            , test "for equal divisions, when the lens settings are at their ultimate maxes and mins, and the dropdown is for the max, it also returns the full ultimate range, with the specified option selected as always" <|
                \() ->
                    let
                        expected =
                            fullEqualDivisionRange

                        lensSettingValues =
                            LensSettingValues
                                EqualDivision
                                [ SettingValue Min 3
                                , SettingValue Max 100
                                ]

                        actual =
                            dropdownOptions lensSettingValues Max "8"
                    in
                    equal expected actual
            , test "for equal divisions, when the lens setting min is above the ultimate min, and the lens setting max is at the ultimate max, and the dropdown is for the min, still returns the full ultimate range, specified option selected" <|
                \() ->
                    let
                        expected =
                            fullEqualDivisionRange

                        lensSettingValues =
                            LensSettingValues
                                EqualDivision
                                [ SettingValue Min 7
                                , SettingValue Max 100
                                ]

                        actual =
                            dropdownOptions lensSettingValues Min "8"
                    in
                    equal expected actual
            , test "for equal divisions, when the lens setting min is above the ultimate min, and the lens setting max is at the ultimate max, and the dropdown is for the max, returns only the range between the selected min and the ultimate max, specified option selected" <|
                \() ->
                    let
                        expected =
                            selectedMinToUltimateMaxEqualDivisionRange

                        lensSettingValues =
                            LensSettingValues
                                EqualDivision
                                [ SettingValue Min 7
                                , SettingValue Max 100
                                ]

                        actual =
                            dropdownOptions lensSettingValues Max "8"
                    in
                    equal expected actual
            , test "for equal divisions, when the lens setting max is below the ultimate max, and the lens setting min is at the ultimate min, and the dropdown is for the min, returns only the range between the ultimate min and the selected max, specified option selected" <|
                \() ->
                    let
                        expected =
                            ultimateMinToSelectedMaxEqualDivisionRange

                        lensSettingValues =
                            LensSettingValues
                                EqualDivision
                                [ SettingValue Min 3
                                , SettingValue Max 12
                                ]

                        actual =
                            dropdownOptions lensSettingValues Min "8"
                    in
                    equal expected actual
            , test "for equal divisions, when the lens setting max is below the ultimate max, and the lens setting min is at the ultimate min, and the dropdown is for the max, returns the full ultimate range, specified option selected" <|
                \() ->
                    let
                        expected =
                            fullEqualDivisionRange

                        lensSettingValues =
                            LensSettingValues
                                EqualDivision
                                [ SettingValue Min 3
                                , SettingValue Max 12
                                ]

                        actual =
                            dropdownOptions lensSettingValues Max "8"
                    in
                    equal expected actual
            , test "for nChords, returns a range between 2 and 100 instead of 3 to 100" <|
                \() ->
                    let
                        expected =
                            fullNChordRange

                        lensSettingValues =
                            LensSettingValues
                                NChord
                                [ SettingValue Min 2
                                , SettingValue Max 100
                                ]

                        actual =
                            dropdownOptions lensSettingValues Max "4"
                    in
                    equal expected actual
            ]
        , describe "setting dropdowns"
            [ test "when there are no setting values, do not style or attach a handler (primarily for testability, sorry)" <|
                \() ->
                    let
                        expected =
                            select [] []

                        lensSettingValues =
                            LensSettingValues NChord []

                        actual =
                            settingDropdown Min lensSettingValues
                    in
                    equal expected actual
            ]
        ]


fullEqualDivisionRange : List (Html Msg)
fullEqualDivisionRange =
    [ option [ value "3", selected False ] [ text "3" ]
    , option [ value "4", selected False ] [ text "4" ]
    , option [ value "5", selected False ] [ text "5" ]
    , option [ value "6", selected False ] [ text "6" ]
    , option [ value "7", selected False ] [ text "7" ]
    , option [ value "8", selected True ] [ text "8" ]
    , option [ value "9", selected False ] [ text "9" ]
    , option [ value "10", selected False ] [ text "10" ]
    , option [ value "11", selected False ] [ text "11" ]
    , option [ value "12", selected False ] [ text "12" ]
    , option [ value "13", selected False ] [ text "13" ]
    , option [ value "14", selected False ] [ text "14" ]
    , option [ value "15", selected False ] [ text "15" ]
    , option [ value "16", selected False ] [ text "16" ]
    , option [ value "17", selected False ] [ text "17" ]
    , option [ value "18", selected False ] [ text "18" ]
    , option [ value "19", selected False ] [ text "19" ]
    , option [ value "20", selected False ] [ text "20" ]
    , option [ value "21", selected False ] [ text "21" ]
    , option [ value "22", selected False ] [ text "22" ]
    , option [ value "23", selected False ] [ text "23" ]
    , option [ value "24", selected False ] [ text "24" ]
    , option [ value "25", selected False ] [ text "25" ]
    , option [ value "26", selected False ] [ text "26" ]
    , option [ value "27", selected False ] [ text "27" ]
    , option [ value "28", selected False ] [ text "28" ]
    , option [ value "29", selected False ] [ text "29" ]
    , option [ value "30", selected False ] [ text "30" ]
    , option [ value "31", selected False ] [ text "31" ]
    , option [ value "32", selected False ] [ text "32" ]
    , option [ value "33", selected False ] [ text "33" ]
    , option [ value "34", selected False ] [ text "34" ]
    , option [ value "35", selected False ] [ text "35" ]
    , option [ value "36", selected False ] [ text "36" ]
    , option [ value "37", selected False ] [ text "37" ]
    , option [ value "38", selected False ] [ text "38" ]
    , option [ value "39", selected False ] [ text "39" ]
    , option [ value "40", selected False ] [ text "40" ]
    , option [ value "41", selected False ] [ text "41" ]
    , option [ value "42", selected False ] [ text "42" ]
    , option [ value "43", selected False ] [ text "43" ]
    , option [ value "44", selected False ] [ text "44" ]
    , option [ value "45", selected False ] [ text "45" ]
    , option [ value "46", selected False ] [ text "46" ]
    , option [ value "47", selected False ] [ text "47" ]
    , option [ value "48", selected False ] [ text "48" ]
    , option [ value "49", selected False ] [ text "49" ]
    , option [ value "50", selected False ] [ text "50" ]
    , option [ value "51", selected False ] [ text "51" ]
    , option [ value "52", selected False ] [ text "52" ]
    , option [ value "53", selected False ] [ text "53" ]
    , option [ value "54", selected False ] [ text "54" ]
    , option [ value "55", selected False ] [ text "55" ]
    , option [ value "56", selected False ] [ text "56" ]
    , option [ value "57", selected False ] [ text "57" ]
    , option [ value "58", selected False ] [ text "58" ]
    , option [ value "59", selected False ] [ text "59" ]
    , option [ value "60", selected False ] [ text "60" ]
    , option [ value "61", selected False ] [ text "61" ]
    , option [ value "62", selected False ] [ text "62" ]
    , option [ value "63", selected False ] [ text "63" ]
    , option [ value "64", selected False ] [ text "64" ]
    , option [ value "65", selected False ] [ text "65" ]
    , option [ value "66", selected False ] [ text "66" ]
    , option [ value "67", selected False ] [ text "67" ]
    , option [ value "68", selected False ] [ text "68" ]
    , option [ value "69", selected False ] [ text "69" ]
    , option [ value "70", selected False ] [ text "70" ]
    , option [ value "71", selected False ] [ text "71" ]
    , option [ value "72", selected False ] [ text "72" ]
    , option [ value "73", selected False ] [ text "73" ]
    , option [ value "74", selected False ] [ text "74" ]
    , option [ value "75", selected False ] [ text "75" ]
    , option [ value "76", selected False ] [ text "76" ]
    , option [ value "77", selected False ] [ text "77" ]
    , option [ value "78", selected False ] [ text "78" ]
    , option [ value "79", selected False ] [ text "79" ]
    , option [ value "80", selected False ] [ text "80" ]
    , option [ value "81", selected False ] [ text "81" ]
    , option [ value "82", selected False ] [ text "82" ]
    , option [ value "83", selected False ] [ text "83" ]
    , option [ value "84", selected False ] [ text "84" ]
    , option [ value "85", selected False ] [ text "85" ]
    , option [ value "86", selected False ] [ text "86" ]
    , option [ value "87", selected False ] [ text "87" ]
    , option [ value "88", selected False ] [ text "88" ]
    , option [ value "89", selected False ] [ text "89" ]
    , option [ value "90", selected False ] [ text "90" ]
    , option [ value "91", selected False ] [ text "91" ]
    , option [ value "92", selected False ] [ text "92" ]
    , option [ value "93", selected False ] [ text "93" ]
    , option [ value "94", selected False ] [ text "94" ]
    , option [ value "95", selected False ] [ text "95" ]
    , option [ value "96", selected False ] [ text "96" ]
    , option [ value "97", selected False ] [ text "97" ]
    , option [ value "98", selected False ] [ text "98" ]
    , option [ value "99", selected False ] [ text "99" ]
    , option [ value "100", selected False ] [ text "100" ]
    ]


selectedMinToUltimateMaxEqualDivisionRange : List (Html Msg)
selectedMinToUltimateMaxEqualDivisionRange =
    [ option [ value "7", selected False ] [ text "7" ]
    , option [ value "8", selected True ] [ text "8" ]
    , option [ value "9", selected False ] [ text "9" ]
    , option [ value "10", selected False ] [ text "10" ]
    , option [ value "11", selected False ] [ text "11" ]
    , option [ value "12", selected False ] [ text "12" ]
    , option [ value "13", selected False ] [ text "13" ]
    , option [ value "14", selected False ] [ text "14" ]
    , option [ value "15", selected False ] [ text "15" ]
    , option [ value "16", selected False ] [ text "16" ]
    , option [ value "17", selected False ] [ text "17" ]
    , option [ value "18", selected False ] [ text "18" ]
    , option [ value "19", selected False ] [ text "19" ]
    , option [ value "20", selected False ] [ text "20" ]
    , option [ value "21", selected False ] [ text "21" ]
    , option [ value "22", selected False ] [ text "22" ]
    , option [ value "23", selected False ] [ text "23" ]
    , option [ value "24", selected False ] [ text "24" ]
    , option [ value "25", selected False ] [ text "25" ]
    , option [ value "26", selected False ] [ text "26" ]
    , option [ value "27", selected False ] [ text "27" ]
    , option [ value "28", selected False ] [ text "28" ]
    , option [ value "29", selected False ] [ text "29" ]
    , option [ value "30", selected False ] [ text "30" ]
    , option [ value "31", selected False ] [ text "31" ]
    , option [ value "32", selected False ] [ text "32" ]
    , option [ value "33", selected False ] [ text "33" ]
    , option [ value "34", selected False ] [ text "34" ]
    , option [ value "35", selected False ] [ text "35" ]
    , option [ value "36", selected False ] [ text "36" ]
    , option [ value "37", selected False ] [ text "37" ]
    , option [ value "38", selected False ] [ text "38" ]
    , option [ value "39", selected False ] [ text "39" ]
    , option [ value "40", selected False ] [ text "40" ]
    , option [ value "41", selected False ] [ text "41" ]
    , option [ value "42", selected False ] [ text "42" ]
    , option [ value "43", selected False ] [ text "43" ]
    , option [ value "44", selected False ] [ text "44" ]
    , option [ value "45", selected False ] [ text "45" ]
    , option [ value "46", selected False ] [ text "46" ]
    , option [ value "47", selected False ] [ text "47" ]
    , option [ value "48", selected False ] [ text "48" ]
    , option [ value "49", selected False ] [ text "49" ]
    , option [ value "50", selected False ] [ text "50" ]
    , option [ value "51", selected False ] [ text "51" ]
    , option [ value "52", selected False ] [ text "52" ]
    , option [ value "53", selected False ] [ text "53" ]
    , option [ value "54", selected False ] [ text "54" ]
    , option [ value "55", selected False ] [ text "55" ]
    , option [ value "56", selected False ] [ text "56" ]
    , option [ value "57", selected False ] [ text "57" ]
    , option [ value "58", selected False ] [ text "58" ]
    , option [ value "59", selected False ] [ text "59" ]
    , option [ value "60", selected False ] [ text "60" ]
    , option [ value "61", selected False ] [ text "61" ]
    , option [ value "62", selected False ] [ text "62" ]
    , option [ value "63", selected False ] [ text "63" ]
    , option [ value "64", selected False ] [ text "64" ]
    , option [ value "65", selected False ] [ text "65" ]
    , option [ value "66", selected False ] [ text "66" ]
    , option [ value "67", selected False ] [ text "67" ]
    , option [ value "68", selected False ] [ text "68" ]
    , option [ value "69", selected False ] [ text "69" ]
    , option [ value "70", selected False ] [ text "70" ]
    , option [ value "71", selected False ] [ text "71" ]
    , option [ value "72", selected False ] [ text "72" ]
    , option [ value "73", selected False ] [ text "73" ]
    , option [ value "74", selected False ] [ text "74" ]
    , option [ value "75", selected False ] [ text "75" ]
    , option [ value "76", selected False ] [ text "76" ]
    , option [ value "77", selected False ] [ text "77" ]
    , option [ value "78", selected False ] [ text "78" ]
    , option [ value "79", selected False ] [ text "79" ]
    , option [ value "80", selected False ] [ text "80" ]
    , option [ value "81", selected False ] [ text "81" ]
    , option [ value "82", selected False ] [ text "82" ]
    , option [ value "83", selected False ] [ text "83" ]
    , option [ value "84", selected False ] [ text "84" ]
    , option [ value "85", selected False ] [ text "85" ]
    , option [ value "86", selected False ] [ text "86" ]
    , option [ value "87", selected False ] [ text "87" ]
    , option [ value "88", selected False ] [ text "88" ]
    , option [ value "89", selected False ] [ text "89" ]
    , option [ value "90", selected False ] [ text "90" ]
    , option [ value "91", selected False ] [ text "91" ]
    , option [ value "92", selected False ] [ text "92" ]
    , option [ value "93", selected False ] [ text "93" ]
    , option [ value "94", selected False ] [ text "94" ]
    , option [ value "95", selected False ] [ text "95" ]
    , option [ value "96", selected False ] [ text "96" ]
    , option [ value "97", selected False ] [ text "97" ]
    , option [ value "98", selected False ] [ text "98" ]
    , option [ value "99", selected False ] [ text "99" ]
    , option [ value "100", selected False ] [ text "100" ]
    ]


ultimateMinToSelectedMaxEqualDivisionRange : List (Html Msg)
ultimateMinToSelectedMaxEqualDivisionRange =
    [ option [ value "3", selected False ] [ text "3" ]
    , option [ value "4", selected False ] [ text "4" ]
    , option [ value "5", selected False ] [ text "5" ]
    , option [ value "6", selected False ] [ text "6" ]
    , option [ value "7", selected False ] [ text "7" ]
    , option [ value "8", selected True ] [ text "8" ]
    , option [ value "9", selected False ] [ text "9" ]
    , option [ value "10", selected False ] [ text "10" ]
    , option [ value "11", selected False ] [ text "11" ]
    , option [ value "12", selected False ] [ text "12" ]
    ]


fullNChordRange : List (Html Msg)
fullNChordRange =
    [ option [ value "2", selected False ] [ text "2" ]
    , option [ value "3", selected False ] [ text "3" ]
    , option [ value "4", selected True ] [ text "4" ]
    , option [ value "5", selected False ] [ text "5" ]
    , option [ value "6", selected False ] [ text "6" ]
    , option [ value "7", selected False ] [ text "7" ]
    , option [ value "8", selected False ] [ text "8" ]
    , option [ value "9", selected False ] [ text "9" ]
    , option [ value "10", selected False ] [ text "10" ]
    , option [ value "11", selected False ] [ text "11" ]
    , option [ value "12", selected False ] [ text "12" ]
    , option [ value "13", selected False ] [ text "13" ]
    , option [ value "14", selected False ] [ text "14" ]
    , option [ value "15", selected False ] [ text "15" ]
    , option [ value "16", selected False ] [ text "16" ]
    , option [ value "17", selected False ] [ text "17" ]
    , option [ value "18", selected False ] [ text "18" ]
    , option [ value "19", selected False ] [ text "19" ]
    , option [ value "20", selected False ] [ text "20" ]
    , option [ value "21", selected False ] [ text "21" ]
    , option [ value "22", selected False ] [ text "22" ]
    , option [ value "23", selected False ] [ text "23" ]
    , option [ value "24", selected False ] [ text "24" ]
    , option [ value "25", selected False ] [ text "25" ]
    , option [ value "26", selected False ] [ text "26" ]
    , option [ value "27", selected False ] [ text "27" ]
    , option [ value "28", selected False ] [ text "28" ]
    , option [ value "29", selected False ] [ text "29" ]
    , option [ value "30", selected False ] [ text "30" ]
    , option [ value "31", selected False ] [ text "31" ]
    , option [ value "32", selected False ] [ text "32" ]
    , option [ value "33", selected False ] [ text "33" ]
    , option [ value "34", selected False ] [ text "34" ]
    , option [ value "35", selected False ] [ text "35" ]
    , option [ value "36", selected False ] [ text "36" ]
    , option [ value "37", selected False ] [ text "37" ]
    , option [ value "38", selected False ] [ text "38" ]
    , option [ value "39", selected False ] [ text "39" ]
    , option [ value "40", selected False ] [ text "40" ]
    , option [ value "41", selected False ] [ text "41" ]
    , option [ value "42", selected False ] [ text "42" ]
    , option [ value "43", selected False ] [ text "43" ]
    , option [ value "44", selected False ] [ text "44" ]
    , option [ value "45", selected False ] [ text "45" ]
    , option [ value "46", selected False ] [ text "46" ]
    , option [ value "47", selected False ] [ text "47" ]
    , option [ value "48", selected False ] [ text "48" ]
    , option [ value "49", selected False ] [ text "49" ]
    , option [ value "50", selected False ] [ text "50" ]
    , option [ value "51", selected False ] [ text "51" ]
    , option [ value "52", selected False ] [ text "52" ]
    , option [ value "53", selected False ] [ text "53" ]
    , option [ value "54", selected False ] [ text "54" ]
    , option [ value "55", selected False ] [ text "55" ]
    , option [ value "56", selected False ] [ text "56" ]
    , option [ value "57", selected False ] [ text "57" ]
    , option [ value "58", selected False ] [ text "58" ]
    , option [ value "59", selected False ] [ text "59" ]
    , option [ value "60", selected False ] [ text "60" ]
    , option [ value "61", selected False ] [ text "61" ]
    , option [ value "62", selected False ] [ text "62" ]
    , option [ value "63", selected False ] [ text "63" ]
    , option [ value "64", selected False ] [ text "64" ]
    , option [ value "65", selected False ] [ text "65" ]
    , option [ value "66", selected False ] [ text "66" ]
    , option [ value "67", selected False ] [ text "67" ]
    , option [ value "68", selected False ] [ text "68" ]
    , option [ value "69", selected False ] [ text "69" ]
    , option [ value "70", selected False ] [ text "70" ]
    , option [ value "71", selected False ] [ text "71" ]
    , option [ value "72", selected False ] [ text "72" ]
    , option [ value "73", selected False ] [ text "73" ]
    , option [ value "74", selected False ] [ text "74" ]
    , option [ value "75", selected False ] [ text "75" ]
    , option [ value "76", selected False ] [ text "76" ]
    , option [ value "77", selected False ] [ text "77" ]
    , option [ value "78", selected False ] [ text "78" ]
    , option [ value "79", selected False ] [ text "79" ]
    , option [ value "80", selected False ] [ text "80" ]
    , option [ value "81", selected False ] [ text "81" ]
    , option [ value "82", selected False ] [ text "82" ]
    , option [ value "83", selected False ] [ text "83" ]
    , option [ value "84", selected False ] [ text "84" ]
    , option [ value "85", selected False ] [ text "85" ]
    , option [ value "86", selected False ] [ text "86" ]
    , option [ value "87", selected False ] [ text "87" ]
    , option [ value "88", selected False ] [ text "88" ]
    , option [ value "89", selected False ] [ text "89" ]
    , option [ value "90", selected False ] [ text "90" ]
    , option [ value "91", selected False ] [ text "91" ]
    , option [ value "92", selected False ] [ text "92" ]
    , option [ value "93", selected False ] [ text "93" ]
    , option [ value "94", selected False ] [ text "94" ]
    , option [ value "95", selected False ] [ text "95" ]
    , option [ value "96", selected False ] [ text "96" ]
    , option [ value "97", selected False ] [ text "97" ]
    , option [ value "98", selected False ] [ text "98" ]
    , option [ value "99", selected False ] [ text "99" ]
    , option [ value "100", selected False ] [ text "100" ]
    ]
