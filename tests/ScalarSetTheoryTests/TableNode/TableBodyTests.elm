module ScalarSetTheoryTests.TableNode.TableBodyTests exposing (tableBodyTests)

import Expect exposing (equal)
import Html.Styled exposing (text)
import ScalarSetTheory.Css.TableStyles exposing (background, collapseToggleCellStyle, defaultGreyBackground)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableBody exposing (tableBody)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(..))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)
import ScalarSetTheory.Types.Lens exposing (Lens(..))
import Test exposing (Test, describe, test)


tableBodyTests : Test
tableBodyTests =
    describe "table body tests"
        [ test "when there are no active lens setting values" <|
            \() ->
                let
                    expected =
                        TableNode
                            { cellItself = Nothing
                            , cellChildren = []
                            }

                    model =
                        Model [] []

                    actual =
                        tableBody model
                in
                equal expected actual
        , test "when there are active lens setting values" <|
            \() ->
                let
                    expected =
                        tableRow
                            [ Just (TableCell (text "root") defaultGreyBackground)
                            , Just (TableCell (text "^") collapseToggleCellStyle)
                            , Just (TableCell (text "1") defaultGreyBackground)
                            , Just (TableCell (text "0") (background (getLensProperties NChord).color))
                            ]

                    model =
                        Model
                            [ { lens = NChord
                              , settingValues = []
                              }
                            ]
                            []

                    actual =
                        tableBody model
                in
                equal expected actual
        ]
