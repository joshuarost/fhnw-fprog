module Main where
import qualified A1.Test1 
import qualified A2.Test2
import qualified A3.Test3
import qualified A4.Test4
import qualified A5.Test5
import qualified A6.Test6

main :: IO ()
main = sequence_ [
    A1.Test1.main,
    A2.Test2.main,
    A3.Test3.main,
    A4.Test4.main,
    A5.Test5.main,
    A6.Test6.main
    ]