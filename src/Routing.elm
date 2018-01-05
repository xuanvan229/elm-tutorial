module Routing exposing (..)


import Models exposing (..)
import Navigation exposing (..)
import UrlParser exposing (..)

matchers : Parser (Route -> a) a
matchers =
    oneOf 
        [ map PlayersRoute top
        , map PlayerRoute (s "players" </> string)
        , map PlayersRoute (s "players")
        ]



parseLocation : Location -> Route 
parseLocation location =
    case (parseHash matchers location) of 
        Just route ->
            route

        Nothing ->
            NotFoundRoute


playersPath: String 
playersPath = "#players"


playerPath : PlayerId -> String 
playerPath id =
    "#players/" ++ id 