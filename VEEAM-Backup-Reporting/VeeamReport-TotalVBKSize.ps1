$items = Get-ChildItem -path 'F:\Backup\*' -recurse -Include *.vbk | Where-Object {$_.LastWriteTime -gt (Get-date).AddDays(-7)}
$count = ($items | measure-object | select -expand Count)
$size = (($items | Measure-Object -property length -sum).sum /1Tb)
$size