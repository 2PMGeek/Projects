################################################################
# Project: Bias-Favorite Title Track Relationship
# Codes by @2PMGeek
################################################################

################################################################
## Library
library(ggplot2)
library(ggpubr)
library(plyr)
library(dplyr)
################################################################

################################################################
## Labels and Data
PM = c('JK', 'NK', 'TY', 'WY',  'JH', 'CS')
PMf = c('Jun. K', 'Nichkhun', 'Taecyeon', 'Wooyoung',  'Junho', 'Chansung')
songKR = c('10점 만점에 10점\n[10 Out Of 10]', 'Again & Again', 'Heartbeat', 'Without U', 'I\'ll Be Back', 'Hands Up', '이 노래를 듣고 돌아와\n[C.B.W.Y.H.T.S]', '하.니.뿐.\n[A.D.T.O.Y.]', '미친거 아니야?\n[Go Crazy!]', '우리집\n[My House]', 'Promise (I\'ll Be)', '해야 해\n[Make It]')
songJP = c('Take Off', 'I\'m Your Man', 'Ultra Lover', 'Beautiful', 'マスカレード\n 〜Masquerade〜', 'GIVE ME LOVE', 'Winter Games', 'Step By Step', 'ミダレテミナ\n[Go Crazy!]', 'Guilty Love', 'HIGHER', 'Promise (I\'ll Be)', '僕とまた\n[With Me Again]')
songKR2 = c('10점 만점에 10점 [10 Out Of 10]', 'Again & Again', 'Heartbeat', 'Without U', 'I\'ll Be Back', 'Hands Up', '이 노래를 듣고 돌아와 [C.B.W.Y.H.T.S]', '하.니.뿐. [A.D.T.O.Y.]', '미친거 아니야?[Go Crazy!]', '우리집 [My House]', 'Promise (I\'ll Be)', '해야 해 [Make It]') #song titles but one line
songJP2 = c('Take Off', 'I\'m Your Man', 'Ultra Lover', 'Beautiful', 'マスカレード～Masquerade～', 'GIVE ME LOVE', 'Winter Games', 'Step By Step', 'ミダレテミナ [Go Crazy!]', 'Guilty Love', 'HIGHER', 'Promise (I\'ll Be)', '僕とまた [With Me Again]') #song titles but one line
nKR = length(songKR)
nJP = length(songJP)

# Matrix for Member Colors
PMcol = c('#fd5add', '#ff0000', '#00b050', '#0070c0', '#ffc000', '#7030a0')

# Data Matrix : Favorite Voice Given Bias
# Dim1: favorite JP title track
# Dim2: favorite KR title track
# Dim3: bias
x = c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,3,0,1,0,1,0,1,0,0,2,0,0,0,2,0,2,1,2,0,1,0,0,1,0,0,1,1,0,2,0,1,0,0,2,0,3,0,0,1,2,0,6,0,0,0,0,0,0,0,0,0,1,0,0,2,0,0,0,1,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,2,0,0,0,0,0,0,0,0,0,0,2,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0,4,0,2,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,1,2,0,0,0,0,0,0,0,0,1,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,1,2,2,0,3,0,0,1,3,0,8,0,4,0,1,0,0,1,0,0,0,1,0,2,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,2,1,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,1,0,1,1,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,0,1,0,0,0,0,2,0,0,1,0,0,0,0,0,0,0,1,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,0,0,0,0,0,1,0,1,2,4,1,2,0,1,2,0,0,1,6,1,5,0,1,0,0,0,0,1,0,0,0,7,0,2,0,3,0,2,0,0,0,0,1,0,1,0,1,3,0,0,1,1,0,1,0,0,1,4,0,4,0,2,0,0,0,0,0,0,0,0,1,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,4,0,0,0,0,0,0,0,0,0,1,1,0,3)
data = array(x, dim=c(nJP,nKR,6), dimnames=list(songJP2, songKR2, PMf))

# Prepare data.frame
col_songKR = rep(rep(songKR2, each=nJP),6)
col_songJP = rep(rep(songJP2, nKR),6)
col_member = rep(PM, each=nJP*nKR)
col_count = x
alldata = data.frame(col_songKR, col_songJP, col_member, col_count)
alldata$col_songKR = factor(alldata$col_songKR, levels = songKR2)
alldata$col_songJP = factor(alldata$col_songJP, levels = songJP2)
alldata$col_member = factor(alldata$col_member, levels = PM)

# Prepare matrices
dataKR = apply(data,c(2,3),sum)
dataJP = apply(data,c(1,3),sum)
dataALL = apply(data,c(1,2),sum)
dataKRt = apply(data,2,sum)
dataJPt = apply(data,1,sum)
################################################################

################################################################
## Fisher Exact Test
#KR-bias
ftpval = fisher.test(dataKR, simulate.p.value=TRUE)$p.value
cat(paste('p-value =', format(ftpval,nsmall=6)))
if(ftpval < 0.05){
	message('Fav KR Title Track - Bias :: Not Independent at \U03B1 = 0.05')
} else{
	cat('Fav KR Title Track - Bias :: Independent at \U03B1 = 0.05')
}
if(ftpval < 0.01){
	message('Fav KR Title Track - Bias :: Not Independent at \U03B1 = 0.01')
} else{
	cat('Fav KR Title Track - Bias :: Independent at \U03B1 = 0.01')
}

#JP-bias
ftpval = fisher.test(dataJP, simulate.p.value=TRUE)$p.value
cat(paste('p-value =', format(ftpval,nsmall=6)))
if(ftpval < 0.05){
	message('Fav JP Title Track - Bias :: Not Independent at \U03B1 = 0.05')
} else{
	cat('Fav JP Title Track - Bias :: Independent at \U03B1 = 0.05')
}
if(ftpval < 0.01){
	message('Fav JP Title Track - Bias :: Not Independent at \U03B1 = 0.01')
} else{
	cat('Fav JP Title Track - Bias :: Independent at \U03B1 = 0.01')
}

#KR-JP
ftpval = fisher.test(dataALL, simulate.p.value=TRUE)$p.value
cat(paste('p-value =', format(ftpval,nsmall=6)))
if(ftpval < 0.05){
	message('Fav KR Title Track - Fav JP Title Track :: Not Independent at \U03B1 = 0.05')
} else{
	cat('Fav KR Title Track - Fav JP Title Track :: Independent at \U03B1 = 0.05')
}
if(ftpval < 0.01){
	message('Fav KR Title Track - Fav JP Title Track :: Not Independent at \U03B1 = 0.01')
} else{
	cat('Fav KR Title Track - Fav JP Title Track :: Independent at \U03B1 = 0.01')
}
################################################################

################################################################
## Plot Matrices
# plot for fav KR title track
col_song = songKR
col_count = dataKRt/sum(dataKRt)*100
pmt = data.frame(col_song, col_count)
pmt$col_song = factor(pmt$col_song, levels=songKR)
ggplot(pmt) + 
	geom_bar(stat="identity", position="dodge", aes(y=col_song, x=col_count), fill='#d95319') + 
   	labs(title='Favorite KR Title Track', x='Proportion (in %)', y=element_blank()) +
   	theme(legend.position='none') +
	scale_x_continuous(limits=c(0, 50), expand=c(0,0))
ggsave(paste('figure/songKR.png',sep=""), width = 7, height = 5, units = "in", dpi = 150)

# plot for fav JP title track
col_song = songJP
col_count = dataJPt/sum(dataJPt)*100
pmt = data.frame(col_song, col_count)
pmt$col_song = factor(pmt$col_song, levels=songJP)
ggplot(pmt) + 
	geom_bar(stat="identity", position="dodge", aes(y=col_song, x=col_count), fill='#4dbeee') + 
   	labs(title='Favorite JP Title Track', x='Proportion (in %)', y=element_blank()) +
   	theme(legend.position='none') +
	scale_x_continuous(limits=c(0, 50), expand=c(0,0))
ggsave(paste('figure/songJP.png',sep=""), width = 7, height = 5, units = "in", dpi = 150)
	
for(si in 1:6){
    # plots for fav KR title track given bias (ggplot)
	col_group = c(rep(PMf[si], nKR), rep('Hottest', nKR))
	col_song = rep(songKR, 2)
	col_count =c(dataKR[,si]/sum(dataKR[,si])*100, dataKRt/sum(dataKRt)*100)
	pmt = data.frame(col_group, col_song, col_count)
	pmt$col_group = factor(pmt$col_group, levels = c('Hottest', PMf[si]))
    ggplot(pmt) + 
    	geom_bar(stat="identity", position="dodge", aes(y=col_song, x=col_count, fill=col_group), width=0.65) + 
    	labs(title=paste('If your bias is *', PMf[si],'*, then your favorite KR title track is...', sep=""), y='KR Title Track',x='Proportion (in %)') +
		scale_fill_manual(values = c(PMcol[si], '#b3b3b3'), limits = c(PMf[si], 'Hottest')) +
		theme(legend.title=element_blank(), legend.position=c(0.9,0.1)) +
		scale_x_continuous(limits=c(0, 50), expand=c(0,0)) +
		scale_y_discrete(limits = songKR)
	ggsave(paste('figure/',si,PM[si],'-kr.png',sep=""), width = 7, height = 5, units = "in", dpi = 150)
    
    # plots for fav JP title track given bias (ggplot)
	col_group = c(rep(PMf[si], nJP), rep('Hottest', nJP))
	col_song = rep(songJP, 2)
	col_count =c(dataJP[,si]/sum(dataJP[,si])*100, dataJPt/sum(dataJPt)*100)
	pmt = data.frame(col_group, col_song, col_count)
	pmt$col_group = factor(pmt$col_group, levels = c('Hottest', PMf[si]))
    ggplot(pmt) + 
		geom_bar(stat="identity", position="dodge", aes(y=col_song, x=col_count, fill=col_group), width=0.65) + 
    	labs(title=paste('If your bias is *', PMf[si],'*, then your favorite JP title track is...', sep=""), y='JP Title Track', x='Proportion (in %)') +
		scale_fill_manual(values = c(PMcol[si], '#b3b3b3'), limits = c(PMf[si], 'Hottest')) +
		theme(legend.title=element_blank(), legend.position=c(0.9,0.1)) +
		scale_x_continuous(limits=c(0, 50), expand=c(0,0)) +
		scale_y_discrete(limits = songJP)
	ggsave(paste('figure/',si,PM[si],'-jp.png',sep=""), width = 7, height = 5, units = "in", dpi = 150)
}

# plots for bias given KR title track (all)
for(pi in 1:3){
	pstr = 4*(pi-1)+1
	pend = 4*pi
	col_song = rep(songKR[pstr:pend], each=6)
	col_member = PM
	col_count = c()
	for(si in pstr:pend){
		col_count = c(col_count, dataKR[si,]/sum(dataKR[si,])*100)
	}
	pmt = data.frame(col_song, col_member, col_count)
	pmt$col_member = factor(pmt$col_member, levels = PM)
	pmt$col_song = factor(pmt$col_song, levels = songKR)
	label_count = format(round(col_count,1), nsmall=1) #formatting numbers in figure
	label_count = paste(label_count, '%', sep='')
	label_count[col_count ==0] = ''
	ggplot(pmt, aes(x="", y=col_count, fill=col_member)) + 
		geom_bar(stat="identity", width=1) + 
		facet_wrap(~ col_song, nrow=2) +
		coord_polar("y", start=0) +
		ggtitle('If your favorite KR title track is ..., then your bias is...') +
		scale_fill_manual(values = PMcol, limits = PM) +
		theme(legend.title=element_blank(), legend.position="bottom", legend.text=element_text(size=6), legend.key.size=unit(3,'mm'), legend.margin=margin(-12), axis.title=element_blank(), axis.ticks=element_blank(), axis.text=element_blank(), panel.grid=element_blank(), plot.margin=margin(0)) +
		geom_text(aes(label = label_count), position = position_stack(vjust = 0.5), size=2) +
		guides(fill = guide_legend(nrow = 1))
	ggsave(paste('figure/song-kr',pi,'.png',sep=""), width = 5, height = 5, units = "in", dpi = 150)
}

# plots for bias given fav KR title track (My House, Promise)
for(si in 10:11){
	col_member = PM
	col_count = dataKR[si,]/sum(dataKR[si,])*100
	pmt = data.frame(col_member, col_count)
	pmt$col_member = factor(pmt$col_member, levels = PM)
	label_count = format(round(col_count,1), nsmall=1) #formatting numbers in figure
	label_count = paste(label_count, '%', sep='')
	label_count[col_count ==0] = ''
    ggplot(pmt, aes(x="", y=col_count, fill=col_member)) + 
    	geom_bar(stat="identity", width=1) + 
    	coord_polar("y", start=0) +
    	ggtitle(paste('If your favorite KR title track is\n*', songKR2[si],'*,\nthen your bias is...', sep="")) +
		scale_fill_manual(values = PMcol, limits = PM) +
		theme_void() +
		theme(legend.title=element_blank(), legend.position="right", plot.margin=margin(0)) +
		geom_text(aes(label = label_count), position = position_stack(vjust = 0.5))
	ggsave(paste('figure/kr-song-',si,'.png',sep=""), width = 5, height = 5, units = "in", dpi = 150)
}

# plots for bias given JP title track (all)
for(pi in 1:4){
	if(pi==1){
		pstr = 4*(pi-1)+1
		pend = 4*pi
	} else{
		pstr = 3*(pi-1)+2
		pend = 3*pi+1
	}
	col_song = rep(songJP[pstr:pend], each=6)
	col_member = PM
	col_count = c()
	for(si in pstr:pend){
		col_count = c(col_count, dataJP[si,]/sum(dataJP[si,])*100)
	}
	pmt = data.frame(col_song, col_member, col_count)
	pmt$col_member = factor(pmt$col_member, levels = PM)
	pmt$col_song = factor(pmt$col_song, levels = songJP)
	label_count = format(round(col_count,1), nsmall=1) #formatting numbers in figure
	label_count = paste(label_count, '%', sep='')
	label_count[col_count ==0] = ''
	ggplot(pmt, aes(x="", y=col_count, fill=col_member)) + 
		geom_bar(stat="identity", width=1) + 
		facet_wrap(~ col_song, nrow=2) +
		coord_polar("y", start=0) +
		ggtitle('If your favorite JP title track is ..., then your bias is...') +
		scale_fill_manual(values = PMcol, limits = PM) +
		theme(legend.title=element_blank(), legend.position="bottom", legend.text=element_text(size=6), legend.key.size=unit(3,'mm'), legend.margin=margin(-12), axis.title=element_blank(), axis.ticks=element_blank(), axis.text=element_blank(), panel.grid=element_blank(), plot.margin=margin(0)) +
		geom_text(aes(label = label_count), position = position_stack(vjust = 0.5), size=2) +
		guides(fill = guide_legend(nrow = 1))
	ggsave(paste('figure/song-jp',pi,'.png',sep=""), width = 5, height = 5, units = "in", dpi = 150)
}

# plot for fav KR-fav JP-bias
pct = ddply(alldata, .(col_songJP, col_songKR), summarize, col_pct=col_count/sum(col_count)*100)
pctdata = data.frame(pct, col_member)
ggplot(pctdata, aes(x="", y=col_pct, fill=col_member)) + 
	geom_bar(stat="identity", width=1) + 
	facet_grid(col_songJP ~ col_songKR) +
	coord_polar("y", start=0) +
	ggtitle('If your favorite KR title track is ... and your favorite JP title track is ..., \nthen your bias is...') +
	scale_fill_manual(values = PMcol, limits = PM) +
	theme(legend.title=element_blank(), legend.position="right", legend.text=element_text(size=6), legend.key.size=unit(3,'mm'), legend.margin=margin(-12), axis.title=element_blank(), axis.ticks=element_blank(), axis.text=element_blank(), panel.grid=element_blank(), plot.margin=margin(0),strip.text=element_text(size=4),)
ggsave('figure/songBias.png', width = 7, height = 5, units = "in", dpi = 150)

# plot for fav KR-fav JP
totaldata = ddply(alldata, .(col_songJP, col_songKR), summarize, col_total=sum(col_count)/sum(alldata$col_count)*100)
ggplot(totaldata, aes(x='', y='', fill=col_total)) + 
	geom_bar(stat="identity", width=1) + 
	facet_grid(col_songJP ~ col_songKR) +
	coord_polar("y", start=0) +
	#scale_x_discrete(expand=c(0,0)) +
	scale_y_discrete(expand=c(0,0)) +
	scale_fill_gradient(low ='grey92', high = '#d95319') +
	labs(title='Favorite KR title track vs favorite JP title track', fill='% of\nTotal') +
	theme(legend.title=element_text(size=6), legend.position="right", legend.text=element_text(size=6), legend.key.size=unit(3,'mm'), legend.margin=margin(-12), axis.title=element_blank(), axis.ticks=element_blank(), axis.text=element_blank(), panel.grid=element_blank(), plot.margin=margin(0),strip.text=element_text(size=4),)
ggsave('figure/song.png', width = 7, height = 5, units = "in", dpi = 150)

################################################################

################################################################
## Additional Checks for Dependent Results
# KR-Bias (exclude JK, TY, My House, Promise)
ftpval = fisher.test(dataKR[c(-10,-11),c(-1,-3)], simulate.p.value=TRUE)$p.value
cat(paste('p-value =', format(ftpval,nsmall=6)))
if(ftpval < 0.05){
	message('Fav KR Title Track - Bias :: Not Independent at \U03B1 = 0.05')
} else{
	cat('Fav KR Title Track - Bias :: Independent at \U03B1 = 0.05')
}
if(ftpval < 0.01){
	message('Fav KR Title Track - Bias :: Not Independent at \U03B1 = 0.01')
} else{
	cat('Fav KR Title Track - Bias :: Independent at \U03B1 = 0.01')
}

# KR-JP (exclude Heartbeat, ミダレテミナ)
ftpval = fisher.test(dataALL[-9,-3], simulate.p.value=TRUE)$p.value
cat(paste('p-value =', format(ftpval,nsmall=6)))
if(ftpval < 0.05){
	message('Fav KR Title Track - Fav JP Title Track :: Not Independent at \U03B1 = 0.05')
} else{
	cat('Fav KR Title Track - Fav JP Title Track :: Independent at \U03B1 = 0.05')
}
if(ftpval < 0.01){
	message('Fav KR Title Track - Fav JP Title Track :: Not Independent at \U03B1 = 0.01')
} else{
	cat('Fav KR Title Track - Fav JP Title Track :: Independent at \U03B1 = 0.01')
}
################################################################