module ScalarSetTheory.Analyses.AnalysisDefaults exposing (defaultActiveAnalysisSettingValues)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision, NChord))
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettingValues exposing (AnalysisSettingValues)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Settings.SettingValue exposing (SettingValue)


defaultActiveAnalysisSettingValues : List AnalysisSettingValues
defaultActiveAnalysisSettingValues =
    let
        equalDivisionProperties =
            getAnalysisProperties EqualDivision

        nChordProperties =
            getAnalysisProperties NChord

        equalDivisionSettingValues =
            [ SettingValue Min equalDivisionProperties.initialMin
            , SettingValue Max equalDivisionProperties.initialMax
            ]

        nChordSettingValues =
            [ SettingValue Min nChordProperties.initialMin
            , SettingValue Max nChordProperties.initialMax
            ]
    in
    [ AnalysisSettingValues EqualDivision equalDivisionSettingValues
    , AnalysisSettingValues NChord nChordSettingValues
    ]
