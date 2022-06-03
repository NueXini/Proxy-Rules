#!/bin/bash
# Create By NueXini


binbin="$(ls -F ./bin/targets/ | grep "/$")"
for a in $binbin; do
	echo "=========${a}========="
	ls ./bin/targets/${a}
	du --max-depth=1 -h ${a}
	echo "---------${a}---------"
done

if [ ${1}x == 'all'x ]; then
	rm -rf $(find ./bin/targets/ -type d -name "packages")
	cp -rf $(find ./bin/targets/ -type f) ./artifact/firmware/
else
	cp `find ./bin/targets/ -type f -name '*-breed-factory.*'` ./artifact/firmware/
	cp `find ./bin/targets/ -type f -name '*-sysupgrade.*'` ./artifact/firmware/
fi

