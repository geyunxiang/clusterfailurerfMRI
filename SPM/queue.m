% process queue
clear all;
close all;

logfilename = sprintf('log-%s.txt', datetime);
logfilepath = ['/home/geyx/Documents/logs/' logfilename];

fd = fopen(logfilepath, 'a');
config.logfilepath = logfilepath;
fprintf(fd, '%s  Filename: queue.m.\n', datetime);
fprintf(fd, '%s  Initializing default parameters.\n', datetime);

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

% reportf = fopen(['/home/geyx/tmp/report-1st-' study '-' config.report1 '.txt'], 'w');
config.reportname1 = 'default';
config.reportname2 = 'default';

config.smoothingLevels = [6];
config.experimentList = [3];

fprintf(fd, '%s  Starting.\n', datetime);
fclose(fd);
%{
for m = 5:5
	config.realign_est_sep = m;
	config.reportname1 = ['reestsep' int2str(m)];
	config.reportname2 = ['reestsep' int2str(m)];
	config.subfoldername = ['reestsep' int2str(m)];
	fd = fopen(logfilepath, 'a');
	fprintf(fd, '%s  Running preprocess_pipeline with realign_est_sep = %d.\n', datetime, m);
	fclose(fd);
	preprocess_pipeline(config, 140+1, 198);
	fd = fopen(logfilepath, 'a');
	fprintf(fd, '%s  Running preprocess_pipeline with realign_est_sep = %d finished.\n', datetime, m);
	fclose(fd);
	% process_pipeline(config);
	fd = fopen(logfilepath, 'a');
	inference_pipeline(config);
	fprintf(fd, '%s  Running inference_pipeline with realign_est_sep = %d finished.\n', datetime, m);
	fclose(fd);
end
config.realign_est_sep = 4;
pause;

for m = 1:7
	config.realign_est_interp = m;
	config.reportname1 = ['reestinterp' int2str(m)];
	config.reportname2 = ['reestinterp' int2str(m)];
	config.subfoldername = ['reestinterp' int2str(m)];
	process_pipeline(config);
	fprintf(fd, 'config.realign_est_interp = %d done. At %s.\n', m, datetime);
end
config.realign_est_interp = 2;

for m = 0:7
	config.realign_ropt_interp = m;
	config.reportname1 = ['reroptinterp' int2str(m)];
	config.reportname2 = ['reroptinterp' int2str(m)];
	config.subfoldername = ['reroptinterp' int2str(m)];
	process_pipeline(config);
	fprintf(fd, 'config.realign_ropt_interp = %d done. At %s.\n', m, datetime);
end
config.realign_ropt_interp = 4;

config.coreg_est_costfun = 'mi';
config.reportname1 = ['coregest-' 'mi'];
config.reportname2 = ['coregest-' 'mi'];
config.subfoldername = ['coregest-' 'mi'];
process_pipeline(config);
fprintf(fd, 'config.coreg_est_costfun = %s done. At %s.\n', config.coreg_est_costfun, datetime);

config.coreg_est_costfun = 'ecc';
config.reportname1 = ['coregest-' 'ecc'];
config.reportname2 = ['coregest-' 'ecc'];
config.subfoldername = ['coregest-' 'ecc'];
process_pipeline(config);
fprintf(fd, 'config.coreg_est_costfun = %s done. At %s.\n', config.coreg_est_costfun, datetime);

config.coreg_est_costfun = 'nmi';
%}
% for m = 1:5
for m = 1:1
	config.oldseg_samp = m;
	config.reportname1 = ['oldsegsamp' int2str(m)];
	config.reportname2 = ['oldsegsamp' int2str(m)];
	config.subfoldername = ['oldsegsamp' int2str(m)];
	fd = fopen(logfilepath, 'a');
	fprintf(fd, '%s  Running preprocess_pipeline with oldseg_samp = %d.\n', datetime, m);
	fclose(fd);
	preprocess_pipeline(config, 151, 198, 4);
	% process_pipeline(config);
	fd = fopen(logfilepath, 'a');
	fprintf(fd, 'config.oldseg_samp = %d done. At %s.\n', m, datetime);
	fclose(fd);
end
pause;
config.oldseg_samp = 3;

for m = 0:7
	config.oldnorm_interp = m;
	config.reportname1 = ['oldnorminterp' int2str(m)];
	config.reportname2 = ['oldnorminterp' int2str(m)];
	config.subfoldername = ['oldnorminterp' int2str(m)];
	process_pipeline(config);
	fprintf(fd, 'config.oldnorm_interp = %d done. At %s.\n', m, datetime);
end
config.oldnorm_interp = 1;

