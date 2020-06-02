# Base de données Uniprot
cd /home/meyer/droso-analysis/data/raw/uniprot-blast/
mkdir results
FILES=*.results
for f in $FILES
do
    cat $f | sed 's/^>\([^ ]*\) .*/\1/' > results/${f%\.results}
    #cat $f | grep ">" | uniq | sed 's/^>\([^ ]*\) .*/\1/' > results/$f
done

# Base de données RefSeq
cd /home/meyer/droso-analysis/data/raw/refseq-blast/
mkdir results
FILES=*.results
for f in $FILES
do
    cat $f | sed 's/^>\([^ ]*\) .*/\1/' > results/${f%\.results}

done
