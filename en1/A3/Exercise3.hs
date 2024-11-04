module A3.Exercise3 where
import Lib.FprogTest ( todo )

{-
Lösen Sie die folgenden Aufgaben und lassen Sie die Tests laufen:
`> runhaskell A3.Test3` oder `> ghci A3.Test3` und dann in ghci `main` 
-}

{- 1.
Implementieren Sie die Funktionen `secret1` und `secret2` mit den gegeben Typen.
Endlosscheifen, error, undefined, etc. sind nicht erlaubt und geben signifikant Abzug.
Wenn Sie die Aufgabe nicht lösen können, lassen Sie einfach das `todo` drin.
Die Typsignaturen dürfen nicht verändert werden.
-}

secret1 :: (a,(c,d,b)) -> ((c,a),d,b)
secret1 = todo


secret2 :: a -> (b -> a -> c) -> (a -> b) -> c
secret2 = todo
