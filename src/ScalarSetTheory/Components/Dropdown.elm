module ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)

import Html exposing (Html, option, text)
import Html.Attributes exposing (selected, value)
import List exposing (map, range)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Msg exposing (Msg)
import ScalarSetTheory.Settings.GetSettingValue exposing (getValueOfSetting)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))


dropdownOptions : AnalysisSettingValues -> Setting -> String -> List (Html Msg)
dropdownOptions analysisSettingValues thisDropdownIsForSetting selectedOption =
    let
        analysis =
            analysisSettingValues.analysis

        analysisProperties =
            getAnalysisProperties analysis

        analysisSettingMin =
            getValueOfSetting analysisSettingValues Min

        analysisSettingMax =
            getValueOfSetting analysisSettingValues Max

        rangeMin =
            case thisDropdownIsForSetting of
                Min ->
                    analysisProperties.ultimateMin

                Max ->
                    max analysisProperties.ultimateMin analysisSettingMin

        rangeMax =
            case thisDropdownIsForSetting of
                Min ->
                    min analysisProperties.ultimateMax analysisSettingMax

                Max ->
                    analysisProperties.ultimateMax

        rangeForAnalysis =
            range rangeMin rangeMax

        indexToOption =
            \index -> dropdownOption index selectedOption
    in
    map indexToOption rangeForAnalysis


dropdownOption : Int -> String -> Html Msg
dropdownOption indexAsInt selectedOption =
    let
        index =
            toString indexAsInt
    in
    option
        [ value index
        , selected (isSelected index selectedOption)
        ]
        [ text index ]


isSelected : String -> String -> Bool
isSelected index selectedOption =
    index == selectedOption
