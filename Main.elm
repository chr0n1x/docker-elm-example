-- Taken directly from the elm-architecture examples
-- https://github.com/evancz/elm-architecture-tutorial/blob/master/examples/05-http.elm

import Giphy
import JSONAPI

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http


initialTopic = "cats"


main =
  Html.program
    { init = init initialTopic
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL


type alias Model =
  { topic : String
  , gifUrl : String
  }


init : String -> (Model, Cmd JSONAPI.Msg)
init topic =
  ( Model topic "waiting.gif"
  , Giphy.randomGif topic
  )


-- UPDATE


update : JSONAPI.Msg -> Model -> (Model, Cmd JSONAPI.Msg)
update msg model =
  case msg of
    JSONAPI.SubmitRequest ->
      (model, Giphy.randomGif model.topic)

    JSONAPI.FetchSucceed newUrl ->
      (Model model.topic newUrl, Cmd.none)

    JSONAPI.FetchFail _ ->
      (model, Cmd.none)


-- VIEW


view : Model -> Html JSONAPI.Msg
view model =
  div []
    [ h2 [] [text "FEEL THE JANK"]
    , br [] []
    , button [ onClick JSONAPI.SubmitRequest ] [ text "I'm Feeling Janky" ]
    , br [] []
    , img [src model.gifUrl] []
    ]


-- SUBSCRIPTIONS


subscriptions : Model -> Sub JSONAPI.Msg
subscriptions model =
  Sub.none
