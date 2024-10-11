max1 :: Int -> Int -> Int
max1 a b
  | a > b = a
  | b > a = b

max2 :: Int -> Int -> Int
max2 a b = if a > b then a else b

max3 :: Int -> Int -> Int
max3 a b = case a > b of
  True -> a
  False -> b

-- Not possible
