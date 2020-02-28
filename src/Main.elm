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
    comments: List String
  }


init : Model
init =
  { 
    inputData = "",
    comments = []
  }



-- UPDATE


type Msg
  = Change String
  | Update
  | Reset


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newInput ->
      { model | inputData = newInput }

    Update ->
      { model | comments = model.comments ++ [model.inputData] }

    Reset ->
      { model | comments = [] }


-- VIEW

rowItem: String -> Html Msg
rowItem comment =
    div []
        [ text ("- " ++ comment) ]

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Place text here", value model.inputData, onInput Change ] []
    , button [ onClick Update ] [ text "OK" ]
    , button [ onClick Reset ] [ text "RESET" ]
    , div [] (List.map rowItem model.comments)
    ]