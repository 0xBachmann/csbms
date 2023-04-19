
#========parse data==========#
for SYSTEM in unrestrained NOE_IR NOE_TAR
do
   head -n 195 post_noe_${SYSTEM}.out > tmp
   tail -n 179 tmp > tmp1
   cat tmp1 | awk '{print $1,$18}' > post_noe_${SYSTEM}.dat
done
rm -f tmp tmp1

#========make xmgrace file==========#
cat noe_template.agr > noe.agr
echo "@target G0.S0" >> noe.agr
echo "@type bar" >> noe.agr
cat post_noe_unrestrained.dat >> noe.agr
echo "&" >> noe.agr

echo "@target G1.S0" >> noe.agr
echo "@type bar" >> noe.agr
cat post_noe_NOE_IR.dat >> noe.agr
echo "&" >> noe.agr

echo "@target G2.S0" >> noe.agr
echo "@type bar" >> noe.agr
cat post_noe_NOE_TAR.dat >> noe.agr
echo "&" >> noe.agr

