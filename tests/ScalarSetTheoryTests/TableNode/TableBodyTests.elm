module ScalarSetTheoryTests.TableNode.TableBodyTests exposing (tableBodyTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Css.TableStyles exposing (defaultGrey)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableBody exposing (tableBody)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Types.Lens exposing (Lens(NChord))
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
                        Model []

                    actual =
                        tableBody model
                in
                equal expected actual
        , test "when there are active lens setting values" <|
            \() ->
                let
                    expected =
                        TableNode
                            { cellItself = Just (TableCell (text "root") defaultGrey)
                            , cellChildren =
                                [ TableNode
                                    { cellItself = Just (TableCell (text "1") defaultGrey)
                                    , cellChildren =
                                        [ TableNode
                                            { cellItself = Just (TableCell (text "0") (getLensProperties NChord).color)
                                            , cellChildren = []
                                            }
                                        ]
                                    }
                                ]
                            }

                    model =
                        Model
                            [ { lens = NChord
                              , settingValues = []
                              }
                            ]

                    actual =
                        tableBody model
                in
                equal expected actual
        ]
