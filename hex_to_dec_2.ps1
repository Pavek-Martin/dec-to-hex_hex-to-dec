cls
# prevadi haxa cislo do dec, 2 zpusoby, oba fungujou

# zpusob 1
echo "-------------- 1 -------------------"

#[string] $hexa_1 = "10" # 255 dekadicky
[string] $hexa_1 = "0A" # 255 dekadicky
#[string] $hexa_1 = "0F" # 255 dekadicky

echo $hexa_1" dec"

[int16]$hexa_1b="0x"+$hexa_1
echo $hexa_1b" hex"
#echo $hexa_1b.GetType()

# zpusob 2  # pravedi take 00,01,02-09
echo "-------------- 2 -------------------"
$hexa_2b = [convert]::ToInt16($hexa_1, 16)
echo $hexa_1" dec"
echo $hexa_2b" hex"
#echo $hexa_2b.GetType()

#sleep 10


