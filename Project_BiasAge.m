%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Bias-Age Relationship
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all
addpath('0library')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Labels and Data
PM = {'JK', 'NK', 'TY', 'WY',  'JH', 'CS'};
PMf = {'Jun. K', 'Nichkhun', 'Taecyeon', 'Wooyoung',  'Junho', 'Chansung'};
ageS = {'','below 20', '20s', '30s','40s','50 and above'};
ageL = {'','below 20', '20-24', '25-29', '30-34', '35-39',...
    '40-44', '45-49', '50 and above'};

% Matrix for Member Colors
PMcol = [253/255, 90/255, 221/255;
    1, 0, 0;
    0, 176/255, 80/255;
    0, 112/255, 192/255;
    1, 192/255, 0;
    112/255, 48/255, 160/255];

% Matrix for OB/YB Colors 
obyb = [0.8500 0.3250 0.0980;
    0.3010 0.7450 0.9330];

% Data Matrix : Age
% Row: age group, according to ageL
% Col: members
data = [13	6	21	15	20	10
    23	11	38	20	47	26
    14	12	24	13	51	30
    6	3	12	10	23	10
    4	1	5	2	13	4
    3	1	2	0	2	0
    0	0	1	1	8	2
    0	0	1	1	2	1
    0	0	1	0	1	0
    0	0	0	0	1	0];
data = [data(1:7,:); sum(data(8:10,:))]; %merge last three age groups

% Data Matrix : Age
% Row: age group, according to ageS
% Col: members
data2 = [13	6	21	15	20	10
    37	23	62	33	98	56
    10	4	17	12	36	14
    3	1	3	1	10	2
    0	0	2	1	3	1
    0	0	0	0	1	0];
data2 = [data2(1:4,:); sum(data2(5:6,:))]; %merge last two age groups

% Data Matrix : Age
% Row: age group, according to ageL
% Col: OB, YB
data3 = [40	45
    72	93
    50	94
    21	43
    10	19
    6	2
    1	11
    1	4
    1	1
    0	1];
data3 = [data3(1:7,:); sum(data3(8:10,:))]; %merge last three age groups

% normalize matrices
dpct = data ./ sum(data);
dpct2 = data2 ./ sum(data2);
dpct3 = data3 ./ sum(data3);

% normalize overall matrices
gtrend = sum(data,2) ./ sum(data, 'all');
gtrend3 = sum(data3,2) ./ sum(data3, 'all');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Data Matrix and Perform Necessary Tests
% sum matrices for goodness-of-fit tests
dSum1 = sum(data,1);
dSum2 = sum(data,2) ./ sum(data, 'all');
data_exp = dSum1 .* dSum2;
gofRes = zeros(6,7);

for si=1:6
    % plot age group distribution, one figure per member
    % together with overall distribution
    figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
    dt = dpct(:,si);
    pcol = PMcol(si,:);
    h = plot(dt, 'Color',pcol, 'LineWidth',5,...
        'MarkerSize',75, 'Marker','.');
    hold on
    h0 = plot([0 1], [0; dt(1)], 'Color',pcol, 'LineWidth',5);
    h1 = plot(0:8, [0;gtrend], 'Color',[0.7 0.7 0.7], 'LineWidth',3,...
        'LineStyle','--'); % overall distribution plot
    hold off
    title(PMf{si})
    set(gca, 'FontSize', 24)
    xlabel('Age Group')
    ylabel('Proportion')
    xticks(0:8)
    xticklabels(ageL)
    ylim([0 0.5])
    xlim([0 9])
    
    % perform goodness-of-fit test
    % note: assumptions not checked
    dataO = data(:,si);
    dataE = data_exp(:,si);
    chi2 = sum(((dataO - dataE).^2) ./ dataE);
    gofRes(si, 1) = 1-chi2cdf(chi2, size(dataO,1) - 1); %exp = overall
    
    % exp = member age dist
    for mi = 1:6
        dataO = data(:,si);
        dataE0 = data(:,mi);
        dSum1 = sum(dataO,1);
        dSum2 = sum(dataE0,2) ./ sum(dataE0, 'all');
        dataE = dSum1 .* dSum2;

        dataE(dataE == 0) = 0.001;
        chi2 = sum(((dataO - dataE).^2) ./ dataE);
        gofRes(si, mi+1) = 1-chi2cdf(chi2, size(dataO,1) - 1);
    end
end

% check test statistic against alpha level
alpha = 0.05;
gofIntr = gofRes < alpha;

% plot age group distribution in one figure
figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
hold on
for si=1:6
    dt = dpct(:,si);
    pcol = PMcol(si,:);
    h = plot(dt, 'Color',pcol, 'LineWidth',5,...
        'MarkerSize',75, 'Marker','.');
    h0 = plot([0 1], [0; dt(1)], 'Color',pcol, 'LineWidth',5);
    h0.Annotation.LegendInformation.IconDisplayStyle = 'off';
    set(gca, 'FontSize', 24)
    xlabel('Age Group')
    ylabel('Proportion')
    xticks(0:8)
    xticklabels(ageL)
    xlim([0 9])
end
hold off
lgd = legend(PM);
lgd.Box = 'off';
title('2PM', 'FontSize', 24)

% plot age group distribution in one figure
% using wider age groups
figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
hold on
for si=1:6
    dt = dpct2(:,si);
    pcol = PMcol(si,:);
    h = plot(dt, 'Color',pcol, 'LineWidth',5,...
        'MarkerSize',75, 'Marker','.');
    h0 = plot([0 1], [0; dt(1)], 'Color',pcol, 'LineWidth',5);
    h0.Annotation.LegendInformation.IconDisplayStyle = 'off';
    set(gca, 'FontSize', 24)
    xlabel('Age Group')
    ylabel('Proportion')
    xticks(0:5)
    xticklabels(ageS)
    xlim([0 6])
end
hold off
lgd = legend(PM);
lgd.Box = 'off';
title('2PM', 'FontSize', 24)

% plot age group distribution in one figure for OB and YB
figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
hold on
for si=1:2
    dt = dpct3(:,si);
    pcol = obyb(si,:);
    h = plot(dt, 'Color',pcol, 'LineWidth',5,...
        'MarkerSize',75, 'Marker','.');
    h0 = plot([0 1], [0; dt(1)], 'Color',pcol, 'LineWidth',5);
    h0.Annotation.LegendInformation.IconDisplayStyle = 'off';
    set(gca, 'FontSize', 24)
    xlabel('Age Group')
    ylabel('Proportion')
    xticks(0:8)
    xticklabels(ageL)
    xlim([0 9])
end
hold off
lgd = legend({'OB', 'YB'});
lgd.Box = 'off';
title('2PM', 'FontSize', 24)

% plot member distribution per age group
figure('Units', 'normalized', 'Position', [0 0.1811 1 1]);
spi = 1;
for ai = 1:8
    % get member distribution given age group
    dtrunc = data(ai,:);
    dage = dtrunc ./ sum(dtrunc);
    
    subplot(2,4,spi)
    ht = pie(dage);
    colormap(PMcol)
    set(findobj(ht,'type','text'),'fontsize',16)
    set(gca, 'FontSize', 24)
    title(['Age : ', ageL{spi+1}],'FontSize', 24);
    spi = spi+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional Plots Not Included in Thread
% compute for Hamming distance between member & overall age distribution,
% including distance between members
hd = zeros(6,7);
for mmi = 1:6
    p1 = dpct(:, mmi);
    hd(mmi, 1) = sqrt( sum((sqrt(p1) - sqrt(gtrend)).^2) ) ./ sqrt(2);

    for mmj = 2:7
        p2 = dpct(:,mmj-1);
        hd(mmi, mmj) = sqrt( sum((sqrt(p1) - sqrt(p2)).^2) ) ./ sqrt(2);
    end
end

% plot HD using heatmap
figure
imagesc(hd, [min(hd(hd>0)) max(hd(:))])
colormap('gray')
xticklabels(horzcat({'All'},PM))
yticklabels(PM)
set(gca, 'FontSize', 24)

% plot age group distribution, one subplot per member-pair
spi = 0;
figure('Units', 'normalized', 'Position', [0 0.1811 1 1]);
for mmi = 1:6
    for mmj = 2:7
        spi = spi + 1 ;
        subplot(6,6,spi)

        % plot member 1
        dt = dpct(:,mmi);
        pcol = PMcol(mmi,:);
        hi = plot(dt, 'Color',pcol, 'LineWidth',1,...
            'MarkerSize',25, 'Marker','.');
        hold on
        h0i = plot([0 1], [0; dt(1)], 'Color',pcol, 'LineWidth',1);
        
        % plot member 2
        dt = dpct(:,mmj-1);
        pcol = PMcol(mmj-1,:);
        hj = plot(dt, 'Color',pcol, 'LineWidth',1,...
            'MarkerSize',25, 'Marker','.');
        h0j = plot([0 1], [0; dt(1)], 'Color',pcol, 'LineWidth',1);
        hold off
        
        % plot specifications
        if mmi == mmj-1
            title([PM{mmi}])
        else
            title([PM{mmi}, ' vs ', PM{mmj-1}])%,...
        end
        ylim([0 0.5])
        xlim([0 9])
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%