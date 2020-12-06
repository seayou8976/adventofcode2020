Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green
Write-Host "+             Advent of Code 2020; Day 6              +" -ForegroundColor Green
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green

Set-Location $PSScriptRoot

$input = "day6input.txt"

Write-Host "++++++ Part 1 ++++++" -ForegroundColor Yellow

$total = 0

(Get-Content $input -Raw) -split '(?:\r?\n){2}' | ForEach-Object { 
    $uniq = ($_.ToCharArray() | Where-Object {![string]::IsNullOrWhiteSpace($_)} | Sort-Object -Unique).Count
    $total += $uniq
}

Write-Host "Total: $total" -ForegroundColor Green


Write-Host "++++++ Part 2 ++++++" -ForegroundColor Yellow

$total = 0

(Get-Content $input -Raw) -split '(?:\r?\n){2}' | ForEach-Object { 
    $people = ($_ | Measure-Object -Line).Lines
    $uniq = ($_.ToCharArray() | Where-Object {![string]::IsNullOrWhiteSpace($_)} | Group-Object)
    foreach ($u in $uniq) {
        if ($u.Count -eq $people) {
            $total++
        }
    }
}

Write-Host "Total: $total" -ForegroundColor Green