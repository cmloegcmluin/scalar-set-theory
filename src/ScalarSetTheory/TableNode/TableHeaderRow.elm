module ScalarSetTheory.TableNode.TableHeaderRow exposing (tableHeaderRow)

import Html exposing (text)
import List exposing (map)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.TableNode.TableRow exposing (tableRow)


tableHeaderRow : Model -> TableNode
tableHeaderRow model =
    let
        activeLensSettingValues =
            map .lens model.activeLensSettingValues

        activeLensProperties =
            map getLensProperties activeLensSettingValues

        activeLensNames =
            map .name activeLensProperties

        activeLensNamesPlusLensHeading =
            "lens" :: activeLensNames

        lensNamesPlusLensHeadingAsHtml =
            map text activeLensNamesPlusLensHeading
    in
    tableRow lensNamesPlusLensHeadingAsHtml
