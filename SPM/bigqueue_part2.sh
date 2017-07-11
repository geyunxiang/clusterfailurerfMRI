# Beijing r38

# enable classical statistical analysis
#sed -i "s/cls_analysis_pipeline(config, 1, 16, 1);/% cls_analysis_pipeline(config, 1, 16, 1);/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change dataset
sed -i "s/config.dataset = 'changgeng_shiyuzheng_single';/config.dataset = 'Beijing_r38';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfile content
# sed -i "s/DPARSFA_changgeng_shiyuzheng_single/Beijing_r38/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/config.subfoldername = 'DPARSFA_default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_global_RWSDCF/subfoldername: DPARSFA_default_RWS/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDCF';/config.reportname1 = 'default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDCF';/config.reportname2 = 'default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
for fld in /media/geyx/Data/Data/Beijing_r38/* ; do
	cd $fld
    subjname=${PWD##*/}
    cp -r /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default_RWS /media/geyx/Data/Data/Beijing_r38/$subjname/func/DPARSFA_default_RWS
done

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWS';/config.subfoldername = 'DPARSFA_default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWS/subfoldername: DPARSFA_default_RWSD/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWS';/config.reportname1 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWS';/config.reportname2 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
for fld in /media/geyx/Data/Data/Beijing_r38/* ; do
	cd $fld
    subjname=${PWD##*/}
    cp -r /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default_RWSD /media/geyx/Data/Data/Beijing_r38/$subjname/func/DPARSFA_default_RWSD
done

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSD';/config.subfoldername = 'DPARSFA_default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWSD/subfoldername: DPARSFA_default_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSD';/config.reportname1 = 'default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSD';/config.reportname2 = 'default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
for fld in /media/geyx/Data/Data/Beijing_r38/* ; do
	cd $fld
    subjname=${PWD##*/}
    cp -r /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default_RWSDC /media/geyx/Data/Data/Beijing_r38/$subjname/func/DPARSFA_default_RWSDC
done

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDC';/config.subfoldername = 'DPARSFA_default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWSDC/subfoldername: DPARSFA_default_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDC';/config.reportname1 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDC';/config.reportname2 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
for fld in /media/geyx/Data/Data/Beijing_r38/* ; do
	cd $fld
    subjname=${PWD##*/}
    cp -r /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default /media/geyx/Data/Data/Beijing_r38/$subjname/func/DPARSFA_default_RWSDCF
    mv /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default_RWSDCF
done

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDCF';/config.subfoldername = 'DPARSFA_default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWSDCF/subfoldername: DPARSFA_default_global_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDCF';/config.reportname1 = 'default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDCF';/config.reportname2 = 'default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
for fld in /media/geyx/Data/Data/Beijing_r38/* ; do
	cd $fld
    subjname=${PWD##*/}
    cp -r /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_RWSDC /media/geyx/Data/Data/Beijing_r38/$subjname/func/DPARSFA_default_global_RWSDC
    mv /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_RWSDC /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default_global_RWSDC
done

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDC';/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_global_RWSDC/subfoldername: DPARSFA_default_global_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDC';/config.reportname1 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDC';/config.reportname2 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

for fld in /media/geyx/Data/Data/Beijing_r38/* ; do
	cd $fld
    subjname=${PWD##*/}
    # cp -r /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default /media/geyx/Data/Data/Beijing_r38/$subjname/func/DPARSFA_default_RWSDCF
    mv /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_RWSDCF /media/geyx/Data/Data/Beijing/$subjname/func/DPARSFA_default_global_RWSDCF
done

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


