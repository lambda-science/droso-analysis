FILES=~/droso-analysis/data/raw/uniprot-blast/results/*.fasta
for f in $FILES
do
	/biolo/mafft/inst/bin/mafft $f > $f.mafft
done