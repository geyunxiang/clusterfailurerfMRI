% test script for classical analysis pipeline

config.subfoldername = 'DPARSFA_default';

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

cls_analysis_pipeline(config, 1, 1, 0)