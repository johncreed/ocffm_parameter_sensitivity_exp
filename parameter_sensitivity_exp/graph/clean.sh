dir=$1

for f in ${dir}/k.log ${dir}/w.log ${dir}/l.log
do
    python parse_log.py ${f}
done

for f in ${dir}/t.log
do
    python parse_t.py ${f}
done

for f in ${dir}/*.csv
do
    mv $f tmp
    sort -gk 1 tmp > $f
done

rm tmp
