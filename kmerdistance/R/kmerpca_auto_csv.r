kmerpca <- function(filename,outputfile, plotmain = "Main", ifscale = 1, ifbinary = 0, numofp = 3){
	#require(rgl,quietly=T)
	rawdata=read.csv(filename,header=T)
	if(ifscale == 1){	# need to scale first then binary or you will get error info "Error in cov.wt(z) : 'x' must contain finite values only"
		scaled = scale(rawdata)
		if(ifbinary == 0){
			scaled[is.nan(scaled)] <- 0
			pcaloadings=princomp(scaled)$loadings[,1:numofp]
			print("Will plot unbinaried scaled graph",quote=F)
		}
		else{
			scaled_binaried = ifelse(scaled>0, 1, 0)
			pcaloadings=princomp(scaled_binaried)$loadings[,1:numofp]
			print("Will plot binaried scaled graph",quote=F)
		}
	}
	else{	# non scaled choice
		if(ifbinary == 0){	# non binary choice
			pcaloadings=princomp(rawdata)$loadings[,1:numofp]
			print("Will plot unbinaried unscaled graph",quote=F)
		}
		else{	# binary choice
			binaried = ifelse(rawdata>0, 1, 0)
			pcaloadings=princomp(binaried)$loadings[,1:numofp]
			print("Will plot binaried unscaled graph",quote=F)
		}
	}

	if(numofp == 3){
		#thisplot = plot3d(pcaloadings,type="p",col="red",main=plotmain)+text3d(pcaloadings,text=rownames(pcaloadings),font=3,col="blue") %print 3d structre only when first 3 main components are used
	}
	thisdist = as.matrix(dist(pcaloadings))
	write.csv(thisdist,file=outputfile, quote=F)

	return(thisdist)
	#return(pcaloadings)
}