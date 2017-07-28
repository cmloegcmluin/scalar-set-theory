module ScalarSetTheory.Css.Styles exposing (styles)

import Css exposing (asPairs)
import Html exposing (Attribute)
import Html.Attributes exposing (style)
import ScalarSetTheory.Msg exposing (Msg)


styles : List Css.Mixin -> Attribute Msg
styles =
    asPairs >> style
