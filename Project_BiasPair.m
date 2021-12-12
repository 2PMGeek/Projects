%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Bias-Pair Relationship
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all
addpath('0library')
save_fig = 1;
if ~exist('figure', 'dir') && save_fig
    mkdir('figure')
end

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

% Data Matrix : Pair-partner Given Bias
% Row: pair-partner
% Col: bias
ppb = [0	2	4	5	19	1
    9	0	39	21	1	1
    6	19	0	24	3	9
    7	3	17	0	32	4
    13	0	12	11	0	17
    8	0	11	7	53	0];

ppb_raw = [0	2	4	5	19	1
    9	0	39	21	1	1
    6	19	0	51	3	9
    7	3	17	0	32	4
    21	0	12	11	0	17
    8	0	11	7	53	0];

% Data Vector : Bias not in Pair Given Bias
pnp = [10
    0
    9
    10
    11
    4];

% % Data Matrix : Bias Given Pair
% Row: pair
% Jun. K - Nichkhun
% Jun. K - Taecyeon
% Jun. K - Wooyoung
% Jun. K - Junho
% Jun. K - Chansung
% Nichkhun - Taecyeon
% Nichkhun - Wooyoung
% Nichkhun - Junho
% Nichkhun - Chansung
% Taecyeon - Wooyoung
% Taecyeon - Junho
% Taecyeon - Chansung
% Wooyoung - Junho
% Wooyoung - Chansung
% Junho - Chansung
% Col: bias
prb = [9	2	1	2	5	1
    6	0	4	0	0	1
    7	0	0	5	0	0
    13	0	0	0	19	0
    8	0	0	0	0	1
    0	19	39	2	4	1
    2	3	3	21	0	0
    0	0	0	0	1	0
    0	0	0	0	0	1
    0	0	17	24	0	0
    0	0	12	0	3	0
    1	0	11	0	1	9
    2	0	1	11	32	1
    0	0	1	7	1	4
    5	0	3	6	53	17];
% generate vector containing members of pairs
prb_unit = zeros(15,2);
mr = 0;
for mi = 1:6
    for mj = 1:6
        if mi < mj
            mr = mr + 1;
            prb_unit(mr,1) = mi;
            prb_unit(mr,2) = mj;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Matrices
% plots for bias not in pair data
figure
dt = pnp;
pcol = PMcol;
h = pie(dt);
colormap(pcol)
title('Which stans *did not* have their bias in their favorite pair?')%,...
set(gca, 'FontSize', 16)
set(findobj(h,'type','text'),'fontsize',16)
lg = legend(PM);
lg.Location = 'south outside';
lg.NumColumns = 3;
lg.Box = 'off';
th = findobj(h,'Type','Text'); % text handles
isSmall = startsWith({th.String}, '0');  % r2016b or later
set(th(isSmall),'String', '')
if save_fig
    saveas(gcf, fullfile('figure', 'bias_out.png'))
end

% plots for conditional matrices
for si=1:6
    % plot Pair-partner Given Bias
    figure
    dt = [ppb(:, si); pnp(si)];
    dt(si) = [];
    pcol = [PMcol; 0.3,0.3,0.3];
    pcol(si,:) = [];
    PMl = strcat([PM{si}, '-'], PM);
    PMl(si) = [];
    PMl{end+1} = 'others';
    h = pie(dt);
    colormap(pcol)
    title(['If your bias is *', PM{si},...
        '*, then your favorite pair is...'])
    set(gca, 'FontSize', 16)
    set(findobj(h,'type','text'),'fontsize',16)
    lg = legend(PMl);
    lg.Location = 'south outside';
    lg.NumColumns = 3;
    lg.Box = 'off';
    th = findobj(h,'Type','Text');
    isSmall = startsWith({th.String}, '0');
    set(th(isSmall),'String', '')

    if save_fig
        saveas(gcf, fullfile('figure', [num2str(si),PM{si}, '.png']))
    end
end

% plot bias given pair
figure('Units', 'normalized', 'Position', [0.1300 0.1100 0.6506 0.6028]);
pli = 0;
for pri = 1:15
    pli = pli + 1;
    subplot(3,5,pli)
    dt = prb(pri,:);
    pcol = PMcol;
    h2 = pie(dt);
    colormap(gca, pcol)
    title([PM{prb_unit(pri,1)},'-',PM{prb_unit(pri,2)}],...
        'FontWeight', 'normal')
    set(gca, 'FontSize', 16)
    set(h2, 'LineStyle', 'none')
    delete(findobj(h2,'Type','text'))
    h_arr = get(gca, 'Children');
    set(h_arr(7-prb_unit(pri,1)), 'FaceAlpha', 0.25);
    set(h_arr(7-prb_unit(pri,2)), 'FaceAlpha', 0.25);
    sgtitle('Which stans chose ... as their favorite pair?',...
        'FontSize', 24, 'FontWeight', 'bold')
end
if save_fig
    saveas(gcf, fullfile('figure', 'pair.png'))
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%