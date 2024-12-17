main = do
  putStrLn "Welcome to MiniCalc"
  putStrLn "Please enter a first number:"
  fst <- getLine
  putStrLn "Please enter a second number:"
  snd <- getLine
  let sum = (read fst :: Int) + read snd :: Int
  putStrLn (fst ++ " + " ++ snd ++ " = " ++ show sum)
  main