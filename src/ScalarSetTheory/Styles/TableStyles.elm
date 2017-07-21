module ScalarSetTheory.Styles.TableStyles exposing (sstCellAndChildren, sstCellItself, sstCellChildrenContainer, tableStyle)

import Css exposing (px, rgb, solid, display, alignItems, justifyContent, width, borderRight3, borderBottom3, borderTop3, borderLeft3, margin, flexDirection, column, center, stretch, displayFlex, display, inlineBlock)
import ScalarSetTheory.Styles.Styles exposing (styles)

sstCellAndChildren =
    styles
        [ displayFlex
        , alignItems stretch
        ]

sstCellItself =
    styles
        [ borderRight3 (px 1) solid (rgb 128 128 128)
        , borderBottom3 (px 1) solid (rgb 128 128 128)
        , displayFlex
        , alignItems center
        , justifyContent center
        , width (px 80)
        ]

sstCellChildrenContainer =
    styles
        [ displayFlex
        , flexDirection column
        ]


tableStyle =
    styles
        [ borderTop3 (px 1) solid (rgb 128 128 128)
        , borderLeft3 (px 1) solid (rgb 128 128 128)
        , display inlineBlock
        ]