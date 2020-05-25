FILES=~/droso-analysis/data/raw/results/*.id
for f in $FILES
do
	/biolo/blast/bin/blastdbcmd -entry_batch $f -db /commun/bics/DB-Corentin/uniprot >> $f.fasta
done
