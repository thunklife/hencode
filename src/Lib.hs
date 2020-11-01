
{-# LANGUAGE OverloadedStrings #-}

module Lib (encode, decode) where

import Data.ByteString (ByteString)
import Data.ByteString.Char8 as C 
import qualified Data.ByteString.Base64 as B64
import Data.Text as T 

handleError :: Either String ByteString -> Text 
handleError (Left s) = T.pack s
handleError (Right b) = T.pack $ C.unpack b

encode :: Text -> Text
encode = T.pack . C.unpack . B64.encode . C.pack . T.unpack

decode :: Text -> Text
decode = handleError . B64.decode . C.pack . T.unpack
