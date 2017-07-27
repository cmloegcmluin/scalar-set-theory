module ScalarSetTheory.Styles.TableStyles exposing (tableCellAndChildren, tableCellChildrenContainer, tableCellItself, tableStyle)

import Css exposing (alignItems, borderBottom3, borderLeft3, borderRight3, borderTop3, center, column, display, displayFlex, flexDirection, inlineBlock, justifyContent, px, rgb, solid, stretch, width)
import Html exposing (Attribute)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.Styles exposing (styles)


tableCellAndChildren : Attribute Msg
tableCellAndChildren =
    styles
        [ displayFlex
        , alignItems stretch
        ]


tableCellItself : Attribute Msg
tableCellItself =
    styles
        [ borderTop3 (px 1) solid (rgb 128 128 128)
        , borderLeft3 (px 1) solid (rgb 128 128 128)
        , borderRight3 (px 1) solid (rgb 128 128 128)
        , borderBottom3 (px 1) solid (rgb 128 128 128)
        , displayFlex
        , alignItems center
        , justifyContent center
        , width (px 100)
        ]


tableCellChildrenContainer : Attribute Msg
tableCellChildrenContainer =
    styles
        [ displayFlex
        , flexDirection column
        ]


tableStyle : Attribute Msg
tableStyle =
    styles
        [ display inlineBlock
        ]
