cls

# A=65, Z=90, a=97, z=122, 0=48, 1=49, 9=57
#$pole=@(48,57,65,90,97,122) # 0-9, A-Z, a-z 
$pole_ascii=@(48,57,97,122,65,90)
$d_pole_ascii=$pole_ascii.Length

$pole_znaky=@()
for ( $aa = 0; $aa -le $d_pole_ascii -2; $aa++ ) {
$od = $pole_ascii[$aa]
$do = $pole_ascii[$aa+1]
for ( $bb = $od; $bb -le $do; $bb++ ) {
$znk = [char] $bb
$pole_znaky+=$znk
}
$aa++
}

#echo $pole_znaky
$d_pole_znaky = $pole_znaky.Length-1


#[int32] $chci = Read-host -Prompt "zadej  00-3843"


for ($i = 1; $i -lt 9999; $i++) { # testovaci !

    
$chci = Get-Random -Minimum 0 -Maximum 3843
echo "$chci= chci"

$poc_1 = 0

for ( $aa = 0; $aa -le $d_pole_znaky; $aa++) {
for ( $bb = 0; $bb -le $d_pole_znaky; $bb++) {

$poc_1++

if ( $chci -eq $poc_1 - 1 ) {
$x1=$aa
$x2=$bb
}

}
}

$vysledek=$pole_znaky[$x1]
$vysledek+=$pole_znaky[$x2]

echo $vysledek
#echo $vysledek.GetTypeCode()



###############################################################
# zpatky moje

$chci_2 = $vysledek # vysledek z prevodu do ZZ spatky do vstupu

$chci2_aa2 = $chci_2.Substring(0,1)
$chci2_bb2 = $chci_2.Substring(1,1)

$poc_2 = 0
for ( $aa2 = 0; $aa2 -le $d_pole_znaky; $aa2++) {
for ( $bb2 = 0; $bb2 -le $d_pole_znaky; $bb2++) {

$poc_2++

if (( $chci2_aa2 -ceq $pole_znaky[$aa2] ) -and ( $chci2_bb2 -ceq $pole_znaky[$bb2])) {# - ceq case sensitive operator 
$vysledek_2=$poc_2
$vysledek_2--
}

}
}

echo $vysledek_2"= moje zpatky z reference do int " # int32 musi bejt 1-2 cifry a int type !!
#echo $vysledek_2.GetTypeCode()

#$vysledek_2 = 10 # testovaci jenom

if ( $chci -ne $vysledek_2 ) { # test porovnai vstup a vystup
echo "CHYBA"
echo $chyba
break
}


#sleep 3
echo "------------------"


}


