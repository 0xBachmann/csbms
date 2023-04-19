bsub -W 24:00 -R "rusage[scratch=2000]" -J protein_298K_1 -e ${SIMULDIR}/protein_298K_1.err -o ${SIMULDIR}/protein_298K_1.out < protein_298K_1.run

