#Load Assembly and Library
Add-Type -AssemblyName PresentationFramework

#XAML form designed using Vistual Studio
#[xml]$Form = gc wpf_2.xaml

[xml]$Form = @'
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Study" Height="467" Width="719" ResizeMode="NoResize">
    <Grid Background="#FFDDF0EC">
        <Grid.RowDefinitions>
            <RowDefinition Height="100"/>
            <RowDefinition Height="100"/>
            <RowDefinition Height="1*"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="220"/>
            <ColumnDefinition Width="150"/>
            <ColumnDefinition Width="150"/>
            <ColumnDefinition Width="10*"/>
        </Grid.ColumnDefinitions>
        <Button Name="MyButton" Content="Click" HorizontalAlignment="Center" VerticalAlignment="Top" Width="126" Grid.Row="0" Grid.Column="1"/>
        <TextBox Name="MyTextBox" HorizontalAlignment="Center" Height="28" TextWrapping="Wrap" VerticalAlignment="Top" Width="201" Grid.Row="0" Grid.Column="0"/>
        <ComboBox x:Name="comboBox" HorizontalAlignment="Left" VerticalAlignment="Top" Width="120" Grid.Row="0" Grid.Column="2">
            <ComboBoxItem Content="ComboBoxItem0"/>
            <ComboBoxItem Content="ComboBoxItem1"/>
            <ComboBoxItem Content="ComboBoxItem2"/>
        </ComboBox>
        <Label x:Name="label" Content="This is a Label" HorizontalAlignment="Left" VerticalAlignment="Top" Width="120" Grid.Row="0" Grid.Column="3"/>

        <ListBox x:Name="listBox" HorizontalAlignment="Left" VerticalAlignment="Top" Width="120" Grid.Row="1" Grid.Column="0">
            <ListBoxItem Content="ListBoxItem0"/>
            <ListBoxItem Content="ListBoxItem1"/>
            <ListBoxItem Content="ListBoxItem2"/>
        </ListBox>

        <GroupBox x:Name="groupBox1" Header="GroupBox1" HorizontalAlignment="Left" VerticalAlignment="Top" Height="86" Width="120" BorderBrush="#FF133447" Grid.Row="1" Grid.Column="1">
            <StackPanel x:Name="checkBoxes" Margin="0,10,0,0" Width="100">
                <CheckBox x:Name="checkBox1" Content="checkBox1"/>
                <CheckBox x:Name="checkBox2" Content="checkBox2"/>
                <CheckBox x:Name="checkBox3" Content="checkBox3"/>
            </StackPanel>
        </GroupBox>
    </Grid>
    
</Window>    
'@

#Create a form
$XMLReader = (New-Object System.Xml.XmlNodeReader $Form)
$XMLForm = [Windows.Markup.XamlReader]::Load($XMLReader)

$MyButton = $XMLForm.FindName("MyButton")
$MyButton.Add_Click({
    Write-Host "Clicked!"
    "WPF_Test" > test.txt
})

$ListBox = $XMLForm.FindName("listBox")
$ListBox.Add_SelectionChanged({
    $selectedIndex = $this.SelectedIndex
    $selected = $this.SelectedValue.Content
    #if($selected -eq $null){
    #    $selected = $this.Items.GetItemAt($selectedIndex)
    #}
    Write-Host "Selected Index: " + $selectedIndex + ", selected Value: " + $selected
})

$CheckBox1 = $XMLForm.FindName("checkBox1")
$CheckBox1.Add_Click({
    $result = $this.Content + "is "
    if(-not $this.IsChecked){
        $result += "Un"
    }
    $result += "Checked"
    Write-Host $result
})




#Show XMLform
$XMLForm.ShowDialog()