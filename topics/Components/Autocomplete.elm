module Components.Autocomplete exposing (..)

{-

    EXAMPLE: Stateful Components. Autocomplete

    Sometimes we want the state of a component to be opaque. In those cases, we do want to create a component more like The Elm Architecture.

    Let's create a basic autocomplete componentb

    1. Look nice out of the box
    2. Be packaged into a nice top-level view
    3. Expose its guts
    4. Allow for very differnet kinds of entries in the content box
    5. But work easily out of the box

    
-}


-- it should have a search bar, then