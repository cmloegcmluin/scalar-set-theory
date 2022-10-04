module ScalarSetTheoryTests.TableNode.TableHeaderTests exposing (tableHeaderTests)

import Expect exposing (equal)
import Html.Styled exposing (select, styled, text)
import ScalarSetTheory.Css.TableStyles exposing (blankCollapseToggleCellStyle, defaultGreyBackground, dropdownStyle)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableHeader exposing (tableLensHeaderRow, tableLensSettingRow)
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import ScalarSetTheory.Types.Lens exposing (Lens(..))
import ScalarSetTheory.Types.Setting exposing (Setting(..))
import Test exposing (Test, describe, test)


tableHeaderTests : Test
tableHeaderTests =
    describe "table header tests"
        [ test "when the tippy top header row, starts with 'lens', then lens names, adding spacers both for the children count cell as well as the collapse toggle" <|
            \() ->
                let
                    expected =
                        tableRow
                            [ Just (TableCell (text "lens") defaultGreyBackground)
                            , Just (TableCell (text "") blankCollapseToggleCellStyle)
                            , Nothing
                            , Just (TableCell (text "n-chord") defaultGreyBackground)
                            , Just (TableCell (text "") blankCollapseToggleCellStyle)
                            , Nothing
                            , Just (TableCell (text "equal division") defaultGreyBackground)
                            ]

                    model =
                        Model
                            [ { lens = NChord
                              , settingValues = []
                              }
                            , { lens = EqualDivision
                              , settingValues = []
                              }
                            ]
                            []

                    actual =
                        tableLensHeaderRow model
                in
                equal expected actual
        , test "when a setting row, starts with the setting name, then dropdowns for that setting for each lens" <|
            \() ->
                let
                    expected =
                        tableRow
                            [ Just (TableCell (text "min") defaultGreyBackground)
                            , Just (TableCell (text "") blankCollapseToggleCellStyle)
                            , Nothing
                            , Just (TableCell (styled select dropdownStyle [] []) defaultGreyBackground)
                            , Just (TableCell (text "") blankCollapseToggleCellStyle)
                            , Nothing
                            , Just (TableCell (styled select dropdownStyle [] []) defaultGreyBackground)
                            ]

                    model =
                        Model
                            [ { lens = NChord
                              , settingValues = []
                              }
                            , { lens = EqualDivision
                              , settingValues = []
                              }
                            ]
                            []

                    actual =
                        tableLensSettingRow Min model
                in
                equal expected actual
        ]
