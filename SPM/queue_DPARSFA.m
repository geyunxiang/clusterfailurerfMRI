% queue following DPARSFA pre-processed data

close all;

BK = '~/Documents/SeniorResearch/ParametricMultisubjectfMRI/SPM';

logfilename = sprintf('log-%s.txt', datetime);
logfilepath = ['/home/geyx/Documents/logs/' logfilename];

content = sprintf('%s  Filename: queue_DPARSFA.m.\n', datetime);
myLog(logfilepath, content);
content = sprintf('%s  Initializing default parameters.\n', datetime);
myLog(logfilepath, content);

config.logfilepath = logfilepath;
config.subfoldername = 'setting1';

% dataset: Cambridge, Beijing
config.dataset = 'Beijing';

config.preprocessing = 1;

% pre processing parameters
% smoothingLevels = 4:2:10;
% experimentList = [1 2 3 4];
config.smoothingLevels = [4 6 8 10];
config.experimentList = [1 2 3 4];

% DEFAULT: 4
% vary 1:6
% realign_est_sep = 4;
config.realign_est_sep = 4;

% DEFAULT: 2
% vary 1:7
% realign_est_interp = 2;
config.realign_est_interp = 2;

% DEFAULT: 4
% vary 0:7, Inf
% realign_ropt_interp = 4;
config.realign_ropt_interp = 4;

% DEFAULT: 'nmi'
% vary 'mi' 'nmi' 'ecc'
% coreg_est_costfun = 'nmi'
config.coreg_est_costfun = 'nmi';

% DEFAULT: 3
% vary 1:5
% oldseg_samp = 3;
config.oldseg_samp = 3;

% DEFAULT: 1
% vary 0:7
% oldnorm_interp = 1;
config.oldnorm_interp = 1;

% reportf = fopen(['/home/geyx/tmp/report-1st-' config.dataset '-' config.report1 '.txt'], 'w');
config.reportname1 = 'default';
config.reportname2 = 'default';

config.smoothingLevels = [6];
config.experimentList = [3];

content = sprintf('%s  Starting.\n', datetime);
myLog(logfilepath, content);

config.subfoldername = 'DPARSFA_10point_global_RWSDCF';
config.reportname1 = 'DPARSFA_10point_global_RWSDCF';
config.reportname2 = 'DPARSFA_10point_global_RWSDCF'
content = sprintf('%s  subfoldername: DPARSFA_10point_global_RWSDCF.\n', datetime);
myLog(logfilepath, content);
% perform classical statistical analysis

parfor n = 1:8
% for n = 1:8
	startsubj = 1 + (n - 1) * 25;
	endsubj = n*25;
	if n == 8
		endsubj = 198;
	end
	cls_analysis_pipeline(config, startsubj, endsubj, n);
end
% cls_analysis_pipeline(config, 198, 198, 1);
content = sprintf('%s  Classical statistical analysis finished.\n', datetime);
myLog(logfilepath, content);

% fprintf(1, '%s Program paused.\n', datetime);
% pause;

% perform fist level analysis

first_level_inference(config);

content = sprintf('%s  First level analysis finished.\n', datetime);
myLog(logfilepath, content);

% perform second level analysis

significantDifferences = zeros(8, 7, 2, 4);
errors = zeros(8, 7, 4);

parfor n = 1:8
	comp_start = 1 + (n - 1) * 125;
	comp_end = n * 125;
	[significantDifferences(n, :, :, :), errors(n, :, :)] = second_level_inference(config, comp_start, comp_end, n);
end
content = sprintf('%s  Sum of significantDifferences: %d first cluster.\n', datetime, sum(significantDifferences(:, 1, 1, 3)));
myLog(logfilepath, content);
content = sprintf('%s  Sum of significantDifferences: %d second cluster.\n', datetime, sum(significantDifferences(:, 1, 2, 3)));
myLog(logfilepath, content);
content = sprintf('%s  Errors: %d.\n', datetime, sum(errors(:, 1, 3)));
myLog(logfilepath, content);
reportf = fopen(['/home/geyx/Documents/logs/reports/report-2nd-' config.dataset '-' config.reportname2 '.txt'], 'w');
FWE1 = sum(significantDifferences(:, 1, 1, 3)) / 1000;
fprintf(reportf, 'Current FWE 1 is %f for 6 mm of smoothing, experiment 3 and first cluster defining threshold.\n', FWE1);
FWE2 = sum(significantDifferences(:, 1, 2, 3)) / 1000;
fprintf(reportf, 'Current FWE 2 is %f for 6 mm of smoothing, experiment 3 and second cluster defining threshold.\n', FWE2);
fprintf(reportf, 'Errors: %d.\n', sum(errors(:, 1, 3)));
fclose(reportf);

fprintf(1, '%s Finished.\n', datetime);
