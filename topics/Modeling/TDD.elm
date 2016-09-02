module Modeling.TDD exposing (..)

import Dict exposing (Dict)
import Html exposing (text)
import String


{-
   LEARN: Type First Developet / Type Driven Development
   Start by modeling your problem in the type system
   Like in TDD, it gets you to think about your boundaries
   Write function signatures and make sure they fit

   EXAMPLE: naive calculator

   Your program takes user input and computes a value
   Ignores associativity

   1 + 4 * 3 = (1 + 4) * 3 = 15

   If we just start implementing the solution, it's easy to get lost
-}


calculate : String -> Float
calculate input =
    -- live code, get stuck, it's too big!
    String.split " " input
        |> Debug.crash "What now?"



{-
   EXAMPLE: Let's model some types!

-}


type
    Op
    -- live code: what are our possible operations?
    = Add Float
    | Sub Float
    | Div Float
    | Mul Float
    | Lit Float



-- create some function signatures and see if they fit together...


calculateOp : Op -> Float -> Float
calculateOp op tot =
    -- live code: seems easy to write leave until later
    case op of
        Add n ->
            tot + n

        Sub n ->
            tot - n

        Div n ->
            tot / n

        Mul n ->
            tot * n

        Lit n ->
            n


calculateOps : List Op -> Float
calculateOps ops =
    -- live code: does this fit with calculate Op?
    -- yeah it works! All we have to do is write the other functions
    List.foldl calculateOp 0 ops


calculate' : String -> Float
calculate' input =
    -- live code: does this fit with parse and calculateOps?
    parse input
        |> calculateOps


parse : String -> List Op
parse input =
    -- live code: try parseMap first
    -- but parseMap is impossible to write
    String.split " " input
        |> parseRecursive


parseMap : String -> Op
parseMap str =
    -- live code: I need to write this function to see if it's actually possible
    -- wait, what does the signature of this have to be?
    case str of
        "+" ->
            Debug.crash "I can't just return Add, that's (Float -> Op)"

        _ ->
            Debug.crash "..."


parseFoldl : String -> b -> b
parseFoldl str =
    -- live code: what's b supposed to be here? how?
    Debug.crash "???"


parseRecursive : List String -> List Op
parseRecursive strs =
    let
        parseDefault0 n =
            String.toFloat n
                |> Result.withDefault 0

        -- live code: let's recurse manually
    in
        case strs of
            "+" :: n :: rest ->
                Add (parseDefault0 n) :: parseRecursive rest

            "-" :: n :: rest ->
                Sub (parseDefault0 n) :: parseRecursive rest

            "*" :: n :: rest ->
                Mul (parseDefault0 n) :: parseRecursive rest

            "/" :: n :: rest ->
                Div (parseDefault0 n) :: parseRecursive rest

            n :: rest ->
                Lit (parseDefault0 n) :: parseRecursive rest

            [] ->
                []



{-

   EXERCISE

   Add support for variables to the calculator. The input will now be multiple lines. All lines except the last will contain statements to set variables. The last line will contain a calculation, as before, but it may contain variables.

       A = 3
       B = 2
       2 + A / B

   Should return

        2.5

   Don't worry about implementing all functions, the exercise is to create the type signatures for functions to make sure your solution makes sense. Implement as many functions as is necessary to be confident that your model will work.

   Change the signatures of the above functions to match your assumptions. Get it to compile using Debug.crash
-}


type alias Variables =
    ()


calculateAll : List String -> Float
calculateAll steps =
    -- what does the state look like?
    -- implement this function to make sure it fits with your solution
    Debug.crash "TODO"