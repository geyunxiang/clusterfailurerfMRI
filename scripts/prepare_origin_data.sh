#!/bin/bash
for fld in /media/geyx/Data/Data/1000fcon/Beijing/* ; do
    cd $fld
    subjname=${PWD##*/}
    if [ -e /media/geyx/SeagateS/Data/DPARSFA_Beijing/FunImg/$subjname ]
    then
        echo $fld everything fine
        # do nothing
    else
        mkdir /media/geyx/SeagateS/Data/DPARSFA_Beijing/FunImg/$subjname
        mkdir /media/geyx/SeagateS/Data/DPARSFA_Beijing/T1Img/$subjname
    fi
    gunzip -k $fld/func/rest.nii.gz
    mv $fld/func/rest.nii /media/geyx/SeagateS/Data/DPARSFA_Beijing/FunImg/$subjname/func.nii
    gunzip -k $fld/anat/mprage_skullstripped.nii.gz
    mv $fld/anat/mprage_skullstripped.nii /media/geyx/SeagateS/Data/DPARSFA_Beijing/T1Img/$subjname/comprage_skullstripped.nii
done

