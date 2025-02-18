cls

Remove-variable chci, vysledek, vysledek_2, poc, poc_2 -ErrorAction SilentlyContinue


$pole = @("0","1","2","3","4","5","6","7","8","9")
$pole += ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
$pole += ("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")

$d_pole = $pole.Length-1
#echo $d_pole


#[int32] $chci = Read-host -Prompt "zadej  00-3843"

$chci = Get-Random -Minimum 0 -Maximum 3843
echo "$chci= chci"


$poc_1=0
for ( $aa = 0; $aa -le $d_pole; $aa++) {
for ( $bb = 0; $bb -le $d_pole; $bb++) {

$poc_1++

if ( $chci -eq $poc_1-1 ) {
$x1=$aa
$x2=$bb
}

}
}

$vysledek=$pole[$x1]
$vysledek+=$pole[$x2]

echo $vysledek
#echo $vysledek.GetTypeCode()


###############################################################
# zpatky moje

$chci_2 = $vysledek # vysledek z prevodu do ZZ spatky do vstupu

$chci2_aa2 = $chci_2.Substring(0,1)
$chci2_bb2 = $chci_2.Substring(1,1)

$poc_2 = 0
for ( $aa2 = 0; $aa2 -le $d_pole; $aa2++) {
for ( $bb2 = 0; $bb2 -le $d_pole; $bb2++) {

$poc_2++

if (( $chci2_aa2 -ceq $pole[$aa2] ) -and ( $chci2_bb2 -ceq $pole[$bb2])) {# - ceq case sensitive operator 
$vysledek_2=$poc_2
$vysledek_2--
}

}
}

echo $vysledek_2"= moje zpatky z reference do int " # int32 musi bejt 1-2 cifry a int type !!
#echo $vysledek_2.GetTypeCode()
$vysledek_2 = 10

if ( $chci -ne $vysledek_2 ) {
echo "CHYBA"
}


#sleep 3


