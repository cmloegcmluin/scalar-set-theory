module ScalarSetTheory.Styles.Styles exposing (styles)

import Css exposing (asPairs)
import Html.Attributes exposing (style)


styles =
    asPairs >> style
