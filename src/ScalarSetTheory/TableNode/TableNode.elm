module ScalarSetTheory.TableNode.TableNode exposing (TableNode(..))

import ScalarSetTheory.TableCell.TableCell exposing (TableCell)


type TableNode
    = TableNode
        { cellItself : Maybe TableCell
        , cellChildren : List TableNode
        }
