cls

function ConvertTo-NumeralBase {
[CmdletBinding()]
[OutputType([string])]
param(
[Parameter(
Position = 0,
Mandatory,
ValueFromPipelineByPropertyName)]
[ValidateNotNullOrEmpty()]
[int]$Number,
[Parameter(
Position = 1,
Mandatory,
ValueFromPipelineByPropertyName)]
[ValidateNotNullOrEmpty()]
[ValidateRange(2,36)]
[int]$Base
)

$Characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
while ($Number -gt 0){
$Remainder = $Number % $Base
$CurrentCharacter = $Characters[$Remainder]
$ResultNumber = "$CurrentCharacter$ResultNumber"
$Number = ($Number - $Remainder) / $Base
}
$ResultNumber
}

# zpatky do dec
function ConvertFrom-NumeralBase {
[CmdletBinding()]
[OutputType([string])]
param(
[Parameter(
Position = 0,
Mandatory,
ValueFromPipelineByPropertyName)]
[ValidateNotNullOrEmpty()]
[string]$Number,
[Parameter(
Position = 1,
Mandatory,
ValueFromPipelineByPropertyName)]
[ValidateNotNullOrEmpty()]
[ValidateRange(2,36)]
[int]$Base
)
$Characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
$NumberCharArray = $Number.ToUpper().ToCharArray()
$NumberCharArray = $NumberCharArray[($NumberCharArray.Count)..0]
[long]$DecimalNumber = ""
$Position = 0
foreach ($Character in $NumberCharArray) {
$DecimalNumber += $Characters.IndexOf($Character) * [long][Math]::Pow($Base, $Position)
$Position++
}
$DecimalNumber
}














# odsud moje

$pole = @("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","M","O","P","Q","R","S","T","U","V","W","X","Y","Z")
#          0   0   0   0   0   0   0   0   0   0   1   1   1   1   1   1   1   1   1   1   2   2   2   2   2   2   2   2   2   2   3   3   3   3   3   3
#          0   1   2   3   4   5   5   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5

$d_pole = $pole.Length-1

$poc=0

#$chci = 100
$chci = Read-host -Prompt "zadej Base 36 - 00-1295"

#exit 1

for ( $aa = 0; $aa -le $d_pole; $aa++) {
#$poc++
for ( $bb = 0; $bb -le $d_pole; $bb++) {
#$poc++

$o11 = [string] $poc
$o11 += " "
$o11 += $pole[$aa]
$o11 += $pole[$bb]

#echo $o11
$poc++

if ( $chci -eq $poc-1 ) {
#echo "xxxxxxxxxxxxx"
$x1=$aa
$x2=$bb

}

}
}

# dec to base 36
$vysledek=$pole[$x1]
$vysledek+=$pole[$x2]

echo $vysledek"<"
$funk = ConvertTo-NumeralBase -Number $chci -Base 36
echo $funk"<<"
#exit 1

















# zpatky moje
$poc_2 = 0

$chci2 = $vysledek
#$chci2 = "FF"
#$chci2 = "ED" # zde zadavat v hexa !!!!

$chci2_aa2 = $chci2.Substring(0,1)
$chci2_bb2 = $chci2.Substring(1,1)

#exit 1
for ( $aa2 = 0; $aa2 -le $d_pole; $aa2++) {
for ( $bb2 = 0; $bb2 -le $d_pole; $bb2++) {

$o11 = [string] $poc_2
$o11 += " "
$o11 += $pole[$aa2]
$o11 += $pole[$bb2]

#echo $o11
$poc_2++

if (( $chci2_aa2 -ceq $pole[$aa2] ) -and ( $chci2_bb2 -ceq $pole[$bb2])) {
# - ceq case sensitive operator 
#echo "xxxxxxxxxxxx"
$vysledek_2=$poc_2
}

}
}






# zpet to dec
$vysledek_2--
echo $vysledek_2"<-"

$funk_2 = ConvertFrom-NumeralBase -Number $funk -Base 36
echo $funk_2"<<-"







