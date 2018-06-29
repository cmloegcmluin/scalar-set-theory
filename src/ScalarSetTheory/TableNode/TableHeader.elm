module ScalarSetTheory.TableNode.TableHeader exposing (tableHeaderRow, tableSettingRow)

import Html exposing (Html, div, text)
import List exposing (head, length, map, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.Css.TableStyles exposing (defaultGrey)
import ScalarSetTheory.Html.Dropdown exposing (settingDropdown)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.SettingProperties.SettingProperties exposing (getSettingProperties)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Types.Setting exposing (Setting)


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


tableSettingRow : Setting -> Model -> TableNode
tableSettingRow setting model =
    let
        settingProperties =
            getSettingProperties setting

        settingName =
            settingProperties.name

        settingDropdownUsingSettingField =
            \activeLensSettingValues -> settingDropdown setting activeLensSettingValues

        settingDropdowns =
            map settingDropdownUsingSettingField model.activeLensSettingValues

        settingDropdownsPlusSettingHeading =
            text settingName :: settingDropdowns
    in
    tableRow settingDropdownsPlusSettingHeading


tableRow : List (Html Msg) -> TableNode
tableRow cells =
    let
        emptyDiv =
            div [] []

        headCell =
            withDefault emptyDiv (head cells)

        tailCells =
            withDefault [ emptyDiv ] (tail cells)

        cellItself =
            Just (TableCell headCell defaultGrey)

        cellChildren =
            case length tailCells of
                0 ->
                    []

                _ ->
                    [ TableNode
                        { cellItself = Nothing --spacer for children count
                        , cellChildren =
                            [ TableNode
                                { cellItself = Nothing --spacer for collapse toggle
                                , cellChildren = [ tableRow tailCells ]
                                }
                            ]
                        }
                    ]
    in
    TableNode
        { cellItself = cellItself
        , cellChildren = cellChildren
        }
