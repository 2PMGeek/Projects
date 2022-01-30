%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Bias-Major Relationship
% Codes by @2PMGeek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all force
addpath('0library')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Labels and Data
PMf = {'Jun. K', 'Nichkhun', 'Taecyeon', 'Wooyoung',  'Junho', 'Chansung'};
PM = {'JK', 'NK', 'TY', 'WY',  'JH', 'CS'};

% MBTI labels
mtype = {'ENFP', 'ENFJ', 'ENTP', 'ENTJ', 'ESFP', 'ESFJ', 'ESTP', 'ESTJ',...
    'INFP', 'INFJ', 'INTP', 'INTJ', 'ISFP', 'ISFJ', 'ISTP', 'ISTJ'};
MBTI0 = {'I-E', 'S-N', 'T-F', 'J-P'};
MBTI1f = {'Introverts', 'Sensors','Thinkers','Judgers'};
MBTI2f = {'Extroverts', 'iNtuitives', 'Feelers', 'Perceivers'};

% Matrix for Member Colors
PMcol = [253/255, 90/255, 221/255;
    1, 0, 0;
    0, 176/255, 80/255;
    0, 112/255, 192/255;
    1, 192/255, 0;
    112/255, 48/255, 160/255];

% load data matrix
% Data Matrix : Major
% Row: responses
% Col 1: Bias
% Col 2: I/E
% Col 3: S/N
% Col 4: T/F
% Col 5: J/P
data = [6	0	0	0	0
    6	0	0	0	0
    6	0	0	0	0
    6	0	0	1	0
    6	0	0	1	0
    6	0	1	0	1
    6	0	1	0	0
    6	0	1	0	0
    6	0	1	0	0
    6	1	0	0	1
    6	1	0	0	1
    6	1	0	0	1
    6	1	0	0	1
    6	1	0	0	1
    6	1	0	0	1
    6	1	0	0	1
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	0	0
    6	1	0	1	1
    6	1	0	1	1
    6	1	0	1	1
    6	1	0	1	1
    6	1	0	1	1
    6	1	0	1	0
    6	1	0	1	0
    6	1	0	1	0
    6	1	0	1	0
    6	1	1	0	1
    6	1	1	0	1
    6	1	1	0	1
    6	1	1	0	1
    6	1	1	0	1
    6	1	1	0	1
    6	1	1	0	0
    6	1	1	0	0
    6	1	1	0	0
    6	1	1	0	0
    6	1	1	0	0
    6	1	1	1	1
    6	1	1	1	1
    6	1	1	1	0
    6	1	1	1	0
    1	0	0	0	1
    1	0	0	0	0
    1	0	0	0	0
    1	0	0	0	0
    1	0	0	0	0
    1	0	0	0	0
    1	0	0	0	0
    1	0	0	1	1
    1	0	0	1	0
    1	0	1	1	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	1
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	0	0
    1	1	0	1	1
    1	1	0	1	1
    1	1	0	1	1
    1	1	0	1	1
    1	1	0	1	1
    1	1	0	1	1
    1	1	0	1	0
    1	1	0	1	0
    1	1	0	1	0
    1	1	1	0	1
    1	1	1	0	0
    1	1	1	0	0
    1	1	1	0	0
    1	1	1	0	0
    1	1	1	0	0
    1	1	1	0	0
    1	1	1	0	0
    1	1	1	1	1
    1	1	1	1	1
    1	1	1	1	1
    1	1	1	1	0
    1	1	1	1	0
    1	1	1	1	0
    1	1	1	1	0
    5	0	0	0	1
    5	0	0	0	1
    5	0	0	0	1
    5	0	0	0	0
    5	0	0	0	0
    5	0	0	0	0
    5	0	0	1	0
    5	0	0	1	0
    5	0	0	1	0
    5	0	1	0	1
    5	0	1	0	0
    5	0	1	1	1
    5	0	1	1	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	1
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	0	0
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	1
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	0	1	0
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	1
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	0	0
    5	1	1	1	1
    5	1	1	1	1
    5	1	1	1	1
    5	1	1	1	1
    5	1	1	1	1
    5	1	1	1	1
    5	1	1	1	1
    5	1	1	1	1
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    5	1	1	1	0
    2	0	0	0	1
    2	0	0	0	1
    2	0	0	0	0
    2	0	0	1	1
    2	0	1	1	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	1
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	0	0
    2	1	0	1	1
    2	1	0	1	1
    2	1	0	1	0
    2	1	0	1	0
    2	1	0	1	0
    2	1	0	1	0
    2	1	1	0	1
    2	1	1	0	1
    2	1	1	0	1
    2	1	1	0	1
    2	1	1	0	1
    2	1	1	0	1
    2	1	1	0	0
    2	1	1	0	0
    2	1	1	0	0
    2	1	1	0	0
    2	1	1	1	1
    2	1	1	1	1
    2	1	1	1	1
    2	1	1	1	1
    3	0	0	0	1
    3	0	0	0	1
    3	0	0	0	0
    3	0	0	0	0
    3	0	0	0	0
    3	0	0	0	0
    3	0	0	0	0
    3	0	0	0	0
    3	0	0	0	0
    3	0	0	1	1
    3	0	0	1	0
    3	0	0	1	0
    3	0	0	1	0
    3	0	1	0	1
    3	0	1	0	1
    3	0	1	0	0
    3	0	1	0	0
    3	0	1	0	0
    3	0	1	0	0
    3	0	1	1	1
    3	0	1	1	0
    3	0	1	1	0
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	1
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	0	0
    3	1	0	1	1
    3	1	0	1	1
    3	1	0	1	1
    3	1	0	1	1
    3	1	0	1	1
    3	1	0	1	1
    3	1	0	1	1
    3	1	0	1	0
    3	1	0	1	0
    3	1	0	1	0
    3	1	0	1	0
    3	1	0	1	0
    3	1	0	1	0
    3	1	0	1	0
    3	1	0	1	0
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	1
    3	1	1	0	0
    3	1	1	0	0
    3	1	1	0	0
    3	1	1	0	0
    3	1	1	0	0
    3	1	1	0	0
    3	1	1	0	0
    3	1	1	0	0
    3	1	1	0	0
    3	1	1	0	0
    4	0	0	0	1
    4	0	0	0	0
    4	0	0	0	0
    4	0	0	0	0
    4	0	0	0	0
    4	0	0	1	0
    4	0	0	1	0
    4	0	1	0	1
    4	0	1	0	0
    4	0	1	0	0
    4	0	1	0	0
    4	0	1	1	1
    4	0	1	1	1
    4	1	0	0	1
    4	1	0	0	1
    4	1	0	0	1
    4	1	0	0	1
    4	1	0	0	1
    4	1	0	0	1
    4	1	0	0	1
    4	1	0	0	1
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	0	0
    4	1	0	1	1
    4	1	0	1	1
    4	1	0	1	1
    4	1	0	1	1
    4	1	0	1	1
    4	1	0	1	1
    4	1	0	1	0
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	1
    4	1	1	0	0
    4	1	1	0	0
    4	1	1	0	0
    4	1	1	0	0
    4	1	1	0	0
    4	1	1	0	0
    4	1	1	0	0
    4	1	1	1	1
    4	1	1	1	1
    4	1	1	1	1
    4	1	1	1	1
    4	1	1	1	0
    4	1	1	1	0
    4	1	1	1	0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Data Processing and Matrix Generations
% initialize matrices
pct_bias = zeros(2,4,6); % percentages for type given bias, per category
pct_type = zeros(2,4,6); % percentages for bias given type, per category
mbti_pct = zeros(16,6); % percentages for each of 16 types given bias
mbti_gpct = zeros(16,1);
mbti_pct_type = zeros(16,6); % percentages for each of 16 types given bias

% compute relevant probabilities
d_mbti = data(:,2:end);
Bias = data(:,1);

% convert 16 MBTI types to numerical category
d_mbti16 = (d_mbti(:,1).*8) + (d_mbti(:,2).*4) +...
    (d_mbti(:,3).*2) + (d_mbti(:,4).*1)+1;

for i = 1:6
    % compute probability of each type given bias
    pct1 = sum(data(Bias == i,2:5)) ./ size(data(Bias == i),1);
    temp1 = [pct1; 1-pct1];
    pct_bias(:,:,i) = temp1;

    % prepare count matrix for pct_type
    pct2 = sum(data(Bias == i,2:5));
    temp2 = [pct2; size(data(Bias == i),1)-pct2];
    pct_type(:,:,i) = temp2;

    % compute probability of each of the 16 types given bias
    d_mbti16_bias = d_mbti16(Bias == i);
    for ti = 1:16
        % compute for bias-specific
        mbti_pct(ti, i) = sum(d_mbti16_bias == ti) ./ size(d_mbti16_bias, 1);
        % compute for general
        mbti_gpct(ti) = sum(d_mbti16 == ti) ./ size(d_mbti16,1);
        % prepare count matrix for pct_type
        mbti_pct_type(ti, i) = sum(d_mbti16_bias == ti);
    end
end

% convert count matrix to probability matrix, conditional to MBTI type
pct_type = permute(pct_type,[3 1 2]);
pct_type = pct_type ./ sum(pct_type, 1);
mbti_pct_type = mbti_pct_type ./ sum(mbti_pct_type,2);

% compute general trends
gpct = sum(d_mbti)./size(data,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tests

% Perform Chi Square Test for Independence
% for bias vs (combinations of) MBTI type

% MBTI type levels:
% L1 : one category (four tests, two MBTI values each)
% ex: I-E (I vs E), S-N (S vs N), etc
% L2 : two categories (six tests, four MBTI values each)
% ex: I-E + S-N (IS vs IN vs ES vs EN), etc
% L3 : three categories (four tests, eight MBTI values each)
% L4 : all categories (one test, sixteen MBTI values total)

alpha = 0.1;
for mti = 1:4 % L1
    % prepare observed data matrix
    dt = zeros(2,6);
    for mi=1:6
        dt(:,mi) = [size(data(Bias == mi & data(:,mti+1)==1),1);...
            size(data(Bias == mi & data(:,mti+1)==0),1)];
    end
    % perform chi-square test for independence
    [h, ~, p, assump] = chi2ind(dt, alpha);
    if h % for displaying results
        res = 'independent';
    else
        res = 'dependent';
    end
    if assump %assump checks if sample size assumptions are met
        v = '';
    else
        v = '*not valid*';
    end
    % display result
    fprintf('%s \t \t \t : %s (%.4f) %s\n', MBTI0{mti}, res, p, v)

    for mtij = 1:4 % L2
        if mtij > mti % to avoid repetitive tests
            % prepare observed data matrix
            dt = zeros(4,6);
            for mi=1:6
                dt(:,mi) = [...
                    size(data(Bias == mi & data(:,mti+1)==1 &...
                    data(:,mtij+1)==1),1);...
                    size(data(Bias == mi & data(:,mti+1)==1 &...
                    data(:,mtij+1)==0),1);...
                    size(data(Bias == mi & data(:,mti+1)==0 &...
                    data(:,mtij+1)==1),1);...
                    size(data(Bias == mi & data(:,mti+1)==0 &...
                    data(:,mtij+1)==0),1)...
                    ];
            end
            % perform chi-square test for independence
            [h, ~, p, assump] = chi2ind(dt, alpha);
            if h % for displaying results
                res = 'independent';
            else
                res = 'dependent';
            end
            if assump %assump checks if sample size assumptions are met
                v = '';
            else
                v = '*not valid*';
            end
            % display result
            fprintf('%s + %s \t \t : %s (%.4f) %s\n',...
                MBTI0{mti}, MBTI0{mtij}, res, p, v )

            for mtijk = 1:4 % for L3
                if mtijk > mtij % to avoid repetitive tests
                    % prepare observed data matrix
                    dt = zeros(8,6);
                    for mi=1:6
                        dt(:,mi) = [...
                            size(data(Bias == mi & data(:,mti+1)==1 &...
                            data(:,mtij+1)==1 & data(:,mtijk+1)==1),1);...
                            size(data(Bias == mi & data(:,mti+1)==1 &...
                            data(:,mtij+1)==1 & data(:,mtijk+1)==0),1);...
                            size(data(Bias == mi & data(:,mti+1)==1 &...
                            data(:,mtij+1)==0 & data(:,mtijk+1)==1),1);...
                            size(data(Bias == mi & data(:,mti+1)==1 &...
                            data(:,mtij+1)==0 & data(:,mtijk+1)==0),1);...
                            size(data(Bias == mi & data(:,mti+1)==0 &...
                            data(:,mtij+1)==1 & data(:,mtijk+1)==1),1);...
                            size(data(Bias == mi & data(:,mti+1)==0 &...
                            data(:,mtij+1)==1 & data(:,mtijk+1)==0),1);...
                            size(data(Bias == mi & data(:,mti+1)==0 &...
                            data(:,mtij+1)==0 & data(:,mtijk+1)==1),1);...
                            size(data(Bias == mi & data(:,mti+1)==0 &...
                            data(:,mtij+1)==0 & data(:,mtijk+1)==0),1)...
                            ];
                    end
                    % perform chi-square test for independence
                    [h, ~, p, assump] = chi2ind(dt, alpha);
                    if h % for displaying results
                        res = 'independent';
                    else
                        res = 'dependent';
                    end
                    if assump %assump checks if sample size assumptions are met
                        v = '';
                    else
                        v = '*not valid*';
                    end
                    % display result
                    fprintf('%s + %s + %s \t : %s (%.4f) %s\n',...
                        MBTI0{mti}, MBTI0{mtij}, MBTI0{mtijk}, res, p, v)

                    for mtijkl = 1:4 % for L4
                        if mtijkl > mtijk % to avoid repetitive tests
                            % prepare observed data matrix
                            dt = zeros(16,6);
                            for mi=1:6
                                dt(:,mi) = [...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==1 & data(:,mtij+1)==1 &...
                                    data(:,mtijk+1)==1 & data(:,mtijkl+1)==1),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==1 & data(:,mtij+1)==1 &...
                                    data(:,mtijk+1)==1 & data(:,mtijkl+1)==0),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==1 & data(:,mtij+1)==1 &...
                                    data(:,mtijk+1)==0 & data(:,mtijkl+1)==1),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==1 & data(:,mtij+1)==1 &...
                                    data(:,mtijk+1)==0 & data(:,mtijkl+1)==0),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==1 & data(:,mtij+1)==0 &...
                                    data(:,mtijk+1)==1 & data(:,mtijkl+1)==1),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==1 & data(:,mtij+1)==0 &...
                                    data(:,mtijk+1)==1 & data(:,mtijkl+1)==0),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==1 & data(:,mtij+1)==0 &...
                                    data(:,mtijk+1)==0 & data(:,mtijkl+1)==1),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==1 & data(:,mtij+1)==0 &...
                                    data(:,mtijk+1)==0 & data(:,mtijkl+1)==0),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==0 & data(:,mtij+1)==1 &...
                                    data(:,mtijk+1)==1 & data(:,mtijkl+1)==1),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==0 & data(:,mtij+1)==1 &...
                                    data(:,mtijk+1)==1 & data(:,mtijkl+1)==0),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==0 & data(:,mtij+1)==1 &...
                                    data(:,mtijk+1)==0 & data(:,mtijkl+1)==1),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==0 & data(:,mtij+1)==1 &...
                                    data(:,mtijk+1)==0 & data(:,mtijkl+1)==0),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==0 & data(:,mtij+1)==0 &...
                                    data(:,mtijk+1)==1 & data(:,mtijkl+1)==1),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==0 & data(:,mtij+1)==0 &...
                                    data(:,mtijk+1)==1 & data(:,mtijkl+1)==0),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==0 & data(:,mtij+1)==0 &...
                                    data(:,mtijk+1)==0 & data(:,mtijkl+1)==1),1);...
                                    size(data(Bias == mi &...
                                    data(:,mti+1)==0 & data(:,mtij+1)==0 &...
                                    data(:,mtijk+1)==0 & data(:,mtijkl+1)==0),1)...
                                    ];
                            end
                            % perform chi-square test for independence
                            [h, ~, p, assump] = chi2ind(dt, alpha);
                            if h % for displaying results
                                res = 'independent';
                            else
                                res = 'dependent';
                            end
                            %assump checks if sample size assumptions are met
                            if assump
                                v = '';
                            else
                                v = '*not valid*';
                            end
                            % display result
                            fprintf('%s + %s + %s + %s \t : %s (%.4f) %s\n',...
                                MBTI0{mti}, MBTI0{mtij}, MBTI0{mtijk},...
                                MBTI0{mtijkl}, res, p, v)

                        end
                    end
                end
            end
        end
    end
end

% Decision Tree
Introverts = logical(data(:,2));
Sensors = logical(data(:,3));
Thinkers = logical(data(:,4));
Judgers = logical(data(:,5));
data1 = table(Bias, Introverts, Sensors, Thinkers, Judgers);
tree = fitctree(data1,'Bias','CategoricalPredictors','all'); %,'CrossVal','on'
view(tree,'Mode','graph')

% check which predictors are important
imp = predictorImportance(tree);
figure;
bar(imp);
title('Predictor Importance Estimates');
ylabel('Estimates');
xlabel('Predictors');
h = gca;
h.TickLabelInterpreter = 'none';
h.XTickLabel = MBTI0;

% PCA : check which variables account for variability in responses
fprintf('\nPC Loadings :\n')
pcres = pca(data(:,2:end))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Matrices
% plot distribution for each MBTI type level
for j = 1:4
    % plot distribution given bias
    figure
    temp3 = squeeze(pct_bias(:,j,:));
    a = barh(6:-1:1,temp3','stacked', 'EdgeColor','none');
    a(1).FaceColor = [0.8500 0.3250 0.0980];
    a(1).EdgeColor = [0.8500 0.3250 0.0980];
    a(2).FaceColor = [0.3010 0.7450 0.9330];
    a(2).EdgeColor = [0.3010 0.7450 0.9330];
    ax1 = gca;
    ax1.FontSize = 24;
    ax1.YTickLabel = flip(PM);
    ax1.XAxis.Visible = 'off';
    xline(gpct(j), 'LineWidth',5,'LineStyle','--','Color',[0.7, 0.7,0.7])
    lgd = legend({MBTI1f{j}, MBTI2f{j}, 'Hottest'});
    lgd.Location = 'southoutside';
    lgd.Orientation = 'horizontal';
    lgd.Box = 'off';
    title('Proportion of MBTI types, given bias')
    
    % plot distribution given MBTI type
    figure
    % for overall distribution
    subplot(4,4,13:16)
    gdt = [gpct(j); 1-gpct(j)];
    a = barh(1, gdt','stacked');
    a(1).FaceColor = [0.8500 0.3250 0.0980];
    a(1).EdgeColor = [0.8500 0.3250 0.0980];
    a(2).FaceColor = [0.3010 0.7450 0.9330];
    a(2).EdgeColor = [0.3010 0.7450 0.9330];
    ax1 = gca;
    ax1.FontSize = 24;
    ax1.XLim = [0 1];
    ax1.XTick = [0, 0.5, 1];
    ax1.XColor = 'none';
    ax1.YColor = 'none';
    ax1.Box = 'off';
    lgd = legend({MBTI1f{j}, MBTI2f{j}});
    lgd.Location = 'south';
    lgd.Orientation = 'horizontal';
    lgd.Box = 'off';
    lgd.FontSize = 12;
    title('Hottest', 'FontSize', 16, 'FontWeight','normal')

    % for first type in category
    subplot(4,4,[1 2 5 6 9 10])
    dt = pct_type(:,1,j);
    ht = pie(dt);
    colormap(PMcol)
    set(findobj(ht,'type','text'),'fontsize',16)
    T = ht(strcmpi(get(ht,'Type'),'text'));
    P = cell2mat(get(T,'Position'));
    set(T,{'Position'},num2cell(P*0.92,2));
    set(gca, 'FontSize', 24)
    title(MBTI1f{j},'FontSize', 24);

    % for second type in category
    subplot(4,4,[3 4 7 8 11 12])
    dt = pct_type(:,2,j);
    ht = pie(dt);
    colormap(PMcol)
    set(findobj(ht,'type','text'),'fontsize',16)
    T = ht(strcmpi(get(ht,'Type'),'text'));
    P = cell2mat(get(T,'Position'));
    set(T,{'Position'},num2cell(P*0.92,2));
    set(gca, 'FontSize', 24)
    title(MBTI2f{j},'FontSize', 24);
end

% plot distribution for bias (per 16 types)
for si = 1:6
    pcol = PMcol(si,:);
    dt = [mbti_pct(:,si), mbti_gpct];

    f1 = figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
    pl2 = bar(dt, 'EdgeColor','none');
    pl2(1).FaceColor = pcol;
    pl2(2).FaceColor = [0.7 0.7 0.7];
    title(PMf{si})
    ax1 = gca;
    ax1.FontSize = 24;
    ax1.XTick = 1:16;
    ax1.XTickLabel = mtype;
    ax1.YLim = [0, 0.3];
    xlabel('MBTI Type')
    ylabel('Proportion')
end

% plot overall distribution for Hottest (per 16 types)
f2 = figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
pl2 = bar(dt(:,2), 'EdgeColor','none');
pl2.FaceColor = [0.3 0.3 0.3];
title('Hottest')
ax1 = gca;
ax1.FontSize = 24;
ax1.XTick = 1:16;
ax1.XTickLabel = mtype;
xlabel('MBTI Type')
ylabel('Proportion')

% plot distribution for bias given type (per category) in one figure
figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
plot(reshape(pct_type,[6 8]), 'LineWidth',5,'Marker','o', 'MarkerSize',25)
ax1 = gca;
ax1.FontSize = 24;
ax1.XTickLabel = PM;
ax1.XTick = 1:6;
ax1.XLim = [0.75 6.25];
ylabel('Proportion')
xlabel('Bias')
lgd = legend(reshape([MBTI1f;MBTI2f], [8 1]));
lgd.Location = 'southoutside';
lgd.Orientation = 'horizontal';
lgd.NumColumns = 4;
title('Proportion of biases, given MBTI category')

% plot distribution for type given bias (per MBTI type level) in one figure
figure
b1 = barh(4:-1:1, [gpct; 1-gpct]','stacked');
xline(0.5, 'LineWidth',5,'LineStyle','-.','Color',[0.3, 0.3,0.3])
b1(1).FaceColor = [0.8500 0.3250 0.0980];
b1(1).EdgeColor = [0.8500 0.3250 0.0980];
b1(2).FaceColor = [0.3010 0.7450 0.9330];
b1(2).EdgeColor = [0.3010 0.7450 0.9330];
title('Hottest')
ax1 = gca;
ax1.FontSize = 24;
ax1.XTick = 0.5;
ax1.Box = 'off';
ax1.XLim = [0 1];

yyaxis left
ax1.YTickLabel = flip(MBTI1f);
ax1.YTick = 1:4;
yyaxis right
ax1.YTickLabel = flip(MBTI2f);
ax1.YTick = 1:4;
ax1.YColor = 'k';

% plot distribution for bias given type (per 16 types) in one figure
for mti = 1:16
    if mod(mti,4)== 1
        figure
    end
    try
        subplot(2,2,mod(mti,4))
    catch
        subplot(2,2,4)
    end
    dt = mbti_pct_type(mti,:);
    ht = pie(dt);
    colormap(PMcol)
    set(findobj(ht,'type','text'),'fontsize',16)
    T = ht(strcmpi(get(ht,'Type'),'text'));
    P = cell2mat(get(T,'Position'));
    set(T,{'Position'},num2cell(P*0.92,2));
    set(gca, 'FontSize', 16)
    title(mtype{mti});
    th = findobj(ht,'Type','Text'); % text handles
    isSmall = startsWith({th.String}, '0');  % r2016b or later
    set(th(isSmall),'String', '')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional Plots and Tests Not Included in Thread
% plot distribution for type given bias (per 16 types) in one figure
figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
pl = plot([mbti_pct, mbti_gpct], 'LineWidth', 3,...
    'Marker','o', 'MarkerSize',10);
for li = 1:6
    pl(li).Color = PMcol(li,:);
end
pl(7).Color = [0.7 0.7 0.7];
pl(7).LineStyle = '--';
pl(7).LineWidth = 10;
pl(7).Marker = 'd';
pl(7).MarkerSize = 25;
ax1 = gca;
ax1.FontSize = 24;
ax1.XTickLabel = mtype;
ax1.XTick = 1:16;
ax1.XLim = [0.75 16.25];
ylabel('Proportion')
xlabel('MBTI Type')
title('Proportion of MBTI type, given bias')

% nominal logistic regression
[B, dev, stats] = mnrfit(Bias,d_mbti16);
[pihat,dlow,dhi] = mnrval(B,(1:6)', stats);
[~, bhat]=max(pihat,[],2);
ntype = 16;

for si = 1:6
    dt = pihat(si,:);
    et = dlow(si,:);
    pcol = PMcol(si,:);

    dm = mbti_pct(:,si);
    gm = mbti_gpct;
    f1 = figure('Units', 'normalized', 'Position', [0 0.1811 0.7033 0.6733]);
    pl = plot(1:ntype,dt,'Color',pcol,'LineWidth',5,...
        'MarkerSize',75, 'Marker','.');
    hold on
    ple = errorbar(dt,et,'Color',pcol,'LineWidth',3);
    pl2 = plot(1:ntype,dm,'Color','k','LineWidth',3,...
        'LineStyle','--', 'MarkerSize',15, 'Marker','x');
    pl3 = plot(1:ntype,gm,'Color',[0.7 0.7 0.7],'LineWidth',3,...
        'LineStyle',':', 'MarkerSize',15, 'Marker','+');
    hold off
    title(PMf{si})
    ax1 = gca;
    ax1.FontSize = ntype;
    ax1.XTick = 1:ntype;
    ax1.FontSize = 24;
    ax1.XTickLabel = mtype;
    lgd = legend({'Estimate', '', 'Actual', 'Hottest'});
    lgd.Location = 'southoutside';
    lgd.Orientation = 'horizontal';
    lgd.NumColumns = 3;
end