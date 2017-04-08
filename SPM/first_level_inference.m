% first level inference
function first_level_inference(config)

close all

voxel_size = 2;
DATA_ROOT = '/media/geyx/Data/Data/';
BK = '/home/geyx/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM/';
addpath('/media/geyx/Data/matlabtools/spm12')
addpath(BK)

%--------------------------------------------------------------------------
%% I. Specify dataset and parameters
%--------------------------------------------------------------------------

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
smoothingLevels = config.smoothingLevels;
experimentList = config.experimentList;
realign_est_sep = config.realign_est_sep;
realign_est_interp = config.realign_est_interp;
realign_ropt_interp = config.realign_ropt_interp;
coreg_est_costfun = config.coreg_est_costfun;
oldseg_samp = config.oldseg_samp;
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

% second level errors
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
