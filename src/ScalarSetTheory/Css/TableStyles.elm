module ScalarSetTheory.Css.TableStyles exposing (background, blankCollapseToggleCellStyle, blankTableCellStyle, borderGrey, collapseToggleCellStyle, defaultGrey, defaultGreyBackground, dropdownStyle, noStyle, tableCellAndChildrenStyle, tableCellChildrenContainerStyle, tableCellItselfStyle, tableStyle)

import Css exposing (..)


tableCellAndChildrenStyle : List Style
tableCellAndChildrenStyle =
    [ displayFlex
    , alignItems stretch
    ]


tableCellItselfStyle : List Style
tableCellItselfStyle =
    [ outline3 (px 1) solid borderGrey
    , marginTop <| px 1
    , marginLeft <| px 1
    , displayFlex
    , alignItems center
    , justifyContent center
    , width <| px 50
    , whiteSpace noWrap
    ]


blankTableCellStyle : List Style
blankTableCellStyle =
    [ marginTop <| px 1
    , marginLeft <| px 1
    , displayFlex
    , width <| px 50
    ]


blankCollapseToggleCellStyle : List Style
blankCollapseToggleCellStyle =
    [ marginTop <| px 1
    , marginLeft <| px 1
    , displayFlex
    , width <| px 20
    , outline3 (px 0) solid borderGrey
    ]


collapseToggleCellStyle : List Style
collapseToggleCellStyle =
    [ backgroundColor defaultGrey
    , width <| px 20
    ]


tableCellChildrenContainerStyle : List Style
tableCellChildrenContainerStyle =
    [ displayFlex
    , flexDirection column
    ]


tableStyle : List Style
tableStyle =
    [ display inlineBlock
    ]


dropdownStyle : List Style
dropdownStyle =
    [ width <| px 50
    ]


defaultGrey : Color
defaultGrey =
    rgb 204 204 204


borderGrey : Color
borderGrey =
    rgb 128 128 128


defaultGreyBackground : List Style
defaultGreyBackground =
    [ backgroundColor defaultGrey
    ]


background : Color -> List Style
background color =
    [ backgroundColor color
    ]


noStyle : List Style
noStyle =
    []
