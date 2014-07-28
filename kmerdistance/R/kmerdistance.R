#' kmerdistance package
#' R package use for pairwise distance between genome base on kmer stratege
NULL

#' kmerDistance.dif
#' Usage
#' kmerDistance.dif <- function(kmer.length,path.to.data="../data/",output="kemr.dif.distance.csv")
#' Description
#' calculate pairwise distnace of kmer data by using XOR discrete funtion.
#' Arguments
#' kmer.length		length of kmer
#' path.to.data		path to test data
#' output			output file, the default output file formate is csv

kmerDistance.dif <- function(kmer.length,path.to.data="../data/",output="kemr.dif.distance.csv")
{
	if (is.null(kmer.length))
		stop("Please specify the length of kmer");
	if (is.null(path.to.data))
		stop("Please specify the path to test data");
	
	#read in all kc files in path.to.data
	kcFiles=list.files(path.to.data,"*.kc");
	l=length(kcFiles);
	#save all kmers in klist
	klist<-new.env()
	for (i in 1:l)
	{
		temp=read.table(paste(path.to.data,kcFiles[i],sep=""));
		klist[[kcFiles[i]]]=temp[,1];
	}
	#create a matrix to hold the diferential occupancy distance
	dif.occupancy=matrix(0,l,l);
	#calculate the pairwise distance
	for(i in 1:l)
	{
		j=i+1
		while(j <=l)
		{
			l1=length(klist[[kcFiles[i]]]);
			l2=length(klist[[kcFiles[j]]]);
			dt=length(intersect(klist[[kcFiles[i]]],klist[[kcFiles[j]]]));
			dif.occupancy[i,j]=dif.occupancy[j,i]=(l1+l2-2*dt)/(4^kmer.length);		
			j=j+1;
		}
	}
	#output result
	difd=data.frame(dif.occupancy);
	names(difd)=kcFiles;
	write.csv(difd,output,row.names=kcFiles);
	return(difd);
}