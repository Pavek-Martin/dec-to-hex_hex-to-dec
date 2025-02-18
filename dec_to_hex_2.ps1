cls

#$bb = 16 # 16 hexa = 10 dec
$bb = 255
$bb=15+1

echo $bb

$hexa_4 = "{0:x}" -f $bb
echo $hexa_4

if ( $hexa_4.Length -eq 1 ) { # < 9 prida nulu na konec 
$hexa_4 = "0"+$hexa_4
}

echo $hexa_4.GetType()


#sleep 10


