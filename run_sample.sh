#!/bin/bash

# variables
export NUM_PLAYERS=5
export NUM_LIVES=3
export NUM_INFO_TOKENS=8
export NUM_COLORS=5
export NUM_RANKS=5
export ABDUCTION="on"
export STRATEGY_FILE="strategies\/basic.asl"
export RESULTS_FILE="results\/results.txt"

# write header of results file
echo "num_players,num_lives,num_info_tokens,num_colors,num_ranks,seed,abduction,strategy_file,score,hints" > $RESULTS_FILE

for i in {1..500}
do
   cp hanabdi_template.mas2j hanabdi.mas2j
   sed -i "s/NUM_PLAYERS/$NUM_PLAYERS/" hanabdi.mas2j
   sed -i "s/NUM_LIVES/$NUM_LIVES/" hanabdi.mas2j
   sed -i "s/NUM_INFO_TOKENS/$NUM_INFO_TOKENS/" hanabdi.mas2j
   sed -i "s/NUM_COLORS/$NUM_COLORS/" hanabdi.mas2j
   sed -i "s/NUM_RANKS/$NUM_RANKS/" hanabdi.mas2j
   sed -i "s/SEED/$i/" hanabdi.mas2j
   sed -i "s/ABDUCTION/$ABDUCTION/" hanabdi.mas2j
   sed -i "s/STRATEGY_FILE/\"$STRATEGY_FILE\"/" hanabdi.mas2j
   sed -i "s/RESULTS_FILE/\"$RESULTS_FILE\"/" hanabdi.mas2j
   
   jason hanabdi.mas2j
   rm hanabdi.mas2j
done
