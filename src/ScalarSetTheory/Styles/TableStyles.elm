module ScalarSetTheory.Styles.TableStyles exposing (tableCellAndChildren, tableCellChildrenContainer, tableCellItself, tableStyle)

import Css exposing (alignItems, center, column, display, displayFlex, flexDirection, inlineBlock, justifyContent, marginLeft, marginTop, outline3, px, rgb, solid, stretch, width)
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
        [ outline3 (px 1) solid (rgb 128 128 128)
        , marginTop (px 1)
        , marginLeft (px 1)
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
