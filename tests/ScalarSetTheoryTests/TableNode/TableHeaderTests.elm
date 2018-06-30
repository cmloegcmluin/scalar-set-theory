module ScalarSetTheoryTests.TableNode.TableHeaderTests exposing (tableHeaderTests)

import Css exposing (px, width)
import Expect exposing (equal)
import Html exposing (option, select, text)
import Html.Events exposing (onInput)
import ScalarSetTheory.Css.Styles exposing (styles)
import ScalarSetTheory.Css.TableStyles exposing (blankCollapseToggleCellStyle, defaultGreyBackground)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg(UpdateLensSettingValue))
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableHeader exposing (tableLensHeaderRow, tableLensSettingRow)
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import ScalarSetTheory.Types.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.Types.Setting exposing (Setting(Min))
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
                            , Just (TableCell (select [] []) defaultGreyBackground)
                            , Just (TableCell (text "") blankCollapseToggleCellStyle)
                            , Nothing
                            , Just (TableCell (select [] []) defaultGreyBackground)
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
