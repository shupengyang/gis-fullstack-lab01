
Write-Host '===== GIS Environment Check =====' -ForegroundColor Cyan
Write-Host ''

function Test-Tool {
    param([string], [string], [string])
    Write-Host ('  ' +  + ' : ') -NoNewline
     = Get-Command  -ErrorAction SilentlyContinue
    if () {
         = Invoke-Expression ( + ' ' +  + ' 2>&1') | Select-Object -First 1
        Write-Host  -ForegroundColor Green
    } else {
        Write-Host 'NOT FOUND' -ForegroundColor Red
    }
}

Test-Tool 'Node.js' 'node' '-v'
Test-Tool 'pnpm' 'pnpm' '-v'
Test-Tool 'Python' 'python' '--version'
Test-Tool 'Java' 'java' '-version'
Test-Tool 'Maven' 'mvn' '-v'
Test-Tool 'Git' 'git' '--version'
Test-Tool 'Docker' 'docker' '--version'

Write-Host ''
Write-Host '===== Check Complete =====' -ForegroundColor Cyan
