$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = 'C:\Windows\System32\cscript.exe'

$packageArgs = @{
  packageName   = 'TestPkg1'
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu

  softwareName  = 'TestPkg1*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  file			= $fileLocation
  silentArgs    = "$toolsDir\Install.vbs /Install"
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs # https://docs.chocolatey.org/en-us/create/functions/install-chocolateyinstallpackage

