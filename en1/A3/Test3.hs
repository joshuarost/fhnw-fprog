module A3.Test3 where

import Lib.FprogTest
import A3.Exercise3

test1 :: Test
test1 = TestCase "test1" 0 (assertEqual ((3,1),4,2) (secret1 (1,(3,4,2))))

test2 :: Test
test2 = TestCase "test2" 0 (assertEqual 5 (secret2 2 (+) (+1)))

main :: IO ()
main = runTests "A3" (TestList [test1, test2])

