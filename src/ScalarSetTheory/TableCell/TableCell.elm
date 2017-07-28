module ScalarSetTheory.TableCell.TableCell exposing (TableCell)

import Css exposing (Color)
import Html exposing (Html)
import ScalarSetTheory.Msg exposing (Msg)


type alias TableCell =
    { content : Html Msg
    , color : Color
    }
