module Lib (encode, decode) where

import Data.ByteString (ByteString)
import Data.ByteString.Char8 (pack, unpack)
import qualified Data.ByteString.Base64 as B64

handleError :: Either String ByteString -> String
handleError (Left s) = s
handleError (Right b) = unpack b

encode :: String -> String
encode = unpack . B64.encode . pack

decode :: String -> String
decode = handleError . B64.decode . pack
