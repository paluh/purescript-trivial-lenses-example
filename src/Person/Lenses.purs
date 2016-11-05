module Person.Lenses where

import Prelude as Prelude
import Data.Lens as Lens
import Data.Either as Either
import Person


_Male :: Lens.PrismP Gender Prelude.Unit
_Male = Lens.prism (Prelude.const Male) unwrap
  where
    unwrap Male = Either.Right Prelude.unit
    unwrap y = Either.Left y

_Female :: Lens.PrismP Gender Prelude.Unit
_Female = Lens.prism (Prelude.const Female) unwrap
  where
    unwrap Female = Either.Right Prelude.unit
    unwrap y = Either.Left y

_Other :: Lens.PrismP Gender Prelude.Unit
_Other = Lens.prism (Prelude.const Other) unwrap
  where
    unwrap Other = Either.Right Prelude.unit
    unwrap y = Either.Left y

fullName :: forall a b r. Lens.Lens { "fullName" :: a | r } { "fullName" :: b | r } a b
fullName = Lens.lens _."fullName" (_ { "fullName" = _ })

age :: forall a b r. Lens.Lens { "age" :: a | r } { "age" :: b | r } a b
age = Lens.lens _."age" (_ { "age" = _ })

gender :: forall a b r. Lens.Lens { "gender" :: a | r } { "gender" :: b | r } a b
gender = Lens.lens _."gender" (_ { "gender" = _ })

_Person :: Lens.PrismP Person
             { fullName :: String
             , age :: Int
             , gender :: Gender
             }
_Person = Lens.prism Person unwrap
  where
    unwrap (Person x) = Either.Right x
    unwrap y = Either.Left y
