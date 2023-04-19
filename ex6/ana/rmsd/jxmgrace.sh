
#========make xmgrace file==========#
cat rmsd_template.agr > rmsd.agr
echo "@target G0.S0" >> rmsd.agr
echo "@type xy" >> rmsd.agr
cat rmsd_unrestrained_my.out >> rmsd.agr
echo "&" >> rmsd.agr

echo "@target G0.S1" >> rmsd.agr
echo "@type xy" >> rmsd.agr
cat rmsd_NOE_IR_my.out >> rmsd.agr
echo "&" >> rmsd.agr

echo "@target G0.S2" >> rmsd.agr
echo "@type xy" >> rmsd.agr
cat rmsd_NOE_TAR_my.out >> rmsd.agr
echo "&" >> rmsd.agr

echo "@target G1.S0" >> rmsd.agr
echo "@type xy" >> rmsd.agr
cat rmsd_unrestrained.out >> rmsd.agr
echo "&" >> rmsd.agr

echo "@target G1.S1" >> rmsd.agr
echo "@type xy" >> rmsd.agr
cat rmsd_NOE_IR.out >> rmsd.agr
echo "&" >> rmsd.agr

echo "@target G1.S2" >> rmsd.agr
echo "@type xy" >> rmsd.agr
cat rmsd_NOE_TAR.out >> rmsd.agr
echo "&" >> rmsd.agr

