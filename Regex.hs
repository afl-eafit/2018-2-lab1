module Regex where

data Regex a = Empty
  | Epsilon
  | Symbol a
  | Star (Regex a)
  | Plus (Regex a) (Regex a)
  | Dot  (Regex a) (Regex a)
  deriving Show
