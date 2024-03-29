#!/bin/bash

# for smaller boxes, LAMMPS is used due to some GROMACS restriction
# for larger boxes, GROMACS is used as its faster

set -e

raw_data=raw-data/
if [ ! -d "$raw_data" ];
then
    mkdir $raw_data
fi

# loop over log-spaced data created using np.int32(np.logspace(np.log10(25), np.log10(4000), 12))
#for n_peg in 3 4 5 7 9 13 17 24 32 44 59 79
for n_peg in 32
do

    folder=${raw_data}NPEG${n_peg}/
    if [ ! -d "$folder" ];
    then
        mkdir $folder
        cd inputs
            newline='Number_polymer = '$n_peg
            oldline=$(cat create-system.py | grep 'Number_polymer = ')
            sed -i '/'"$oldline"'/c\'"$newline" create-system.py
            python3 create-system.py
        cd ..
        if ((${n_peg} > 100));
        then
            echo 'Create GROMACS configuration for Npeg = '${n_peg}
            # Use GROMACS
            cp -r inputs/ff-gromacs ${folder}ff
            cp -r inputs/input-gromacs ${folder}input
            cp inputs/conf.gro $folder
            cp inputs/topol.top $folder
            cp inputs/run_bigfoot_UGA.sh $folder
        else
            echo 'Create LAMMPS configuration for Npeg = '${n_peg}
            # Une LAMMPS
            cp inputs/input-lammps/*.lammps $folder
            cp inputs/ff-lammps/*.lammps $folder
            cp inputs/init.data $folder
            cp inputs/conf.gro $folder
            cp inputs/run_dahu_UGA.sh $folder
        fi
        rm inputs/conf.gro
        rm inputs/topol.top
        rm inputs/init.data
    else
        echo 'Folder '${folder}'exist already, skipped'
    fi
done
