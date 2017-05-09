#!/bin/bash
for fld in /media/geyx/SeagateS/changgengSCI/patient/* ; do
    cd $fld
    subjname=${PWD##*/}
    if [ -e /media/geyx/SeagateS/Data/DPARSFA_changgeng/FunImg/$subjname ]
    then
        echo $fld everything fine
        # do nothing
    else
        mkdir /media/geyx/SeagateS/Data/DPARSFA_changgeng/FunImg/$subjname
        # mkdir /media/geyx/SeagateS/Data/DPARSFA_changgeng/T1Img/$subjname
    fi
    gunzip -k $fld/*.gz
    mv $fld/*.nii /media/geyx/SeagateS/Data/DPARSFA_changgeng/FunImg/$subjname/func.nii
    # gunzip -k $fld/anat/mprage_skullstripped.nii.gz
    # mv $fld/anat/mprage_skullstripped.nii /media/geyx/SeagateS/Data/DPARSFA_Beijing/T1Img/$subjname/comprage_skullstripped.nii
done

