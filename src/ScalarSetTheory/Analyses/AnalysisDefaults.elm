module ScalarSetTheory.Analyses.AnalysisDefaults exposing (defaultAnalysisSettings)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision, NChord))
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)
import ScalarSetTheory.Settings.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Settings.SettingValue exposing (SettingValue)


defaultAnalysisSettings : AnalysisSettings
defaultAnalysisSettings =
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
    [ AnalysisSetting EqualDivision equalDivisionSettingValues
    , AnalysisSetting NChord nChordSettingValues
    ]
