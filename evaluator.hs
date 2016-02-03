-- Evaluator
--

-- hellfire(asyncloading#163.com)
-- Feb 3rd, 2016


module Evaluator
( showVal) where


-- Data type definition
-- It can hold any list value.
data LispVal = Atom String                          -- Stores a String naming the atom
             | List [LispVal]                       -- Stores a proper list
             | DottedList [LispVal] LispVal         -- Stores an improper list
             | Number Integer                       -- Integer
             | String String                        -- String
             | Bool Bool                            -- Boolean


showVal :: LispVal -> String
showVal (String contents) = "\"" ++ contents ++ "\""
showVal (Atom name) = name
showVal (Number contents) = show contents
showVal (Bool True) = "#t"
showVal (Bool False) = "#f"
showVal (List contents) = "(" ++ unwordsList contents ++ ")"

unwordsList :: [LispVal] -> String
unwordsList = unwords . map showVal


