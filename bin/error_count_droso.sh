FILES=~/droso-analysis/data/raw/results/*.mafft
for f in $FILES
do
	/home/julie/ALN_UTILS/seqerrs $f >> ~/droso-analysis/data/raw/droso_errors.txt
done
