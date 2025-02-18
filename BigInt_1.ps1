cls

#$n = [bigint] "1234567890123456789012345678901234567890"
#$n = [bigint] "12345678901234567890123456789012345678901234567890"
$n = [bigint] "12345678901234567890123456789012345678901234567890"

#echo $n.GetType()
echo $n


$nn = $n.ToString("X")
echo $nn
echo $nn.Length
echo $nn.GetType()






