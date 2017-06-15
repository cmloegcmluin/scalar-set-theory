module ScalarSetTheory.Styles.TableStyles exposing (tableBorder, tableBorderCollapse)

import Css exposing (asPairs, border3, borderCollapse, collapse, px, rgb, solid)
import ScalarSetTheory.Styles.Styles exposing (styles)


tableBorder =
    styles [ border3 (px 1) solid (rgb 128 128 128) ]


tableBorderCollapse =
    styles [ borderCollapse collapse ]
