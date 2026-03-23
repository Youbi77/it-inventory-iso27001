# Script de Inventario ISO 27001 - Bilal El Younossi

$Fecha = Get-Date -Format "yyyy-MM-dd_HH-mm"
$Archivo = "Ficha_Tecnica_$Fecha.txt"

$Cuerpo = @"
=== GENERANDO FICHA TECNICA (WINDOWS) ===
Fecha: $(Get-Date)
--------------------------------------

1. DATOS DEL EQUIPO
Serie PC: $((Get-CimInstance Win32_Bios).SerialNumber)
Modelo: $((Get-CimInstance Win32_ComputerSystem).Model)

2. DATOS DE DISCOS
$(Get-PhysicalDisk | Select-Object FriendlyName, SerialNumber, MediaType, Size | Out-String)

3. DATOS DE RED
Nombre Equipo: $env:COMPUTERNAME
IP: $((Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ne "Loopback*" }).IPAddress | Out-String)
"@

$Cuerpo | Out-File -FilePath $Archivo
Write-Host "Ficha generada con exito en $Archivo" -ForegroundColor Green
notepad $Archivo
