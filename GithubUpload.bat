@echo off
cls
echo ========================================
echo     SMART AUTO GIT UPLOADER (Auto Mode)
echo ========================================
echo.

:: STEP 1: Ask for repository link
set /p REPO=Enter your GitHub repository link: 
if "%REPO%"=="" (
    echo ❌ Repository link required!
    pause
    exit /b
)

:: STEP 2: Ask for branch name (default: main)
set /p BRANCH=Enter branch name (default: main): 
if "%BRANCH%"=="" set BRANCH=main

echo.
echo Repository: %REPO%
echo Branch: %BRANCH%
echo.

:: STEP 3: Ask if group or solo project
set /p MODE=Are you working in a group project or solo? (group/solo, default: group): 
if "%MODE%"=="" set MODE=group

:: Ensure no extra spaces or uppercase issues
set MODE=%MODE: =%
set MODE=%MODE:"=%

if /I "%MODE%"=="group" (
    set PULLMODE=merge
) else (
    if /I "%MODE%"=="solo" (
        set PULLMODE=rebase
    ) else (
        echo ⚠️ Invalid input! Defaulting to group mode.
        set PULLMODE=merge
    )
)

echo Selected mode: %MODE% project
echo Pull method: %PULLMODE%
echo.

:: STEP 4: Initialize Git if not exists
if not exist .git (
    echo 🧱 Initializing new Git repository...
    git init
    git branch -M %BRANCH%
    git remote add origin %REPO%
) else (
    echo ✅ Git repository already initialized.
)

:: STEP 5: Ensure remote origin exists
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    git remote add origin %REPO%
)
git remote set-url origin %REPO%

:: STEP 6: Add and commit
echo.
echo ➕ Adding all local changes...
git add .

set /p msg=Enter commit message (default: auto update): 
if "%msg%"=="" set msg=auto update

echo 💬 Committing changes...
git commit --allow-empty -m "%msg%"

:: STEP 7: Pull latest changes (depends on mode)
echo.
if /I "%PULLMODE%"=="rebase" (
    echo 📥 Pulling latest code from GitHub (rebase mode for solo)...
    git pull origin %BRANCH% --rebase
) else (
    echo 📥 Pulling latest code from GitHub (merge mode for group)...
    git pull origin %BRANCH%
)

if errorlevel 1 (
    echo ❌ Pull failed! Please resolve merge conflicts manually.
    pause
    exit /b
)

:: STEP 8: Push to GitHub
echo.
echo 🚀 Uploading code to GitHub...
git push -u origin %BRANCH%
if errorlevel 1 (
    echo ❌ Push failed! Check your internet or permissions.
    pause
    exit /b
)

echo.
echo ✅ All done! Code uploaded successfully.

:: === STEP 9: Ask for another repository ===
:ANOTHER_REPO
echo.
set /p AGAIN=Do you want to upload to another repository? (y/n): 
if /I "%AGAIN%"=="y" (
    set /p NEWREPO=Enter new GitHub repository link: 
    if "%NEWREPO%"=="" (
        echo ❌ Repository link required!
        goto ANOTHER_REPO
    )
    echo 🔄 Updating remote URL...
    git remote set-url origin %NEWREPO%
    echo 🚀 Uploading to new repository...
    git push -u origin %BRANCH%
    if errorlevel 1 (
        echo ❌ Push failed! Check your internet or permissions.
        pause
        exit /b
    )
    echo ✅ Successfully uploaded to: %NEWREPO%
    goto ANOTHER_REPO
) else (
    echo 👋 Exiting. All uploads complete!
    pause
    exit /b
)
