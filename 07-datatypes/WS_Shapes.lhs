Arbeitsblatt: Figuren als Algebraische Datentypen

Hinweis: Sie lesen diesen Text in einem literate Haskell File.
Aller Text wird als Kommentar behandelt, ausser er startet mit '>'.

Folgende Option schaltet alle Compiler-Warnungen ein.

> {-# OPTIONS_GHC -Wall #-}

In diesem Arbeitsblatt implementieren wir eine kleine Bibliothek für den
Umgang mit Figuren.

a) Definieren Sie den Datentyp Shape.
Zwei Formen werden von der Bibliothek unterstützt:
- Kreis: Die Grösse wird über den Radius angegeben
- Rechteck: Die Grösse wird über die Länge und die Breite angegeben

Hinweis: Verwenden Sie deriving (Show) damit Ihr Datentyp auf in einen
lesbaren String übersetzt werden kann.

> data Shape = Circle Float
>            | Rectangle Float Float
>            deriving (Show)

b) Definieren Sie die Funktion circumference, die den Umfang einer Form berechnet:
Hinweis: Die Kreiskonstante π ist vordefiniert unter dem Namen pi.

> circumference :: Shape -> Float
> circumference (Circle r) = 2 * pi * r
> circumference (Rectangle l b) = 2 * (l + b)

c) Gegeben ist der Datentyp Point. Ein Punkt beschreibt mit zwei Float
Werten eine X/Y Koordinate in der Ebene.

> data Point = XY Float Float deriving (Show)

Definieren Sie den Typ Figure. Eine Figure ist ein positioniertes Shape.
Verwenden Sie als Komponenten den Typ Point und den Typ Shape.

> data Figure = Figure Point Shape deriving (Show)
> getShape :: Figure -> Shape
> getShape  (Figure _ s) = s


d) Definieren Sie die Funktion um eine Figur zu verschieben.
Der erste Float ist die Differenz in Richtung x und der zweite Float ist
die Differenz in Richtung y.

> move :: Figure -> Float -> Float -> Figure
> move (Figure _ s) x y = Figure (XY x y) s
