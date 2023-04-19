#!/bin/sh

touch ene_ana.arg
echo -e "@topo ../topo/EGM_512.top\n@library /cluster/work/igc/CSBMS/GROMOS/lib/ene_ana.md++.lib\n@prop densit\ntotpot\n@time 0 2\n@en_files " > ene_ana.arg

for i in 2 3 4 5 6
do
	echo "liq_${i}.tre.gz " >> ene_ana.arg
	ene_ana @f ene_ana.arg > ene_liq_${i}.out	
done 
