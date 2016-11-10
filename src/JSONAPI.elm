module JSONAPI exposing (..)


import Http
import Json.Decode as Json


type Msg = SubmitRequest | FetchSucceed String | FetchFail Http.Error


decodeResponseKey : String -> Json.Decoder String
decodeResponseKey key =
  Json.at ["data", key] Json.string
