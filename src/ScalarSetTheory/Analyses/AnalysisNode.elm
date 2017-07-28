module ScalarSetTheory.Analyses.AnalysisNode exposing (analysisNode)

import Html exposing (text)
import List exposing (length)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))


analysisNode : String -> List TableNode -> TableNode
analysisNode cellValue cellChildren =
    TableNode
        { cellItself = text cellValue
        , cellChildren =
            [ TableNode
                { cellItself = cellChildren |> length |> toString |> text
                , cellChildren = cellChildren
                }
            ]
        }
