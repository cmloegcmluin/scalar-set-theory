module ScalarSetTheory.Css.AppStyles exposing (appStyle)

import Css exposing (margin, px)
import Html exposing (Attribute)
import ScalarSetTheory.Css.Styles exposing (styles)
import ScalarSetTheory.Msg exposing (Msg)


appStyle : Attribute Msg
appStyle =
    styles [ margin (px 10) ]
