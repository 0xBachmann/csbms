#!/usr/bin/env bash

dirfile=$1

mkdir -p plots

#read line in directory list
while read line
do
  line=$(echo $line | sed -e 's/^[ \t]*//') #strip leading blanks
  [[ ${line:0:1} == '#' ]] && continue #skip line if it is a comment
  
  # read out values
  dir=$(echo $line | awk '{print $1;}')
  sys=$(echo $line | awk '{print $2;}')
  tit=$(echo $line | awk '{print $3;}')

  echo "###  "$dir"   ###"

  mkdir -p $dir/ana/
  cd $dir/ana/
  
  #run analysis script (ene_ana)
  cp ../../scripts/jdhdl.sh .
  ./jdhdl.sh $sys

  #integrate and create plot with python
  filename=${dir}".png"
  ../../scripts/integrate_plot.py $filename $tit >> ave_dhdl.dat
  
  #copy plot
  cp $filename ../../plots/

  cd ../../
done < $dirfile

exit
