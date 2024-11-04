module A4.Exercise4 where
import Lib.FprogTest ( todo )

{-
Lösen Sie die folgenden Aufgaben und lassen Sie die Tests laufen:
`runhaskell A4.Test4` oder `ghci A4.Test4` und dann in ghci `main` 
-}

{- Gegeben sind folgende zwei Typen: -}
data Customer = MkCustomer { email :: String, nr :: Int } deriving (Eq, Show)
data Order = MkOrder { custnr :: Int, prod :: String, price :: Double } deriving (Eq, Show)


{- 1. 
Definieren Sie die Funktion findCustomerId, die aus der Liste von Kunden 
die KundenID `nr` für eine gegebene Emailadresse zurück gibt. Der Returntyp
der Funktion ist Maybe Int, für den Fall, dass die Emailadresse nicht gefunden werden kann.
Verwenden Sie Rekursion um die Aufgabe zu lösen.
-}
-- Kunden -> Email -> Maybe KundenID
findCustomerId :: [Customer] -> String -> Maybe Int
findCustomerId = todo


{- 2. 
Definieren Sie die Funktion, die aus der Liste von Bestellungen für eine gegebene 
KundenID und ein gegebenes Produkt die Liste der Preise zurückgibt. 
Ein Kunde kann für ein Produkt mehrere oder keine Bestellungen getätigt haben, 
deshalb als Resultat eine Liste von Preisen.
Verwenden Sie Rekursion um die Aufgabe zu lösen.
-}
-- Bestellungen -> KundenID -> Produkt -> [Preis]
getBill :: [Order] -> Int -> String -> [Double]
getBill = todo
