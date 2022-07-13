{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Life_Colector (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/esrela/Documents/Plp/Haskell/Life-Colector/.cabal-sandbox/bin"
libdir     = "/home/esrela/Documents/Plp/Haskell/Life-Colector/.cabal-sandbox/lib/x86_64-linux-ghc-8.6.5/Life-Colector-0.1.0.0-IlTTF8e07bN9nOhbzmlKce-Life-Colector"
dynlibdir  = "/home/esrela/Documents/Plp/Haskell/Life-Colector/.cabal-sandbox/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/esrela/Documents/Plp/Haskell/Life-Colector/.cabal-sandbox/share/x86_64-linux-ghc-8.6.5/Life-Colector-0.1.0.0"
libexecdir = "/home/esrela/Documents/Plp/Haskell/Life-Colector/.cabal-sandbox/libexec/x86_64-linux-ghc-8.6.5/Life-Colector-0.1.0.0"
sysconfdir = "/home/esrela/Documents/Plp/Haskell/Life-Colector/.cabal-sandbox/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Life_Colector_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Life_Colector_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Life_Colector_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Life_Colector_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Life_Colector_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Life_Colector_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
