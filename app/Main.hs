{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import Turtle
import Data.Text

data Command =
      Encode Text
    | Decode Text

parser :: Parser Command
parser
    =
        fmap Encode
             (subcommand "encode" "Base64 encode a string"
                (argText "string" "The string you want to encode"
                )
             )
    <|> fmap Decode 
             (subcommand "decode" "Decode a Base64 string"
                (argText "string" "The string you want to decode")
              )

main :: IO ()
main = do
    cmd <- options "Hencode" parser
    case cmd of
        Encode s -> putStrLn . unpack $ encode s
        Decode s -> putStrLn . unpack $ decode s 