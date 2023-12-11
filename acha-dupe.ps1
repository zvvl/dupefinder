$srcDir = read-host "Indique a pasta inicial para a busca"
Get-ChildItem -Path $srcDir -File -Recurse | Group -Property Length `
    | where { $_.Count -gt 1 } | select -ExpandProperty Group | Get-FileHash `
    | Group -Property Hash | where { $_.count -gt 1 }| foreach { $_.Group | select Path, Hash } 