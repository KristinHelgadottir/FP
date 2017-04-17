module Main exposing(..)
import Html exposing(..)
import Html.Events exposing(..)
import Html.Attributes exposing(..)
--import Html.App as App
--import Html.Lazy
-- https://www.youtube.com/watch?v=ALlYcJdZsgc     min 10.25 anonimus function
main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }

--model
model : Model
model =
    { todo = ""
    , todos = []
    }

type alias Model =
    {todo : String
    , todos : List String
    }

--update
type Msg
    = UpdateTodo String
    | AddTodo
    | RemoveAll
    | RemoveItem String
    | ClearInput


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateTodo text ->
            { model | todo = text }
        AddTodo ->
            { model | todos = model.todo :: model.todos } -- :: conned onto the list, inserting the string to the front of the list
        RemoveAll ->
            { model | todos = [] }
        RemoveItem text ->
            { model | todos = List.filter (\x -> x /= text) model.todos}
        ClearInput ->
            { model | todo = "" }

--view
todoItem : String -> Html Msg
todoItem todo =
    li [] [ text todo, button [ onClick (RemoveItem todo)][ text "x"]]

todoList : List String -> Html Msg
todoList todos =
    let
        child =
            List.map todoItem todos
    in
        ul [] child

view : Model -> Html Msg
view model =
    div[]
        [ input
            [ type_ "text"
            , onInput UpdateTodo
            , value model.todo
            , onMouseEnter ClearInput
            ][]
        , button [ onClick AddTodo ][text "Submit"]
        , button [ onClick RemoveAll][text "Remove All"]
        , div [][ todoList model.todos]  -- this will show my dynamicly as I type in the field
        ]
