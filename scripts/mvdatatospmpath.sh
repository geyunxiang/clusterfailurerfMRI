#!/bin/bash
subfoldername=DPARSFA_10point_global_RWSDCF
for fld in /media/geyx/SeagateS/Data/DPARSFA_Beijing/FunImgRWSDglobalCF/* ; do
    cd $fld
    subjname=${PWD##*/}
    if [ -e /media/geyx/Data/Data/Beijing/$subjname ]; then
        echo $fld everything fine
        # do nothing
    else
        mkdir /media/geyx/Data/Data/Beijing/$subjname
        mkdir /media/geyx/SeagateS/Data/DPARSFA_Beijing_bak/$subjname
    fi
    mkdir /media/geyx/Data/Data/Beijing/$subjname/func/$subfoldername/
    # mkdir /media/geyx/SeagateS/Data/DPARSFA_Beijing_bak/$subjname/$subfoldername/
    mv $fld/Filtered_4DVolume.nii /media/geyx/Data/Data/Beijing/$subjname/func/$subfoldername/processed.nii
    # mv $fld/Filtered_4DVolume.nii /media/geyx/SeagateS/Data/DPARSFA_Beijing_bak/$subjname/$subfoldername/Filtered_4DVolume.nii
done

for fld in /media/geyx/SeagateS/Data/DPARSFA_Beijing/RealignParameter/* ; do
    if [ -e $fld/rp_func.txt ]; then
        cd $fld
        subjname=${PWD##*/}
        cp $fld/rp_func.txt /media/geyx/Data/Data/Beijing/$subjname/func/$subfoldername/rp_rest.txt
        # cp $fld/rp_func.txt /media/geyx/SeagateS/Data/DPARSFA_Beijing_bak/$subjname/$subfoldername/rp_rest.txt
    fi
done

