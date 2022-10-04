module ScalarSetTheory.Html.Dropdown exposing (dropdownOptions, settingDropdown)

import Debug exposing (toString)
import Html.Styled exposing (Html, option, select, styled, text)
import Html.Styled.Attributes exposing (selected, value)
import Html.Styled.Events exposing (onInput)
import List exposing (length, map, range)
import ScalarSetTheory.Css.TableStyles exposing (dropdownStyle)
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.Msg exposing (Msg(..))
import ScalarSetTheory.Types.Setting exposing (Setting(..))
import ScalarSetTheory.Utilities exposing (parseInt)
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


settingDropdown : Setting -> LensSettingValues -> Html Msg
settingDropdown setting lensSettingValues =
    let
        selectedOption =
            getValueOfSetting lensSettingValues setting

        lens =
            lensSettingValues.lens

        handler =
            \newValue -> UpdateLensSettingValue lens setting <| parseInt newValue

        attributes =
            case length lensSettingValues.settingValues of
                0 ->
                    []

                _ ->
                    [ onInput handler ]

        options =
            dropdownOptions lensSettingValues setting (toString selectedOption)
    in
    styled select
        dropdownStyle
        attributes
        options


dropdownOptions : LensSettingValues -> Setting -> String -> List (Html Msg)
dropdownOptions lensSettingValues thisDropdownIsForSetting selectedOption =
    let
        lens =
            lensSettingValues.lens

        lensProperties =
            getLensProperties lens

        lensSettingMin =
            getValueOfSetting lensSettingValues Min

        lensSettingMax =
            getValueOfSetting lensSettingValues Max

        rangeMin =
            case thisDropdownIsForSetting of
                Min ->
                    lensProperties.ultimateMin

                Max ->
                    max lensProperties.ultimateMin lensSettingMin

        rangeMax =
            case thisDropdownIsForSetting of
                Min ->
                    min lensProperties.ultimateMax lensSettingMax

                Max ->
                    lensProperties.ultimateMax

        rangeForLens =
            range rangeMin rangeMax

        indexToOption =
            \index -> dropdownOption index selectedOption
    in
    map indexToOption rangeForLens


dropdownOption : Int -> String -> Html Msg
dropdownOption indexAsInt selectedOption =
    let
        index =
            toString indexAsInt
    in
    option
        [ value index
        , selected <| isSelected index selectedOption
        ]
        [ text index ]


isSelected : String -> String -> Bool
isSelected index selectedOption =
    index == selectedOption
