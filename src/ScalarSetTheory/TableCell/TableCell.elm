module ScalarSetTheory.TableCell.TableCell exposing (TableCell)

import Html exposing (Attribute, Html)
import ScalarSetTheory.Msg exposing (Msg)


type alias TableCell =
    { content : Html Msg
    , style : Attribute Msg
    }
