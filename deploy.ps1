# ============================================
# 9MM Clube de Tiro — Deploy Automatico
# ============================================

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host ""
Write-Host "========================================" -ForegroundColor DarkGray
Write-Host "  9MM CLUBE DE TIRO — DEPLOY AUTOMATICO" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor DarkGray
Write-Host ""

Set-Location "C:\Users\uesle\Desktop\9mm"

# ---------- GITHUB ----------
Write-Host "[1/4] Fazendo login no GitHub..." -ForegroundColor Cyan
Write-Host "      => O navegador vai abrir. Clique em [Authorize github]." -ForegroundColor Gray
Write-Host ""
gh auth login --web -h github.com -p https

Write-Host ""
Write-Host "[2/4] Criando repositorio e enviando o codigo..." -ForegroundColor Cyan
gh repo create 9mm-clube --public --source=. --remote=origin --push
Write-Host "      OK - Codigo no GitHub!" -ForegroundColor Green

# ---------- VERCEL ----------
Write-Host ""
Write-Host "[3/4] Fazendo login no Vercel..." -ForegroundColor Cyan
Write-Host "      => O navegador vai abrir. Clique em [Continue with GitHub]." -ForegroundColor Gray
Write-Host ""
vercel login

Write-Host ""
Write-Host "[4/4] Fazendo deploy no Vercel..." -ForegroundColor Cyan
vercel --yes --name 9mm-clube --prod

Write-Host ""
Write-Host "========================================" -ForegroundColor DarkGray
Write-Host "  PRONTO! Site no ar!" -ForegroundColor Green
Write-Host "  URL: https://9mm-clube.vercel.app" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor DarkGray
Write-Host ""
pause
