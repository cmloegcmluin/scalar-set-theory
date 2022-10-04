module ScalarSetTheory.TableNode.LensNode exposing (lensNode)

import Debug exposing (toString)
import Html.Styled exposing (Html, text)
import List exposing (length)
import ScalarSetTheory.Css.TableStyles exposing (collapseToggleCellStyle, defaultGreyBackground)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(..))


collapseSymbol : Html Msg
collapseSymbol =
    text "^"


lensNode : TableCell -> List TableNode -> TableNode
lensNode tableCell cellChildren =
    let
        childrenCount =
            cellChildren |> length |> toString |> text

        childrenCountCell =
            Just <| TableCell childrenCount defaultGreyBackground

        collapseToggleCell =
            Just <| TableCell collapseSymbol collapseToggleCellStyle
    in
    TableNode
        { cellItself = Just tableCell
        , cellChildren =
            [ TableNode
                { cellItself = collapseToggleCell
                , cellChildren =
                    [ TableNode
                        { cellItself = childrenCountCell
                        , cellChildren = cellChildren
                        }
                    ]
                }
            ]
        }
