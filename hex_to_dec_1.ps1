cls

# prevadi haxa cislo do dec, 2 zpusoby, oba fungujou


# zpusob 1
[string] $hexa_1 = "ff" # 255 dekadicky
echo $hexa_1
#[int16]$hexa_1b="0x"+$hexa_1
[int16]$hexa_1b="0x"+$hexa_1
echo $hexa_1b
echo $hexa_1b.GetType()


# zpusob 2
$hexa_2 = "ff"
echo $hexa_2
$hexa_2b = [convert]::ToInt16($hexa_2, 16)
echo $hexa_2b
echo $hexa_2b.GetType()

sleep 10


