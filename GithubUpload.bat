@echo off
setlocal
echo ========================================
echo  SMART GIT UPLOADER (Multi-Repo) v5
echo  (DEBUG MODE - Step-by-Step)
echo ========================================
echo.

:: === Set a flag for new repo ===
set IS_NEW_REPO=0

:: === STEP 1: Ask for PRIMARY repository link ===
set /p REPO=Enter your PRIMARY GitHub repository link: 
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
echo ℹ️ DEBUG: 'git remote set-url' chalacchi...
git remote set-url origin %REPO%
echo.
pause

:: === STEP 5: Add and commit ===
echo ➕ Adding all local changes...
echo ℹ️ DEBUG: 'git add .' chalacchi...
git add .
echo.
pause

set /p msg=Enter commit message (default: auto update): 
if "%msg%"=="" set msg=auto update

echo 💬 Committing changes...
echo ℹ️ DEBUG: 'git commit' chalacchi...
git commit --allow-empty -m "%msg%"
echo.
pause

:: === STEP 6 & 7: Pull (Only if NOT a new repo) ===
if %IS_NEW_REPO% == 0 (
    echo.
    echo ----------------------------------------
    echo   ❓ Pull Strategy Select Korun
    echo ----------------------------------------
    echo    [1] Solo Project (Rebase)
    echo    [2] Group Project (Merge)
    echo.

    choice /c:12 /n /m "Apni ki bhabe kaj korchen [1 or 2]? "

    if errorlevel 2 (
        echo.
        echo ✅ Group mode: 'merge' (default pull) select kora holo.
        echo ℹ️ DEBUG: Ekhon 'git pull' (merge) chalano hobe...
        pause
        git pull origin %BRANCH% --no-edit
        echo ℹ️ DEBUG: 'git pull' (merge) command shesh hoyeche.
        pause
    ) else (
        echo.
        echo ✅ Solo mode: 'rebase' select kora holo.
        echo ℹ️ DEBUG: Ekhon 'git pull' (rebase) chalano hobe...
        pause
        git pull origin %BRANCH% --rebase --autostash
        echo ℹ️ DEBUG: 'git pull' (rebase) command shesh hoyeche.
        pause
    )
    
) else (
    echo.
    echo ℹ️ New repository, 'pull' step skip kora hocche.
)


:: === STEP 8: Push to PRIMARY GitHub ===
echo.
echo 🚀 Primary repository-te upload korchi...
echo ℹ️ DEBUG: Ekhon 'git push' chalano hobe...
pause
git push -u origin %BRANCH%

if errorlevel 1 (
    echo ❗ Primary repo-te push korte giye problem hoyeche.
    pause
    exit /b
)

echo ✅ Primary push complete!
echo.
pause

:: === STEP 9: Ask for secondary push ===
echo ----------------------------------------
echo   ❓ Backup to another repository?
echo ----------------------------------------
choice /c:YN /n /m "Apni ki ei code ONNO kono repository-te push korte chan [Y/N]? "

if errorlevel 2 (
    echo.
    echo ✅ Okay, shudhu primary repo-tei push kora holo.
    goto :end_script
)

:: User pressed Y (errorlevel 1)
echo.
echo 🔗 Ditiyo repository-r link din:
set /p SECOND_REPO=

if "%SECOND_REPO%"=="" (
    echo ❌ Link deya hoyni. Cancelling secondary push.
    goto :end_script
)

echo.
echo ☁️ Ditiyo repository-te push korar cheshta korchi...

set SECOND_REMOTE_NAME=secondary_backup

(git remote remove %SECOND_REMOTE_NAME%) >nul 2>nul
git remote add %SECOND_REMOTE_NAME% %SECOND_REPO%
echo ℹ️ DEBUG: Ditiyo remote add kora hoyeche.
pause

echo 🚀 Uploading code to %SECOND_REMOTE_NAME%...
git push -u %SECOND_REMOTE_NAME% %BRANCH%

if errorlevel 1 (
    echo ❗ Ditiyo repo-te push korte giye problem hoyeche.
) else (
    echo ✅ Ditiyo repository-te push complete!
)


:end_script
echo.
echo ✅ All done! Script shesh holo.
pause
endlocal