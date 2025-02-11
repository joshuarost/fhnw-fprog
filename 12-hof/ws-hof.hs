transform :: (a -> b) -> [a] -> [b]
transform _ [] = []
transform f (a:as) = f a:transform f as

sqrs = transform (^ 2)

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep f (i:is)
  | f i = i:keep f is
  | otherwise = keep f is

aggregate :: (a -> b -> b) -> [a] -> b -> b
aggregate _ [] p = p
aggregate f (i:is) p = i `f` aggregate f is p

total = aggregate (+) [1, 2, 3] 0

total2 = aggregate (*) [1, 2, 3] 0

total3 = foldr (*) 0 [1, 2, 3]