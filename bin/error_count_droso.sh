FILES=~/droso-analysis/data/raw/uniprot-blast/results/*.mafft
for f in $FILES
do
	/home/julie/ALN_UTILS/seqerrs $f >> ~/droso-analysis/data/raw/droso_errors.txt
done
