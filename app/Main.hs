module Main where

import Lib
import Console.Options
import Data.Version

main :: IO ()
main = defaultMain $ do
    programName "hencode"
    programVersion $ makeVersion [0,0,1]
    programDescription "Encode and decode Base64"
    flagA    <- flag $ FlagLong "decode" <> FlagShort 'd'
    str <- argument "A base64 string" Right
    action $ \toParam -> putStrLn $ if toParam flagA then decode (toParam str) else encode (toParam str)
