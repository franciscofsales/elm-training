module Effects.Random exposing (..)

import Html exposing (div, h1, text, button, Html)
import Html.App exposing (program)
import Html.Events exposing (onClick)
import Random exposing (generate)
import DetailedRendering.InlineStyles exposing (center)


--Learn: how do we make an Elm program that has side effects?
{-
   TIME FOR WORDS!

   Elm functions are pure. That means that given the same input, they always return the same output. This makes them easier to understand, but it can also make things harder. Let's imagine something that isn't pure, like a random number generator.

   In JavaScript, you can get a random number just by calling a function, because nothing in JavaScript stops you from having side effects everywhere.

   ```javascript
   function getRandomNumber() {
     return Math.random()
   }
   ```

   In Elm, functions can't do that. They can only take in input and return output.

   ```elm
   getRandomNumber = ???
   ```

   Pure functions that only take input and return output can't build rich web applications. Real apps need effects to actually do anything useful. How do we do that in Elm?


   Well, what if we could create some kind of data structure that represented the thing we wanted Elm to do, and then hand that to Elm to run?
-}
{--
type Msg
    = NewNumber Int


type alias AskElmForARandomNumber =
    { min : Int
    , max : Int
    , result : Int -> Msg
    }
--}
{-
   Now, when we want to generate a random number, we can create this data structure that tells Elm what kind of thing we want. We can't do anything that causes side effects in our code, but what if we could somehow hand this data structure over to Elm?

   Then Elm could run the code that does side effects, grab the random number, put it in the result `Msg`, and then feed that `Msg` back in to our update function.
-}
{--
aNumber =
    { min = 0, max = 100, result = NewNumber }


type alias Model =
    { number : Int
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewNumber n ->
            { model | number = n }

--}
{-
   Somehow `aNumber` could be processed by Elm to become a `NewNumber` message, and fed back in to our update function.

   Our `update` function is already a place where we hand data off to Elm for it to re-render our app. What if we changed `update` so instead of returning a model, it returns a model and the data structure for elm to run?

   Now the random number generation happens in two parts. One `Msg` hands Elm our data structure, then Elm runs it and feeds the resulting `Msg` back in to `update`, which results in our model being updated.
-}
{--
type Msg
    = NewNumber Int
    | Roll


update : Msg -> Model -> ( Model, AskElmForARandomNumber )
update msg model =
    case msg of
        NewNumber n ->
            { model | number = n }
        Roll -> ( model, aNumber )

--}
{-
   We still have a problem though. Our update function won't compile, because not every `Msg` needs to hand Elm something to run for us. Now our case statement returns different types in different branches, which makes Elm sad.

   We can solve that by wrapping the data structure in a Maybe. Then Elm can look in the Maybe, and if it has a Just, follow the loop that we imagined it doing.
-}
{--
type Msg
    = NewNumber Int
    | Roll

update : Msg -> Model -> ( Model, Maybe AskElmForARandomNumber )
update msg model =
    case msg of
        NewNumber n ->
            ({ model | number = n }, Nothing)
        Roll -> ( model, Just aNumber )


--}
{-
   There are still two missing pieces here.

   1. How do we tell Elm to handle our fancy data structure that represents some computation we want it to do?
   2. How do we handle other cases? This is very hard-coded to our specific use case, but what if you want to do Http requests or WebSockets or handle a clock ticking or any other kind of thing that depends on side-effects?

   The good news is that Elm has answers to both of these problems for us, and it looks a lot like what we've done so far. Let me show you some code, and I'll talk through it as I go.

-}

{--}


type alias Model =
    { number : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { number = 0 }, Cmd.none )


type Msg
    = Roll
    | NewNumber Int


view : Model -> Html Msg
view model =
    div [ center ]
        [ h1 [] [ text "Ye Olde Random Number Generator" ]
        , div [] [ button [ onClick Roll ] [ text "Make It So" ] ]
        , div [] [ text ("The number is " ++ (toString model.number)) ]
        ]


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Roll ->
            ( model, getRandomNumber )

        NewNumber n ->
            ( { model | number = n }, Cmd.none )


getRandomNumber : Cmd Msg
getRandomNumber =
    Random.generate NewNumber (Random.int Random.minInt Random.maxInt)



-- Don't worry about subscriptions now, we will cover them later


subscriptions model =
    Sub.none


main =
    program { init = init, view = view, update = update, subscriptions = subscriptions }
--}


{-
EXERCISE: Modify this example to return two random numbers instead of just one

The basic pattern is, you build your app out of pure functions that are easy to test and re-use, and you push all the side-effects to the edges of your program, where Elm can handle them for you.

The new diagram for the architecture looks like this:

     +---------+
     |         |
     |  Elm    |
     |         |
     |         |
     +-+----+--+
       ^    |
       |    |
Cmd Msg|    | Msg
       |    |
       |    |
       |    |
       |    ^
      ++----+----+          Model                 +-----------+
      |          +------------------------------> |           |
      |  Update  |          Msg, Model            |    View   |
      |          +^-------------------------------+           |
      +----------+                                +-----------+


-}

