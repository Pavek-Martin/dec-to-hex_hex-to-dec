cls

#$bb = 16 # 16 hexa = 10 dec

$bb = 255
$bb = 1


echo $bb" dec"

$hexa_4 = "{0:x}" -f $bb
#echo $hexa_4
if ( $hexa_4.Length -eq 1 ) { # < 9 prida nulu na konec 
$hexa_4 = "0"+$hexa_4
}

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



#sleep 10


