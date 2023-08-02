#
# Simple PowerShell script to build all the project images
#

$name="AK-modular-experience"

Write-Output "Building $name images..."

podman build -t ak-modular-experience ..\..\.

Write-Output "All $name images built"
