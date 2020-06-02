FILES=~/droso-analysis/data/raw/refseq-blast/results/*.mafft
for f in $FILES
do
	/home/julie/ALN_UTILS/seqerrs $f >> ~/droso-analysis/data/raw/refseq_blast_errors.txt
done

FILES=~/droso-analysis/data/raw/uniprot-blast/results/*.mafft
for f in $FILES
do
	/home/julie/ALN_UTILS/seqerrs $f >> ~/droso-analysis/data/raw/uniprot_blast_errors.txt
done
