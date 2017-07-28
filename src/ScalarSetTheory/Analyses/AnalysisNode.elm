module ScalarSetTheory.Analyses.AnalysisNode exposing (analysisNode)

import Css exposing (rgb)
import Html exposing (text)
import List exposing (length)
import ScalarSetTheory.Styles.TableStyles exposing (defaultGrey)
import ScalarSetTheory.Table.TableCell exposing (TableCell)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


analysisNode : TableCell -> List TableNode -> TableNode
analysisNode tableCell cellChildren =
    let
        childrenCount =
            cellChildren |> length |> toString |> text

        childrenCountCell =
            Just (TableCell childrenCount defaultGrey)
    in
    TableNode
        { cellItself = Just tableCell
        , cellChildren =
            [ TableNode
                { cellItself = childrenCountCell
                , cellChildren = cellChildren
                }
            ]
        }
