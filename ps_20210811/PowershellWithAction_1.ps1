#Write-Output -InputObject Hello
#dir -Recurse -Filter c*d.exe C:\Windows

#$x=0
#1..3 | foreach {"x is $($x++; $x) "}

#$user = @{FirstName = "John" ; LastName = "Smithz" ; PhoneNumber = "555-1212"}
#$user.date = Get-Date
#$user

#$a = 1,2,3
#$a  += 22,33
#$a

#[math]::Sqrt(9)

#$data = 1,2,3,4,5,6,7,8,9,10
#$OFS = '+'
#Invoke-Expression "$data"

#$a = 0
#$x = @($a++;$a;$a++;$a)
#$x

#$text = gc .\temp.txt
#$text = [string]::Join(" ",$text)
#$words = $text.Split(" `t",[stringsplitoptions]::RemoveEmptyEntries)


#$words | % {$h=@{}} {$h[$_] += 1}

#$frequency = $h.Keys | sort {$h[$_]}
#$frequency[-1]
#$h["aaaaabbbbb"]

#1..3 | % {"This is file $_" > "file$_.txt"}
#dir

#$text = cat file1.txt,file2.txt,file3.txt
#$text
#$text.Count
#function Get-CheckSum($path){
#    $sum = 0
#    Get-Content -Encoding Byte -read 10kb $path | % {foreach($byte in $_){$sum += $byte}}
#    $sum
#}

#$src = ".\file1.txt"
#$dest = ".\file4.txt"

#Get-Content -Encoding byte -read 10kb $src | Set-Content -Encoding Byte $dest
#Get-CheckSum(".\file1.txt")
#Get-CheckSum(".\file2.txt")
#Get-CheckSum(".\file3.txt")
#Get-CheckSum(".\file4.txt")

#Select-String -List "This is" ".\*.txt"

#$d = [xml] "<top><a>aaa</a><b>bbb</b><c>ccc</c></top>"
#$el = $d.CreateElement("d")

#$el.set_InnerText("Hello")
#$d.top.AppendChild($el) > $null

#$d.top
#$d.Save("./new.xml")

#[xml]$xml = gc "./new.xml"
#$xml.top.People.Person | Where-Object IsAdmin -EQ $true

#$data = @{a=1;b=2;c=3},"Hi there",3.5
#$data | Export-Clixml out.xml

function Get-XPathNavigator($text){
    $rdr = [System.IO.StringReader] $text
    $trdr = [System.IO.TextReader] $rdr
    $xpdoc = [System.Xml.XPath.XPathDocument] $trdr
    $xpdoc.CreateNavigator()
}

[xml]$data = Get-Content out.xml
#$xb=$data.CreateNavigator()
#$xb = Get-XPathNavigator $data   
#$expensive = "/bookstore/book[price>9.00]"

#$xb.Select($expensive) | %{[xml] $_.OuterXml} | ft -auto  {$_.book.price},{$_.book.title}

$data.SelectNodes("descendant::book") | Where-Object {$_.price -as [decimal] -gt 9.00} | ft -AutoSize

