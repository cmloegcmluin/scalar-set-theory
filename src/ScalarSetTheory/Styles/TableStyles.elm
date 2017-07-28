module ScalarSetTheory.Styles.TableStyles exposing (blankTableCellStyle, tableCellAndChildrenStyle, tableCellChildrenContainerStyle, tableCellItselfStyle, tableStyle)

import Css exposing (alignItems, center, column, display, displayFlex, flexDirection, inlineBlock, justifyContent, marginLeft, marginTop, outline3, px, rgb, solid, stretch, width)
import Html exposing (Attribute)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Styles.Styles exposing (styles)


tableCellAndChildrenStyle : Attribute Msg
tableCellAndChildrenStyle =
    styles
        [ displayFlex
        , alignItems stretch
        ]


tableCellItselfStyle : Attribute Msg
tableCellItselfStyle =
    styles
        [ outline3 (px 1) solid (rgb 128 128 128)
        , marginTop (px 1)
        , marginLeft (px 1)
        , displayFlex
        , alignItems center
        , justifyContent center
        , width (px 100)
        ]


blankTableCellStyle : Attribute Msg
blankTableCellStyle =
    styles
        [ marginTop (px 1)
        , marginLeft (px 1)
        , displayFlex
        , width (px 100)
        ]


tableCellChildrenContainerStyle : Attribute Msg
tableCellChildrenContainerStyle =
    styles
        [ displayFlex
        , flexDirection column
        ]


tableStyle : Attribute Msg
tableStyle =
    styles
        [ display inlineBlock
        ]
