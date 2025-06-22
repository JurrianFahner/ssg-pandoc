Remove-Item -Path .\dist -Recurse -Force -ErrorAction SilentlyContinue
New-Item -Path .\dist -ItemType Directory | Out-Null

Get-ChildItem -Path .\content -Recurse -File | ForEach-Object {
    (Get-Content $_.FullName)
    "`r`n"
    "`r`n"
} | pandoc.exe -o ".\dist\index.html"