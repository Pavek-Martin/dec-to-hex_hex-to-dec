cls

$n=255

$base=10

#$base = 2   # 2,8,16 taky jde 10 :)
# 32 nejde

$o1 = [convert]::ToString($n, $base)
$o1=$o1.ToUpper()
echo $o1

$o1.GetType()

echo "---------------------------------------------"
$n2 = 397312

$o2 = "{0:x2}" -f $n2
echo $o2











