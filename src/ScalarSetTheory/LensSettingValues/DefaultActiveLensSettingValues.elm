module ScalarSetTheory.LensSettingValues.DefaultActiveLensSettingValues exposing (defaultActiveLensSettingValues)

import ScalarSetTheory.Types.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)
import ScalarSetTheory.LensSettingValues.LensSettingValues exposing (LensSettingValues)
import ScalarSetTheory.Types.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.SettingValue.SettingValue exposing (SettingValue)


defaultActiveLensSettingValues : List LensSettingValues
defaultActiveLensSettingValues =
    let
        equalDivisionProperties =
            getLensProperties EqualDivision

        nChordProperties =
            getLensProperties NChord

        equalDivisionSettingValues =
            [ SettingValue Min equalDivisionProperties.initialMin
            , SettingValue Max equalDivisionProperties.initialMax
            ]

        nChordSettingValues =
            [ SettingValue Min nChordProperties.initialMin
            , SettingValue Max nChordProperties.initialMax
            ]
    in
    [ LensSettingValues EqualDivision equalDivisionSettingValues
    , LensSettingValues NChord nChordSettingValues
    ]
