
#========parse data==========#
for SYSTEM in unrestrained NOE_IR NOE_TAR
do
   head -n 26 jval_${SYSTEM}.out > tmp
   tail -n 15 tmp > tmp1
   cat tmp1 | awk '{print $17,$20}' > jval_${SYSTEM}.dat
done
rm -f tmp tmp1

#========make xmgrace file==========#
cat jval_template.agr > jval.agr
echo "@target G0.S1" >> jval.agr
echo "@type xy" >> jval.agr
cat jval_unrestrained.dat >> jval.agr
echo "&" >> jval.agr

echo "@target G1.S0" >> jval.agr
echo "@type xy" >> jval.agr
echo "0  0" >> jval.agr
echo "20 20" >> jval.agr
echo "&" >> jval.agr
echo "@target G1.S1" >> jval.agr
echo "@type xy" >> jval.agr
cat jval_NOE_IR.dat >> jval.agr
echo "&" >> jval.agr

echo "@target G2.S0" >> jval.agr
echo "@type xy" >> jval.agr
echo "0  0" >> jval.agr
echo "20 20" >> jval.agr
echo "&" >> jval.agr
echo "@target G2.S1" >> jval.agr
echo "@type xy" >> jval.agr
cat jval_NOE_TAR.dat >> jval.agr
echo "&" >> jval.agr

