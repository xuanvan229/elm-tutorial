module Msgs exposing (..)

import Http exposing (..)
import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)
type Msg 
    = OnFetchPlayers (WebData (List Player))
    | OnLocationChange Location
    | ChangeLevel Player Int
    | OnPlayerSave (Result Http.Error Player)