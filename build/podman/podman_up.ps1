#
# Simple script to bring up the ak-modular-experience app in a container
#

# Cleaning temp files if they exist
Write-Output "Removing Node/Gulp temp files"
if (Test-Path -Path '../../node_modules' -PathType Container) {
    Remove-Item '../../node_modules' -Recurse
}

if (Test-Path -Path '../../package-lock.json' -PathType Leaf) {
    Remove-Item -Path '../../package-lock.json' -Force
}

if (Test-Path -Path '../../npm-shrinkwrap.json' -PathType Leaf) {
    Remove-Item -Path '../../npm-shrinkwrap.json' -Force
}


$podname="ak-modular-experience"

Write-Output "Run container and add to pod: gulp"
podman run -it `
    --name $podname `
    --publish 3000:3000 `
    --publish 3001:3001 `
    -v ../../.:/app/:rw `
    $podname