module ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))

import ScalarSetTheory.Table.TableCell exposing (TableCell)


type TableNode
    = TableNode
        { cellItself : Maybe TableCell
        , cellChildren : List TableNode
        }
