@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.3 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Fri Aug 25 11:37:08 +0200 2023
REM SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
call xelab  -wto fce676d767024e0292f5f0eb2740a2e0 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot SimCA_behav xil_defaultlib.SimCA -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0