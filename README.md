# Welcome to Elm Training
This contains the course material for Elm Training. Before attending the training, make sure you can run the code in this repository, and configure your editor to show you errors inline when you save.

Please install [git](https://git-scm.com/downloads) and [Elm 0.17](http://elm-lang.org/install), then run:

    $ git clone https://github.com/elm-training/elm-training.git
    $ cd elm-training
    $ elm-reactor

Then open [http://localhost:8000](http://localhost:8000) in your browser. You should be able to navigate to [./topics/Introduction/Hello.elm](http://localhost:8000/topics/Introduction/Hello.elm) and see "Hello World"


Introduction to Elm
-------------------
- [Basic Syntax + Hello World](./topics/Introduction/Hello.elm)
- [Writing and Using Functions](./topics/Introduction/Functions.elm)
- [Render Functions and the Virtual DOM](./topics/Introduction/RenderDom.elm)


Type System
-----------
- [Basic Function Signatures](./topics/TypeSystem/BasicFunctionSignatures.elm)
- [Type Aliases](./topics/TypeSystem/TypeAliases.elm)
- [Union Types](./topics/TypeSystem/UnionTypes.elm)
- [Type Variables](./topics/TypeSystem/TypeVariables.elm)
- [Advanced Function Signatures](./topics/TypeSystem/AdvancedFunctionSignatures.elm)



The Elm Architecture
--------------------
- [Introduction](./topics/ElmArchitecture/Intro.elm)
- [What to put on the Model](./topics/ElmArchitecture/DerivedData.elm)


Functional Programming
----------------------

*Where should this go? Learners should get a sense of success before tackling this section*

- [Immutability](./topics/Functional/Immutability.elm)
- [Recursion](./topics/Functional/Recursion.elm)
- [Composition](./topics/Functional/Composition.elm)
- [Currying](./topics/Functional/Currying.elm)



The Elm Architecture: Effects
-----------------------------
- [Intro To Effects](./topics/Effects/Random.elm)
- [Http](./topics/Effects/Http.elm)
- [Subscriptions](./topics/Effects/Subscriptions.elm)


The Elm Architecture: Modules
-------------------------------------
Jamison


Real World Types - Data Modeling
--------------------------------
- [Consistent Data](./topics/Modeling/Consistent.elm)
- [Composing Types](./topics/Modeling/Composing.elm)
- [Getting Specific](./topics/Modeling/Specific.elm)
- [Type Driven Development](./topics/Modeling/TDD.elm)


[Error Handling and Tasks](http://guide.elm-lang.org/error_handling/)
---------------------------------------------------
- [Maybe](http://guide.elm-lang.org/error_handling/maybe.html)
- [Result](http://guide.elm-lang.org/error_handling/result.html)
- [Task](http://guide.elm-lang.org/error_handling/task.html)


The Outside World
-----------------
- [Basic JSON parsing](./topics/Outside/BasicJson.elm)
- [Advanced JSON parsing](./topics/Outside/AdvancedJson.elm)
- [Talking to JavaScript](./topics/Outside/JavaScript.elm)


Detailed Rendering
------------------
- [Inline Styles](./topics/DetailedRendering/InlineStyles.elm)
- [CSS](./topics/DetailedRendering/Css.elm)
- [Optimization](./topics/DetailedRendering/Optimization.elm)


Architecture: Organizing Files
------------------------------
Jamison


Reusable Views
--------------
- [Functions, not Components](./topics/Reuse/Functions.elm)
- [Find Your Inner Library](./topics/Reuse/Library.elm)
- [Searchable Table](./topics/Reuse/Table.elm)
- [Autocomplete](./topics/Reuse/Autocomplete.elm)


URL Routing
-----------
- [Routing](./topics/Routing/Routing.elm)

Testing
-------
- [Setting up elm-test](./topics/Testing/ElmTest.elm)
- [Running Test in CI](./topics/Testing/CI.elm)
- [Advanced Testing](./topics/Testing/AdvancedTesting.elm)


Tour of the package ecosystem
-----------------------------
- [package.elm-lang.org](http://package.elm-lang.org/)
- See the "extra" packages and anything maintained by elm-community


Enterprise Applications
-----------------------
- Config and Environment
- Nested Routing
- Page Navigation √
- Modeling the schema √
- Dashboards? During the building section
- Authentication
- Accordion Control ? During the building section
- Sortable Tables ? Show elm sortable table, also your example

Questions
---------

- I moved Functional Programming back one. It's challenging, and people want that sense of "I can do this!". Further back?

- Notice the new "Scaling the Elm Architecture" section: http://guide.elm-lang.org/reuse/. He's advocating the same approach as us (focus on reusing functions before modules. He introduces it before explaining modules at all, should we?). What do we think of his examples compared to mine? Mine seem a little more thorough.

- Effects, Elm Architecture, Outside World duplicate information in the guide. Can you point out where and how it improves on it?

- We should combine the Organizing Files and Routing section into one section on SPA apps. This is where nesting should be mentioned.

- Richard suggests putting all the Nuanced when you should use what stuff after teaching SPA, so you can mention it all at once. So you can talk about it along the way

- What to do with Maybe / result / Task? It's weird having it as a separate heading. Maybe and Task are mentioned in passing earlier. It's just a deep dive?


TODO
------------------
