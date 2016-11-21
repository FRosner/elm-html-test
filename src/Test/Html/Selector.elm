module Test.Html.Selector
    exposing
        ( Selector
        , all
        , classes
        , id
        , attribute
        , boolAttribute
        , class
        , tag
        , text
        , checked
        , selected
        , disabled
        )

{-|
@docs Selector

## General Selectors

@docs tag, text, attribute, boolAttribute, all

## Attributes

@docs classes, class, id, checked, selected, disabled
-}

import Test.Html.Selector.Internal as Internal exposing (..)


{-| TODO
-}
type alias Selector =
    Internal.Selector


{-| TODO
-}
all : List Selector -> Selector
all =
    All


{-| TODO
-}
classes : List String -> Selector
classes =
    Classes


{-| TODO
-}
id : String -> Selector
id =
    namedAttr "id"


{-| TODO
-}
tag : String -> Selector
tag name =
    Tag
        { name = name
        , asString = "tag " ++ toString name
        }


{-| TODO
-}
class : String -> Selector
class =
    namedAttr "class"


{-| TODO
-}
attribute : String -> String -> Selector
attribute name value =
    Attribute
        { name = name
        , value = value
        , asString = "attribute " ++ toString name ++ " " ++ toString value
        }


{-| TODO
-}
boolAttribute : String -> Bool -> Selector
boolAttribute name value =
    BoolAttribute
        { name = name
        , value = value
        , asString = "boolAttribute " ++ toString name ++ " " ++ toString value
        }


{-| TODO
-}
text : String -> Selector
text =
    Internal.Text


{-| TODO
-}
selected : Bool -> Selector
selected =
    namedBoolAttr "selected"


{-| TODO
-}
disabled : Bool -> Selector
disabled =
    namedBoolAttr "disabled"


{-| TODO
-}
checked : Bool -> Selector
checked =
    namedBoolAttr "checked"



-- HELPERS --


namedAttr : String -> String -> Selector
namedAttr name value =
    Attribute
        { name = name
        , value = value
        , asString = name ++ " " ++ toString value
        }


namedBoolAttr : String -> Bool -> Selector
namedBoolAttr name value =
    BoolAttribute
        { name = name
        , value = value
        , asString = name ++ " " ++ toString value
        }