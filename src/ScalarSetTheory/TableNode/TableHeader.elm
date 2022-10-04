module ScalarSetTheory.TableNode.TableHeader exposing (tableLensHeaderRow, tableLensSettingRow)

import Html.Styled exposing (Html, div, text)
import List exposing (head, length, map, tail)
import Maybe exposing (withDefault)
import ScalarSetTheory.Css.TableStyles exposing (blankCollapseToggleCellStyle, defaultGreyBackground)
import ScalarSetTheory.Html.Dropdown exposing (settingDropdown)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.SettingProperties.SettingProperties exposing (getSettingProperties)
import ScalarSetTheory.TableCell.TableCell exposing (TableCell)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(..))
import ScalarSetTheory.Types.Setting exposing (Setting)


tableLensHeaderRow : Model -> TableNode
tableLensHeaderRow model =
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
    tableHeaderRow lensNamesPlusLensHeadingAsHtml


tableLensSettingRow : Setting -> Model -> TableNode
tableLensSettingRow setting model =
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
    tableHeaderRow settingDropdownsPlusSettingHeading


emptyText : Html Msg
emptyText =
    text ""


tableHeaderRow : List (Html Msg) -> TableNode
tableHeaderRow cells =
    let
        emptyDiv =
            div [] []

        headCell =
            withDefault emptyDiv <| head cells

        tailCells =
            withDefault [ emptyDiv ] <| tail cells

        cellItself =
            Just <| TableCell headCell defaultGreyBackground

        cellChildren =
            case length tailCells of
                0 ->
                    []

                _ ->
                    [ TableNode
                        { cellItself =
                            Just <| TableCell emptyText blankCollapseToggleCellStyle
                        , cellChildren =
                            [ TableNode
                                { cellItself = Nothing
                                , cellChildren = [ tableHeaderRow tailCells ]
                                }
                            ]
                        }
                    ]
    in
    TableNode
        { cellItself = cellItself
        , cellChildren = cellChildren
        }
