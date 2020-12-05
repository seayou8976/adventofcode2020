Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green
Write-Host "+             Advent of Code 2020; Day 4              +" -ForegroundColor Green
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green

Set-Location $PSScriptRoot

$input = "day4input.txt"
$num = (Get-Content $input -Raw | Measure-Object -Line).lines - (Get-Content $input | Measure-Object -Line).Lines

$valid = 0
$invalid = 0

Write-Host "++++++ Part 1 ++++++" -ForegroundColor Yellow
Try {
    for ($i = 0; $i -lt ($num + 1); $i++) {
        $passport = (Get-Content $input -Raw) -split '(?:\r?\n){2,}' | Select-Object -Index $i
        if (($passport | Select-String -Pattern '(byr|iyr|eyr|hgt|hcl|ecl|pid)' -AllMatches).Matches.Count -eq 7 ) {
            #Write-Host "$passport" -ForegroundColor Green
            $valid++
        } else {
            #Write-Host "$passport" -ForegroundColor Red
            $invalid++
        }
    }
} Catch {
    Throw $_.Exception.Message
}

Write-Host "Valid Passports: $valid" -ForegroundColor Green
Write-Host "Invalid Passports: $invalid" -ForegroundColor Red


Write-Host "++++++ Part 2 ++++++" -ForegroundColor Yellow

$valid = 0
$invalid = 0

$byr = '(byr:(19[2-9]\d|200[0-2]))'
$iyr = '(iyr:(201\d|2020))'
$eyr = '(eyr:(202\d|2030))'
$hgt = '(hgt:(((59|6\d|7[0-6])in)|1([5-8]\d|9[0-3])cm))'
$hcl = '(hcl:#[0-9a-f]{6})'
$ecl = '(ecl:(amb|blu|brn|gry|grn|hzl|oth))'
$passid = '(pid:\d{9}\b)'

Try {
    for ($i = 0; $i -lt ($num + 1); $i++) {
        $passport = (Get-Content $input -Raw) -split '(?:\r?\n){2,}' | Select-Object -Index $i
        if (($passport | Select-String -Pattern "$byr|$iyr|$eyr|$hgt|$hcl|$ecl|$passid" -AllMatches).Matches.Count -eq 7) {
            #Write-Host "$passport" -ForegroundColor Green
            $valid++
        } else {
            #Write-Host "$passport" -ForegroundColor Red
            $invalid++
        }
    }
} Catch {
    Throw $_.Exception.Message
}

Write-Host "Valid Passports: $valid" -ForegroundColor Green
Write-Host "Invalid Passports: $invalid" -ForegroundColor Red

