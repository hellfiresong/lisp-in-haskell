-- Utilities function.
--
--
--
-- hellfire (asyncloading#163.com)
-- Jan 30th, 2016

module Functional
( spaces) where

import Text.ParserCombinators.Parsec hiding (spaces)


-- Skip space
spaces :: Parser ()
spaces = skipMany1 space
