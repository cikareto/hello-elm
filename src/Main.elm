module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { 
    inputData : String,
    content: String
  }


init : Model
init =
  { 
    inputData = "",
    content = ""
  }



-- UPDATE


type Msg
  = Change String
  | Update String
  | Reset


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newInput ->
      { model | inputData = newInput }

    Update newContent ->
      { model | content = newContent }

    Reset ->
      { model | content = "" }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Place text here", value model.inputData, onInput Change ] []
    , button [ onClick (Update model.inputData) ] [ text "OK" ]
    , button [ onClick Reset ] [ text "RESET" ]
    , div [] [ text model.content ]
    ]