module ScalarSetTheory.TableNode.LensNode exposing (lensNode)

import Html exposing (text)
import List exposing (length)
import ScalarSetTheory.Css.TableStyles exposing (defaultGrey)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))


lensNode : TableCell -> List TableNode -> TableNode
lensNode tableCell cellChildren =
    let
        childrenCount =
            cellChildren |> length |> toString |> text

        childrenCountCell =
            Just (TableCell childrenCount defaultGrey)

        collapseToggleCell =
            Just (TableCell (text "^") defaultGrey)
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
