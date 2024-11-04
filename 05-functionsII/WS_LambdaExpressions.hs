incAll :: [Int] -> [Int]
incAll = map (\x -> x + 1)

addToAll :: Int -> [Int] -> [Int]
addToAll f = map (\x -> x + f)

keepOld :: [Int] -> [Int]
keepOld = filter (\x -> x < 90)

dropShort :: [String] -> [String]
dropShort = filter (\x -> length x /= 1)

todo = error "TODO"
