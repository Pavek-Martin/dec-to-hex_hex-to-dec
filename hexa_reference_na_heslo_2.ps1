cls


#$matrix="703159152953233946403527365648695465465870642752422210504617707049323543215025563418105965382463396564175340146327221762283170533739445424322827632913284149474846593040684219535310462961376468445446635361644170313610533542455223676855302827343625274240"
$matrix=@()
#echo $matrix.Length

$reference_na_heslo_dec=""
$reference_na_heslo_hexa=""
$heslo_pro_zazipovani=""

for ($ff = 0; $ff -le 125; $ff++) { # 126 znaku hesla
#echo $ff
$rnd_num = Get-Random -Minimum 0 -Maximum 255 # vybira se tedkou z 256 moznosti verze 1.2
echo "$rnd_num dec"
$reference_na_heslo_dec += [string] $rnd_num

# prevede dec 0-255 do hexa
$hexa_znak = "{0:x}" -f $rnd_num
if ( $hexa_znak.Length -eq 1 ) { # < 9 prida nulu na konec 
#$hexa_4 = $hexa_4.ToUpper()
$hexa_znak = "0"+$hexa_znak
}

# prevde a-A apod. vi si rady z cisle ve stringu
$hexa_znak = $hexa_znak.ToUpper()
echo $hexa_znak" hex"
$reference_na_heslo_hexa+=$hexa_znak


#$heslo_pro_zazipovani += $matrix[$ff][$rnd_num]
}



