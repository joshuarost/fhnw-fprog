type M22 =
  ( (Int, Int),
    (Int, Int)
  )

add :: M22 -> M22 -> M22
add
  ( (a11, a12),
    (a21, a22)
    )
  ( (b11, b12),
    (b21, b22)
    ) =
    ( (a11 + b11, a12 + b12),
      (a21 + b21, a22 + b22)
    )

sub :: M22 -> M22 -> M22
sub
  ( (a11, a12),
    (a21, a22)
    )
  ( (b11, b12),
    (b21, b22)
    ) =
    ( (a11 - b11, a12 - b12),
      (a21 - b21, a22 - b22)
    )