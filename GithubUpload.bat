@echo off
setlocal
echo ========================================
echo  SMART GIT UPLOADER (Multi-Repo) v2
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
git remote set-url origin %REPO%

:: === STEP 5: Add and commit ===
echo.
echo ➕ Adding all local changes...
git add .

set /p msg=Enter commit message (default: auto update): 
if "%msg%"=="" set msg=auto update

echo 💬 Committing changes...
git commit --allow-empty -m "%msg%"

:: === STEP 6 & 7: Pull (Only if NOT a new repo) ===
if %IS_NEW_REPO% == 0 (
    echo.
    echo ----------------------------------------
    echo   ❓ Pull Strategy Select Korun
    echo ----------------------------------------
    echo    [1] Solo Project (Rebase use korbo)
    echo    [2] Group Project (Merge use korbo)
    echo.

    choice /c:12 /n /m "Apni ki bhabe kaj korchen [1 or 2]? "

    if errorlevel 2 (
        echo.
        echo ✅ Group mode: 'merge' (default pull) select kora holo.
        set PULL_CMD=git pull origin %BRANCH%
    ) else (
        echo.
        echo ✅ Solo mode: 'rebase' select kora holo.
        set PULL_CMD=git pull origin %BRANCH% --rebase
    )
    
    echo.
    echo 📥 GitHub theke code pull korchi...
    %PULL_CMD%

    if errorlevel 1 (
        echo.
        echo ❗ PULL KORTE GIYE CONFLICT HOYECHE!
        echo ❗ Conflict solve kore script ti abar chalun.
        pause
        exit /b
    )
) else (
    echo.
    echo ℹ️ New repository, 'pull' step skip kora hocche.
)


:: === STEP 8: Push to PRIMARY GitHub ===
echo.
echo 🚀 Primary repository-te upload korchi...
git push -u origin %BRANCH%

if errorlevel 1 (
    echo ❗ Primary repo-te push korte giye problem hoyeche.
    pause
    exit /b
)

echo ✅ Primary push complete!
echo.

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

if errorlevel 1 (
    echo ❗ Remote add korte giye problem hoyeche. Link-ti check korun.
    goto :end_script
)

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