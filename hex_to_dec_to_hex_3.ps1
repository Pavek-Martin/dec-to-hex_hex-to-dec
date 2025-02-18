cls

# 0-255 dec

#$bb = 2
[int] $bb = Read-Host -Prompt "Zadej dekadicky csilo 0-255 ?" # [int] musi bejt jinak je type strings !!
echo $bb" dec <"

$hexa_4 = "{0:x}" -f $bb

#echo $hexa_4
if ( $hexa_4.Length -eq 1 ) { # < 9 prida nulu na konec 
#$hexa_4 = $hexa_4.ToUpper()
$hexa_4 = "0"+$hexa_4
}

# prevde a-A apod. vi si rady z cisle ve stringu
$hexa_4 = $hexa_4.ToUpper()
echo $hexa_4" hex"

#echo $hexa_4.GetType()

# a zase zpatky do dec
[int16]$hexa_1b="0x"+$hexa_4
echo $hexa_1b" int zpet z hexa"

if ( $hexa_1b -le 9 ){
$out = "0"
$out += [string] $hexa_1b
#echo $out
}else{
$out = [string] $hexa_1b
}

echo $out" out string"
#$out.GetType()

# udelat funkci rnd klic to hex
# a funkci hex to klic matrix

#sleep 3



