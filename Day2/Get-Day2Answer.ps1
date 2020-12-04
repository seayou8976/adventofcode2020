Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green
Write-Host "+             Advent of Code 2020; Day 2              +" -ForegroundColor Green
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green

Set-Location $PSScriptRoot

$input = "day2input.txt"
$valid = 0
$invalid = 0
Try {
    Write-Host "++++++ Part 1 ++++++" -ForegroundColor Yellow
    Get-Content $input | ForEach-Object {
        $policy, $password = ($_.split(':')[0]).trim(), ($_.split(':')[1]).trim()
        $freq, $char = ($policy.split(' ')[0]).trim(), ($policy.split(' ')[1]).trim()
        $low, $high =  ($freq.split('-')[0]).trim(), ($freq.split('-')[1]).trim()

        if ((($password.split("$char").count-1) -le $high) -and (($password.split("$char").count-1) -ge $low)) {
            $valid++
        } else {
            $invalid++
        }
    }
} Catch {
    Throw $_.Exception.Message
}


Write-Host "Valid Passwords: $valid" -ForegroundColor Green
Write-Host "Invalid Passwords: $invalid" -ForegroundColor Red


Write-Host "++++++ Part 2 ++++++" -ForegroundColor Yellow
$valid = 0
$invalid = 0

Try {
    Get-Content $input | ForEach-Object {
        $policy, $password = ($_.split(':')[0]).trim(), ($_.split(':')[1]).trim()
        $pos, $char = ($policy.split(' ')[0]).trim(), ($policy.split(' ')[1]).trim()
        $first, $second =  ([int]($pos.split('-')[0]).trim() -1), ([int]($pos.split('-')[1]).trim() - 1)
        if (($password[$first] -eq $char) -xor ($password[$second] -eq $char)) {
            $valid++
        } else {
            $invalid++
        }
    }
} Catch {
    Throw $_.Exception.Message
}


Write-Host "Valid Passwords: $valid" -ForegroundColor Green
Write-Host "Invalid Passwords: $invalid" -ForegroundColor Red
