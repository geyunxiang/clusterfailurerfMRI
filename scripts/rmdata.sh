#!/bin/bash
subfoldername=DPARSFA_10point_RWSDC
filename=processed.nii
for subj in /media/geyx/Data/Data/Beijing/* ; do
    if [ -e $subj/func/$subfoldername/$filename ]
    then
        echo $subj
        rm $subj/func/$subfoldername/$filename
    fi
done

