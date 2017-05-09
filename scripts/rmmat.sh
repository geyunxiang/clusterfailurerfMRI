#!/bin/bash
for subj in ./FunImg/*
do
    if [ -e $subj/func.mat ]
    then
        rm $subj/func.mat
    fi
done

