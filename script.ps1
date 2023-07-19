# Copyright (c) 2022 Spring Waters. All Rights Reserved.

# Define a function to check if a number is prime
function Is-Prime {
    param($number)
    $isPrime = $true
    for ($i = 2; $i -le [Math]::Sqrt($number); $i++) {
        if ($number % $i -eq 0) {
            $isPrime = $false
            break
        }
    }
    return $isPrime
}

# Define a function to get all prime numbers up to a certain number
function Get-Primes {
    param($max)
    $primes = @()
    for ($i = 2; $i -le $max; $i++) {
        if (Is-Prime -number $i) {
            $primes += $i
        }
    }
    return $primes
}

# Define a function to handle errors
function Handle-Error {
    param($error)
    Write-Host "An error occurred: $($error.Exception.Message)" -ForegroundColor Red
}

# Call the Get-Primes function and handle any errors
try {
    $max = 100
    Write-Host "Getting all prime numbers up to $max"
    $primes = Get-Primes -max $max
    Write-Host "Prime numbers up to $max: $($primes -join ', ')"
}
catch {
    Handle-Error -error $_
}

# Prompt the user to enter a number to check if it's prime
try {
    $number = Read-Host -Prompt 'Enter a number to check if it is prime'
    if (Is-Prime -number $number) {
        Write-Host "$number is prime" -ForegroundColor Green
    }
    else {
        Write-Host "$number is not prime" -ForegroundColor Red
    }
}
catch {
    Handle-Error -error $_
}
