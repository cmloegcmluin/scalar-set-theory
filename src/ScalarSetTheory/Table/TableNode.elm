module ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))

import Html exposing (Html)
import ScalarSetTheory.Msg exposing (Msg)


type TableNode
    = TableNode
        { cellItself : Html Msg
        , cellChildren : List TableNode
        }
