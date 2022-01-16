%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Bias-Major Relationship
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all
addpath('0library')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Labels and Data
PM = {'JK', 'NK', 'TY', 'WY',  'JH', 'CS'};
PMf = {'Jun. K', 'Nichkhun', 'Taecyeon', 'Wooyoung',  'Junho', 'Chansung'};
major = {'Business', 'STEM', 'Medicine', 'Social Sciences', 'Humanities'};

% Matrix for Member Colors
PMcol = [253/255, 90/255, 221/255;
    1, 0, 0;
    0, 176/255, 80/255;
    0, 112/255, 192/255;
    1, 192/255, 0;
    112/255, 48/255, 160/255];

% Data Matrix : Major
% Row: major group
% Col: members
data = [3	1	26	4	19	1
    7	3	21	12	19	6
    6	3	12	6	6	4
    6	6	9	10	14	7
    8	2	5	0	7	2];

dpct = data ./ sum(data); % normalize matrices
gtrend = sum(data,2) ./ sum(data, 'all'); % normalize overall matrices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Data Matrix and Perform Necessary Tests
% sum matrices for goodness-of-fit tests
dSum1 = sum(data,1);
dSum2 = sum(data,2) ./ sum(data, 'all');
data_exp = dSum1 .* dSum2;
gofRes = zeros(6,7);

for si=1:6
    % plot major distribution, one figure per member [pie]
    figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
    dt = dpct(:,si);
    ht = pie(dt);
    colormap('copper')
    title(PMf{si})
    set(findobj(ht,'type','text'),'fontsize',20)
    set(gca, 'FontSize', 24)
    T = ht(strcmpi(get(ht,'Type'),'text'));
    for mji = 1:5
        if startsWith({T(mji).String}, '0')
            T(mji).String = '';
        else
            T(mji).String = {major{mji}, T(mji).String};
        end
    end
    P = cell2mat(get(T,'Position'));
    set(T,{'Position'},num2cell(P*0.95,2));

    % plot major distribution, one figure per member [bar]
    % together with overall distribution
    figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
    dt = dpct(:,si);
    pcol = PMcol(si,:);
    h = bar([dt,gtrend]);
    h(1).FaceColor = pcol;
    h(2).FaceColor = [0.7 0.7 0.7];
    title(PMf{si})
    set(gca, 'FontSize', 24)
    xticks(1:5)
    xlabel('Major')
    ylabel('Proportion')
    xticklabels(major)
    ylim([0 0.5])
    xlim([0 6])

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

% plot member distribution per major
figure('Units', 'normalized', 'Position', [0 0.1811 1 1]);
spi = 1;
for ai = 1:5
    % get member distribution given major
    dtrunc = data(ai,:);
    dmajor = dtrunc ./ sum(dtrunc);

    subplot(2,3,spi)
    ht = pie(dmajor);
    colormap(PMcol)
    set(findobj(ht,'type','text'),'fontsize',16)
    set(gca, 'FontSize', 24)
    title(['Major : ', major{spi}],'FontSize', 24);
    spi = spi+1;
end

% plot general trend for major
figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
ht = pie(gtrend);
colormap('copper')
title('General')
set(findobj(ht,'type','text'),'fontsize',20)
set(gca, 'FontSize', 24)
T = ht(strcmpi(get(ht,'Type'),'text'));
for mji = 1:5
    if startsWith({T(mji).String}, '0')
        T(mji).String = '';
    else
        T(mji).String = {major{mji}, T(mji).String};
    end
end
P = cell2mat(get(T,'Position'));
set(T,{'Position'},num2cell(P*0.95,2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional Plots Not Included in Thread
% plot major distribution in one figure
figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
h = bar(dpct);
for si=1:6
    h(si).FaceColor = PMcol(si,:);
end
set(gca, 'FontSize', 24)
xlabel('Major')
ylabel('Proportion')
xticks(1:5)
xticklabels(major)
xlim([0 6])
lgd = legend(PM);
lgd.Box = 'off';
title('2PM', 'FontSize', 24)

% compute for Hamming distance between member & overall major distribution,
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

% plot major distribution, one subplot per member-pair
spi = 0;
figure('Units', 'normalized', 'Position', [0 0.1811 1 1]);
for mmi = 1:6
    for mmj = 2:7
        spi = spi + 1 ;
        subplot(6,6,spi)

        % plot
        if mmi == mmj-1
            title([PM{mmi}])
            h = bar(dpct(:,mmi), 'FaceColor',PMcol(mmi,:));
        else
            h = bar(dpct(:,[mmi, mmj-1]));
            h(1).FaceColor = PMcol(mmi,:);
            h(2).FaceColor = PMcol(mmj-1,:);
            if gofIntr(mmi, mmj)
                title([PM{mmi}, ' vs ', PM{mmj-1}])%,...
            end
        end
        ylim([0 0.5])
        xlim([0 6])
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%