module ScalarSetTheory.Model exposing (Model, model)

import Html exposing (Html, text)
import List exposing (..)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode), emptyTableNodeList)


type alias Model =
    { ed :
        { min : String
        , max : String
        }
    , nChord :
        { min : String
        , max : String
        }
    , activeSections : List String
    , tableBody : TableNode
    }


model : Model
model =
    { ed =
        { min = "3"
        , max = "3"
        }
    , nChord =
        { min = "2"
        , max = "100"
        }
    , activeSections = [ "ed", "nChord" ]
    , tableBody =
        TableNode
            { cellItself = text "count(1)"
            , cellChildren =
                [ TableNode
                    { cellItself = text "3"
                    , cellChildren =
                        [ TableNode
                            { cellItself = text "2"
                            , cellChildren = emptyTableNodeList
                            }
                        , TableNode
                            { cellItself = text "3"
                            , cellChildren = emptyTableNodeList
                            }
                        ]
                    }
                ]
            }
    }
