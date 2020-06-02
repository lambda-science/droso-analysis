FILES=~/droso-analysis/data/correction/two-by-two2/*.fasta
for f in $FILES
do
	/biolo/mafft/inst/bin/mafft $f > $f.mafft
done

FILES=~/droso-analysis/data/correction/two-by-two-old2/*.fasta
for f in $FILES
do
	/biolo/mafft/inst/bin/mafft $f > $f.mafft
done
