﻿#cls

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












#Remove-variable vysledek, vysledek_2, vysledek_2b -ErrorAction SilentlyContinue

# odsud moje

$pole = @("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","M","O","P","Q","R","S","T","U","V","W","X","Y","Z")
#          0   0   0   0   0   0   0   0   0   0   1   1   1   1   1   1   1   1   1   1   2   2   2   2   2   2   2   2   2   2   3   3   3   3   3   3
#          0   1   2   3   4   5   5   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5

$d_pole = $pole.Length-1


#test for cyklis zde
for ($chci = 0; $chci -le 1295; $chci++ ){  # 00-ZZ - 1295 max (z nulou 1296)
    
$poc=0

#$chci = 100
#[int32] $chci = Read-host -Prompt "zadej -Base 36 - 00-1295" # rnd ze pak -min 0 - max 1295 -  00-ZZ

#exit 1

for ( $aa = 0; $aa -le $d_pole; $aa++) {

for ( $bb = 0; $bb -le $d_pole; $bb++) {

<#
$o11 = [string] $poc
$o11 += " "
$o11 += $pole[$aa]
$o11 += $pole[$bb]

echo $o11
#>
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


<#
echo $vysledek"< moje tam"
$funk = ConvertTo-NumeralBase -Number $chci -Base 36
echo $funk"<< funkce tam"
#exit 1
#>
















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
$vysledek_2--
}

}
}




# vysledky moje a funkce

echo $vysledek"< moje tam" # string pride zapsat do reference takze 2 cifry !!
#echo $vysledek.GetTypeCode()


#[string] $vysledek_2b = $vysledek_2
#if ( $vysledek_2b.Length -eq 1 ) { $vysledek_2b = "0"+$vysledek_2b }
echo $vysledek_2"<- moje zpatky" # int32 musi bejt 1-2 cifry a int type !!
#echo $vysledek_2.GetTypeCode()

echo ""
#echo "-------------------------------"
$funk = ConvertTo-NumeralBase -Number $chci -Base 36
echo $funk"<< funkce tam"
$funk_2 = ConvertFrom-NumeralBase -Number $funk -Base 36
echo $funk_2"<<- funkce zpatky"
echo "-------------------------------"
} # for $chci


