--  Parse symbol
--
--
-- hellfire (asyncloading#163.com)
-- Jan 30th, 2016

module Symbol
( symbol) where

import Text.ParserCombinators.Parsec hiding (spaces)


symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=?>@^_~#"
