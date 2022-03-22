################################################################
# Project: Bias-Favorite Voice Relationship
# Codes by @2PMGeek
################################################################


################################################################
## Labels and Data
PM = c('JK', 'NK', 'TY', 'WY',  'JH', 'CS')
PMf = c('Jun. K', 'Nichkhun', 'Taecyeon', 'Wooyoung',  'Junho', 'Chansung')

# Matrix for Member Colors
PMcol = c('#fd5add', '#ff0000', '#00b050', '#0070c0', '#ffc000', '#7030a0')
BARcol = c('#d95319', '#4dbeee') #additional color scale

# Data Matrix : Favorite Voice Given Bias
# Row: favorite voice
# Col: bias
x = c(177, 35, 59, 32, 92, 42, 3, 66, 6, 1, 4, 2, 0, 0, 45, 1, 12, 2, 2, 8, 20, 61, 24, 7, 2, 8, 17, 12, 179, 9, 0, 2, 6, 4, 3, 25)
data = matrix(x, nrow=6, byrow=T)
rownames(data) = PM #labels
colnames(data) = PM
################################################################

################################################################
## Plot Matrices
for(si in 1:6){
	# plots for fav voice given bias
	png(paste('figure/',si,'a-',PM[si],'.png',sep=""), width=500, height=500, pointsize=18)
    par(mar=c(0,0,2.5,0))
	dt = data[,si]
	pmt = format(round(dt/sum(dt)*100,1), nsmall=1) #formatting numbers in figure
	pmt = paste(pmt, '%', sep='')
	pmt[dt==0] = ''
    ptitle = paste('If your bias is *', PMf[si],'*,\nthen your favorite singing voice is...', sep="")
    h = pie(dt, label=pmt, main=ptitle,col=PMcol)
    legend(PM, fill=PMcol, bty='n', x='bottom', ncol = 6, inset=-0.02)
    dev.off()
    
    # plots for buas fav voice given bias
    png(paste('figure/',si,'b-',PM[si],'.png',sep=""), width=500, height=500, pointsize = 18)
    par(mar=c(0,0,2.5,0))
	dt = data[si,]
	pmt = format(round(dt/sum(dt)*100,1), nsmall=1) #formatting numbers in figure
	pmt = paste(pmt, '%', sep='')
	pmt[dt==0] = ''
    ptitle = paste('If your favorite singing voice is *', PMf[si],'\'s*,\nthen your bias is...', sep="")
    h = pie(dt, label=pmt, main=ptitle,col=PMcol)
    legend(PM, fill=PMcol, bty='n', x='bottom', ncol = 6, inset=-0.02)
    dev.off()
}

# plot for fav voice = bias (per bias)
png('figure/biasVoice.png', width=750, height=500, pointsize=16)
par(mgp=c(3,0,0), mar=c(1,2.5,2.5,0.5))
bv = matrix(c((colSums(data)-diag(data))/colSums(data), diag(data)/colSums(data)), nrow=6) #transform data into percentages
colnames(bv) = c('No', 'Yes')
rownames(bv) = paste(PM, '\nstans', sep="")
ptitle = 'Is your favorite singing voice from your bias?'
barplot(t(apply(bv,2,rev)), horiz=T, main=ptitle, axes=F, legend=T, las=1, args.legend = list(bty='n', x='bottom', ncol = 2, inset=-0.05), col=BARcol)
dev.off()

# plot for fav voice = bias (per fav voice)
png('figure/voiceBias.png', width=750, height=500, pointsize=16)
par(mgp=c(3,0,0), mar=c(1,2.5,2.5,0.5))
bv = matrix(c((colSums(t(data))-diag(t(data)))/colSums(t(data)), diag(t(data))/colSums(t(data))), nrow=6) #transform data into percentages
colnames(bv) = c('No', 'Yes')
rownames(bv) = paste(PM, '\'s', sep="")
ptitle = 'If your favorite singing voice is ..., is he your bias?'
barplot(t(apply(bv,2,rev)), horiz=T, main=ptitle, axes=F, legend=T, las=1, args.legend = list(bty='n', x='bottom', ncol = 2, inset=-0.05), col=BARcol)
dev.off()

# plot for fav voice distribution
png('figure/favvoice.png', width=500, height=500, pointsize=16)
par(mar=c(0,0,2.5,0))
dt = rowSums(data)
pmt = format(round(dt/sum(dt)*100,1), nsmall=1) #transform data into percentages
pmt = paste(pmt, '%', sep='')
pmt[dt==0] = ''
ptitle = 'Who has your favorite singing voice?'
h = pie(dt, label=pmt, main=ptitle,col=PMcol)
legend(PM, fill=PMcol, bty='n', x='bottom', ncol = 6, inset=-0.02)
dev.off()

# plot for distribution of fav voice = JK
png('figure/voiceJK.png', width=750, height=500, pointsize=16)
CURcol = c('#b3b3b3', '#fd5add')
par(mgp=c(3,0,0), mar=c(1,2.5,2.5,0.5))
bv = matrix(c((colSums(data)-data[1,])/colSums(data), data[1,]/colSums(data)), nrow=6) #transform data into percentages
colnames(bv) = c('No', 'Yes')
rownames(bv) = paste(PM, '\nstans', sep="")
ptitle = 'Is your favorite singing voice Jun. K\'s?'
barplot(t(apply(bv,2,rev)), horiz=T, main=ptitle, axes=F, legend=T, las=1, args.legend = list(bty='n', x='bottom', ncol = 2, inset=-0.05), col=CURcol)
dev.off()

# plot for distribution of fav voice given bias
# data grouped into (JK, bias, others)
pdata = matrix(0,3,6)
pdata[1,] = data[1,] #fav voice = JK
pdata[2,] = diag(data) #fav voice = bias
pdata[3,] = colSums(data) - data[1,] - diag(data) #fav voice = others
pdata[2,1] = 0 #to bias=JK cases
pdata[3,1] = pdata[3,1] + diag(data)[1] #to bias=JK cases
#plot for bias = NK/WY/JH
png('figure/voiceperbias1.png', width=750, height=500, pointsize=16)
par(mfrow=c(2,3), mar=c(1,0.5,2,0), oma=c(0,0,2.5,0))
layout(matrix(c(1:3,4,4,4), 2, 3, byrow = T), heights=c(0.8, 0.2))
for(si in c(2,4,5)){
	dt = pdata[,si]
	pmt = format(round(dt/sum(dt)*100,1), nsmall=1)
	pmt = paste(pmt, '%', sep='')
	pmt[dt==0] = ''
	pcol = c('#fd5add', PMcol[si], '#b3b3b3')
    h = pie(dt, label=pmt,col= pcol)
    title(paste('bias = ', PM[si], sep=''), line=-0.5)
}
mtext('Given bias, whose is your favorite singing voice?', outer=T, font=2, cex=1.5)
plot.new() 
legend(legend=c(PM[c(1,2,4,5)], 'others'), fill=c(PMcol[c(1,2,4,5)], '#b3b3b3'), bty='n', x='bottom', ncol = 5, inset=0.5)
dev.off()
#plot for bias = TY/CS
png('figure/voiceperbias2.png', width=750, height=500, pointsize=16)
par(mfrow=c(2,2), mar=c(1,0.5,2,0), oma=c(0,0,2.5,0))
layout(matrix(c(1,2,3,3), 2, 2, byrow = T), heights=c(0.8, 0.2))
for(si in c(3,6)){
	dt = pdata[,si]
	pmt = format(round(dt/sum(dt)*100,1), nsmall=1)
	pmt = paste(pmt, '%', sep='')
	pmt[dt==0] = ''
	pcol = c('#fd5add', PMcol[si], '#b3b3b3')
    h = pie(dt, label=pmt,col= pcol)
    title(paste('bias = ', PM[si], sep=''), line=-0.5)
}
mtext('Given bias, whose is your favorite singing voice?', outer=T, font=2, cex=1.5)
plot.new()
legend(legend=c(PM[c(1,3,6)], 'others'), fill=c(PMcol[c(1,3,6)], '#b3b3b3'), bty='n', x='bottom', ncol = 4, inset=0.5)
dev.off()

# plot for distribution of bias given voice
# data grouped into (bias, others)
pdata = matrix(0,2,6)
pdata[1,] = diag(data) #fav voice = bias
pdata[2,] = rowSums(data) - diag(data) #fav voice = others
#plot for bias = NK/TY/JH/CS
png('figure/biaspervoice1.png', width=500, height=500, pointsize=16)
par(mfrow=c(3,2), mar=c(1,0.5,2,0), oma=c(0,0,4,0))
layout(matrix(c(1:4,5,5), 3, 2, byrow = T), heights=c(0.45, 0.45, 0.1))
for(si in c(2,3,5,6)){
	dt = pdata[,si]
	pmt = format(round(dt/sum(dt)*100,1), nsmall=1)
	pmt = paste(pmt, '%', sep='')
	pmt[dt==0] = ''
	pcol = c(PMcol[si], '#b3b3b3')
    h = pie(dt, label=pmt,col= pcol)
    title(paste('fav voice = ', PM[si], sep=''), line=-0.5)
}
mtext('Given favorite singing voice,\nwho is your bias?', outer=T, font=2, cex=1.5)
plot.new() 
legend(legend=c(PM[c(2,3,5,6)], 'others'), fill=c(PMcol[c(2,3,5,6)], '#b3b3b3'), bty='n', x='bottom', ncol = 5, inset=-1.3)
dev.off()
################################################################
