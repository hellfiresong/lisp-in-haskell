-- Lisp Data definition.

-- hellfire (asyncloading#163.com)
-- Feb 3rd, 2016

module DataType
( LispVal(..)) where

-- Data type definition
-- It can hold any list value.
data LispVal = Atom String                          -- Stores a String naming the atom
             | List [LispVal]                       -- Stores a proper list
             | DottedList [LispVal] LispVal         -- Stores an improper list
             | Number Integer                       -- Integer
             | String String                        -- String
             | Bool Bool                            -- Boolean
