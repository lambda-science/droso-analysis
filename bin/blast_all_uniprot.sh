# Base de données Uniprot
FILES=/home/meyer/droso-analysis/data/raw/uniprot-blast/*.id
database="UP000000304_7240_all.fasta UP000001070_7222_all.fasta UP000001819_46245_all.fasta UP000007801_7217_all.fasta UP000008792_7244_all.fasta UP000001292_7238_all.fasta UP000007798_7260_all.fasta UP000008744_7234_all.fasta UP000009192_7230_all.fasta"
for f in $FILES
do
	cat $f | grep ">" >> $f.results
    for db in $database
	do
        /biolo/blastplus/blast-2.9.0/bin/blastp -db /commun/bics/DB-Corentin/uniprot-per-droso/$db -num_threads 48 -evalue 0.00000000000000000000000000000000000000000000000001 -outfmt '6 sseqid pident' -max_target_seqs 1 -query $f | awk -v title=$db '{if ($2>=80) print ">"$1 " " title}' | sed 's/>.*|\(.*\)|/>\1 /' >> $f.results
	done
echo "$(uniq $f.results)" > $f.results
done
