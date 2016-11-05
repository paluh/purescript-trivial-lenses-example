module Main where

import Prelude
import Data.Lens (over, set, view)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Person (Person(..), Gender(..))
import Person.Lenses as L

paluh :: Person
paluh = Person {fullName: "paluh", age: 35, gender: Male}

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log $ view (L._Person <<< L.fullName) paluh

  -- `set` returns new Person with updated fullName
  log $ show (set (L._Person <<< L.fullName) "Sir Paluh" paluh)

  -- `over` allows you to modify current value
  log $ show (over (L._Person <<< L.age) (_ + 3) paluh)
