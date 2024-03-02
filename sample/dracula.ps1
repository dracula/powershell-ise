# Once upon a time...

$Vampire = @{
    location = $null
    birthDate = $null
    deathDate = $null
    weaknesses = $null
}

function New-Vampire {
    param (
        [string]$location,
        [int]$birthDate,
        [int]$deathDate,
        [string[]]$weaknesses
    )

    $Vampire.location = $location
    $Vampire.birthDate = $birthDate
    $Vampire.deathDate = $deathDate
    $Vampire.weaknesses = $weaknesses

    Add-Member -InputObject $Vampire -MemberType ScriptMethod -Name calcAge -Value {
        return $this.deathDate - $this.birthDate
    }

    Add-Member -InputObject $Vampire -MemberType ScriptMethod -Name get_age -Value {
        return $this.calcAge()
    }

    return $Vampire
}

# there was a guy named Vlad
$Dracula = New-Vampire -location "Transylvania" -birthDate 1428 -deathDate 1476 -weaknesses @("Sunlight", "Garlic")

# Accéder aux propriétés de l'objet Dracula
Write-Host "Location: $($Dracula.location)"
Write-Host "Birth Date: $($Dracula.birthDate)"
Write-Host "Death Date: $($Dracula.deathDate)"
Write-Host "Weaknesses: $($Dracula.weaknesses -join ', ')"
Write-Host "Age: $($Dracula.get_age())"

