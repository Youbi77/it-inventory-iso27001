# IT Inventory & Sanitization Scripts (ISO 27001)

Este repositorio contiene herramientas de automatización para la fase de incorporación y mantenimiento de equipos IT bajo el estándar **ISO 27001**.

## Contenido
- `inventario.ps1`: Script para Windows (PowerShell) que recopila S/N de BIOS, Discos y Red.
- `inventario.sh`: Script para Linux (Bash) con funcionalidades equivalentes.

## Cómo usar en Windows
1. Abrir PowerShell como Admin.
2. Ejecutar: `Set-ExecutionPolicy RemoteSigned -Scope Process`
3. Ejecutar: `.\inventario.ps1`

## Autor
Bilal El Younossi
