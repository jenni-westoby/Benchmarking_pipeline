#!/bin/bash

source Simulation/venv/bin/activate
brie -a Simulation/brie_splice_events/SE.gold.gtf -s Simulation/bamfiles/simulated/ERR1211610XSAligned.sortedByCoord.out.bam -f mouse_features.csv.gz -o out_dir -p 15
