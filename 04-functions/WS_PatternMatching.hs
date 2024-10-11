switchFirstTwo :: [a] -> [a]
switchFirstTwo [] = []
switchFirstTwo [a] = [a]
switchFirstTwo (a : b : cs) = b : a : cs

type Vec = (Int, Int)

addVec :: Vec -> Vec -> Vec
addVec (ax, ay) (bx, by) = (ax + bx, ay + by)

addVecOpt :: Vec -> Vec -> Vec
addVecOpt (ax, ay) (bx, by) = (addOpt ax bx, addOpt ay by)

addOpt :: Int -> Int -> Int
addOpt 0 b = b
addOpt a 0 = a
addOpt a b = a + b