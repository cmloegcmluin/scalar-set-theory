module ScalarSetTheory.TableNode.TerminalNode exposing (terminalNode)

import Css exposing (Color)
import Html exposing (text)
import ScalarSetTheory.Css.TableStyles exposing (background)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))


terminalNode : String -> Color -> TableNode
terminalNode childValue lensColor =
    TableNode
        { cellItself =
            Just
                (TableCell
                    (text childValue)
                    (background lensColor)
                )
        , cellChildren = []
        }
