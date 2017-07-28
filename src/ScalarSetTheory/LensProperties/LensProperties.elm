module ScalarSetTheory.LensProperties.LensProperties exposing (getLensProperties)

import Css exposing (Color, rgb)
import ScalarSetTheory.Lens.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.LensValuePathChildValues.EqualDivision exposing (equalDivisionChildValuesGetter)
import ScalarSetTheory.LensValuePathChildValues.LensValuePathChildValues exposing (LensValuePathChildValuesGetter)
import ScalarSetTheory.LensValuePathChildValues.NChord exposing (nChordChildValuesGetter)


type alias LensProperties =
    { name : String
    , ultimateMin : Int
    , ultimateMax : Int
    , initialMin : Int
    , initialMax : Int
    , color : Color
    , lensValuePathChildValuesGetter : LensValuePathChildValuesGetter
    }


getLensProperties : Lens -> LensProperties
getLensProperties lens =
    case lens of
        EqualDivision ->
            equalDivisionProperties

        NChord ->
            nChordProperties


equalDivisionProperties : LensProperties
equalDivisionProperties =
    { name = "equal division"
    , ultimateMin = 3
    , ultimateMax = 100
    , initialMin = 3
    , initialMax = 3
    , color = rgb 201 218 248
    , lensValuePathChildValuesGetter = equalDivisionChildValuesGetter
    }


nChordProperties : LensProperties
nChordProperties =
    { name = "n-chord"
    , ultimateMin = 2
    , ultimateMax = 100
    , initialMin = 2
    , initialMax = 100
    , color = rgb 208 224 227
    , lensValuePathChildValuesGetter = nChordChildValuesGetter
    }
