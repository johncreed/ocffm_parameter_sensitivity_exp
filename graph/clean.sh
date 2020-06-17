dir=$1

for f in ${dir}/k.log ${dir}/w.log ${dir}/l.log
do
    python parse_log.py ${f}
done

for f in ${dir}/t.log
do
    python parse_t.py ${f}
done
