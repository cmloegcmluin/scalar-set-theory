module ScalarSetTheory.TableCell.TableCell exposing (TableCell)

import Css exposing (Style)
import Html.Styled exposing (Attribute, Html)
import ScalarSetTheory.Msg exposing (Msg)


type alias TableCell =
    { content : Html Msg
    , styles : List Style
    }
