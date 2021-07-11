Add-Type -AssemblyName PresentationFramework

[xml]$xaml = Get-Content .\wpf.xaml
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$label=$window.FindName("labelz")
$label.Content = "Hello ZZZ"

$button=$window.FindName("buttonz")
$button.Content = "Click Me!"
$button.Add_Click({
    Write-Host "Button Clicked"
})

$window.Add_MouseUp({
    Write-Host "Mouse Up"
})
$window.Add_MouseDown({
    Write-Host "Mouse Down"
})

$window.ShowDialog() > $null

#[xml]$xaml = Get-Content .\text.xaml
#$window = [Windows.Markup.XamlReader]::Load($nodeReader)
#$label=$window.FindName("label")
#$button=$window.FindName("button")
#$label.Content = 1
#$button.add_Click({$label.Content++})
#$window.ShowDialog()