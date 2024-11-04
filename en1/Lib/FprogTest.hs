-- Testframework
{-# LANGUAGE ScopedTypeVariables #-}

module Lib.FprogTest where

import Control.Exception (throw, catch, SomeException, Exception )
import Control.Monad (unless)
import Data.Foldable (traverse_)

todo :: a
todo = throw NotImplemented

uncomment :: a
uncomment = throw UncommentTest

type Assertion = IO ()

data Test = 
    TestCase String Double Assertion
  | TestList [Test]

data TestException = 
    NotImplemented
  | UncommentTest
  | AssertionError String

instance Exception TestException

instance Show TestException where
  show NotImplemented = "Not implemented"
  show UncommentTest = "Test needs to be activated (uncomment)!"
  show (AssertionError msg) = "Assertion error: " ++ msg

assertCompiles :: a -> Assertion
assertCompiles _ = assertTrue True

assertFailure :: String -> Assertion
assertFailure msg = throw $ AssertionError msg

assertTrue :: Bool -> Assertion
assertTrue = assertEqual True

assertFalse :: Bool -> Assertion
assertFalse = assertEqual False

assertEqual :: (Eq a, Show a) => a -> a -> Assertion
assertEqual expected actual = unless (actual == expected) (assertFailure msg)
  where msg = "expected: " ++ show expected ++ " but got: " ++ show actual

reset :: String
reset = "\27[0m"

red :: String -> String
red content = "\27[91m " ++ content ++ reset

green :: String -> String
green content = "\27[92m " ++ content ++ reset

runTests :: String -> Test -> IO ()
runTests testName test = do
  putStrLn ("[[" ++ testName ++ "]]")
  runTests' test

runTests' :: Test -> IO ()
runTests' (TestList ts) = traverse_ runTests' ts
runTests' (TestCase testName _ assertion) = 
  catch (putStr (testName ++ "\t") >> assertion >> putStrLn (green " OK")) 
        (\(e :: SomeException) -> putStr (red " Error ") >> print e)

gradeTests :: Test -> IO ()
gradeTests (TestList ts) = traverse_ gradeTests ts
gradeTests (TestCase name points assertion) = do
  catch (assertion >> putStr success) (\(e :: SomeException) -> putStr failure)
  where success = name ++ ";" ++ show points ++ ";"
        failure = name ++ ";" ++ "0" ++ ";"
