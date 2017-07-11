#!/bin/bash

# first run changgeng jisui all data

# change dataset
#sed -i "s/config.dataset = 'changgeng_shiyuzheng';/config.dataset = 'changgeng';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfile content
#sed -i "s/DPARSFA_changgeng_shiyuzheng/DPARSFA_changgeng/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change subfoldername
#sed -i "s/DPARSFA_default_global_RWSDCF/DPARSFA_default_RWS/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
#sed -i "s/default_global_RWSDCF/default_RWS/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

#matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"



# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSD';/config.subfoldername = 'DPARSFA_default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSD';/config.reportname1 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSD'/config.reportname2 = 'default_RWSD'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSD';/config.subfoldername = 'DPARSFA_default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSD';/config.reportname1 = 'default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSD'/config.reportname2 = 'default_RWSDC'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDC';/config.subfoldername = 'DPARSFA_default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDC';/config.reportname1 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDC'/config.reportname2 = 'default_RWSDCF'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDCF';/config.subfoldername = 'DPARSFA_default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDCF';/config.reportname1 = 'default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDCF'/config.reportname2 = 'default_global_RWSDC'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDC';/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDC';/config.reportname1 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDC'/config.reportname2 = 'default_global_RWSDCF'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"




# changgeng finished
# begin changgeng single




# change dataset
sed -i "s/config.dataset = 'changgeng';/config.dataset = 'changgeng_single';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfile content
sed -i "s/DPARSFA_changgeng/DPARSFA_changgeng_single/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/config.subfoldername = 'DPARSFA_default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDCF';/config.reportname1 = 'default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDCF'/config.reportname2 = 'default_RWS'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWS';/config.subfoldername = 'DPARSFA_default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWS';/config.reportname1 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWS'/config.reportname2 = 'default_RWSD'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSD';/config.subfoldername = 'DPARSFA_default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSD';/config.reportname1 = 'default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSD'/config.reportname2 = 'default_RWSDC'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDC';/config.subfoldername = 'DPARSFA_default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDC';/config.reportname1 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDC'/config.reportname2 = 'default_RWSDCF'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDCF';/config.subfoldername = 'DPARSFA_default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDCF';/config.reportname1 = 'default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDCF'/config.reportname2 = 'default_global_RWSDC'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDC';/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDC';/config.reportname1 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDC'/config.reportname2 = 'default_global_RWSDCF'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"




# changgeng single finished
# begin changgeng shiyuzheng




# change dataset
sed -i "s/config.dataset = 'changgeng_single';/config.dataset = 'changgeng_shiyuzheng';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfile content
sed -i "s/DPARSFA_changgeng_single/DPARSFA_changgeng_shiyuzheng/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/config.subfoldername = 'DPARSFA_default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDCF';/config.reportname1 = 'default_RWS';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDCF'/config.reportname2 = 'default_RWS'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"


# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWS';/config.subfoldername = 'DPARSFA_default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWS';/config.reportname1 = 'default_RWSD';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWS'/config.reportname2 = 'default_RWSD'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSD';/config.subfoldername = 'DPARSFA_default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSD';/config.reportname1 = 'default_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSD'/config.reportname2 = 'default_RWSDC'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDC';/config.subfoldername = 'DPARSFA_default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDC';/config.reportname1 = 'default_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDC'/config.reportname2 = 'default_RWSDCF'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_RWSDCF';/config.subfoldername = 'DPARSFA_default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_RWSDCF';/config.reportname1 = 'default_global_RWSDC';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_RWSDCF'/config.reportname2 = 'default_global_RWSDC'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"

# change subfoldername
sed -i "s/config.subfoldername = 'DPARSFA_default_global_RWSDC';/config.subfoldername = 'DPARSFA_default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

# change logfilename
sed -i "s/config.reportname1 = 'default_global_RWSDC';/config.reportname1 = 'default_global_RWSDCF';/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m
sed -i "s/config.reportname2 = 'default_global_RWSDC'/config.reportname2 = 'default_global_RWSDCF'/g" /home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m

matlab -nodisplay -nodisplay -nosplash -nodesktop -r "run('/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/queue_DPARSFA.m');exit;"
