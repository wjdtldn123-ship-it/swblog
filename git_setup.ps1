If (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git이 설치되어 있지 않습니다. 자동으로 설치를 시작합니다..."
    winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

$gitPath = "git"
If (Test-Path "C:\Program Files\Git\cmd\git.exe") {
    $gitPath = "C:\Program Files\Git\cmd\git.exe"
}

Write-Host "Git 초기화 및 커밋 준비 중..."
& $gitPath init
& $gitPath config user.name "Siwoo Jeong"
& $gitPath config user.email "swblog@example.com"
& $gitPath add .
& $gitPath commit -m "Initial commit: Siwoo's Blog"
& $gitPath branch -M main
& $gitPath remote remove origin 2>$null
& $gitPath remote add origin https://github.com/wjdtldn123-ship-it/swblog.git

Write-Host "GitHub으로 파일을 전송합니다. 브라우저나 로그인 창이 나타나면 권한을 부여해 주세요."
& $gitPath push -u origin main
