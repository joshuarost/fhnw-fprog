module A2.Test2 where

import Lib.FprogTest
import A2.Exercise2

-- Prüft nur, dass es ein nicht negativer Wert ist.
test1 :: Test
test1 = TestCase "test1" 0 (assertTrue (a2_1 >= 0))

test2 :: Test
test2 = TestCase "test2" 0 (assertEqual Paper (material (MkBook Drama Paper)))

test3 :: Test
test3 = TestList [
  TestCase "test3a" 0 (assertEqual (MkBook Drama Electronic) (toElectronic (MkBook Drama Paper))),
  TestCase "test3b" 0 (assertEqual (MkBook Drama Electronic) (toElectronic (MkBook Drama Electronic)))
  ]

test4 :: Test
test4 = TestList[
  TestCase "test4a" 0 (assertEqual "{ 'type':'Fiction', 'material':'Paper' }" (toJSON (MkBook Fiction Paper))),
  TestCase "test4b" 0 (assertEqual "{ 'type':'Poetry', 'material':'Electronic' }" (toJSON (MkBook Poetry Electronic)))
  ]


main :: IO ()
main = runTests "A2" (TestList [test1, test2, test3, test4])