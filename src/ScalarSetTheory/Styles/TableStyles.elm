module ScalarSetTheory.Styles.TableStyles exposing (tableCellAndChildren, tableCellChildrenContainer, tableCellItself, tableStyle)

import Css exposing (alignItems, borderBottom3, borderLeft3, borderRight3, borderTop3, center, column, display, displayFlex, flexDirection, inlineBlock, justifyContent, margin, px, rem, rgb, solid, stretch, width)
import ScalarSetTheory.Styles.Styles exposing (styles)


tableCellAndChildren =
    styles
        [ displayFlex
        , alignItems stretch
        ]


tableCellItself =
    styles
        [ borderRight3 (px 1) solid (rgb 128 128 128)
        , borderBottom3 (px 1) solid (rgb 128 128 128)
        , displayFlex
        , alignItems center
        , justifyContent center
        , width (px 80)
        ]


tableCellChildrenContainer =
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
