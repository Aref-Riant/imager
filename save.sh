for i in `cat imglist`; do
docker pull $i;
docker save -o images/`basename $i`.tar $i
done
