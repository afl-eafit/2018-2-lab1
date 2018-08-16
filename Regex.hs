{- | This module serves as an easy way to represent regular expressions. -}
module Regex where

-- | Represents a regular expession with symbols of type "a"
data Regex a =
  -- | The empty language
  Empty
  -- | The empty string
  | Epsilon
  {- | Represents a symbol of type "a" in the expression.
       E.g. Symbol "a" = a -}
  | Symbol a
  {- | Kleene closure of a regular expression.
       E.g. Star (Symbol "a") = a* -}
  | Star (Regex a)
  {- | Union of two regular expressions.
       E.g. Plus (Symbol "a") (Symbol "b") = a+b -}
  | Plus (Regex a) (Regex a)
  {- | Concatenation of two regular expressions.
       E.g. Dot (Symbol "a") (Symbol "b") = ab -}
  | Dot  (Regex a) (Regex a)
  deriving Show
