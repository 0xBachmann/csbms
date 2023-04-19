
#========parse data==========#
for SYSTEM in unrestrained NOE_IR NOE_TAR
do
   head -n 55 rmsf_${SYSTEM}.out > tmp
   tail -n 48 tmp > tmp1
   cat tmp1 | awk '{print $1,$2}' > rmsf_${SYSTEM}.dat
done
rm -f tmp tmp1

#========make xmgrace file==========#
cat rmsf_template.agr > rmsf.agr
echo "@target G0.S0" >> rmsf.agr
echo "@type xy" >> rmsf.agr
cat rmsf_unrestrained.dat >> rmsf.agr
echo "&" >> rmsf.agr

echo "@target G0.S1" >> rmsf.agr
echo "@type xy" >> rmsf.agr
cat rmsf_NOE_IR.dat >> rmsf.agr
echo "&" >> rmsf.agr

echo "@target G0.S2" >> rmsf.agr
echo "@type xy" >> rmsf.agr
cat rmsf_NOE_TAR.dat >> rmsf.agr
echo "&" >> rmsf.agr

