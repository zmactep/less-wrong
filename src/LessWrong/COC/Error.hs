module LessWrong.COC.Error where

import           Data.Text          (unpack)
import           LessWrong.COC.Type

data CalculusError = ParsingError String
                   | UniverseHasNoType Const
                   | UnknownVariable Var
                   | CannotEqualize Term Term
                   | InvalidType Term

instance Show CalculusError where
  show (ParsingError txt)      = "Parsing error:\n" ++ txt
  show (UniverseHasNoType ct)  = "Universe " ++ show ct ++ " cannot be typed"
  show (UnknownVariable (V v)) = "Variable " ++ unpack v ++ " is not defined"
  show (CannotEqualize t t')   = "Cannot equalize types " ++ show t ++ " and " ++ show t'
  show (InvalidType t)         = "Type " ++ show t ++ " is invalid"
  