module A2.Exercise2 where

import Lib.FprogTest (todo)

{-
Lösen Sie die folgenden Aufgaben und lassen Sie die Tests laufen:
`> runhaskell A2.Test2` oder `> ghci A2.Test2` und dann in ghci `main`
-}

{- Gegeben sind folgende Typen: -}
data Material = Paper | Electronic deriving (Eq, Show)

data Type = Fiction | Drama | Poetry deriving (Eq, Show)

data Book = MkBook Type Material deriving (Eq, Show)

{- 1.
Wie viele unterschiedliche Werte vom Typ Book gibt es?
-}
a2_1 :: Int
a2_1 = 6

{- 2.
Definieren Sie die funktion material, die das Material aus einem Book extrahiert:
-}
material :: Book -> Material
material (MkBook _ m) = m

{- 3.
Definieren Sie die Funktion toElectronic, die ein Book nimmt und ein neues Book zurück gibt,
das in jedem Fall das Electronic ist.
-}
toElectronic :: Book -> Book
toElectronic (MkBook t _) = MkBook t Electronic

{- 4.
Definieren Sie die Funktion toJSON, die eine Order nimmt und ein JSON String zurückgibt.
Es ist nicht korrektes JSON, dafür einfacher zu implementieren.
Das Format ist dem Testcase zu entnehmen.
Hinweis: Die involvierten Datentypen haben alle eine Show Instanz.
-}
toJSON :: Book -> String
toJSON (MkBook t m) = "{ 'type':'" ++ show t ++ "', 'material':'" ++ show m ++ "' }"