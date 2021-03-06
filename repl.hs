-- REPL (read, evaluation, print loop)
-- This is lisp-in-haskell entrance file.
--
-- 
-- hellfire (asyncloading#163.com)
-- Jan 30th, 2016

module Main where

-- Library Dependencies
import System.Environment
import Text.ParserCombinators.Parsec hiding (spaces)

-- Module Dependencies
import Symbol
import DataType
import DataTypeParser
import Evaluator

-- Functional module contains some utilities function.
import Functional

-- Read expression
readExpr :: String -> LispVal
readExpr input = case parse parseExpr "lisp" input of
    Left err -> String $ "No match: " ++ show err
    Right val -> val

-- main
main :: IO()
main = getArgs >>= putStrLn .show .eval .readExpr .(!! 0)

instance Show LispVal where show = showVal
