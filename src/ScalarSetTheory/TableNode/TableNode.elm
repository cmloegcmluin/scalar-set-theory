module ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))

import ScalarSetTheory.TableCell.TableCell exposing (TableCell)


type TableNode
    = TableNode
        { cellItself : Maybe TableCell
        , cellChildren : List TableNode
        }
