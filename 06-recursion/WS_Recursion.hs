factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

countDown :: Int -> [Int]
countDown 0 = [0]
countDown n = n : countDown (n - 1)

countUp :: Int -> [Int]
countUp 0 = [0]
countUp n = countUp (n - 1) ++ [n]

countDownUp :: Int -> [Int]
countDownUp 0 = [0]
countDownUp n = n : countDownUp (n - 1) ++ [n]