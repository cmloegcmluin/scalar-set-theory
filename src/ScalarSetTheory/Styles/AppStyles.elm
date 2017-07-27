module ScalarSetTheory.Styles.AppStyles exposing (appStyle)

import Css exposing (margin, px)
import Html exposing (Attribute)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.Styles exposing (styles)


appStyle : Attribute Msg
appStyle =
    styles [ margin (px 10) ]
