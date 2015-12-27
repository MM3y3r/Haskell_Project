module Paths_Haskell_Project (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/TinyForce/Haskell_Project/.cabal-sandbox/bin"
libdir     = "/Users/TinyForce/Haskell_Project/.cabal-sandbox/lib/x86_64-osx-ghc-7.10.3/Haskell-Project-0.1.0.0-FEdJfXKgzGWKUsawrUg7bw"
datadir    = "/Users/TinyForce/Haskell_Project/.cabal-sandbox/share/x86_64-osx-ghc-7.10.3/Haskell-Project-0.1.0.0"
libexecdir = "/Users/TinyForce/Haskell_Project/.cabal-sandbox/libexec"
sysconfdir = "/Users/TinyForce/Haskell_Project/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Haskell_Project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Haskell_Project_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Haskell_Project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Haskell_Project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Haskell_Project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
