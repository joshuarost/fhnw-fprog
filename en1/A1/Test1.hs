module A1.Test1 where

import Lib.FprogTest
import A1.Exercise1

-- Diese Tests prüfen nur, ob Sie eine gültige Antwort Option gewählt haben.
-- Bei Enthaltung (keine Antwort) wird "Error Not implemented" ausgegeben.
t0, t1, t2, t3, t4, t5, t6, t7, t8, t9 :: Test
t0  = TestCase "a1_0 "  0.5 $ assertTrue (a1_0  || True)
t1  = TestCase "a1_1 "  0.5 $ assertTrue (a1_1  || True)
t2  = TestCase "a1_2 "  0.5 $ assertTrue (a1_2  || True)
t3  = TestCase "a1_3 "  0.5 $ assertTrue (a1_3  || True)
t4  = TestCase "a1_4 "  0.5 $ assertTrue (a1_4  || True)
t5  = TestCase "a1_5 "  0.5 $ assertTrue (a1_5  || True)  
t6  = TestCase "a1_6 "  0.5 $ assertTrue (a1_6  || True)
t7  = TestCase "a1_7 "  0.5 $ assertTrue (a1_7  || True)
t8  = TestCase "a1_8 "  0.5 $ assertTrue (a1_8  || True)
t9  = TestCase "a1_9 "  0.5 $ assertTrue (a1_9  || True)

main :: IO ()
main = runTests "A1" (TestList [t0, t1, t2, t3, t4, t5, t6, t7, t8, t9])
