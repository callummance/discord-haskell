{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (forever)
import Data.Char (isSpace)
import Data.Monoid ((<>))
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

import Discord

a :: IO ()
a = do
  tok <- T.filter (not . isSpace) <$> TIO.readFile "./examples/auth-token.secret"
  Discord _ nextEvent <- login (Bot tok)
  forever $ do
    x <- nextEvent
    putStrLn (show x <> "\n")
    pure ()

