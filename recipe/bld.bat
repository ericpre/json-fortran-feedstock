@echo off
setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build
cd build

:: Configure using the CMakeFiles
cmake -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH:PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE:STRING="Release" ^
      %SRC_DIR%
if errorlevel 1 exit 1

:: Build and install!
cmake --build . --config Release --target install
if errorlevel 1 exit 1
