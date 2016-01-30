-- Data type parser.
--
--
-- hellfire(asyncloading#163.com)
-- Jan 30th, 2016

module DataTypeParser
( parseString
, parseAtom
, parseExpr
, parseNumber
, parseList
, parseQuoted) where

import Control.Monad
import Text.ParserCombinators.Parsec hiding (spaces)

-- Moduel Dependencies
import Symbol

-- Data type definition
-- It can hold any list value.
data LispVal = Atom String                          -- Stores a String naming the atom
             | List [LispVal]                       -- Stores a proper list
             | DottedList [LispVal] LispVal         -- Stores an improper list
             | Number Integer                       -- Integer
             | String String                        -- String
             | Bool Bool                            -- Boolean

parseString :: Parser LispVal
parseString = do char '"'
                 x <- many (noneOf "\"")
                 char '"'
                 return $ String x

parseList :: Parser LispVal
parseList = liftM List $ sepBy parseExpr space

parseQuoted :: Parser LispVal
parseQuoted = do char '\''
                 x <- parseExpr
                 return $ List [Atom "quote", x]

parseDottedList :: Parser LispVal
parseDottedList = do head <- endBy parseExpr space
                     tail <- char '.' >> space >> parseExpr
                     return $ DottedList head tail

parseAtom :: Parser LispVal
parseAtom =  do first <- letter <|> symbol
                rest <- many (letter <|> digit <|> symbol)
                let atom = [first] ++ rest
                return $ case atom of
                           "#t" -> Bool True
                           "#f" -> Bool False
                           otherwise -> Atom atom

parseExpr :: Parser LispVal
parseExpr = parseAtom
        <|> parseString
        <|> parseNumber
        <|> parseQuoted
        <|> do char '('
               x <- (try parseList) <|> parseDottedList
               char ')'
               return x

parseNumber :: Parser LispVal
parseNumber = liftM (Number .read) $many1 digit

