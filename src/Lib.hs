module Lib (encode, decode) where

import Data.ByteString (ByteString)
import Data.ByteString.Char8 (pack)
import qualified Data.ByteString.Base64 as B64

encode :: String -> IO()
encode = print . B64.encode . pack

decode :: String -> IO()
decode = print . B64.decode . pack
