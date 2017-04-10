% process queue
clear all;
close all;

logfilename = sprintf('log-%s.txt', datetime);
logfilepath = ['/home/geyx/Documents/logs/' logfilename];

content = sprintf('%s  Filename: queue_par_subjects.m.\n', datetime);
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

%{
for m = 6:6
	config.realign_est_sep = m;
	config.reportname1 = ['reestsep' int2str(m)];
	config.reportname2 = ['reestsep' int2str(m)];
	config.subfoldername = ['reestsep' int2str(m)];
	content = sprintf('%s  Running preprocess_pipeline with realign_est_sep = %d.\n', datetime, m);
	myLog(logfilepath, content);

	parfor n = 1:8
		startsubj = 1 + (n - 1) * 25;
		endsubj = n*25;
		if n == 8
			endsubj = 198;
		end
		preprocess_pipeline(config, startsubj, endsubj, n);
	end

	content = sprintf('%s  Running preprocess_pipeline with realign_est_sep = %d finished.\n', datetime, m);
	myLog(logfilepath, content);
	
	inference_pipeline(config);
	content = sprintf('%s  Running inference_pipeline with realign_est_sep = %d finished.\n', datetime, m);
	myLog(logfilepath, content);
end
config.realign_est_sep = 4;
pause;
%}

significantDifferences = zeros(8, 7, 2, 4);
errors = zeros(8, 7, 4);

%{
for m = 4:7
	if m == 2
		continue;
	end
	config.realign_est_interp = m;
	config.reportname1 = ['reestinterp' int2str(m)];
	config.reportname2 = ['reestinterp' int2str(m)];
	config.subfoldername = ['reestinterp' int2str(m)];
	content = sprintf('%s  Running preprocess_pipeline with realign_est_interp = %d.\n', datetime, m);
	myLog(logfilepath, content);

	parfor n = 1:8
		startsubj = 1 + (n - 1) * 25;
		endsubj = n*25;
		if n == 8
			endsubj = 198;
		end
		preprocess_pipeline(config, startsubj, endsubj, n);
	end

	content = sprintf('%s  Running preprocess_pipeline with realign_est_interp = %d finished.\n', datetime, m);
	myLog(logfilepath, content);
	
	first_level_inference(config);

	content = sprintf('%s  Running second_level_inference with realign_est_interp = %d.\n', datetime, m);
	myLog(logfilepath, content);

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
	err = sum(errors(:, 1, 3));
	fprintf(reportf, 'Errors: %d.\n', err);
	fclose(reportf);

	% inference_pipeline(config);
	content = sprintf('%s  Running second_level_inference with realign_est_interp = %d finished.\n', datetime, m);
	myLog(logfilepath, content);
	% fprintf(1, 'paused.\n');
	% pause;
end
config.realign_est_interp = 2;
%}

for m = 3:7
	if m == 4
		continue;
	end
	config.realign_ropt_interp = m;
	config.reportname1 = ['reroptinterp' int2str(m)];
	config.reportname2 = ['reroptinterp' int2str(m)];
	config.subfoldername = ['reroptinterp' int2str(m)];
	content = sprintf('%s  Running preprocess_pipeline with realign_ropt_interp = %d.\n', datetime, m);
	myLog(logfilepath, content);

	parfor n = 1:8
		startsubj = 1 + (n - 1) * 25;
		endsubj = n*25;
		if n == 8
			endsubj = 198;
		end
		preprocess_pipeline(config, startsubj, endsubj, n);
	end

	content = sprintf('%s  Running preprocess_pipeline with realign_ropt_interp = %d finished.\n', datetime, m);
	myLog(logfilepath, content);
	
	first_level_inference(config);

	content = sprintf('%s  Running second_level_inference with realign_ropt_interp = %d.\n', datetime, m);
	myLog(logfilepath, content);

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
	fclose(reportf);

	% inference_pipeline(config);
	content = sprintf('%s  Running second_level_inference with realign_ropt_interp = %d finished.\n', datetime, m);
	myLog(logfilepath, content);
end
config.realign_ropt_interp = 4;

config.coreg_est_costfun = 'mi';
config.reportname1 = ['coregest-' 'mi'];
config.reportname2 = ['coregest-' 'mi'];
config.subfoldername = ['coregest-' 'mi'];

content = sprintf('%s  Running preprocess_pipeline with coreg_est_costfun = mi.\n', datetime);
myLog(logfilepath, content);

parfor n = 1:8
	startsubj = 1 + (n - 1) * 25;
	endsubj = n*25;
	if n == 8
		endsubj = 198;
	end
	preprocess_pipeline(config, startsubj, endsubj, n);
end

content = sprintf('%s  Running preprocess_pipeline with coreg_est_costfun = mi finished.\n', datetime);
myLog(logfilepath, content);

first_level_inference(config);

content = sprintf('%s  Running second_level_inference with coreg_est_costfun = mi.\n', datetime);
myLog(logfilepath, content);

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
fclose(reportf);

% inference_pipeline(config);
content = sprintf('%s  Running second_level_inference with coreg_est_costfun = mi finished.\n', datetime);
myLog(logfilepath, content);

config.coreg_est_costfun = 'ecc';
config.reportname1 = ['coregest-' 'ecc'];
config.reportname2 = ['coregest-' 'ecc'];
config.subfoldername = ['coregest-' 'ecc'];

content = sprintf('%s  Running preprocess_pipeline with coreg_est_costfun = ecc.\n', datetime);
myLog(logfilepath, content);

parfor n = 1:8
	startsubj = 1 + (n - 1) * 25;
	endsubj = n*25;
	if n == 8
		endsubj = 198;
	end
	preprocess_pipeline(config, startsubj, endsubj, n);
end

content = sprintf('%s  Running preprocess_pipeline with coreg_est_costfun = ecc finished.\n', datetime);
myLog(logfilepath, content);

first_level_inference(config);

content = sprintf('%s  Running second_level_inference with coreg_est_costfun = ecc.\n', datetime);
myLog(logfilepath, content);

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
fclose(reportf);

% inference_pipeline(config);
content = sprintf('%s  Running second_level_inference with coreg_est_costfun = ecc finished.\n', datetime);
myLog(logfilepath, content);

config.coreg_est_costfun = 'nmi';

% for m = 1:5
for m = 2:5
	if m == 3
		continue;
	end
	config.oldseg_samp = m;
	config.reportname1 = ['oldsegsamp' int2str(m)];
	config.reportname2 = ['oldsegsamp' int2str(m)];
	config.subfoldername = ['oldsegsamp' int2str(m)];



	content = sprintf('%s  Running preprocess_pipeline with oldseg_samp = %d.\n', datetime, m);
	myLog(logfilepath, content);

	parfor n = 1:8
		startsubj = 1 + (n - 1) * 25;
		endsubj = n*25;
		if n == 8
			endsubj = 198;
		end
		preprocess_pipeline(config, startsubj, endsubj, n);
	end
	content = sprintf('%s  Running preprocess_pipeline with oldseg_samp = %d finished.\n', datetime, m);
	myLog(logfilepath, content);

	first_level_inference(config);

	content = sprintf('%s  Running second_level_inference with oldseg_samp = %d.\n', datetime, m);
	myLog(logfilepath, content);

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
	fclose(reportf);

	% inference_pipeline(config);
	content = sprintf('%s  Running second_level_inference with oldseg_samp = %d finished.\n', datetime, m);
	myLog(logfilepath, content);
end
% pause;
config.oldseg_samp = 3;

for m = 0:7
	if m == 1
		continue;
	end
	config.oldnorm_interp = m;
	config.reportname1 = ['oldnorminterp' int2str(m)];
	config.reportname2 = ['oldnorminterp' int2str(m)];
	config.subfoldername = ['oldnorminterp' int2str(m)];
	content = sprintf('%s  Running preprocess_pipeline with oldnorm_interp = %d.\n', datetime, m);
	myLog(logfilepath, content);
	parfor n = 1:8
		startsubj = 1 + (n - 1) * 25;
		endsubj = n*25;
		if n == 8
			endsubj = 198;
		end
		preprocess_pipeline(config, startsubj, endsubj, n);
	end
	content = sprintf('%s  Running preprocess_pipeline with oldnorm_interp = %d finished.\n', datetime, m);
	myLog(logfilepath, content);

	first_level_inference(config);

	content = sprintf('%s  Running second_level_inference with oldnorm_interp = %d.\n', datetime, m);
	myLog(logfilepath, content);

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
	fclose(reportf);

	% inference_pipeline(config);
	content = sprintf('%s  Running second_level_inference with oldnorm_interp = %d finished.\n', datetime, m);
	myLog(logfilepath, content);
end
config.oldnorm_interp = 1;
