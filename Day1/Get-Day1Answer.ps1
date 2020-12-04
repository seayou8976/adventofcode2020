Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green
Write-Host "+             Advent of Code 2020; Day 1              +" -ForegroundColor Green
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green

Set-Location $PSScriptRoot

$input = Get-Content "day1input.txt"

Write-Host "++++++ Part 1 ++++++" -ForegroundColor Yellow
:part1 foreach ($x in $input) {
    foreach ($y in $input) {
        if (([int]$x + [int]$y) -eq 2020) {
            Write-Output "$x + $y = 2020"
            $prod = ([int]$x * [int]$y)
            Write-Output "Product is $prod"
            Break part1
        }
    }
}

Write-Host "++++++ Part 2 ++++++" -ForegroundColor Yellow
:part2 foreach ($x in $input) {
    foreach ($y in $input) {
        foreach ($z in $input) {
            if (([int]$x + [int]$y + [int]$z) -eq 2020) {
                Write-Output "$x + $y + $z = 2020"
                $prod = ([int]$x * [int]$y * [int]$z)
                Write-Output "Product is $prod"
                Exit
            }
        }
    }
}
