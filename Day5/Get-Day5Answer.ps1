Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green
Write-Host "+             Advent of Code 2020; Day 5              +" -ForegroundColor Green
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green

###### FULL CREDIT TO u/ka-splam FOR THIS 
###### IT'S SO CLEAN, I HAD TO USE IT 

Set-Location $PSScriptRoot

$input = "day5input.txt"

$seats = Get-Content $input | ForEach-Object {
    [convert]::ToInt32(($_-replace 'B|R',1 -replace 'F|L',0), 2)
} | Sort-Object

Write-Host "++++++ Part 1 ++++++" -ForegroundColor Yellow

$high = $seats[-1]
Write-Host "Highest Seat ID: $high" -ForegroundColor Green

Write-Host "++++++ Part 2 ++++++" -ForegroundColor Yellow

$myseat = $seats[0]..$seats[-1] | Where-Object {$_ -notin $seats}
Write-Host "My Seat ID: $myseat" -ForegroundColor Green
