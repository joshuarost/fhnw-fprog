module A5.Test5 where
import Lib.FprogTest
import A5.Exercise5

test1 :: Test
test1 =
    TestList [
        TestCase "test1a" 0 (assertEqual [1,2,3] (removeZeros [1,2,3])),
        TestCase "test1b" 0 (assertEqual [1,2,3] (removeZeros [0,1,0,2,3,0])),
        TestCase "test1c" 0 (assertEqual [] (removeZeros [0,0]))
    ]

test2 :: Test
test2 =
    TestList [
        TestCase "test2a" 0 (assertEqual [1,2,3,4,5] (toPositive [-1,2,-3,4,-5])),
        TestCase "test2b" 0 (assertEqual [] (toPositive []))
    ]


test3 :: Test
test3 =
    TestList [
        TestCase "test3a" 0 (assertEqual [[1,2,3,4], [5,6]] (cleanup [[-1,2,-3,4,0], [0,0], [-5,0,6], [0,0,0]])),
        TestCase "test3b" 0 (assertEqual [] (cleanup [[0,0], [], [0,0,0]]))
    ]

main :: IO ()
main = runTests "A5" (TestList [test1, test2, test3])