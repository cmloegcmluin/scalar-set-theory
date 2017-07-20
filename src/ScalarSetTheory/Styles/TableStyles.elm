module ScalarSetTheory.Styles.TableStyles exposing (sstTableCellBorder, sstCellAndChildren, sstCellItself, sstCellChildrenContainer)

import Css exposing (px, rgb, solid, display, alignItems, justifyContent, width, outline3, margin, flexDirection, column, center, stretch, displayFlex)
import ScalarSetTheory.Styles.Styles exposing (styles)


sstTableCellBorder =
    styles
        [ outline3 (px 1) solid (rgb 128 128 128)
        , margin (px 0)
        ]

sstCellAndChildren =
    styles
        [ displayFlex
        , alignItems stretch
        ]

sstCellItself =
    styles
        [ displayFlex
        , alignItems center
        , justifyContent center
        , width (px 80)
        ]

sstCellChildrenContainer =
    styles
        [ displayFlex
        , flexDirection column
        ]
