#!/usr/bin/env python

import glob, os
import sys

working_dir = sys.argv[1]
results = sys.argv[2]
name = sys.argv[3]

os.chdir(working_dir + "/" + results)
with open(name,'r') as f:
    with open("trimmed" + name,'w') as o:
        for l in f:
            wrds=l.split();
            wrds[0] = wrds[0].split('_')[0];
            o.write('\t'.join(wrds) + '\n')
