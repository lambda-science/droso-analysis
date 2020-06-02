cd /home/meyer/droso-analysis/data/raw/uniprot-blast/
FILES=*.results
for f in $FILES
do
    cat $f | sed -s "s/>.*|\(.*\)|.*/\1/" | sed -s "s/>\(.*\) .* .*/\1/" > results/$f
done

cd results
for i in *.results;
do
    mv "$i" "${i%\.results}"
done