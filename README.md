### Pre condition

* GHC compile
* Parsec library installed
  - `ghc-pkg list` command to check whether you have installed the library. 
  - `cabal install --global parsec` to install.
  
### Parser

* I use [Parsec](http://www.cs.uu.nl/~daan/download/parsec/parsec.html) library, it's so powerful that I highly recommend. You can reade real world haskell [chapter 16](http://book.realworldhaskell.org/read/using-parsec.html) if you don't farmilar with it.


### How to run?

* After you get the code, run command: `ghc -package parsec -o repl repl.hs`

### License

* lisp-in-haskell is under the MIT license.
