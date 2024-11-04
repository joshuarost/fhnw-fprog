module A6.Test6 where
import Lib.FprogTest
import A6.Exercise6

test1 :: Test
test1 = TestList [
    TestCase "test1a" 0 (assertEqual "a" (inorder (L 'a') )),
    TestCase "test1b" 0 (assertEqual "abc" (inorder (B (L 'a') 'b' (L 'c')))),
    TestCase "test1c" 0 (assertEqual "abcde" (inorder (B (L 'a') 'b' (B (L 'c') 'd' (L 'e')))))
  ]

main :: IO ()
main = runTests "A6" test1