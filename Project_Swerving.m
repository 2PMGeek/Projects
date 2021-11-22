%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Bias-Wrecker Relationship
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all
addpath('0library') %imported alluvialflow, pointbiserial

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Labels and Data
PM = {'JK', 'NK', 'TY', 'WY',  'JH', 'CS'};

% Matrix for Member Colors
PMcol = [253/255, 90/255, 221/255;
    1, 0, 0;
    0, 176/255, 80/255;
    0, 112/255, 192/255;
    1, 192/255, 0;
    112/255, 48/255, 160/255];
PMcols = PMcol([6,1:5],:); %reordered for better plot

% Data Matrix : First Bias Given Current Bias
% Row: first bias 
% Col: current bias (w/ first col as "didn't change") 
data = [13	1	0	2	1	2	3
    12	3	6	1	7	6	5
    41	13	6	19	18	27	13
    18	5	1	1	7	4	3
    34	2	0	1	5	31	9
    13	2	0	1	4	1	8];
% added "didn't change" to proper column
pogc = diag(data(:,1)) + data(:, 2:end); 

% Data Matrix : First Bias Given Year
% Row: first bias 
% Col: year of becoming hottest (entry year), 2008-2021
data_yr = [1	1	2	2	0	1	3	0	1	3	0	0	3	5
    1	1	5	3	3	4	2	0	4	1	0	1	6	9
    2	3	3	6	4	5	5	2	4	5	2	4	15	77
    1	4	4	4	3	2	1	0	0	0	0	0	10	10
    2	4	6	3	1	2	0	3	1	3	3	2	16	36
    0	2	3	1	2	3	0	1	0	0	1	2	2	12];
pogy = data_yr ./ sum(data_yr); %normalized per year
pyrb = data_yr ./ sum(data_yr, 2); %normalized per bias
pyr = sum(data_yr) ./ sum(data_yr, 'all'); %overall entry year distribution

% Data Matrix : Swerving Status
% Row : year
% Col: Did Not Swerve, Swerved (total), Swerved (Went Back), Swerved
% (Changed)
spy = [3	4	2	2
    8	7	4	3
    8	15	4	11
    9	10	3	7
    4	9	4	5
    7	10	4	6
    7	4	0	4
    1	5	2	3
    2	8	2	6
    9	3	1	2
    3	3	1	2
    1	8	4	4
    20	32	14	18
    49	100	27	73];
spy = spy(:, [1,3,4]) ./ sum(spy(:, [1,3,4]), 2); %removed redundant col

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Data Matrix
% plot swerving direction of all members
figure
alluvialflow(pogc, PM, PM,...
    'First Bias \rightarrow Current Bias', PMcols, 18);

% plot swerving status, per year
% status: did not swerve, swerved (went back), swerved (changed bias)
figure
a = barh(spy, 'stacked');
ax1 = gca;
ax1.FontSize = 16;
ax1.YTickLabel = num2cell(2008:2021);
ax1.YLabel.String = 'Year of becoming Hottest';
ax1.YLabel.FontWeight = 'bold';
ax1.XTick = [];
a(1).FaceColor = [0.8500 0.3250 0.0980];
a(1).EdgeColor = [0.8500 0.3250 0.0980];
a(2).FaceColor = 0.6*[0.3010 0.7450 0.9330];
a(2).EdgeColor = 0.6*[0.3010 0.7450 0.9330];
a(3).FaceColor = [0.3010 0.7450 0.9330];
a(3).EdgeColor = [0.3010 0.7450 0.9330];
lg = legend({'No', 'Yes, but went back', 'Yes'});
lg.Location = 'south outside';
lg.Box = 'off';
lg.Orientation = 'horizontal';
title('\bf Have you ever changed bias?', 'FontSize', 18)

% plot swerving status, in total
% status: did not swerve, swerved (went back), swerved (changed bias)
figure
dt = [sum(data(:, 1)),...
    sum(diag(data(:, 2:end)), 'all'),...
    sum(data(:,2:end) - diag(diag(data(:, 2:end))), 'all')];
pcol = [0.8500 0.3250 0.0980;
    0.6*[0.3010 0.7450 0.9330];
    0.3010 0.7450 0.9330];
h1 = pie(dt);
colormap(pcol)
set(gca, 'FontSize', 18)
set(findobj(h1,'type','text'),'fontsize',18)
T = h1(strcmpi(get(h1,'Type'),'text'));
T(1).String = ['No : ', T(1).String];
T(2).String = {'Yes, but', ['went back : ', T(2).String]};
T(3).String = ['Yes : ', T(3).String];
title('\bf Have you ever changed bias?', 'FontSize', 18)

% prepare window for entry year distribution per bias
f1 = figure('Units', 'normalized',...
    'Position', [0.1300 0.1100 0.7750 0.6150]);

for pmi = 1:6
    % plot swerving direction per member, with emphasis on first bias
    figure
    alluvialflow(pogc, PM, PM,...
        {'\bf First Bias \rightarrow Current Bias',...
        ['\rm First Bias : ', PM{pmi}]},...
        PMcols, 18, pmi);

    % plot swerving direction per member, with emphasis on current bias
    figure
    alluvialflow(pogc, PM, PM,...
        {'\bf First Bias \rightarrow Current Bias',...
        ['\rm Current Bias : ', PM{pmi}]},...
        PMcols, 18, pmi, 1);
    
    % plot swerving status, given first bias
    % status: did not swerve, swerved (went back), swerved (changed bias)
    figure
    dt = [data(pmi, 1), data(pmi, pmi+1),...
        sum(data(pmi, [2:pmi, pmi+2:end]))]; %other biases merged
    pcol = PMcol;
    h1 = pie(dt);
    colormap([pcol(pmi,:); 0.4*pcol(pmi,:); 0.25 0.25 0.25])
    set(gca, 'FontSize', 18)
    set(findobj(h1,'type','text'),'fontsize',18)
    T = h1(strcmpi(get(h1,'Type'),'text'));
    T(1).String = ['No : ', T(1).String];
    T(2).String = {'Yes, but', ['went back : ', T(2).String]};
    T(3).String = ['Yes : ', T(3).String];
    title({'\bf Have you ever changed bias?',...
        ['\rm First Bias : ', PM{pmi}]},...
        'FontSize', 18)

    % plot swerving status, given current bias
    % status: did not swerve, swerved (went back), swerved (changed bias)
    figure
    dt = [data(pmi, 1), data(pmi, pmi+1),...
        sum(data([1:pmi-1, pmi+1:end], pmi+1))]; %other biases merged
    pcol = PMcol;
    h1 = pie(dt);
    colormap([pcol(pmi,:); 0.4*pcol(pmi,:); 0.25 0.25 0.25])
    set(gca, 'FontSize', 18)
    set(findobj(h1,'type','text'),'fontsize',16)
    T = h1(strcmpi(get(h1,'Type'),'text'));
    T(1).String = ['Yes : ', T(1).String];
    T(2).String = {'Yes, but', 'swerved in', ['between : ', T(2).String]};
    T(3).String = ['No : ', T(3).String];
    title({'\bf Is your current bias your first bias?',...
        ['\rm Current Bias : ', PM{pmi}]},...
        'FontSize', 18)
    
    % plot entry year distribution for each bias
    % including overall distribution
    figure(f1)
    subplot(2,3,pmi)
    dt = pyrb(pmi,:);
    pcol = PMcol(pmi,:);
    h = plot(dt, 'Color',pcol, 'LineWidth',3,...
        'MarkerSize',30, 'Marker','.');
    hold on
    h1 = plot(pyr, 'Color',[0.7 0.7 0.7], 'LineWidth',3,...
        'LineStyle','--'); % overall distribution plot
    ax1 = gca;
    ax1.FontSize = 12;
    ax1.XTickLabel = vertcat(strseq("'0",8:9), strseq("'",10:21));
    ax1.XLim = [1 14];
    ax1.YLim = [0 0.6];
    ax1.XTick = 1:14;
    ax1.YLabel.String = 'Proportion';
    ax1.XLabel.String = 'Year of becoming Hottest';
    ax1.XLabel.FontWeight = 'bold';
    ax1.YLabel.FontWeight = 'bold';
    ax1.YTickLabel = {'0%', '10%', '20%', '30%',...
        '40%', '50%', '60%'};
    lg = legend({PM{pmi}, 'Overall'});
    lg.Location = 'north';
    lg.Box = 'off';
    sgtitle('Given a first bias, how are Hottest distributed per year?',...
        'FontSize', 18, 'FontWeight', 'bold')
end

% Plot bias distribution per entry year 
figure('Units', 'normalized', 'Position', [0.1300 0.1100 0.7750 0.6150]);
b = bar(pogy', 'stacked');
ax1 = gca;
ax1.FontSize = 18;
ax1.XTickLabel = num2cell(2008:2021);
ax1.YLim = [0 1];
ax1.YTick = [0 1];
ax1.YTickLabel = {'0%', '100%'};
ax1.YLabel.String = 'Proportion';
ax1.XLabel.String = 'Year of becoming Hottest';
ax1.XLabel.FontWeight = 'bold';
ax1.YLabel.FontWeight = 'bold';
for bi = 1:6
    b(bi).FaceColor = PMcol(bi,:);
    b(bi).EdgeColor = PMcol(bi,:);
end
title('Given a year, how are Hottest distributed per first biases?',...
    'FontSize', 18)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional Tests Not Included in Thread
% Data Matrix : Swerving Status
% Row: response
% Col1: Year
% Col2: Did Not Swerve (0) or Swerved (1)
rsp = [2010	1
2013	1
2013	1
2015	1
2019	1
2021	1
2021	1
2021	1
2009	0
2009	0
2010	0
2011	0
2013	0
2018	0
2020	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2010	1
2021	1
2019	1
2021	1
2012	1
2012	1
2020	1
2021	1
2010	1
2016	1
2021	1
2009	0
2010	0
2014	0
2014	0
2014	0
2017	0
2017	0
2017	0
2020	0
2020	0
2021	0
2021	0
2021	0
2020	1
2011	1
2011	1
2008	1
2013	1
2021	1
2015	1
2018	1
2020	1
2020	1
2021	1
2021	1
2021	1
2021	1
2021	1
2008	0
2009	0
2009	0
2009	0
2010	0
2010	0
2010	0
2011	0
2011	0
2012	0
2013	0
2013	0
2015	0
2017	0
2017	0
2017	0
2018	0
2020	0
2020	0
2020	0
2020	0
2020	0
2020	0
2020	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2016	1
2021	1
2008	1
2009	1
2010	1
2010	1
2010	1
2011	1
2015	1
2018	1
2019	1
2019	1
2020	1
2020	1
2020	1
2020	1
2020	1
2020	1
2020	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2008	1
2014	1
2020	1
2020	1
2021	1
2010	0
2010	0
2010	0
2011	0
2016	0
2019	0
2020	0
2020	0
2021	0
2021	0
2021	0
2021	0
2012	1
2020	1
2021	1
2010	1
2011	1
2013	1
2016	1
2021	1
2021	1
2009	1
2012	1
2012	1
2013	1
2013	1
2020	1
2010	1
2011	1
2013	1
2014	1
2016	1
2016	1
2017	1
2021	1
2015	1
2019	1
2019	1
2020	1
2020	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2008	0
2009	0
2011	0
2011	0
2012	0
2012	0
2013	0
2013	0
2014	0
2014	0
2014	0
2016	0
2017	0
2017	0
2017	0
2018	0
2020	0
2020	0
2020	0
2020	0
2020	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2011	1
2015	1
2020	1
2020	1
2020	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2009	1
2009	1
2010	1
2011	1
2012	1
2013	1
2013	1
2014	1
2016	1
2017	1
2018	1
2020	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2011	1
2019	1
2021	1
2021	1
2021	1
2021	1
2008	1
2011	1
2012	1
2016	1
2016	1
2017	1
2019	1
2020	1
2020	1
2020	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2010	1
2010	1
2013	1
2014	1
2020	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2021	1
2010	1
2020	1
2021	1
2008	0
2009	0
2011	0
2011	0
2011	0
2012	0
2013	0
2013	0
2014	0
2020	0
2020	0
2020	0
2021	0
2021	0
2021	0
2021	0
2021	0
2021	0
2009	1
2012	1
2020	1
2020	1
2021	1
2010	1
2010	1
2010	1
2020	1
2021	1
2020	1
2009	1
2009	1
2011	1
2012	1
2020	1
2020	1
2021	1];

% Perform logistic regression and check of coefficient is significant
% stat.p(2) < alpha for coeff to be significant 
[B, ~, stat] = mnrfit(rsp(:,1),rsp(:,2)+1);

% Compute point biserial coefficient using Hottest age (2021 - entry year)
% h = 1 for correlation to be significant 
[r,h,p,ci] = pointbiserial(rsp(:,2), 2021-rsp(:,1));