{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_evserv (
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

bindir     = "/Users/evan/.cabal/bin"
libdir     = "/Users/evan/.cabal/lib/x86_64-osx-ghc-8.6.3/evserv-0.1.0.0-LFt6l142AVOCycgGPRgRKE-Lib"
dynlibdir  = "/Users/evan/.cabal/lib/x86_64-osx-ghc-8.6.3"
datadir    = "/Users/evan/.cabal/share/x86_64-osx-ghc-8.6.3/evserv-0.1.0.0"
libexecdir = "/Users/evan/.cabal/libexec/x86_64-osx-ghc-8.6.3/evserv-0.1.0.0"
sysconfdir = "/Users/evan/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "evserv_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "evserv_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "evserv_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "evserv_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "evserv_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "evserv_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
