module Giphy exposing (randomGif)


import Http
import Task

import JSONAPI


apiKey = "dc6zaTOxFJmzC"


queryUrl : String -> String
queryUrl topic =
      "https://api.giphy.com/v1/gifs/random?api_key=" ++ apiKey ++ "&tag=" ++ topic


randomGif : String -> Cmd JSONAPI.Msg
randomGif topic =
  let
    url = queryUrl topic
  in
    Task.perform
      JSONAPI.FetchFail
      JSONAPI.FetchSucceed (Http.get (JSONAPI.decodeResponseKey "image_url") url)
