module ScalarSetTheoryTests.TableNode.TerminalNodeTests exposing (terminalNodeTests)

import Expect exposing (equal)
import Html.Styled exposing (text)
import ScalarSetTheory.Css.TableStyles exposing (defaultGrey, defaultGreyBackground)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(..))
import ScalarSetTheory.TableNode.TerminalNode exposing (terminalNode)
import Test exposing (Test, describe, test)


terminalNodeTests : Test
terminalNodeTests =
    describe "terminal node tests"
        [ test "makes the color into a background color; has no children" <|
            \() ->
                let
                    expected =
                        TableNode
                            { cellItself = Just (TableCell (text "finality") defaultGreyBackground)
                            , cellChildren = []
                            }

                    actual =
                        terminalNode "finality" defaultGrey
                in
                equal expected actual
        ]
