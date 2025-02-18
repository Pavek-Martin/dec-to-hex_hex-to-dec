cls

Remove-Variable pole_hex,H,bb -ErrorAction SilentlyContinue

$pole_hex=@()

# udela 15 prazdnej klicu v poly $pole_hex
$prazdnej_klic=""
for ( $aa = 0; $aa -le 15; $aa++ ) {
$pole_hex += $prazdnej_klic
}

echo "--------- dec -> hex -------------------"
$min=16 # 10 hexa ( musi bej dec od 16 aby byl hex 10, prvni dvojciferny cislo do listu zipu )
#$min=0
$max=255 # ff hexa

for ($bb = $min; $bb -le $max; $bb++) { # 16-255 sou vsechny dvojciferny
#echo $bb-$H
$H = "{0:x}" -f $bb
echo "$bb dec = $H hex"
$pole_hex += $H
#echo $pole_hex[$bb]
}

# tohle presne zapise do pole $pole_hex
# $pole_hex[0-15] = ""
# $pole_hex[16]  = 10
# $pole_hex[255] = ff

echo "--------- hex -> dec ----------------------------------------"
#$poc_1=10
# prevede spatky klice pole $pole_hex do [int]
for ( $dd = $min; $dd -le $pole_hex.Length -1; $dd++){

[string] $hexa_vloz = [convert]::ToInt16($pole_hex[$dd], 16)

$hex_to_dec = [int16] $hexa_vloz
#echo $hex_to_dec
#$hex_to_dec.GetType()
$out_1 = "hex "
$out_1 += $pole_hex[$dd]
$out_1 += " = "
$out_1 += $hex_to_dec
$out_1 += " = "
$out_1 += $dd
$out_1 += " dec"
echo $out_1
$poc_1++
}



sleep 20

