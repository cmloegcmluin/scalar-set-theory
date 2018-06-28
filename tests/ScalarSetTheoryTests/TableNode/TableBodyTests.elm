module ScalarSetTheoryTests.TableNode.TableBodyTests exposing (tableBodyTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Model exposing (Model)
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
        ]
