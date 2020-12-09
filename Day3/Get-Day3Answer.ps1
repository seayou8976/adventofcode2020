Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green
Write-Host "+             Advent of Code 2020; Day 3              +" -ForegroundColor Green
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green

# FULL CREDIT TO u/ka-splam FOR THIS LOGIC.

Set-Location $PSScriptRoot

$input = "day3input.txt"
$grid = Get-Content $input

Write-Host "++++++ Part 1 ++++++" -ForegroundColor Yellow

$tree = 0
$x = 0

$grid | ForEach-Object {
    if ($_[$x] -eq '#') {
        $tree++
    }
    $x = ($x + 3) % $_.Length
}

Write-Host "Tree Count: $tree" -ForegroundColor Green


Write-Host "++++++ Part 2 ++++++" -ForegroundColor Yellow

Function Get-Trees {
    param (
        $xInc,

        $yInc
    )

    $tree = 0
    $x, $y = 0, 0

    while ($y -lt $grid.count) {
        if ($grid[$y][$x] -eq '#') {
            $tree ++
        }

        $y += $yInc
        $x = ($x + $xInc) % $grid[0].Length
    }
    return $tree
}

$prod = 1

@(
Get-Trees -xInc 1 -yInc 1
Get-Trees -xInc 3 -yInc 1
Get-Trees -xInc 5 -yInc 1
Get-Trees -xInc 7 -yInc 1
Get-Trees -xInc 1 -yInc 2 
) | ForEach-Object {
    $prod = $prod * $_
}

Write-Host "Product: $prod" -ForegroundColor Green