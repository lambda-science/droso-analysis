FILES=~/droso-analysis/data/correction/two-by-two2/*.mafft
for f in $FILES
do
	/home/julie/ALN_UTILS/seqerrs $f >> ~/droso-analysis/data/correction/error_after_correction2.txt
done

FILES=~/droso-analysis/data/correction/two-by-two-old2/*.mafft
for f in $FILES
do
	/home/julie/ALN_UTILS/seqerrs $f >> ~/droso-analysis/data/correction/error_before_correction2.txt
done
