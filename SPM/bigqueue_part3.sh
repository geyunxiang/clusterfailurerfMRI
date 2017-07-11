# begin changgeng normal


# enable classical statistical analysis
# sed -i "s/% cls_analysis_pipeline(config, 1, 49, 1);/cls_analysis_pipeline(config, 1, 22, 1);/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change dataset
# sed -i "s/config.dataset = 'changgeng_shiyuzheng';/config.dataset = 'changgeng_normal';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfile content
# sed -i "s/DPARSFA_changgeng_shiyuzheng/DPARSFA_changgeng_normal/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDC';/config.subfoldername = 'DPARSFA_default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_global_RWSDC/subfoldername: DPARSFA_default_RWS/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDC';/config.reportname1 = 'default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDC';/config.reportname2 = 'default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
sed -i "s/DPARSFA_default_global_RWSDC/DPARSFA_default_RWS/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sed -i "s/FunImgRWSDglobalC/FunImgRWS/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sed -i "s/CovRegressed_4DVolume/swrfunc/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# remove data
#sed -i "s/DPARSFA_default_global_RWSDCF/DPARSFA_default_RWS/g" /home/geyx/Documents/scripts/rmdata.sh
#sed -i "s/Beijing_r38/DPARSFA_changgeng_normal/g" /home/geyx/Documents/scripts/rmdata.sh
#sh /home/geyx/Documents/scripts/rmdata.sh


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWS';/config.subfoldername = 'DPARSFA_default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWS/subfoldername: DPARSFA_default_RWSD/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWS';/config.reportname1 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWS';/config.reportname2 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
sed -i "s/DPARSFA_default_RWS/DPARSFA_default_RWSD/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sed -i "s/FunImgRWS/FunImgRWSD/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sed -i "s/swrfunc/Detrend_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# remove data
#sed -i "s/DPARSFA_default_RWS/DPARSFA_default_RWSD/g" /home/geyx/Documents/scripts/rmdata.sh
#sh /home/geyx/Documents/scripts/rmdata.sh

# change subfoldername
#sed -i "s/DPARSFA_default_RWSD/DPARSFA_default_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
#sed -i "s/default_RWSD/default_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

#matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSD';/config.subfoldername = 'DPARSFA_default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWSD/subfoldername: DPARSFA_default_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSD';/config.reportname1 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSD';/config.reportname2 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
sed -i "s/DPARSFA_default_RWSD/DPARSFA_default_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sed -i "s/FunImgRWSD/FunImgRWSDCF/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sed -i "s/Detrend_4DVolume/Filtered_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# remove data
#sed -i "s/DPARSFA_default_RWSD/DPARSFA_default_RWSDCF/g" /home/geyx/Documents/scripts/rmdata.sh
#sh /home/geyx/Documents/scripts/rmdata.sh

# change subfoldername
#sed -i "s/DPARSFA_default_RWSDCF/DPARSFA_default_global_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
#sed -i "s/default_RWSDCF/default_global_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

#matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDCF';/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWSDCF/subfoldername: DPARSFA_default_global_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDCF';/config.reportname1 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDCF';/config.reportname2 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
sed -i "s/DPARSFA_default_RWSDCF/DPARSFA_default_global_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sed -i "s/FunImgRWSDCF/FunImgRWSDglobalCF/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sed -i "s/Filtered_4DVolume/Filtered_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_normal/cpmvdata.sh

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# remove data
#sed -i "s/DPARSFA_default_RWSDCF/DPARSFA_default_global_RWSDCF/g" /home/geyx/Documents/scripts/rmdata.sh
#sh /home/geyx/Documents/scripts/rmdata.sh




# changgeng normal finished except covregress
# begin changgeng shiyuzheng single




# enable classical statistical analysis
sed -i "s/cls_analysis_pipeline(config, 1, 22, 1);/cls_analysis_pipeline(config, 1, 16, 1);/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change dataset
sed -i "s/config.dataset = 'changgeng_normal';/config.dataset = 'changgeng_shiyuzheng_single';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfile content
sed -i "s/DPARSFA_changgeng_normal/DPARSFA_changgeng_shiyuzheng_single/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/config.subfoldername = 'DPARSFA_default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_global_RWSDCF/subfoldername: DPARSFA_default_RWS/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDCF';/config.reportname1 = 'default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDCF';/config.reportname2 = 'default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
#sed -i "s/DPARSFA_default_global_RWSDCF/DPARSFA_default_RWS/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
#sed -i "s/FunImgRWSDglobalCF/FunImgRWS/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
#sed -i "s/Filtered_4DVolume/swrfunc/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# remove data
#sed -i "s/DPARSFA_default_global_RWSDCF/DPARSFA_default_RWS/g" /home/geyx/Documents/scripts/rmdata.sh
#sed -i "s/DPARSFA_changgeng_normal/DPARSFA_changgeng_shiyuzheng_single/g" /home/geyx/Documents/scripts/rmdata.sh
#sh /home/geyx/Documents/scripts/rmdata.sh


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWS';/config.subfoldername = 'DPARSFA_default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWS/subfoldername: DPARSFA_default_RWSD/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWS';/config.reportname1 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWS';/config.reportname2 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
sed -i "s/DPARSFA_default_RWS/DPARSFA_default_RWSD/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sed -i "s/FunImgRWS/FunImgRWSD/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sed -i "s/swrfunc/Detrend_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# remove data
#sed -i "s/DPARSFA_default_RWS/DPARSFA_default_RWSD/g" /home/geyx/Documents/scripts/rmdata.sh
#sh /home/geyx/Documents/scripts/rmdata.sh

# change subfoldername
#sed -i "s/DPARSFA_default_RWSD/DPARSFA_default_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
#sed -i "s/default_RWSD/default_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

#matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSD';/config.subfoldername = 'DPARSFA_default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWSD/subfoldername: DPARSFA_default_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSD';/config.reportname1 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSD';/config.reportname2 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
sed -i "s/DPARSFA_default_RWSD/DPARSFA_default_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sed -i "s/FunImgRWSD/FunImgRWSDCF/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sed -i "s/Detrend_4DVolume/Filtered_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# remove data
#sed -i "s/DPARSFA_default_RWSD/DPARSFA_default_RWSDCF/g" /home/geyx/Documents/scripts/rmdata.sh
#sh /home/geyx/Documents/scripts/rmdata.sh

# change subfoldername
#sed -i "s/DPARSFA_default_RWSDCF/DPARSFA_default_global_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
#sed -i "s/default_RWSDCF/default_global_RWSDC/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

#matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDCF';/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: DPARSFA_default_RWSDCF/subfoldername: DPARSFA_default_global_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDCF';/config.reportname1 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDCF';/config.reportname2 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# copy data
sed -i "s/DPARSFA_default_RWSDCF/DPARSFA_default_global_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sed -i "s/FunImgRWSDCF/FunImgRWSDglobalCF/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sed -i "s/Filtered_4DVolume/Filtered_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/DPARSFA_changgeng_shiyuzheng_single/cpmvdata.sh

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# remove data
#sed -i "s/DPARSFA_default_RWSDCF/DPARSFA_default_global_RWSDCF/g" /home/geyx/Documents/scripts/rmdata.sh
#sh /home/geyx/Documents/scripts/rmdata.sh
