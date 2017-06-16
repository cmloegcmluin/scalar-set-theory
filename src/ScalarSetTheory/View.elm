module ScalarSetTheory.View exposing (..)

import Html exposing (Html, div, h1, table, td, text, tr)
import Html.Attributes exposing (rowspan, value)
import Html.Events exposing (onInput)
import List exposing (concatMap, foldr, map, range)
import ScalarSetTheory.Components.TableHeader exposing (tableHeaderRow)
import ScalarSetTheory.Components.TableMaxRow exposing (tableMaxRow)
import ScalarSetTheory.Components.TableMinRow exposing (tableMinRow)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Styles.TableStyles exposing (tableBorder, tableBorderCollapse)
import ScalarSetTheory.Update exposing (..)
import ScalarSetTheory.Utilities exposing (inclusiveCount, parseInt)
import String exposing (concat)


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Scalar Set Theory" ]
        , table
            [ tableBorderCollapse ]
            ([ tableHeaderRow model.activeSections ]
                ++ [ tableMinRow (nameAndMinPerSection model) ]
                ++ [ tableMaxRow (nameAndMaxPerSection model) ]
                ++ edRangeToTableRows model.ed.min model.ed.max
            )
        ]


nameAndMinPerSection : Model -> List ( String, String )
nameAndMinPerSection model =
    map (\name -> nameAndMin name model) model.activeSections


nameAndMin : String -> Model -> ( String, String )
nameAndMin name model =
    case name of
        "ed" ->
            ( name, model.ed.min )

        "nChord" ->
            ( name, model.nChord.min )

        _ ->
            ( name, "" )


nameAndMaxPerSection : Model -> List ( String, String )
nameAndMaxPerSection model =
    map (\name -> nameAndMax name model) model.activeSections


nameAndMax : String -> Model -> ( String, String )
nameAndMax name model =
    case name of
        "ed" ->
            ( name, model.ed.max )

        "nChord" ->
            ( name, model.nChord.max )

        _ ->
            ( name, "" )


edRangeToTableRows : String -> String -> List (Html Msg)
edRangeToTableRows edMin edMax =
    edHeadRows (parseInt edMin) (parseInt edMax)
        ++ concatMap edTailRows (range (parseInt edMin + 1) (parseInt edMax))


edHeadRows : Int -> Int -> List (Html Msg)
edHeadRows edMin edMax =
    [ tr
        []
        ([ td
            [ rowspan (edHeadRowSpan edMin edMax), tableBorder ]
            [ text (concat [ "count (", toString (inclusiveCount edMin edMax), ")" ]) ]
         ]
            ++ nChordHeadRowCells edMin
        )
    ]
        ++ map nChordTailRow (range 2 edMin)


edTailRows : Int -> List (Html Msg)
edTailRows ed =
    [ nChordHeadRow ed ]
        ++ map nChordTailRow (range 2 ed)


nChordHeadRow : Int -> Html Msg
nChordHeadRow ed =
    tr
        []
        (nChordHeadRowCells ed)


nChordTailRow : Int -> Html Msg
nChordTailRow nChord =
    tr
        []
        [ td
            [ tableBorder ]
            [ text (toString nChord) ]
        ]


edHeadRowSpan : Int -> Int -> Int
edHeadRowSpan min max =
    foldr (+) 0 (range min max)


nChordHeadRowCells : Int -> List (Html Msg)
nChordHeadRowCells ed =
    [ td
        [ rowspan ed, tableBorder ]
        [ text (toString ed) ]
    , td
        [ tableBorder ]
        [ text "1" ]
    ]
