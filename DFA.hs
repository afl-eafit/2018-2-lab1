module DFA where

import Data.Map
import qualified Data.Map as Map (Map, empty, insertWith, singleton, union)
import Data.Set
import qualified Data.Set as Set (Set, empty, insert)

data DFA s c = MkDFA
  { start         :: s
  , delta         :: Map s (Map c s)
  , accepting     :: Set s
  } deriving Show

initDFA :: s -> DFA s a
initDFA q0 = MkDFA q0 Map.empty Set.empty

trans :: (Ord s, Ord c) => (s, s, c) -> DFA s c -> DFA s c
trans (q, q', c) (MkDFA q0 ts f) = MkDFA q0 ts' f
  where ts' = Map.insertWith Map.union q (Map.singleton c q') ts

accept :: (Ord a, Ord s) => s -> DFA s a -> DFA s a
accept q (MkDFA q0 ts fs) = MkDFA q0 ts (Set.insert q fs)

example :: DFA Int String
example = trans (1, 3, "c") .
  trans (1, 2, "a") .
  trans (1, 2, "b") .
  trans (2, 3, "b") .
  trans (3, 2, "a") .
  accept 3 $ initDFA 1
