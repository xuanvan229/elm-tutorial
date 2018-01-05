module Main exposing (..)

import Html exposing (Html, div, text, program)
import Msgs exposing (..)
import Models exposing (..)
import Update exposing (..)
import View exposing (..)
import Commands exposing (..)
import Routing
import Navigation exposing (..)


init : Location -> ( Model, Cmd Msg )
init location =
    let 
        currentRoute =
            Routing.parseLocation location 
    in 
        ( initialModel currentRoute,fetchPlayers)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none




-- MAIN


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }