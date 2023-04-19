#!/bin/bash

md @topo ../topo/ppn_512.top \
  @conf ../coord/ppn_512.cnf \
  @fin  ppn_512_minimized.cnf \
  @input min.imd > min.omd

exit 0
