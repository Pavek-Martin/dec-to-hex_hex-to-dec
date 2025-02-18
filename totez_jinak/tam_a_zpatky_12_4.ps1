cls

#Remove-variable vysledek, vysledek_2, vysledek_2b -ErrorAction SilentlyContinue

# odsud moje

$pole = @("0","1","2","3","4","5","6","7","8","9")
$pole += ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
$pole += ("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")

$d_pole = $pole.Length-1
#echo $d_pole

[int32] $chci = Read-host -Prompt "zadej  00-3843"


for ( $aa = 0; $aa -le $d_pole; $aa++) {
for ( $bb = 0; $bb -le $d_pole; $bb++) {

$poc++

if ( $chci -eq $poc-1 ) {
$x1=$aa
$x2=$bb
}

}
}

# dec to base 36
$vysledek=$pole[$x1]
$vysledek+=$pole[$x2]


###############################################################
# zpatky moje
$poc_2 = 0

$chci2 = $vysledek

$chci2_aa2 = $chci2.Substring(0,1)
$chci2_bb2 = $chci2.Substring(1,1)


for ( $aa2 = 0; $aa2 -le $d_pole; $aa2++) {
for ( $bb2 = 0; $bb2 -le $d_pole; $bb2++) {

$o11 = [string] $poc_2
$poc_2++

if (( $chci2_aa2 -ceq $pole[$aa2] ) -and ( $chci2_bb2 -ceq $pole[$bb2])) {
# - ceq case sensitive operator 
$vysledek_2=$poc_2
$vysledek_2--
}

}
}


# vysledky moje
echo "$chci = chci"
echo $chci.GetTypeCode()

echo $vysledek"< moje do reference" # string pride zapsat do reference takze 2 cifry !!
echo $vysledek.GetTypeCode()

echo $vysledek_2"<- moje zpatky z reference do int " # int32 musi bejt 1-2 cifry a int type !!
echo $vysledek_2.GetTypeCode()


#sleep 3


