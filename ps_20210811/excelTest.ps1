$xlDown = -4121
$xlToLeft = -4159
$xlToRight = -4161
$xlUp = -4162

$Excel = New-Object -ComObject "Excel.Application"
$Excel.Visible = $true
$workbook = $Excel.Workbooks.Add()
$Sheet = $workbook.Worksheets.Item("Sheet1")
$row = 1
$column = 1
$Sheet.Cells.Item(1,1) = "First Column"
$Sheet.Cells.Item(1,2) = "Second Column"
$Sheet.Cells.Item(2,1) = "Second Row"
$Sheet.Cells.Item(2,2) = "Second Row Second Column"
$Sheet.Cells.Item(888,1) = "ZZZ"
$Range = $Sheet.UsedRange
#$a = $Range.SpecialCells(11).row
#$b = $Range.SpecialCells(11).column
#write-host "Lastrow:", $a, " Last Column:" $b
#$lastColumn = $Range.Column
#$lastColumn
#$lastRow = $Sheet.Row
$lastRow = $Sheet.Cells.item(10000,1).end($xlUp).Row
$lastRow
$val = $Sheet.Cells.item(888,1).Value()
$val
