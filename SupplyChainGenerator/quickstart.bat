@echo off
REM Quick Start Script for Supply Chain Generator (Windows)

echo ======================================================================
echo Supply Chain Generator - Quick Start
echo ======================================================================
echo.

echo Checking Python installation...
python --version
if errorlevel 1 (
    echo ERROR: Python not found. Please install Python 3.7+
    pause
    exit /b 1
)
echo.

echo === STEP 1: Generate a small test chain ===
python supply_chain_generator.py -c 2 -o quickstart_small.cypher
echo.

echo === STEP 2: Analyze the generated chain ===
python analyze_chain.py quickstart_small.cypher
echo.

echo === STEP 3: Generate a medium chain ===
python supply_chain_generator.py -c 5 -o quickstart_medium.cypher
echo.

echo === STEP 4: Analyze the medium chain ===
python analyze_chain.py quickstart_medium.cypher
echo.

echo ======================================================================
echo Quick start complete!
echo ======================================================================
echo.
echo Generated files:
echo   - quickstart_small.cypher  (complexity 2)
echo   - quickstart_medium.cypher (complexity 5)
echo.
echo To load into Neo4j:
echo   type quickstart_small.cypher ^| cypher-shell -u neo4j -p password
echo.
echo For more options, run:
echo   python supply_chain_generator.py --help
echo.

pause
