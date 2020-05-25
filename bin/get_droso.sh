cd ~/droso-analysis/data/raw/
FILES=*.tfa
for f in $FILES
do
	cat $f | grep ">" | grep -E 'DROME' | sed -s 's/>\(.*\)_.*_.*/\1/' > results/$f
done

cd ~/droso-analysis/data/raw/results/
find . -size 0 -delete

wc -l * | awk '$1 > 1 {print $2}'  | xargs rm

FILES=*.tfa
for f in $FILES
do
    cat ../$f | grep ">" | grep -E 'DROMO|DROVI|DROGR|DROAN|DROSE|DROSI|DROPE|DROPS|DROWI' | sed -s 's/>\(.*\)_.*_.*/\1/' >> $f
done
