module Person where

import Data.Generic (gShow, class Generic)
import Prelude

data Gender = Male | Female | Other
derive instance genericGender :: Generic Gender

newtype Person
  = Person
    { fullName :: String
    , age :: Int
    , gender :: Gender
    }

derive instance genericPerson :: Generic Person
instance showPerson :: Show Person where
  show = gShow
