module ScalarSetTheory.Css.TableStyles exposing (background, blankTableCellStyle, borderGrey, defaultGrey, defaultGreyBackground, dropdownStyle, noStyle, tableCellAndChildrenStyle, tableCellChildrenContainerStyle, tableCellItselfStyle, tableStyle)

import Css exposing (Color, alignItems, backgroundColor, center, column, display, displayFlex, flexDirection, inlineBlock, justifyContent, marginLeft, marginTop, noWrap, outline3, px, rgb, solid, stretch, whiteSpace, width)
import Html exposing (Attribute)
import ScalarSetTheory.Css.Styles exposing (styles)
import ScalarSetTheory.Msg exposing (Msg)


tableCellAndChildrenStyle : Attribute Msg
tableCellAndChildrenStyle =
    styles
        [ displayFlex
        , alignItems stretch
        ]


tableCellItselfStyle : Attribute Msg
tableCellItselfStyle =
    styles
        [ outline3 (px 1) solid borderGrey
        , marginTop (px 1)
        , marginLeft (px 1)
        , displayFlex
        , alignItems center
        , justifyContent center
        , width (px 50)
        , whiteSpace noWrap
        ]


blankTableCellStyle : Attribute Msg
blankTableCellStyle =
    styles
        [ marginTop (px 1)
        , marginLeft (px 1)
        , displayFlex
        , width (px 50)
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


dropdownStyle : Attribute Msg
dropdownStyle =
    styles
        [ width (px 50)
        ]


defaultGrey : Color
defaultGrey =
    rgb 204 204 204


borderGrey : Color
borderGrey =
    rgb 128 128 128


defaultGreyBackground : Attribute Msg
defaultGreyBackground =
    styles
        [ backgroundColor defaultGrey
        ]


background : Color -> Attribute Msg
background color =
    styles
        [ backgroundColor color
        ]


noStyle : Attribute Msg
noStyle =
    styles []
