[CmdletBinding()]
param(
    $station="diamondcity",
    $filter=$null,
    $sourceFolder=".\MultiXwm\output",
    $falloutFolder="C:\Program Files (x86)\Steam\steamapps\common\Fallout 4"
)

Write-Verbose "STATION: $station"
Write-Verbose "SOURCE: $sourceFolder"
Write-Verbose "FALLOUT: $falloutFolder"

$falloutRadioFolder = Join-Path $falloutFolder (Join-Path "sound\fx\mus\radio" $station)
Write-Verbose "DEST: $falloutRadioFolder"

if (!(Test-Path $sourceFolder))
{
    write-error "$sourceFolder not found."
}

$stationFile = "radio-stations\$station.txt"
if (!(Test-Path $stationFile))
{
    write-error "$station not found in .\radio-stations."
}

if(!(Test-Path $falloutRadioFolder))
{
    New-Item -Path $falloutRadioFolder -ItemType Directory -Force
}

Write-Verbose "Reading from $stationFile"
$files = Get-Content $stationFile
foreach ($file in $files)
{
    if ($filter -and $file -match $filter) { continue }
    Write-Verbose "Writing $file"
    $nextFileName = (gci $sourceFolder -File | select -First 1).FullName

    if (!$nextFileName -or !(Test-Path $nextFileName))
    {
        Write-Error "Cannot find source files, specify a different -sourceFolder: '$sourceFolder'"
        exit
    }

    $destFile = Join-Path $falloutRadioFolder $file
    Move-Item $nextFileName -Destination $destFile
}
