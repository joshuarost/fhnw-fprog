module A4.Test4 where

import Lib.FprogTest
import A4.Exercise4


customerDB :: [Customer]
customerDB = [MkCustomer "dk@gmail.com" 123, MkCustomer "fg@hotmail.com" 456]

test1 :: Test
test1 =
    TestList [
        TestCase "test1a" 0 (assertEqual Nothing (findCustomerId customerDB "X@bla.ch")),
        TestCase "test1b" 0 (assertEqual (Just 456) (findCustomerId customerDB "fg@hotmail.com"))
    ]


orderDB :: [Order]
orderDB = [MkOrder 456 "Pizza" 20, MkOrder 456 "Fritten" 10, MkOrder 456 "Pizza" 50]

test2 :: Test
test2 =
    TestList [
        TestCase "test2a" 0 (assertEqual [20, 50] (getBill orderDB 456 "Pizza")),
        TestCase "test2b" 0 (assertEqual [] (getBill orderDB 000 "Pizza"))
    ]


main :: IO ()
main = runTests "A4" (TestList [test1, test2])