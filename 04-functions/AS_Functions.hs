import Data.Ord qualified as Ordering

data Ordering = LT | EQ | GT

compare :: (Ord a) => a -> a -> Ordering
compare x y =
  if x < y
    then Ordering.LT
    else
      if x == y
        then Ordering.EQ
        else Ordering.GT

compare1 :: (Ord a) => a -> a -> Ordering
compare1 x y
  | x < y = Ordering.LT
  | x == y = Ordering.EQ
  | x > y = Ordering.GT

compare2 :: (Ord a) => a -> a -> Ordering
compare2 x y = case x < y of
  True -> Ordering.LT
  False -> case x == y of
    True -> Ordering.EQ
    False -> Ordering.GT

-- Pattern matching doesn't work