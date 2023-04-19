
TI=TO_DO
SIMULDIR="L_0.0"
export OMP_NUM_THREADS=4

cd ${SIMULDIR}
bsub -W 24:00 -R "rusage[scratch=2000]" -J ${TI}_1 -e ${SIMULDIR}/${TI}_1.err -o ${SIMULDIR}/${TI}_1.out -n 4 < ${TI}_1.run
