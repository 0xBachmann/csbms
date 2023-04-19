#!/bin/bash

echo "#  phi   psi" > phipsi.dat

for i in `seq 2 55`; do

  echo "@topo ../../topo/protein.top" > ./tser.inp
  echo "@pbc r" >> ./tser.inp
  echo "@time 0 0.5" >> ./tser.inp
  echo "@prop tp%1:res((x-1):C);1:res((x):N,CA,C)|x=$i tp%1:res((x):N,CA,C);1:res((x+1):N)|x=$i" >> ./tser.inp
  echo "@traj" >> ./tser.inp
    echo "../../md_348K_10ns/protein_348K_20.trc.gz" >> ./tser.inp

  tser @f tser.inp > tser_${i}.dat
  grep -v '#' tser_${i}.dat > tser_${i}
  cat tser_${i} | awk '{print $2,$3}' >> phipsi.dat
  rm tser_${i}.dat tser_${i} tser.inp
done
