module A1.Exercise1 where

import Lib.FprogTest (todo)

{-
Lösen Sie die folgenden Aufgaben und lassen Sie die Tests laufen:
`> runhaskell A1.Test1` oder `> ghci A1.Test1` und dann in ghci `main`
-}

{-
Beantworten Sie die folgenden Fragen.
True: Die Aussage ist korrekt.
False: Die Aussage ist falsch.

Für jede Antwort gilt:
Wenn Sie das `todo` drin lassen, gibt es 0 Punkte.
Pro richtige Antwort 0.5 Punkte.
Pro falsche Antwort -0.5 Punkte. (Raten lohnt sich also nicht.)
-}

-- 0. Listen können in Haskell unendlich lang sein.
a1_0 :: Bool
a1_0 = True

-- 1. Der `String` Datentyp ist nicht sehr effizient (Liste von Char).
a1_1 :: Bool
a1_1 = True

-- 2. Funktionsanwendung bindet am stärksten.
a1_2 :: Bool
a1_2 = True

-- 3. head gibt die erste Komponente eines Pairs (a,b) zurück.
a1_3 :: Bool
a1_3 = False

-- 4. Listen sind in Haskell immutable.
a1_4 :: Bool
a1_4 = True

-- 5. Statt Schleifen wird in Haskell Rekursion verwendet.
a1_5 :: Bool
a1_5 = True

-- 6. Funktionsapplikation ist rechtsassoziativ: f a b == (f (a b)).
a1_6 :: Bool
a1_6 = False

-- 7. [[b]] -> [b] ist ein legaler Typ für (map head).
a1_7 :: Bool
a1_7 = True

-- 8. (take 1) verhält sich gleich wie head.
a1_8 :: Bool
a1_8 = False

-- 9. Folgender Typ beschreibt eine Liste, die nicht leer sein kann:
-- data Nel a = El a | Cons a (Nel a)
a1_9 :: Bool
a1_9 = True
