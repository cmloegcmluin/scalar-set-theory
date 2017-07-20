module ScalarSetTheory.Types.TableNode exposing (TableNode, TableNode(TableNode), emptyTableNodeList, emptyTableNode)

import Html exposing (Html, text)
import ScalarSetTheory.Msg exposing (Msg)
import List exposing (map)

type TableNode =
    TableNode
        { cellItself : Html Msg
        , cellChildren : List (TableNode)
        }


emptyTableNodeList : List TableNode
emptyTableNodeList =
    map TableNode [ ]


emptyTableNode : TableNode
emptyTableNode =
    TableNode
        { cellItself = text ""
        , cellChildren = emptyTableNodeList
        }
