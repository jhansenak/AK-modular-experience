#
# Simple PowerShell script to shutdown project containers
#

$podname="ak-modular-experience"

# Stop the pod
Write-Output "Stopping pod: $podname"
podman stop $podname

# Prune pod
Write-Output "Removing pod and containers"
podman rm $podname
