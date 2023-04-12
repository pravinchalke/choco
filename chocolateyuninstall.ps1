$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$ErrorActionPreference = 'Stop' # stop on all errors
$packageArgs = @{
  packageName   = 'TestPkg1'
  SoftwareName	= 'TestPkg1*'
  file 		= 'C:\Windows\System32\cscript.exe'
  fileType      = 'EXE' #only one of these: MSI or EXE (ignore MSU for now)
  # MSI
  silentArgs    = "$toolsDir\Install.vbs /Remove"
  validExitCodes= @(0) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
}


    Uninstall-ChocolateyPackage @packageArgs
