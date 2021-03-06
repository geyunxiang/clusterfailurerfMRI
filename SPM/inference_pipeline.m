function inference_pipeline(config)

close all

voxel_size = 2;
DATA_ROOT = '/media/geyx/Data/Data/';
BK = '/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/';
addpath('/media/geyx/Data/matlabtools/spm12')
addpath(BK)

%--------------------------------------------------------------------------
%% I. Specify dataset and parameters
%--------------------------------------------------------------------------

% subfoldername = 'setting1';
subfoldername = config.subfoldername;

% Cambridge
if strcmp(config.dataset, 'Cambridge')
    TR = 3;
    TRs = 119;
    study = 'Cambridge_Buckner';
    load randomEventsCambridge.mat
end

% Beijing
if strcmp(config.dataset, 'Beijing')
    TR = 2;
    TRs = 225;
    study = 'Beijing';
    load randomEventsBeijing.mat
end

fprintf(1, 'Running on dataset: %s.\n', config.dataset);

cd([DATA_ROOT study '/']);
subjects = dir;

preprocessing = config.preprocessing;

% pre processing parameters
% smoothingLevels = 4:2:10;
% experimentList = [1 2 3 4];
smoothingLevels = config.smoothingLevels;
experimentList = config.experimentList;

% DEFAULT: 4
% vary 1:6
% realign_est_sep = 4;
realign_est_sep = config.realign_est_sep;

% DEFAULT: 2
% vary 1:7
% realign_est_interp = 2;
realign_est_interp = config.realign_est_interp;

% DEFAULT: 4
% vary 0:7, Inf
% realign_ropt_interp = 4;
realign_ropt_interp = config.realign_ropt_interp;

% DEFAULT: 'nmi'
% vary 'mi' 'nmi' 'ecc'
% coreg_est_costfun = 'nmi'
coreg_est_costfun = config.coreg_est_costfun;

% DEFAULT: 3
% vary 1:5
% oldseg_samp = 3;
oldseg_samp = config.oldseg_samp;

% DEFAULT: 1
% vary 0:7
% oldnorm_interp = 1;
oldnorm_interp = config.oldnorm_interp;

% inference parameters
% CDT
clusterDefiningThreshold1 = 0.01;
clusterDefiningThreshold2 = 0.001;

% second level analyses group size
groupSize = 40;

% (smoothing level, CDT, experiment)
significantDifferences = zeros(7, 2, 4);

% (smoothing, comparison, (xyz estimate), experiment)
smoothnessEstimates = zeros(7, 1000, 3, 4);

% (comparison, CDT, experiment)
clusterSizes = zeros(1000, 2, 4);

errors = zeros(7, 4);

%--------------------------------------------------------------------------
%% III. First Level analyses
%--------------------------------------------------------------------------
fprintf(1, 'Entering First-level analyses region.\n');
cd([DATA_ROOT study '/']);
reportf = fopen(['/home/geyx/Documents/logs/reports/report-1st-' study '-' config.reportname1 '.txt'], 'w');

% #experiment, #smoothing, #CDT, #subjects
significantActivations = zeros(4, 16, 2, length(subjects) - 2);

analyses = 0;

for subject = 1:length(subjects) - 2

    analyses = analyses + 1;
    subjectString = subjects(subject+2).name;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CLASSICAL STATISTICAL ANALYSIS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for experiment = 1:length(experimentList)
        for smoothing = 1:length(smoothingLevels)
            smt = smoothingLevels(smoothing);
            expt = experimentList(experiment);
            fprintf(1, 'First level analyses for subject: %s (%d/%d). Smoothing: %d. Experiment %d. Study: %s.\n', ...
                subjectString, subject, length(subjects) - 2, smt, expt, study);

            if expt == 1
                % Boxcar 10
                experimentString = 'boxcar10';
            elseif expt == 2
                % Boxcar 30
                experimentString = 'boxcar30';
            elseif expt == 3
                % Event 1
                experimentString = 'event1';
            elseif expt == 4
                % Event 2
                experimentString = 'event2';
            end

            % Get t-map
            data_path = [DATA_ROOT study '/' subjectString '/func/' subfoldername '/spmT_' experimentString '_s' num2str(smt) '.nii'];
            V = spm_vol(data_path);
            [tmap, aa] = spm_read_vols(V);

            % Load SPM file (containing design specification and model parameter estimation)
            clear SPM
            data_path = [DATA_ROOT study '/' subjectString '/func/' subfoldername '/SPM_' experimentString '_s' num2str(smt) '.mat'];
            load(data_path);

            % Calculate cluster extent threshold, for first cluster
            % defining threshold
            [k, Pc] = corrclusth(SPM, clusterDefiningThreshold1, 0.05, 1:100000);
            % Apply cluster defining threshold 1
            STAT = 'T';
            df = [1 SPM.xX.erdf];
            u = spm_u(clusterDefiningThreshold1, df, STAT);
            indices = find(tmap > u);
            % Get size of largest cluster
            max_cluster = max_extent(tmap, indices);
            if max_cluster >= k
                significantActivations(expt, smt, 1, subject) = 1;
                disp('Significant activation detected!')
            end

            % Calculate cluster extent threshold, for second cluster
            % defining threshold
            [k, Pc] = corrclusth(SPM, clusterDefiningThreshold2, 0.05, 1:100000);
            % Apply cluster defining threshold 2
            STAT = 'T';
            df = [1 SPM.xX.erdf];
            u = spm_u(clusterDefiningThreshold2, df, STAT);
            indices = find(tmap > u);
            % Get size of largest cluster
            max_cluster = max_extent(tmap, indices);
            if max_cluster >= k
                significantActivations(expt, smt, 2, subject) = 1;
                disp('Significant activation detected!')
            end

            FWE1 = sum(significantActivations(expt, smt, 1, :)) / analyses;
            disp(sprintf('Current FWE is %f for %d mm of smoothing, experiment %d and first cluster defining threshold.\n', FWE1, smt, expt))
            fprintf(reportf, 'Current FWE is %f for %d mm of smoothing, experiment %d and first cluster defining threshold.\n', FWE1, smt, expt);
            
            FWE2 = sum(significantActivations(expt, smt, 2, :)) / analyses;
            disp(sprintf('Current FWE is %f for %d mm of smoothing, experiment %d and second cluster defining threshold.\n', FWE2, smt, expt))
            fprintf(reportf, 'Current FWE is %f for %d mm of smoothing, experiment %d and second cluster defining threshold.\n', FWE2, smt, expt);
        end % for smoothing = 4:2:10
    end % for experiment = [1 2 3 4]
end % for subject = 1:length(subjects) - 2
fclose(reportf);
fprintf(1, 'First-level analyses finished.\n');


%--------------------------------------------------------------------------
%% IV. Second Level analyses
%--------------------------------------------------------------------------
fprintf(1, 'Entering Second-level analyses region.\n');
reportf = fopen(['/home/geyx/Documents/logs/reports/report-2nd-' study '-' config.reportname2 '.txt'], 'w');

for experiment = 1:length(experimentList)
    expt = experimentList(experiment);
    if expt == 1
        experimentString = 'boxcar10';
    elseif expt == 2
        experimentString = 'boxcar30';
    elseif expt == 3
        experimentString = 'event1';
    elseif expt == 4
        experimentString = 'event2';
    end
    
    for smoothing = 1:length(smoothingLevels)

        % Do 1000 random group analyses for each smoothing
        for comparison = 1:1000
            
            disp(sprintf('Doing second level analysis %d/1000, exp %d. Study = %s, smoothing = %d mm.\n', comparison, expt, ...
                study, smoothingLevels(smoothing)))
            
            spm('Defaults', 'fMRI');
            spm_jobman('initcfg');

            spm_file = [DATA_ROOT 'tempgroup/classical1/SPM.mat'];
            if exist(spm_file, 'file') == 2
                system(['rm ' spm_file]);
            end
            
            % Read a random permutation from file
            filename = [BK '../' study '_permutations/permutation' num2str(comparison) '.txt'];
            fileID = fopen(filename);
            C = textscan(fileID, '%s');
            fclose(fileID);

            clear jobs
            job = 1;
            data_path = [DATA_ROOT 'tempgroup/classical1/'];
            jobs{job}.cfg_basicio.file_dir.dir_ops.cfg_cd.dir = cellstr(data_path);
            jobs{job}.cfg_basicio.file_dir.dir_ops.cfg_named_dir.name = 'classical1';
            jobs{job}.cfg_basicio.file_dir.dir_ops.cfg_named_dir.dirs = {{data_path}};
            
            % Setup group 1
            group1 = {};
            for s = 1:groupSize
                subjectString = C{1}(s);
                subjectString = subjectString{1};
                filename = [DATA_ROOT study '/' subjectString '/func/' subfoldername '/con_' experimentString '_s' num2str(smoothingLevels(smoothing)) '.nii,1'];
                group1{s} = filename;
            end
            group1 = reshape(group1, [length(group1) 1]);

            % Setup statistical analysis
            job = job + 1;
            jobs{job}.spm.stats.factorial_design.dir = cellstr(data_path);
            jobs{job}.spm.stats.factorial_design.des.t1.scans = group1;
            jobs{job}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
            jobs{job}.spm.stats.factorial_design.masking.tm.tm_none = 1;
            jobs{job}.spm.stats.factorial_design.masking.im = 1;
            jobs{job}.spm.stats.factorial_design.masking.em = {''};
            jobs{job}.spm.stats.factorial_design.globalc.g_omit = 1;
            jobs{job}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
            jobs{job}.spm.stats.factorial_design.globalm.glonorm = 1;
            
            % Estimate
            job = job + 1;
            jobs{job}.spm.stats.fmri_est.spmmat = {[data_path 'SPM.mat']};
            jobs{job}.spm.stats.fmri_est.method.Classical = 1;
            
            % Setup contrast
            job = job + 1;
            jobs{job}.spm.stats.con.spmmat = {[data_path 'SPM.mat']};
            jobs{job}.spm.stats.con.consess{1}.tcon = struct('name', 'group 1 > 0', 'convec',  1, 'sessrep', 'none');
            
            % Look at results
            %jobs{2}.stats{4}.results.spmmat = {'D:\fcon1000\tempgroup\classical1\SPM.mat'};
            %jobs{2}.stats{4}.results.conspec.contrasts = Inf;
            %jobs{2}.stats{4}.results.conspec.threshdesc = 'none';
            %jobs{2}.stats{4}.results.conspec.thresh = clusterDefiningThreshold; % uncorrected voxel threshold
            %jobs{2}.stats{4}.results.conspec.extent = 0;
            %jobs{2}.stats{4}.results.print = false;

            try
                spm_jobman('run', jobs);

                % Get t-map
                filename = [data_path 'spmT_0001.nii'];
                V = spm_vol(filename);
                [tmap, aa] = spm_read_vols(V);
                
                clear SPM
                load SPM.mat

                %------------

                % Calculate cluster extent threshold 1
                [k, Pc] = corrclusth(SPM, clusterDefiningThreshold1, 0.05, 1:100000);
                
                % Apply cluster defining threshold 1
                STAT = 'T';
                df   = [1 SPM.xX.erdf];
                u = spm_u(clusterDefiningThreshold1, df, STAT);
                indices = find(tmap>u);
                
                % Get size of largest cluster
                max_cluster = max_extent(tmap,  indices);
                
                clusterSizes(comparison, 1, expt) = max_cluster;
                
                if max_cluster >= k
                    significantDifferences(smoothing, 1, expt) = significantDifferences(smoothing, 1, expt) + 1;
                    disp('Significant group activation detected!')
                end
                
                FWE1 = significantDifferences(smoothing, 1, expt) / comparison;
                disp(sprintf('Current FWE 1 is %f for %d mm of smoothing \n', FWE1, smoothingLevels(smoothing)))
                fprintf(reportf, 'Current FWE 1 is %f for %d mm of smoothing, experiment %d and first cluster defining threshold.\n', ...
                    FWE1, smoothingLevels(smoothing), expt);
                
                %------------
                
                % Calculate cluster extent threshold 2
                [k, Pc] = corrclusth(SPM, clusterDefiningThreshold2, 0.05, 1:100000);
                
                % Apply cluster defining threshold 2
                STAT = 'T';
                df   = [1 SPM.xX.erdf];
                u = spm_u(clusterDefiningThreshold2, df, STAT);
                indices = find(tmap>u);
                
                % Get size of largest cluster
                max_cluster = max_extent(tmap,  indices);
                
                clusterSizes(comparison, 2, expt) = max_cluster;
                
                if max_cluster >= k
                    significantDifferences(smoothing, 2, expt) = significantDifferences(smoothing, 2, expt) + 1;
                    disp('Significant group activation detected!')
                end
                
                FWE2 = significantDifferences(smoothing, 2, expt) / comparison;
                disp(sprintf('Current FWE 2 is %f for %i mm of smoothing \n', FWE2, smoothingLevels(smoothing)))
                fprintf(reportf, 'Current FWE 2 is %f for %d mm of smoothing, experiment %d and second cluster defining threshold.\n', ...
                    FWE2, smoothingLevels(smoothing), expt);
                
                %------------
                
                xsmoothness = SPM.xVol.FWHM(1) * abs(SPM.xVol.M(1, 1));
                ysmoothness = SPM.xVol.FWHM(2) * abs(SPM.xVol.M(2, 2));
                zsmoothness = SPM.xVol.FWHM(3) * abs(SPM.xVol.M(3, 3));
                smoothnessEstimates(smoothing, comparison, :, expt) = [xsmoothness ysmoothness zsmoothness];
                
            catch ME
                disp('Error detected!')
                fprintf(1, 'error message: %s\n', ME.identifier);
                fprintf(reportf, 'error detected!Error message: %s\n\n', ME.identifier);

                errors(smoothing, expt) = errors(smoothing, expt) + 1;
                
                FWE1 = significantDifferences(smoothing, 1, expt) / comparison;
                disp(sprintf('Current FWE 1 is %f for %i mm of smoothing \n', FWE1, smoothingLevels(smoothing)))
                fprintf(reportf, 'Current FWE 1 is %f for %d mm of smoothing, experiment %d and first cluster defining threshold.\n', ...
                    FWE1, smoothingLevels(smoothing), expt);
                
                FWE2 = significantDifferences(smoothing, 2, expt) / comparison;
                disp(sprintf('Current FWE 2 is %f for %i mm of smoothing \n', FWE2, smoothingLevels(smoothing)))
                fprintf(reportf, 'Current FWE 2 is %f for %d mm of smoothing, experiment %d and second cluster defining threshold.\n', ...
                    FWE2, smoothingLevels(smoothing), expt);
                fprintf(reportf, 'Error handled.\n\n');
            end % try
        end %for comparison = 1:1000
        fprintf(reportf, '%d errors for %d mm of smoothing, experiment %d.\n', errors(smoothing, expt), smoothingLevels(smoothing), expt);
    end % for smoothing = 1:length(smoothingLevels)
end % for experiment = 1:4
fclose(reportf);
fprintf(1, 'Second-level analyses finished.\n');
