%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Bias-Wrecker Relationship
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all
addpath('0library')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Labels and Data
PM = {'JK', 'NK', 'TY', 'WY',  'JH', 'CS'};
PMf = {'Jun. K', 'Nichkhun', 'Taecyeon', 'Wooyoung',  'Junho', 'Chansung'};

% Matrix for Member Colors
PMcol = [253/255, 90/255, 221/255;
    1, 0, 0;
    0, 176/255, 80/255;
    0, 112/255, 192/255;
    1, 192/255, 0;
    112/255, 48/255, 160/255];

% Data Matrix : Wrecker Given Bias
% Row: wrecker
% Col: bias
pw = [4	10	10	5	30	11
    1	1	16	9	11	6
    10	12	10	11	24	13
    13	6	22	16	50	14
    9	7	48	19	8	17
    19	10	22	20	42	2];

% Data Matrix : Bias Given Wrecker
% Row: bias
% Col: wrecker
pb = [4	1	10	13	9	19
    10	1	12	6	7	10
    10	16	10	22	48	22
    5	9	11	16	19	20
    30	11	24	50	8	42
    11	6	13	14	17	2];

% Data Matrix : Wrecker Given Bias (OB-YB)
% Row: wrecker
% Col: bias
obyb = [59	120
    156	162];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Data Matrix
for si=1:6
    % plot Wrecker Given Bias
    figure
    dt = pw(:,si);
    pcol = PMcol;
    h = pie(dt);
    colormap(pcol)
    title(['If your bias is *', PMf{si}, '*, then your wrecker is...'])%,...
    set(gca, 'FontSize', 16)
    set(findobj(h,'type','text'),'fontsize',16)
    lg = legend(PM);
    lg.Location = 'east outside';
    lg.Box = 'off';

    % plot Bias Given Wrecker
    figure
    dt = pb(:,si);
    pcol = PMcol;
    h = pie(dt);
    colormap(pcol)
    title(['If your wrecker is *', PMf{si}, '*, then your bias is...'])%,...
    set(gca, 'FontSize', 16)
    set(findobj(h,'type','text'),'fontsize',16)
    lg = legend(PM);
    lg.Location = 'east outside';
    lg.Box = 'off';
end

% plot distribution of Bias = Wrecker responses
figure
h = pie([4	1	10	16	8	2]);
colormap(PMcol)
title('Bias = Bias Wrecker')
set(gca, 'FontSize', 16)
set(findobj(h,'type','text'),'fontsize',16)
lg = legend(PM);
lg.Location = 'east outside';
lg.Box = 'off';

% plot OB-YB matrix
oy0 = [obyb; obyb'];
oy = oy0 ./ sum(oy0,2);
oy = oy([2, 4, 1, 3], :);
a = barh(oy, 'stacked');
colormap('summer')
lab = {'If wrecker is *YB*,\newlinethen bias is...',...
    'If bias is *YB*,\newlinethen wrecker is...',...
    'If wrecker is *OB*,\newlinethen bias is...',...
    'If bias is *OB*,\newlinethen wrecker is...'};
ax1 = gca;
ax1.FontSize = 16;
ax1.YTickLabel = lab;
ax1.XTick = [];
ax1.Box = 'off';
ax1.XAxis.Visible = 'off';
xline(0.5, '--', 'color', [0.45, 0.45, 0.45], 'LineWidth', 5) %ref line
lg = legend({'OB', 'YB'});
lg.Location = 'south outside';
lg.Box = 'off';
lg.Orientation = 'horizontal';
a(1).FaceColor = [0.8500 0.3250 0.0980];
a(1).EdgeColor = [0.8500 0.3250 0.0980];
a(2).FaceColor = [0.3010 0.7450 0.9330];
a(2).EdgeColor = [0.3010 0.7450 0.9330];
a(1).XData = [1 2 4 5];
a(2).XData = [1 2 4 5];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional Plots Not Included in Thread
% plot breakdown of bias
figure
h = pie([52	45	118	64	157	61]);
colormap(PMcol)
title('Bias Breakdown')
set(gca, 'FontSize', 16)
set(findobj(h,'type','text'),'fontsize',16)
lg = legend(PM);
lg.Location = 'east outside';
lg.Box = 'off';

% plot breakdown of wrecker
figure
h = pie([66	43	70	105	100	113]);
colormap(PMcol)
title('Wrecker Breakdown')
set(gca, 'FontSize', 16)
set(findobj(h,'type','text'),'fontsize',16)
lg = legend(PM);
lg.Location = 'east outside';
lg.Box = 'off';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%