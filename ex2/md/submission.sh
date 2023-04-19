export OMP_NUM_THREAD=4
module load pgi/15.1
module load open_mpi/1.6.5
SIMULDIR=$HOME/ex2/md
bsub -W 24:00 -R "rusage[scratch=2000]" -n 4 -J hexapepE_1 -e $SIMULDIR/hexapepE_1.err -o $SIMULDIR/hexapepE_1.out < hexapepE_1.run
