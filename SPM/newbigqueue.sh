# begin changgeng SCI

# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWS/subfoldername=DPARSFA_rm10points_RWSD/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWS/FunImgRWSD/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/swrfunc/Detrend_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWS';/config.subfoldername = 'DPARSFA_rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWS/subfoldername: rm10points_RWSD/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWS';/config.reportname1 = 'rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWS';/config.reportname2 = 'rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWSD/subfoldername=DPARSFA_rm10points_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWSD/FunImgRWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/Detrend_4DVolume/Filtered_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWSD';/config.subfoldername = 'DPARSFA_rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWSD/subfoldername: rm10points_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWSD';/config.reportname1 = 'rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWSD';/config.reportname2 = 'rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWSDCF/subfoldername=DPARSFA_rm10points_global_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWSDCF/FunImgRWSDglobalCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWSDCF';/config.subfoldername = 'DPARSFA_rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWSDCF/subfoldername: rm10points_global_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWSDCF';/config.reportname1 = 'rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWSDCF';/config.reportname2 = 'rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"






# changgeng SCI finished except covregress
# begin changgeng CS






# prepare matlab program for new dataset
sed -i "s/cls_analysis_pipeline(config, 1, 87, 1);/cls_analysis_pipeline(config, 1, 49, 1);/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change dataset
sed -i "s/config.dataset = 'changgeng';/config.dataset = 'changgeng_shiyuzheng';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfile content
sed -i "s/Dataset: changgeng/Dataset: changgeng_shiyuzheng/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m


# prepare new dataset copy mv data script
sed -i "s/study=DPARSFA_changgeng/study=DPARSFA_changgeng_shiyuzheng/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/changgeng_SCI/changgeng_CS/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh


# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_global_RWSDCF/subfoldername=DPARSFA_rm10points_RWS/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWSDglobalCF/FunImgRWS/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/Filtered_4DVolume/swrfunc/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_global_RWSDCF';/config.subfoldername = 'DPARSFA_rm10points_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_global_RWSDCF/subfoldername: rm10points_RWS/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_global_RWSDCF';/config.reportname1 = 'rm10points_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_global_RWSDCF';/config.reportname2 = 'rm10points_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWS/subfoldername=DPARSFA_rm10points_RWSD/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWS/FunImgRWSD/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/swrfunc/Detrend_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWS';/config.subfoldername = 'DPARSFA_rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWS/subfoldername: rm10points_RWSD/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWS';/config.reportname1 = 'rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWS';/config.reportname2 = 'rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWSD/subfoldername=DPARSFA_rm10points_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWSD/FunImgRWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/Detrend_4DVolume/Filtered_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWSD';/config.subfoldername = 'DPARSFA_rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWSD/subfoldername: rm10points_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWSD';/config.reportname1 = 'rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWSD';/config.reportname2 = 'rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWSDCF/subfoldername=DPARSFA_rm10points_global_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWSDCF/FunImgRWSDglobalCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWSDCF';/config.subfoldername = 'DPARSFA_rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWSDCF/subfoldername: rm10points_global_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWSDCF';/config.reportname1 = 'rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWSDCF';/config.reportname2 = 'rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"






# changgeng CS finished except covregress
# begin changgeng normal






# prepare matlab program for new dataset
sed -i "s/cls_analysis_pipeline(config, 1, 49, 1);/cls_analysis_pipeline(config, 1, 22, 1);/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change dataset
sed -i "s/config.dataset = 'changgeng_shiyuzheng';/config.dataset = 'changgeng_normal';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfile content
sed -i "s/Dataset: changgeng_shiyuzheng/Dataset: changgeng_normal/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m


# prepare new dataset copy mv data script
sed -i "s/study=DPARSFA_changgeng_shiyuzheng/study=DPARSFA_changgeng_normal/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/changgeng_CS/changgeng_normal/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh


# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_global_RWSDCF/subfoldername=DPARSFA_rm10points_RWS/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWSDglobalCF/FunImgRWS/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/Filtered_4DVolume/swrfunc/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_global_RWSDCF';/config.subfoldername = 'DPARSFA_rm10points_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_global_RWSDCF/subfoldername: rm10points_RWS/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_global_RWSDCF';/config.reportname1 = 'rm10points_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_global_RWSDCF';/config.reportname2 = 'rm10points_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWS/subfoldername=DPARSFA_rm10points_RWSD/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWS/FunImgRWSD/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/swrfunc/Detrend_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWS';/config.subfoldername = 'DPARSFA_rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWS/subfoldername: rm10points_RWSD/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWS';/config.reportname1 = 'rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWS';/config.reportname2 = 'rm10points_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWSD/subfoldername=DPARSFA_rm10points_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWSD/FunImgRWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/Detrend_4DVolume/Filtered_4DVolume/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWSD';/config.subfoldername = 'DPARSFA_rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWSD/subfoldername: rm10points_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWSD';/config.reportname1 = 'rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWSD';/config.reportname2 = 'rm10points_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# copy and move data
sed -i "s/subfoldername=DPARSFA_rm10points_RWSDCF/subfoldername=DPARSFA_rm10points_global_RWSDCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sed -i "s/FunImgRWSDCF/FunImgRWSDglobalCF/g" /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh
sh /media/geyx/Data/DPARSFA_runtime/cpmvdata.sh

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_rm10points_RWSDCF';/config.subfoldername = 'DPARSFA_rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/subfoldername: rm10points_RWSDCF/subfoldername: rm10points_global_RWSDCF/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'rm10points_RWSDCF';/config.reportname1 = 'rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'rm10points_RWSDCF';/config.reportname2 = 'rm10points_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"
