module ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))

import Html exposing (Html, text)
import List exposing (map)
import ScalarSetTheory.Msg exposing (Msg)


type TableNode
    = TableNode
        { cellItself : Html Msg
        , cellChildren : List TableNode
        }
