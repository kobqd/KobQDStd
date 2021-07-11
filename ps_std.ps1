#$process = Get-Process -Id $PID
#$process.Name
#$process.StartTime.DayOfWeek

####################################

#$object = [PSCustomObject]@{'Some Name' = 'Vallzz'}
#$object."Some Name"
#$object.'Some Name'
#$object.{Some Name}

####################################
#(Get-Date).Date.AddDays(-1)

####################################
#$File = New-Item NewFile.txt -Force
#$File | Get-Member -MemberType Property

#Add-Type -AssemblyName System.Windows.Forms
#Add-Type -AssemblyName System.Drawing
#
#$form = New-Object System.Windows.Forms.Form
#$form.Text = 'Data Entry Form'
#$form.Size = New-Object System.Drawing.Size(300,200)
#$form.StartPosition = 'CenterScreen'
#
#$okButton = New-Object System.Windows.Forms.Button
#$okButton.Location = New-Object System.Drawing.Point(75,120)
#$okButton.Size = New-Object System.Drawing.Size(75,23)
#$okButton.Text = 'OK'
#$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
#$form.AcceptButton = $okButton
#$form.Controls.Add($okButton)
#
#$cancelButton = New-Object System.Windows.Forms.Button
#$cancelButton.Location = New-Object System.Drawing.Point(150,120)
#$cancelButton.Size = New-Object System.Drawing.Size(75,23)
#$cancelButton.Text = 'Cancel'
#$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
#$form.CancelButton = $cancelButton
#$form.Controls.Add($cancelButton)
#
#$label = New-Object System.Windows.Forms.Label
#$label.Location = New-Object System.Drawing.Point(10,20)
#$label.Size = New-Object System.Drawing.Size(280,20)
#$label.Text = 'Please enter the information in the space below:'
#$form.Controls.Add($label)
#
#$textBox = New-Object System.Windows.Forms.TextBox
#$textBox.Location = New-Object System.Drawing.Point(10,40)
#$textBox.Size = New-Object System.Drawing.Size(260,20)
#$form.Controls.Add($textBox)
#
#$form.Topmost = $true
#
#$form.Add_Shown({$textBox.Select()})
#$result = $form.ShowDialog()
#
#if ($result -eq [System.Windows.Forms.DialogResult]::OK)
#{
#    $x = $textBox.Text
#    $x
#}
#
#################################################################################
#$files = dir
#$files[0]
#################################################################################
#Add-Type -AssemblyName PresentationFramework
#$msgResult = [System.Windows.MessageBox]::Show("Hello","Hi Msgbox","YesNoCancel","Question")
#switch($msgResult){
#'Yes'{Write-Host "Yes result"}
#'No'{Write-Host "No result"}
#'Cancel'{Write-Host "Cancel result"}
#}
#################################################################################
#$i = 0
#while ($i -lt 10){
#    "$i is odd" 
#    $i = $i + 1 
#}
#################################################################################
#$foo = "Global foo"
#function myFunc{
#    $foo = "Function local foo"
#    Write-Host $foo
#    Write-Host $global:foo
#    Write-Host $local:foo
#}
#myFunc
#Write-Host $foo
#Write-Host $Local:foo
#################################################################################
#$a = Read-Host "Enter a number"
#$a -gt 5
#################################################################################
#"Any","Bob","Celine","David" | ForEach-Object -Begin {
#$results = @()
#} -Process {
##Create and store message
#$results += "Hi, my name is $_!"
#} -End {
##Count messages and output
#Write-Host "Total messages: $($results.Count)"
#$results
#}
#################################################################################
#$hashTable = @{
#    Key1 = 'aaa'
#    Key2 = 'bbb'
#}
#$result = "{0} wanna {1}" -f $hashTable.Key1,$hashTable.Key2
#Write-Host $result
#$hashTable += @{Key3 = 'ccc'}

#foreach ($key in $hashTable.Keys){
#    Write-Host $hashTable.$key
#}
#
#$hashTable.GetEnumerator() | ForEach-Object{
#    Write-Host ($_).key
#    Write-Host ($_).value
#}
#################################################################################
#$NewObject = New-Object -TypeName PSObject -Property @{
#    Name = $env:USERNAME
#    ID = 12
#    Address = $null
#}
#$NewObject
#################################################################################
#[Nullable[datetime]]$nullableDate = Get-Date -Year 2021 -Month 5 -Day 15
#$nullableDate
#$nullableDate.GetType().FullName
#$nullableDate = $null
#$nullableDate
#################################################################################
#[System.Collections.Generic.SortedDictionary[int, String]]$dict =
#[System.Collections.Generic.SortedDictionary[int, String]]::new()
#$dict.GetType().FullName
#dict.Add(1, 'a')
#$dict.Add(2, 'b')
#$dict.Add(3, 'c')
#$dict.Add('4', 'd') #powershell auto converts '4' to 4
#$dict.Add('5.1', 'c') #powershell auto converts '5.1' to 5
#$dict
#################################################################################
#function Write-Greeting{
#    param(
#        [Parameter(Mandatory,Position=1)]
#        [Int]$age,
#        [Parameter(Mandatory,Position=0)]
#        [String]$name
#    )
#    "Hello $name, you are $age years old"
#}
#function Write-Greeting($name,$age){
#    "Hello $name, you are $age years old"
#}
#Write-Greeting -name "KobQD" -age 28
#Write-Greeting "KobQD" 28
#########################################################
#function Get-Greeting{
#    param
#    (
#        [Parameter(Mandatory=$true)]
#        [ValidateSet('red','green','blue',IgnoreCase)]
#        $name   #Ask input val if not set
#    )
#    "Hello World $name"
#}
#Get-Greeting
#########################################################
#class Person{
#    [String]$name
#    [Int]$age
#    Person([String]$name){
#        $this.name = $name
#    }
#    Person([String]$name, [Int]$age){
#        $this.name = $name
#        $this.age = $age
#    }
#    [String]Greeting(){
#        return "Greeting, {0} {1} years old" -f $this.name, $this.age
#    }
#}
#
#$x = [Person]::new("KobQD",55)
#$x.name
#$x.age
#$x.Greeting()
#
#Get-Member -InputObject $x
#########################################################