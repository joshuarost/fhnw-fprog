module A5.Exercise5 where

import Data.Char (toLower)
import Lib.FprogTest (todo)

{-
Lösen Sie die folgenden Aufgaben und lassen Sie die Tests laufen:
`runhaskell A5.Test` oder `ghci A5.Test` und dann in ghci `main`
-}

{- WICHTIG:
Verwenden Sie vorderfinierte Listenfunktionen
Selber programmierte Rekursion ist in dieser Aufgabe NICHT erlaubt.
-}

{- 1.
Implementieren Sie die Funktion removeZeros, die eine Liste von Int's nimmt
und alle 0 Werte entfernt.
-}
removeZeros :: [Int] -> [Int]
removeZeros = filter (/= 0)

{- 2.
Implementieren Sie die Funktion toPositive, die eine Liste von Int's nimmt und alle
Werte positiv macht. Verwenden Sie dazu die Funktion `abs`.
-}
toPositive :: [Int] -> [Int]
toPositive = map abs

{- 3.
Implementieren Sie die Funktion cleanup, die eine Liste von Listen von Int's nimmt,
bei jeder inneren Liste die 0 Werte entfernt, danach die leeren Listen entfernt
und die Ints der verbleibenen Listen auf positive Ints normalisiert.
Verwenden Sie dazu auch die Funktionen aus 1. und 2.
-}
cleanup :: [[Int]] -> [[Int]]
cleanup is = map toPositive (filter (\x -> length x > 0) (map removeZeros is))