# prereq
Mit diesem kleinen Web-Projekt stellen Sie sicher, dass Sie für die kommende Projektarbeit gut vorbereitet sind.

Damit alle die gleiche Umgebung haben, verwenden wir einen [Dev Container](https://code.visualstudio.com/docs/devcontainers/containers). Damit das funktioniert, müssen Sie Docker installiert haben. Für Windows und macOS empfehle ich [Docker Desktop](https://www.docker.com/products/docker-desktop/).

Die Applikation verwendet [Scotty](https://hackage.haskell.org/package/scotty-0.22), ein minimales Webframework.

## Kompilieren und Ausführen
Wenn Sie das Projekt mit VSCode öffnen, werden Sie gefragt, ob Sie es im Dev Container öffnen möchten. Docker muss zu diesem Zeitpunkt laufen, damit das funkioniert. Beim ersten Mal dauert das etwas länger, weil das Docker-Image gebaut wird. Im Docker-Image wird auch gleich das Webframework installiert und dabei ein ganzer Webserver kompiliert. 

### Build und Run:
Um das Projekt zu kompilieren und auszuführen, können Sie folgendes Kommando verwenden:
```
> cabal run
```
Wenn die Applikation läuft, können Sie mit dem Browser unter folgender Adresse damit interagieren: http://localhost:4000

### Tests ausführen
Um die Tests auszuführen, können Sie folgendes Kommando verwenden:
```
> cabal test
```

### Bei Problemen
Sollte es Probleme beim Build oder der Ausführung des Projekts kommen, bitte ich Sie diese präzise auf MS Teams zu erklären. Die Fehlermeldung fügen Sie bitte als Text und nicht als Screenshot ein. Es würde mich auch sehr freuen, wenn Sie sich gegenseitig helfen würden.


## Hinweise zum Code

```haskell
($) :: (a -> b) -> a -> b infixr 0
```
Application operator. This operator is redundant, since ordinary application `(f x)` means the same as `(f $ x)`. However, `$` has low, right-associative binding precedence, so it sometimes allows parentheses to be omitted; for example:

```haskell
f $ g $ h x  =  f (g (h x))
```
----

Scotty verwendet nicht `type String = [Char]` sondern `Text` als Repräsentation für Text. 
Sie können zwischen diesen beiden Typen konvertieren:
```haskell
T.pack :: String -> T.Text
T.unpack :: T.Text -> String
```
Text können Sie mit `<>` konkatenieren und mit `mconcat` können Sie ganze Listen zusammenfügen.
Ich schlage allerdings vor, dass Sie mit `String` operieren und nur gerade an der Schnittstelle zu `T.Text` konvertieren.

Dank der Language-Extension `{-# LANGUAGE OverloadedStrings #-}` können `String` Literale automatisch als `Text` interpretiert werden. 

----

`IO`-Actions in Scotty müssen mit `liftIO` zu `ActionM` konvertiert werden. `ActionM` ist wie ein `IO`-Rezept, kann aber noch mehr. Sie können solche `ActionM` Rezepte analog zu den `IO`-Actions mittels `do`-Notation zu einem grösseren Rezept zusammenfügen.

----

Zusätzliche Module müssen im `prereq.cabal` File unter `library` `->` `exposed-modules:` hinzugefügt werden. Sonst scheitert `gcc` in der Linker Phase.