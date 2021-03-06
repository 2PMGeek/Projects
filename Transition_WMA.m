%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Transition Analysis: With Me Again
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Labels and Data
PM = {'JK', 'JH', 'WY', 'NK',  'CS', 'TY'};
song_title = {'εγ¨γΎγ', 'By My Side','Urahara'};

% Data
all_song = {};
all_song{1} = [2	5	3	4	6	2	1	3	4	1	2	5	3	6	3	4	6	4	6	4	5	6	1	4	3	4	5	4	6	4	2	1	2	5]; %wma
all_song{2} = [2	4	2	6	5	4	5	3	2	3	5	6	5	6	1	5	1	5	1	3	6	1	4	1	3	4	3	2		6	2	6	1	2	1	2	1	6	3	5	4	1	5	6	5	6	1	5	1	5	1	2]; %by my side
all_song{3} = [1	2	4	5	2	1	6	4	1	3	2	3	5	4	6	5	2	1	6	3	4	1]; %urahara
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Generate and Plot Transition Matrix
% Initialize Variables
nsong = length(all_song);
all_tm = zeros(6,6,nsong);
stat = zeros(nsong, 2);

for sgi = 1:nsong
    % compute for transition matrix for each song
    song = all_song{sgi};
    song_mat = zeros(6,6);
    for si = 1:length(song)-1
        song_mat(song(si), song(si+1)) = song_mat(song(si), song(si+1)) + 1;
    end
    song_mat = song_mat([1,5,4,2,6,3], [1,5,4,2,6,3]); %rearrange to match labels
    song_tm = song_mat ./ sum(song_mat, 2); %normalize matrix

    % plot transition matrix for each song
    figure
    song_graph = digraph(song_tm, PM);
    sgraph = plot(song_graph, 'layout', 'circle');
    if sum(isnan(song_tm), 'all')
        songWt = zeros(6,6)+0.1;
    else
        songWt = song_mat';
    end
    songWt(songWt == 0) = [];
    sgraph.LineWidth = 2*songWt(:);
    sgraph.ArrowSize = 10;
    sgraph.NodeFontSize = 16;
    title([song_title{sgi}, ' (', num2str(si+1), ')'])
    set(gca, 'FontSize', 16)
    
    % save necessary values
    stat(sgi, 1) = si+1;
    stat(sgi, 2) = sum(song_mat > 0, 'all');
    all_tm(:,:,sgi) = song_mat;
end

% overall transition matrix
tm = sum(all_tm,3);
tm = tm([1,5,4,2,6,3], [1,5,4,2,6,3]);

% plot directed overall transition matrix
figure
subplot(2,1,1)
imagesc(max(tm(:))-tm)
xticklabels(PM)
xticks(1:6)
yticks(1:6)
yticklabels(PM)
colormap('gray')
textStrings = num2str(tm(:), '%d');
textStrings = strtrim(cellstr(textStrings));
[xplot, yplot] = meshgrid(1:6, 1:6);
text(xplot(:), yplot(:), textStrings(:),...
    'HorizontalAlignment', 'center', 'Color', 'white');
set(gca, 'FontSize', 16)

% plot undirected overall transition matrix
subplot(2,1,2)
utm = triu(tm)' + tril(tm);
imagesc(max(utm(:))-utm)
xticklabels(PM)
xticks(1:6)
yticks(1:6)
yticklabels(PM)
colormap('gray')
textStrings = num2str(utm(:), '%d');
textStrings = strtrim(cellstr(textStrings));
[xplot, yplot] = meshgrid(1:6, 1:6);
text(xplot(:), yplot(:), textStrings(:),...
    'HorizontalAlignment', 'center', 'Color', 'white');
set(gca, 'FontSize', 16)

% plot number of transitions, number of transition pairs
figure
bar(stat)
xticklabels(song_title)
legend({'No. of Transitions', 'No. of Unique Transition Pairs'},...
    'location', 'best')
set(gca, 'FontSize', 16)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%