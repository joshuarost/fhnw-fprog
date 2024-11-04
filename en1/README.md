# FPROG EN1 Probeprüfung

## Wichtige Hinweise
⚠️ Die automatisch Bewertung geht davon aus, dass der Code kompiliert.
Dateien mit einem Kompilierungsfehler werden mit 0 Punkten bewertet.
Wenn Sie eine (Teil-)Aufgabe nicht lösen können, lassen Sie einfach das entsprechende `todo` drin.

⚠️ Alle Funktionen müssen total sein. Das bedeutet, sie dürfen nicht mit einem Fehler abbrechen.
Sie müssen z.B. auch mit leeren Listen funktionieren.


## Nützliche Helfer
Folgende Kommandos sind nützlich in ghci:
- `:t` zeigt den Typ eines Ausdrucks
- `:i` zeigt Informationen zu einem Typ oder einer Funktion
- `:doc` zeigt die Dokumentation zu einer Funktion

Praktische Funktionen: `fst`, `snd`, `length`, `sum`, `map`, `filter`, `concat`.


## Aufbau
Jede Aufgabe ist in einem separaten Ordner `AN`.
Darin finden Sie jeweils zwei Dateien:
- `ExerciseN.hs` enthält die Aufgabe
- `TestN.hs` enthält die Tests dazu

Die Tests sind Teil der Spezifikation. Schauen Sie also auch in die Tests um zu verstehen wie eine Aufgabe gemeint ist.

## Punkte
| Aufgabe | Punkte |
|---------|--------|
| A1      | -5..5  |
| A2      | 0..8   |
| A3      | 0..7   |
| A4      | 0..12  |
| A5      | 0..11  |
| A6      | 0..6   |
|__Total__| __49__ |

Die Anzahl Punkte ist ein Richtwert und die definitive Bewertung kann davon abweichen.

## Tests

### Alle Tests ausführen
Um alle Tests zu starten, können Sie folgendes Kommando verwenden:
```
> runhaskell AllTests
```

Alternativ können Sie `ghci` starten:
```
> ghci AllTests
```
und darin `main` ausführen. 
```
ghci> main
```

### Spezifische Tests ausführen 
Um beispielsweise die Tests für eine Aufgabe `A1` zu starten, können Sie folgendes Kommando verwenden:
```
runhaskell A1.Test1
```

Alternativ können Sie zuerst `ghci` starten:
```
> ghci A1.Test1
```
und darin `main` ausführen. 
```
ghci> main
```
