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

% Matrix for Member Colors
PMcol = [253/255, 90/255, 221/255;
    1, 0, 0;
    0, 176/255, 80/255;
    0, 112/255, 192/255;
    1, 192/255, 0;
    112/255, 48/255, 160/255];

% Data Matrix : Member
% for each number, position = ranking (leftmost = rank1), value = member
data = [615234
615324
612543
613254
613452
613425
614523
614253
614235
614352
614352
651324
651324
651423
651423
651423
652134
652134
652341
652413
653142
653412
654123
654123
654132
654132
654312
654312
654321
621435
625341
623154
623514
624531
624531
631524
631524
631542
631452
635124
635142
635214
635412
635412
635421
635421
635421
632154
632415
634152
634125
634512
634512
634512
634251
641523
641532
641532
645123
645132
645321
642513
643125
643512
643521
165234
165324
165423
165432
162543
162453
163524
163245
163245
163452
164523
164523
164523
164532
164532
164532
164532
164235
156342
156342
156432
152643
152346
153642
153246
153426
153426
154623
154623
154632
154362
126435
123564
123456
124563
124365
136245
136245
132456
132456
134652
134562
134256
146523
146532
146532
146532
146253
146352
146325
145623
145362
145362
145326
143625
143562
143526
143256
143256
561243
561324
561423
561423
561423
561432
561432
561432
562134
562143
562341
562413
562413
562431
563124
563142
563241
563412
563412
563421
563421
564123
564123
564123
564123
564132
564132
564132
564132
564213
564231
564231
564231
564231
564312
564312
564312
564312
564312
564321
564321
516234
516342
516342
516423
516423
516432
516432
516432
516432
516432
512643
512364
512346
512436
513624
513264
513264
514623
514362
514326
514326
514326
514326
514326
526134
526143
521643
523461
523461
523416
524631
524361
536124
536142
536142
536142
536214
536214
536241
536241
536241
536412
536412
536421
536421
531624
531624
531642
531246
532641
532641
532146
532461
532461
532416
534612
534612
534612
534612
534621
534621
534162
534162
534261
546123
546123
546123
546123
546123
546123
546132
546132
546132
546231
546231
546231
546312
546312
546312
546312
546312
546321
546321
546321
541623
541623
541632
541632
541632
541236
541326
542613
542631
542361
542316
543612
543612
543621
543621
543162
543162
543162
543162
543126
543126
543261
543261
543216
543216
261453
265431
263514
263541
263541
264135
264315
216453
213546
213456
214536
251346
253416
254613
254631
236145
231645
231465
235641
235146
235146
235146
234165
234561
246351
241635
241635
241635
241635
245613
245136
243615
243651
243561
361245
365214
365214
365241
365412
365421
365421
362145
362145
362145
362514
362541
362541
362541
362541
362415
362415
362415
362415
362415
362451
362451
364125
364125
364512
364512
364521
364521
364215
316542
316542
316452
315642
315426
312654
312645
314265
356142
356142
356142
356241
356241
356241
356241
356412
356421
351642
351462
351426
351426
351426
352614
352641
352641
352164
352146
352461
352461
354612
354612
354612
354612
354621
354621
354621
354621
354621
354162
354261
354216
354216
354216
326145
326145
326514
326541
326541
326541
326415
321645
321645
321645
321645
321645
321465
325614
325614
325641
325461
325416
324165
324561
324561
324561
324561
324516
346152
346125
346512
346521
341652
341625
341265
341265
345612
345612
345621
345621
345162
345261
345261
345261
342615
342165
342165
342156
461532
461253
461235
461352
461325
465123
465231
465312
465312
462531
462531
463125
463512
463512
463521
463521
463251
416523
416532
416532
415623
415623
415623
415632
415326
413562
413265
413256
456123
456132
456213
456231
456231
456231
456312
451263
451236
451362
451362
451326
451326
453612
453621
453621
453621
453621
453261
453261
453216
453216
453216
426153
426135
426135
426531
426315
426315
421653
421635
421365
425631
425361
425361
425316
423561
423561
436215
431625
435612
435126
435261
432615
432651
432651
432165
432165]; 

% Data Matrix : Ranking
% data where position = member (leftmost = JK), entry = ranking
dataR = [245631
254631
236541
243651
263451
253461
256341
246351
245361
264351
264351
354621
354621
356421
356421
356421
435621
435621
634521
536421
463521
563421
456321
456321
465321
465321
564321
564321
654321
325461
624531
423651
523641
625341
625341
352641
352641
362541
362451
452631
462531
542631
562431
562431
652431
652431
652431
432651
532461
462351
452361
562341
562341
562341
642351
356241
365241
365241
456231
465231
654231
536241
453261
563241
653241
145632
154632
156432
165432
136542
136452
153642
143562
143562
163452
156342
156342
156342
165342
165342
165342
165342
145362
164523
164523
165423
136524
134526
163524
143526
153426
153426
156324
156324
165324
164325
125463
123645
123456
126345
124365
142563
142563
132456
132456
162354
162345
142356
156243
165243
165243
165243
146253
164253
154263
156234
164235
164235
154236
153264
163245
153246
143256
143256
346512
354612
356412
356412
356412
365412
365412
365412
435612
436512
634512
536412
536412
635412
453612
463512
643512
563412
563412
653412
653412
456312
456312
456312
456312
465312
465312
465312
465312
546312
645312
645312
645312
645312
564312
564312
564312
564312
564312
654312
654312
245613
264513
264513
256413
256413
265413
265413
265413
265413
265413
236514
234615
234516
235416
253614
243615
243615
256314
264315
254316
254316
254316
254316
254316
425613
426513
326514
623415
623415
523416
625314
624315
452613
462513
462513
462513
542613
542613
642513
642513
642513
562413
562413
652413
652413
352614
352614
362514
342516
632514
632514
432516
632415
632415
532416
562314
562314
562314
562314
652314
652314
462315
462315
642315
456213
456213
456213
456213
456213
456213
465213
465213
465213
645213
645213
645213
564213
564213
564213
564213
564213
654213
654213
654213
356214
356214
365214
365214
365214
345216
354216
536214
635214
634215
534216
563214
563214
653214
653214
463215
463215
463215
463215
453216
453216
643215
643215
543216
543216
316452
615432
513642
613542
613542
415362
514362
216453
213546
213456
215346
314526
513426
516324
615324
412563
312564
312465
612534
412536
412536
412536
412365
612345
614253
315264
315264
315264
315264
516234
415236
513264
613254
613245
341562
541632
541632
641532
561432
651432
651432
431562
431562
431562
531642
631542
631542
631542
631542
531462
531462
531462
531462
531462
631452
631452
451362
451362
561342
561342
651342
651342
541362
261543
261543
261453
261534
251436
231654
231564
241365
461523
461523
461523
641523
641523
641523
641523
561423
651423
361524
361425
351426
351426
351426
531624
631524
631524
431625
431526
631425
631425
561324
561324
561324
561324
651324
651324
651324
651324
651324
461325
641325
541326
541326
541326
421563
421563
521643
621543
621543
621543
521463
321564
321564
321564
321564
321564
321465
521634
521634
621534
621435
521436
421365
621345
621345
621345
621345
521346
461253
451263
561243
651243
361254
351264
341265
341265
561234
561234
651234
651234
461235
641235
641235
641235
531264
431265
431265
431256
365142
346152
345162
364152
354162
456132
645132
564132
564132
635142
635142
453162
563142
563142
653142
653142
643152
256143
265143
265143
256134
256134
256134
265134
254136
263145
243165
243156
456123
465123
546123
645123
645123
645123
564123
346125
345126
364125
364125
354126
354126
563124
653124
653124
653124
653124
643125
643125
543126
543126
543126
426153
425163
425163
625143
524163
524163
326154
325164
324165
625134
624135
624135
524136
623145
623145
542163
352164
562134
452136
642135
532164
632154
632154
432165
432165]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Data Transformations and Matrix Generations
% convert string into matrix
dataM = dec2base(data,10) - '0'; % col = ranking, value = member
dataM2 = dec2base(dataR,10) - '0'; % col = member, value = ranking
ndata = size(dataM, 1);

% initialize matrices
pMatrix = zeros(6,6);
dMatrix = zeros(6,6,ndata);
for di = 1:ndata
    cdata = dataM(di, :);

    % pair count frequency (directed) : number of times a given of pair 
    % appear beside each other
    % directed : member i before j is different from member j before i
    % pMatrix(i, j) = frequency count of member i & j appearing together
    for ddi = 1:5
        pMatrix(cdata(ddi), cdata(ddi+1)) =...
            pMatrix(cdata(ddi), cdata(ddi+1)) + 1;
    end

    % distance : difference in ranking
    % dMatrix(i, j, k) = difference in ranking for member i & j 
    % for the kth response
    for ddi = 1:6
        sddi = find(cdata==ddi);
        for sddj = 1:6
            dMatrix(ddi, cdata(sddj), di) = abs(sddi-sddj);
        end
    end
end

% following matrices were computed based on [Lee+, 2013]
% reference paper: https://doi.org/10.1186/1471-2288-13-65

% pair matrix comparison
% pairMatrix(i, j) = number of times when member i has higher rank than j
pairMatrix = zeros(6,6);
for si = 1:6
    for sj = 1:6
        pairMatrix(si, sj) = sum(dataM2(:,si) < dataM2(:,sj));
    end
end
pairPMatrix = pairMatrix ./ sum(pairMatrix, 2); % converted to probability

% marginal matrix
% marMatrix(i, j) = number of times member i has rank j
marMatrix = zeros(6,6);
for si = 1:6
    marMatrix(si, :) = sum(dataM == si);
end

% following matrices are conditional versions of earlier matrices, 
% where rank1 member is fixed

% initialize matrices
cMatrix = zeros(5,5,6);
cpMatrix = zeros(5,5,6);
cppMatrix = zeros(5,5,6);
d2Matrix = cell(6,1);

for si = 1:6
    % load only values where Rank1 = member si
    cmat = dataM(dataM(:,1) == si, :);
    ngdata = size(cmat, 1);
    
    % conditional marginal matrix
    % cMatrix(i, j, k) = number of times member i has rank j,
    % where Rank1 = member k
    for ssi = 1:6
        if ssi ~= si
            temp = sum(cmat == ssi);
            cMatrix(ssi, :, si) = temp(2:end);
        end
    end

    % conditional pair matrix
    % cpMatrix(i, j, k) = number of times when member i has higher rank
    % than j, where Rank1 = member k
    % cppMatrix is the probability version of cpMatrix
    cmat2 = dataM2(dataM(:,1) == si, :);
    temp = zeros(6,6);
    for ssi = 1:6
        for ssj = 1:6
            if ssi ~= si && ssj ~= si
                temp(ssi, ssj) = sum(cmat2(:,ssi) < cmat2(:,ssj));
            end
        end
    end
    temp(:, si) = [];
    temp(si, :) = [];
    cpMatrix(:, :, si) = temp;
    cppMatrix(:, :, si) = temp ./ sum(temp, 2);

    % conditional distance (difference in ranking)
    % d2Matrix{si} = tdMatrix = distance matrix for member si
    % tdMatrix(i, j, k) = difference in ranking for member i & j 
    % for the kth response, where Rank1 = member k
    tdMatrix = zeros(6,6,ngdata);
    for di = 1:ngdata
        cdata = cmat(di, :);
        for ddi = 1:6
            sddi = find(cdata==ddi);
            for sddj = 1:6
                tdMatrix(ddi, cdata(sddj), di) = abs(sddi-sddj);
            end
        end
    end
    d2Matrix{si} = tdMatrix;
end

% pair count frequency (undirected)
% prMatrix = undirected version of pMatrix
% undirected : member i before j is same as member j before i
prMatrix = triu(pMatrix)' + tril(pMatrix);
prMatrix(prMatrix == 0) = NaN;

% reshape prMatrix into a list
pair_count = prMatrix(:);
pair_count(pair_count==0) = [];
pc = pair_count / sum(pair_count) * 100; %probability version

% prepare data file for R
dataFrame = [perms(1:6), zeros(factorial(6), 1)];
allRank = str2num(char(perms(1:6)+48));

for di = 1:ndata
    currR = dataR(di);
    currLoc = find(currR == allRank);
    dataFrame(currLoc, 7) = dataFrame(currLoc, 7) + 1;
end
writematrix(dataFrame,'rankdata.csv')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Computations and Tests
% number of unique responses
nUniqueR = sum(dataFrame(:,7)~=0);
mostR = dataFrame(dataFrame(:,7) == max(dataFrame(:,7)),1:6);
mostRN = max(dataFrame(:,7));
disp(['no. of unique ranking = ', num2str(nUniqueR)])

% compute mean of ranking difference
meanDist = mean(dMatrix, 3);
meanDist = tril(meanDist);
mDist = squeeze(meanDist);
mDist(mDist == 0) = []; % list version of matrix
meanDist(meanDist == 0) = NaN; % change 0 to NaN for plotting purposes

% compute standard deviation of ranking difference
dMatrix1 = dMatrix;
dMatrix1(dMatrix1==0) = NaN;
stdDist = std(dMatrix1,0,3,'omitnan');
stdDist = tril(stdDist);
sdDist = squeeze(stdDist);
sdDist(sdDist == 0) = [];
sdDist(isnan(sdDist)) = []; % list version of matrix
stdDist(stdDist == 0) = NaN; % change 0 to NaN for plotting purposes
%errorbar(mDist, sdDist, 'o')

% prepare data matrix for anova
data_anova = zeros(ndata, nchoosek(6,2));
PMpair = cell(nchoosek(6,2), 1);
cpairi = 0;
for si = 1:6
    for sj = 1:6
        if si < sj
            cpairi = cpairi + 1;
            data_anova(:, cpairi) = squeeze(dMatrix(si,sj,:));
            PMpair{cpairi} = [PM{si}, '/', PM{sj}];
        end
    end
end
% perform anova for ranking difference
alpha = 0.05;
[p,~,stats] = anova1(data_anova,[],'off');
if p > alpha
    disp('dist_res = similar')
else
    disp('dist_res = different')
end
% perform multiple comparison test
figure
[c, m, hmc] = multcompare(stats);
hmc.CurrentAxes.YTickLabel = flip(PMpair);
hmc.Name = 'Comparison : All';

% chi test for mean rank
% statistic from [Lee+, 2013]
% reference paper: https://doi.org/10.1186/1471-2288-13-65
% compute test statistic
meanRank = zeros(1,6);
for si = 1:6
    meanRank(si) = sum(sum(dataM == si).*[1:6])/ndata;
end
erank = repmat((6+1)/2, 1, 6);
cons = (12*ndata) / (6*(6+1));
chi_mean = cons*sum((meanRank - erank).^2,2 );
% print result
if chi2pdf(chi_mean, 6-1) > alpha
    disp('mean_res = similar')
else
    disp('mean_res = different')
end

% chi test for pair comparison
% statistic from [Lee+, 2013]
% reference paper: https://doi.org/10.1186/1471-2288-13-65
% compute test statistic
cons = (12*ndata);
part1 = (sum( tril(pairMatrix) , 'all' ) - 0.5*ndata).^2;
part2 = ((sum( tril(meanRank) , 'all' ) - ((6+1)/2) ).^2 ) / (6+1);
chi_pair = cons*(part1 - part2);
% print result
if chi2pdf(chi_pair, 6-1) > alpha
    disp('pair_res = similar')
else
    disp('pair_res = different')
end

%chi test for marginal matrix
% statistic from [Lee+, 2013]
% reference paper: https://doi.org/10.1186/1471-2288-13-65
% compute test statistic
emar = repmat(1/6, 6, 6);
cons = ndata*6;
tempM = (marMatrix/ndata - emar).^2;
chi_mar = cons*sum(tril( tempM-diag(diag(tempM)) ), 'all');
% print result
if chi2pdf(chi_mar, (6-1)^2) > alpha
    disp('mar_res = similar')
else
    disp('mar_res = different')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Matrices
% plot pair count frequency (undirected) matrix
figure
p1 = imagesc(prMatrix);
colormap('gray')
ax1 = gca;
ax1.FontSize = 18;
ax1.XTickLabel = PM;
ax1.YTickLabel = PM;
ax1.XTick = 1:6;
ax1.YTick = 1:6;
textStrings = num2str(prMatrix(:), '%d');
textStrings = strtrim(cellstr(textStrings));
[x, y] = meshgrid(1:6, 1:6);
hStrings0 = text(x(:), y(:), textStrings(:),...
    'HorizontalAlignment', 'center',...
    'FontSize', 14, 'Color', [0.3010 0.7450 0.9330]);
delete(findall(gcf,'String','NaN'));
set(p1, 'AlphaData', 1-isnan(prMatrix))
title({'How often do these pairs appear',...
     'beside each other in rankings?'},'FontSize', 24)

% plot distance matrix heatmaps
figure('Units', 'normalized', 'Position', [0.1300 0.1117 0.5750 0.5755]);
% heatmap for mean of distance
subplot(1,2,1)
imagesc(meanDist)
colormap(flipud(colormap('gray')))
title({'Average of', 'difference in ranking'},...
    'FontWeight', 'normal', 'FontSize', 18)
ax1 = gca;
ax1.FontSize = 18;
ax1.XTickLabel = PM;
ax1.YTickLabel = PM;
ax1.XTick = 1:6;
ax1.YTick = 1:6;
textStrings = num2str(meanDist(:), '%0.2f');
textStrings = strtrim(cellstr(textStrings));
[x, y] = meshgrid(1:6, 1:6);
hStrings1 = text(x(:), y(:), textStrings(:),...
    'HorizontalAlignment', 'center',...
    'FontSize', 14, 'Color', [0.8500 0.3250 0.0980]);
delete(findall(gcf,'String','NaN'));
% plot standard deviation of distance
subplot(1,2,2)
imagesc(stdDist)
colormap(flipud(colormap('gray')))
title({'Standard deviation of', 'difference in ranking'},...
    'FontWeight', 'normal', 'FontSize', 18)
ax1 = gca;
ax1.FontSize = 18;
ax1.XTickLabel = PM;
ax1.YTickLabel = PM;
ax1.XTick = 1:6;
ax1.YTick = 1:6;
textStrings = num2str(stdDist(:), '%0.2f');
textStrings = strtrim(cellstr(textStrings));
[x, y] = meshgrid(1:6, 1:6);
hStrings2 = text(x(:), y(:), textStrings(:),...
    'HorizontalAlignment', 'center',...
    'FontSize', 14, 'Color', [0.8500 0.3250 0.0980]);
delete(findall(gcf,'String','NaN'));
% overall title for subplots
sgtitle({'How far apart in rankings are a given pair?'...
    '\fontsize{14} \rm (ex: if A is Rank1 & B is Rank4, difference in ranking is 3)'},...
    'FontSize', 24,...
    'FontWeight', 'bold')

% plots for conditional matrices
for si = 1:6
    % plot member distribution per ranking, given Rank1 = member si
    figure('Units', 'normalized', 'Position', [0.1300 0.1117 0.5750 0.5755]);
    maxct = sum(cMatrix(:,1,si));
    marbar = barh(5:-1:1, cMatrix(:,:,si)', 'stacked');
    ax1 = gca;
    ax1.FontSize = 24;
    ax1.XTick = [0, maxct];
    ax1.XTickLabel = {'0%', '100%'};
    ax1.XLim = [0,maxct];
    ax1.XLabel.String = 'Proportion';
    ax1.XLabel.FontWeight = 'bold';
    ax1.YTickLabel = strseq("Rank ",6:-1:2);
    for ssi = 1:6
        marbar(ssi).FaceColor = PMcol(ssi,:);
        marbar(ssi).EdgeColor = PMcol(ssi,:);
    end
    title({'How are other members distributed',...
        ['in each rank if Rank 1 = ', PM{si}, '?']})

    % plot distance matrix, given Rank1 = member si
    % compute for mean
    tdMatrix = d2Matrix{si};
    meanDist = mean(tdMatrix, 3);
    meanDist = tril(meanDist);
    mDist = squeeze(meanDist);
    mDist(mDist == 0) = [];
    meanDist(meanDist == 0) = NaN;
    % compute for standard deviation
    dMatrix1 = tdMatrix;
    dMatrix1(dMatrix1==0) = NaN;
    stdDist = std(dMatrix1,0,3,'omitnan');
    stdDist = tril(stdDist);
    sdDist = squeeze(stdDist);
    sdDist(sdDist == 0) = [];
    sdDist(isnan(sdDist)) = [];
    stdDist(stdDist == 0) = NaN;
    % plot distance matrix heatmaps
    figure('Units', 'normalized', 'Position', [0.1300 0.1117 0.5750 0.5755]);
    % heatmap for mean of distance
    subplot(1,2,1)
    imagesc(meanDist) %[1 4]
    colormap(flipud(colormap('gray')))
    title({'Average of', 'difference in ranking'},...
        'FontWeight', 'normal', 'FontSize', 18)
    ax1 = gca;
    ax1.FontSize = 18;
    ax1.XTickLabel = PM;
    ax1.YTickLabel = PM;
    ax1.XTick = 1:6;
    ax1.YTick = 1:6;
    textStrings = num2str(meanDist(:), '%0.2f');
    textStrings = strtrim(cellstr(textStrings));
    [x, y] = meshgrid(1:6, 1:6);
    hStrings3 = text(x(:), y(:), textStrings(:),...
        'HorizontalAlignment', 'center',...
        'FontSize', 14, 'Color', PMcol(si,:));
    delete(findall(gcf,'String','NaN'));
    % heatmap for mean of standard deviation
    subplot(1,2,2)
    imagesc(stdDist) %[0 2]
    colormap(flipud(colormap('gray')))
    title({'Standard deviation of', 'difference in ranking'},...
        'FontWeight', 'normal', 'FontSize', 18)
    ax1 = gca;
    ax1.FontSize = 18;
    ax1.XTickLabel = PM;
    ax1.YTickLabel = PM;
    ax1.XTick = 1:6;
    ax1.YTick = 1:6;
    textStrings = num2str(stdDist(:), '%0.2f');
    textStrings = strtrim(cellstr(textStrings));
    [x, y] = meshgrid(1:6, 1:6);
    hStrings4 = text(x(:), y(:), textStrings(:),...
        'HorizontalAlignment', 'center',...
        'FontSize', 14, 'Color', PMcol(si,:));
    delete(findall(gcf,'String','NaN'));
    % overall title for subplots
    sgtitle({'How far apart in rankings are a given pair',...
        ['if Rank 1 = ', PM{si}, '?'],...
        '\fontsize{14} \rm (ex: if A is Rank1 & B is Rank4, difference in ranking is 3)'},...
        'FontSize', 24,...
        'FontWeight', 'bold')
        
    % prepare data matrix for anova
    tndata = size(tdMatrix,3);
    data_anova = zeros(tndata, nchoosek(6,2));
    cpairi = 0;
    for tsi = 1:6
        for tsj = 1:6
            if tsi < tsj
                cpairi = cpairi + 1;
                data_anova(:, cpairi) = squeeze(tdMatrix(tsi,tsj,:));
            end
        end
    end
    % perform anova for ranking difference
    alpha = 0.05;
    [~,~,stats] = anova1(data_anova,[],'off');
    % perform multiple comparison test
    figure
    [c, m, hmc] = multcompare(stats);
    hmc.CurrentAxes.YTickLabel = flip(PMpair);
    hmc.Name = ['Comparison : ', PM{si}];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional Plots Not Included in Thread
% plot ranking summary
figure
% heatmap for mean of ranking
subplot(2,1,1)
meanRanking = mean(dataM2);
imagesc(meanRanking)
colormap(flipud(colormap('gray')))
ax1 = gca;
ax1.FontSize = 18;
ax1.YTick = [];
ax1.XTick = [];
ax1.YLabel.String = 'Mean';
textStrings = num2str(meanRanking(:), '%0.2f');
textStrings = strtrim(cellstr(textStrings));
[x, y] = meshgrid(1:6, 1);
hStrings01 = text(x(:), y(:), textStrings(:),...
    'HorizontalAlignment', 'center',...
    'FontSize', 18, 'Color', [0.8500 0.3250 0.0980]);
% heatmap for standard deviation of ranking
subplot(2,1,2)
sdRanking = std(dataM2);
imagesc(sdRanking)
colormap(flipud(colormap('gray')))
ax1 = gca;
ax1.FontSize = 18;
ax1.YTick = [];
ax1.XTickLabel = PM;
ax1.YLabel.String = {'Standard', 'Deviation'};
textStrings = num2str(sdRanking(:), '%0.2f');
textStrings = strtrim(cellstr(textStrings));
[x, y] = meshgrid(1:6, 1);
hStrings02 = text(x(:), y(:), textStrings(:),...
    'HorizontalAlignment', 'center',...
    'FontSize', 18, 'Color', [0.8500 0.3250 0.0980]);
sgtitle('How were the members ranked?','FontSize', 24,...
    'FontWeight', 'bold')

% plot member distribution per ranking
figure('Units', 'normalized', 'Position', [0.1300 0.1117 0.5750 0.5755]);
maxct = sum(marMatrix, 'all');
marbar = barh(6:-1:1, marMatrix', 'stacked');
ax1 = gca;
ax1.FontSize = 24;
ax1.XTick = [0, ndata];
ax1.XTickLabel = {'0%', '100%'};
ax1.XLabel.String = 'Proportion';
ax1.XLabel.FontWeight = 'bold';
ax1.YTickLabel = strseq("Rank ",6:-1:1);
for ssi = 1:6
    marbar(ssi).FaceColor = PMcol(ssi,:);
    marbar(ssi).EdgeColor = PMcol(ssi,:);
end
title('How are the members distributed in each rank?')

% plot pair matrix comparison (probability)
figure('Units', 'normalized', 'Position', [0.1300 0.1117 0.5750 0.5755]);
for si = 1:6
    cdist = pairPMatrix(si,:);
    cdist(si)=[];
    slist = 1:6;
    slist(si) = [];
    pl = plot(slist, cdist, 'color', [PMcol(si,:), 0.3], 'Marker','.',...
        'MarkerSize',50, 'LineWidth',3, 'MarkerEdgeColor', PMcol(si,:));
    hold on
end
hold off
lg = legend(strcat("Member i = ", PM));
lg.FontSize = 14;
lg.Box = 'off';
ax1 = gca;
ax1.FontSize = 24;
ax1.XLim = [0.5 6.5];
ax1.XTick = 1:6;
ax1.XTickLabel = PM;
ax1.XLabel.String = 'Member j';
ax1.XLabel.FontWeight = 'bold';
ax1.YLabel.String = 'Empirical Probability';
ax1.YLabel.FontWeight = 'bold';
title({'Probability that member i is', 'ranked higher than member j'},...
    'FontSize', 24)

% additional conditional matrix plots
for si = 1:6
    % plot conditional pair matrix comparison (probability), 
    % given Rank1 = member si, on the same window
    figure('Units', 'normalized',...
        'Position', [0.1300 0.1117 0.5750 0.5755]);
    tPMcol = PMcol;
    tPMcol(si,:) = [];
    tPM = PM;
    tPM(si) = [];
    for ssi = 1:5
        cdist = cppMatrix(ssi,:,si);
        cdist(ssi)=[];
        slist = 1:5;
        slist(ssi) = [];
        pl = plot(slist, cdist, 'color', [tPMcol(ssi,:), 0.3],...
            'Marker','.', 'MarkerSize',50,...
            'LineWidth',3, 'MarkerEdgeColor', tPMcol(ssi,:));
        hold on
    end
    hold off
    lg = legend(strcat("Member i = ", tPM));
    lg.FontSize = 14;
    lg.Box = 'off';
    ax1 = gca;
    ax1.FontSize = 24;
    ax1.XLim = [0.5 5.5];
    ax1.XTick = 1:5;
    ax1.XTickLabel = tPM;
    ax1.XLabel.String = 'Member j';
    ax1.XLabel.FontWeight = 'bold';
    ax1.YLabel.String = 'Empirical Probability';
    ax1.YLabel.FontWeight = 'bold';
    title({['Given Rank 1 = ', PM{si},', probability that'], ...
        'member i is ranked higher than member j'},...
        'FontSize', 24)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
