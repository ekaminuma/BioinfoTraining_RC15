test_myCodonFinder<- function(seq){

	start_codon=DNAString("ATG")
	stop_codons=list("TAA","TAG","TGA")
	
	codon_pos=list()
	
	codon_pos$start=matchPattern(start_codon,seq)
	
	x=list()
	for (i in 1:3){
		
		x[[i]]=matchPattern(DNAString(stop_codons[[i]]),seq)
		codon_pos$Stop=x;
	}
	
	return(codon_pos)
	
}