# Lese die Konfigurationsdatei
$configurations = Get-Content -Path "$PSScriptRoot\Config.json" | ConvertFrom-Json

# Erstelle eine GUI-Fenster
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$Form = New-Object System.Windows.Forms.Form
$Form.Text = "PushPanel"
$Form.Size = New-Object System.Drawing.Size(800, 600)
$Form.StartPosition = "CenterScreen"

# Setze die Anzahl der Buttons pro Reihe
$buttonsPerRow = 9

# Initialisiere die Zählvariable
$buttonCount = 0

# Erstelle Buttons basierend auf der Konfiguration
foreach ($config in $configurations) {
    $Button = New-Object System.Windows.Forms.Button
    $Button.Text = $config.Name

    # Berechne die Reihe und Spalte jedes Buttons
    $row = [math]::floor($buttonCount / $buttonsPerRow)
    $column = $buttonCount % $buttonsPerRow

    # Setze die Position des Buttons
    $Button.Location = New-Object System.Drawing.Point((10 + $column * ($Button.Width + 10)), (30 + $row * 40))

    $Button.Tag = $config.Pfad, $config.Datei
    $Button.Add_Click({
        Start-Process "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ArgumentList "-NoExit cd '$($Button.Tag[0])'; .\$($Button.Tag[1])"
    })

    $Form.Controls.Add($Button)

    # Inkrementiere die Zählvariable
    $buttonCount++
}

# Zeige das Formular an
[Windows.Forms.Application]::Run($Form)