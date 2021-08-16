#Load Assembly and Library
Add-Type -AssemblyName PresentationFramework

#Check server is reachable and get winevent
function Get-RestartEventLogs {
    param (
        $ComputerName = $ComputerNameBox.Text
    )
    if (Test-Connection $ComputerName -Quiet -Count 2) {
        try {
            $Logs = Get-EventLog -LogName System -Source user32 -ComputerName $ComputerName -Newest 10 -ErrorAction Stop
            foreach ($event in $logs) {
                $TempFileName = [System.IO.Path]::GetTempFileName()
                $event.Message | Out-File -FilePath $TempFileName
                $event | Select-Object UserName, TimeWritten, MachineName, @{N='Message'; E={(Get-Content -Path $TempFileName)[0]}}
                
            }
        }
        catch {
            [System.Windows.MessageBox]::Show("Cannot retrive event logs from server $ComputerName. Check permissions.", "Server unreachable")
        }
    }
    else {
        [System.Windows.MessageBox]::Show("Provided Server is not reachable.", "Server unreachable")
    }
}

#XAML form designed using Vistual Studio
[xml]$Form = gc wpf_1.xaml

#Create a form
$XMLReader = (New-Object System.Xml.XmlNodeReader $Form)
$XMLForm = [Windows.Markup.XamlReader]::Load($XMLReader)

#Load Controls
$ComputerNameBox = $XMLForm.FindName('ComputerNameBox')
$RestartLogsButton = $XMLForm.FindName('RestartLogsButton')
$ResultDataGrid = $XMLForm.FindName('ResultDataGrid')

#computername to textbox
$ComputerNameBox.Text = $env:COMPUTERNAME

#Create array object for Result DataGrid
$RestartEventList = New-Object System.Collections.ArrayList

$result

#Button Action
$RestartLogsButton.add_click({
    #Computer name shouldn't be null
    if ($ComputerNameBox.Text -eq '') {
        [System.Windows.MessageBox]::Show("Please enter a valid Computername or IP before clicking Get-RestartLogs button.", "Textbox empty")
        return
    }
    if ($ComputerNameBox.Text -eq 'aa') {
        $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
            InitialDirectory = [Environment]::GetFolderPath('Desktop')
            Filter = 'Documents (*.docx)|*.docx|SpreadSheet (*.xlsx)|*.xlsx'
            }
        $null = $FileBrowser.ShowDialog()
        $result = $FileBrowser.FileName
        $result
        return
    }

    #Check server is reachable and get winevent
    $Events = Get-RestartEventLogs -ComputerName $ComputerNameBox.Text
    
    #Build Datagrid if there
    if ($Events -ne 'OK') {
        $RestartEventList.AddRange($Events)
        $ResultDataGrid.ItemsSource=@($RestartEventList)
    }
})


#Show XMLform
$XMLForm.ShowDialog()