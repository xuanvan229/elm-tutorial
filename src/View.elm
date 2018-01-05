
module View exposing (..)

import Html exposing (..)
import Msgs exposing (..)
import Models exposing (..)
import Player.List exposing (..)
import Player.Edit
import RemoteData

view: Model -> Html Msg 
view model = 
    div []
        [ page model
        ]

page: Model -> Html Msg 
page model =
    case model.route of 
        Models.PlayersRoute ->
            Player.List.view model.players
        Models.PlayerRoute id ->
            playerEditPage model id
        Models.NotFoundRoute -> 
            notFoundView


playerEditPage : Model -> PlayerId -> Html Msg 
playerEditPage model playerId =
    case model.players of 
        RemoteData.NotAsked -> 
            text ""
        RemoteData.Loading ->
            text "Loading ..."
        RemoteData.Success players ->
            let 
                maybePlayer =
                    players 
                        |> List.filter (\player -> player.id == playerId)
                        |> List.head

            in
                case maybePlayer of
                    Just player ->
                        Player.Edit.view player
                    Nothing ->
                        notFoundView
        RemoteData.Failure err ->
            text (toString err)



notFoundView: Html msg 
notFoundView = 
    div []
        [ text "Not Found"]

            