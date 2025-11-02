@echo off
setlocal
echo ========================================
echo  SMART AUTO GIT UPLOADER (Rebase Mode)
echo ========================================
echo.

:: === Set a flag for new repo ===
set IS_NEW_REPO=0

:: === STEP 1: Ask for PRIMARY repository link ===
set /p REPO=Enter your GitHub repository link: 
if "%REPO%"=="" (
    echo ❌ Repository link required!
    pause
    exit /b
)

:: === STEP 2: Ask for branch name ===
set /p BRANCH=Enter branch name (default: main): 
if "%BRANCH%"=="" set BRANCH=main

echo.
echo Primary Repository: %REPO%
echo Branch: %BRANCH%
echo.

:: === STEP 3: Initialize Git if not exists ===
if not exist .git (
    echo 🧱 Initializing new Git repository...
    git init
    git branch -M %BRANCH%
    git remote add origin %REPO%
    set IS_NEW_REPO=1
) else (
    echo ✅ Git repository already initialized.
)

:: === STEP 4: Update remote link ===
git remote set-url origin %REPO%

:: === STEP 5: Add and commit ===
echo.
echo ➕ Adding all local changes...
git add .

set /p msg=Enter commit message (default: auto update): 
if "%msg%"=="" set msg=auto update

echo 💬 Committing changes...
git commit --allow-empty -m "%msg%"

:: === STEP 6: Pull (Rebase Mode) ===
if %IS_NEW_REPO% == 0 (
    echo.
    echo 📥 GitHub theke code pull korchi (Rebase Mode)...
    
    :: Shudhumatro rebase command use kora hocche
    git pull origin %BRANCH% --rebase --autostash
    
) else (
    echo ℹ️ New repository, 'pull' step skip kora hocche.
)

:: === STEP 7: Push to PRIMARY GitHub ===
echo.
echo 🚀 Primary repository-te upload korchi...
git push -u origin %BRANCH%

if errorlevel 1 (
    echo ❗❗❗ Push korte giye problem hoyeche. ❗❗❗
    echo ❗ (Jodi pull conflict hoye thake, age setake solve korun)
    pause
    exit /b
)

echo ✅ Primary push complete!

:end_script
echo.
echo ✅ All done! Script shesh holo.
pause
endlocal