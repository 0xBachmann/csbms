#!/usr/bin/env sh

# TI type
TI=$1

# loop over all the lambda
rm -f ave_dhdl.dat
for X in `seq 0 10`; do

# calculate lambda
  ld=`echo $X | awk '{printf "%3.1f", 0.1*$1}'`
  N=$((($X*100)+2))

  # run ene_ana
  echo "@topo ../../topo/phe.top" > ene_ana_${X}.inp
  echo "@library /cluster/work/igc/CSBMS/GROMOS/lib/alzbetas_ene_ana.md++.lib" >> ene_ana_${X}.inp
  echo "@prop dhdl" >> ene_ana_${X}.inp
  echo "@time 0 1" >> ene_ana_${X}.inp
  echo "@fr_files ../L_${ld}/${TI}_${N}.trg.gz" >> ene_ana_${X}.inp
  ene_ana @f ene_ana_${X}.inp > ene_ana_${X}.out

# clean
  mv dhdl.dat dhdl_${X}.dat
  rm ene_ana_${X}.inp

# get information
  printf "$ld" >> ave_dhdl.dat
  printf " " >> ave_dhdl.dat
  tail -n 1 ene_ana_${X}.out > tmp
  cat tmp | awk '{print $2,$4}' >> ave_dhdl.dat 
  rm tmp
done
