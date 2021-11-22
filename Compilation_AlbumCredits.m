%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Compilation of Song Credits (Album Song)
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Labels and Data
PM = {'JK', 'TY', 'WY',  'JH', 'CS'};
PMf = {'Jun. K', 'Taecyeon', 'Wooyoung',  'Junho', 'Chansung'};
crtype = {'Sole Lyricist & Sole Composer', 'Sole Lyricist & Composer', ...
    'Sole Lyricist only',...
    'Lyricist only',...
    'Lyricist & Composer', 'Lyricist & Sole Composer'};
ltype = {'Sole Lyricist', 'Lyricist'};
ctype = {'Sole Composer', 'Composer', 'Not Invovled'};

% Data Matrix
% Col1: Solo Lyricist + Solo Composer
% Col2: Solo Lyricist + Composer
% Col3: Solo Lyricist
% Col4: Lyricist + Solo Composer
% Col5: Lyricist + Composer
% Col6: Lyricist
% Row: Members
scredits = [3	6	0	0	2	0;
    0	0	0	0	5	17;
    0	1	1	0	2	0;
    0	2	0	0	3	0;
    0	0	1	1	4	3];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Credits Breakdown
for si = 1:5
    figure
    % Plot all credit types
    subplot(4,6,[1:4,7:10,13:16,19:22])
    pie(scredits(si,[1:3,6,5,4]))
    colormap(gca,'jet')
    lg = legend(crtype);
    lg.Location = 'south outside';
    lg.Box = 'off';
    title(['Credits : ', PMf{si}, ' (', num2str(sum(scredits(si,:))), ')'])
    set(gca, 'FontSize', 16)
    
    % Plot lyricist credits
    subplot(4,6,[5:6,11:12])
    pie([sum(scredits(si,1:3)), sum(scredits(si,4:6))])
    colormap(gca, flipud(colormap(gca, 'spring')))
    lg = legend(ltype);
    lg.Location = 'south outside';
    lg.Box = 'off';
    title(['Lyrics : ', PM{si}])
    caxis([1 7])
    
    % Plot composer credits
    subplot(4,6,[17:18,23:24])
    pie([sum(scredits(si,[1,4])), sum(scredits(si,[2,5])),...
        sum(scredits(si,[3,6]))])
    colormap(gca,'winter')
    lg = legend(ctype);
    lg.Location = 'south outside';
    lg.Box = 'off';
    title(['Composition : ', PM{si}])
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%