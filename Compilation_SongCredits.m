%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Compilation of Song Credits (Album Song)
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Labels and Data
PM = {'JK', 'NK', 'TY', 'WY',  'JH', 'CS'};
PMf = {'Jun. K', 'Nichkhun', 'Taecyeon', 'Wooyoung',  'Junho', 'Chansung'};
crtype = {'Sole Composer Only',...
    'Sole Lyricist & Sole Composer',...
    'Sole Lyricist & Composer', ...
    'Sole Lyricist only',...
    'Composer Only',...
    'Lyricist only',...
    'Lyricist & Composer',...
    'Lyricist & Sole Composer',...
    };
ltype = {'Sole Lyricist', 'Lyricist', 'Not Invovled'};
ctype = {'Sole Composer', 'Composer', 'Not Invovled'};

% Data Matrix
% Row1: Solo Lyricist + Solo Composer
% Row2: Solo Lyricist + Composer
% Row3: Solo Lyricist
% Row4: Lyricist + Solo Composer
% Row5: Lyricist + Composer
% Row6: Lyricist
% Row7: Solo Composer
% Row8: Composer
% Col: Members
scredits = [12	0	12	0	3	0
    28	12	1	12	25	0
    0	1	0	1	0	2
    10	0	4	0	1	3
    43	4	20	31	80	14
    3	2	21	1	0	4
    1	0	0	0	0	0
    0	0	0	0	1	0]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Credits Breakdown
for si = 1:6
    figure
    % Plot all credit types
    subplot(4,6,[1:4,7:10,13:16,19:22])
    h1 = pie(scredits(si,[7,1,2,3,8,6,5,4]));
    colormap(gca, flipud(colormap(gca,'jet')))
    lg = legend(crtype);
    lg.Location = 'south outside';
    lg.Box = 'off';
    title(['Credits : ', PMf{si}, ' (', num2str(sum(scredits(si,:))), ')'])
    set(gca, 'FontSize', 16)
    % remove entries with 0
    th = findobj(h1,'Type','Text');
    isSmall = startsWith({th.String}, '0');
    set(th(isSmall),'String', '')
    
    % Plot lyricist credits
    subplot(4,6,[5:6,11:12])
    h2 = pie([sum(scredits(si,1:3)), sum(scredits(si,4:6)),...
        sum(scredits(si,7:8))]);
    colormap(gca, flipud(colormap(gca, 'spring')))
    lg = legend(ltype);
    lg.Location = 'south outside';
    lg.Box = 'off';
    title(['Lyrics : ', PM{si}])
    % remove entries with 0
    th = findobj(h2,'Type','Text');
    isSmall = startsWith({th.String}, '0');
    set(th(isSmall),'String', '')
    
    % Plot composer credits
    subplot(4,6,[17:18,23:24])
    h3 = pie([sum(scredits(si,[1,4])), sum(scredits(si,[2,5])),...
        sum(scredits(si,[3,6]))]);
    colormap(gca,'winter')
    lg = legend(ctype);
    lg.Location = 'south outside';
    lg.Box = 'off';
    title(['Composition : ', PM{si}])
    % remove entries with 0
    th = findobj(h3,'Type','Text');
    isSmall = startsWith({th.String}, '0');
    set(th(isSmall),'String', '')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%