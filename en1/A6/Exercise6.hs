module A6.Exercise6 where
import Lib.FprogTest ( todo )

{-
Beantworten Sie die folgenden Fragen und lassen Sie die Tests laufen:
`> runhaskell A0.Test6` oder `> ghci A0.Test6` und dann in ghci `main` 
-}

{- Gegeben ist folgender Typ für eine Baumstruktur: -}
data CharTree = L Char | B CharTree Char CharTree

{- 1. 
Definieren Sie die Funktion inorder, die den Baum in inorder Reihenfolge traversiert.
Orientieren Sie sich an den Tests für die vorgesehene Reihenfolge.
-}
inorder :: CharTree -> String
inorder = todo
