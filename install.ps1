Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1

if (!(Test-Path -Path "venv")) {
    Write-Output  "Creating venv for python..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "Installing deps..."
pip install -U -r requirements-windows.txt

Write-Output "Checking models..."

if (!(Test-Path -Path "models")) {
    Write-Output  "Creating pretrained_models..."
    mkdir "models"
    git lfs install
    git lfs clone https://huggingface.co/JunhaoZhuang/PowerPaint-v1/ ./models
}

Write-Output "Install completed"
Read-Host | Out-Null ;
