bsub -W 24:00 -R "rusage[scratch=2000]" -J protein_1 -e ${SIMULDIR}/protein_1.err -o ${SIMULDIR}/protein_1.out < protein_1.run 

