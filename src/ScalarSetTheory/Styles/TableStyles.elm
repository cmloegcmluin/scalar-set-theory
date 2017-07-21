module ScalarSetTheory.Styles.TableStyles exposing (sstCellAndChildren, sstCellChildrenContainer, sstCellItself, tableStyle)

import Css exposing (alignItems, borderBottom3, borderLeft3, borderRight3, borderTop3, center, column, display, displayFlex, flexDirection, inlineBlock, justifyContent, margin, px, rem, rgb, solid, stretch, width)
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
