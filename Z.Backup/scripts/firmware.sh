#!/bin/bash
# Create By NueXini


bin1="$(ls -F ./bin/targets/ | grep "/$")"
for a in $bin1; do
	bin2="$(ls -F ./bin/targets/${a} | grep "/$")"
	for b in $bin2; do
		echo "=========${b}========="
		
		bin3="./bin/targets/${a}${b}"
		
		# rm -rf $(find ./bin/targets/ -type d -name "packages")
		rm -rf "${bin3}packages"
		rm -rf "${bin3}.*initramfs.*"
		
		ls ${bin3}
		du --max-depth=1 -h ${bin3}
		
		echo "---------${b}---------"
		
		# cp `find ./bin/targets/ -type f -name '*-breed-factory.*'` ./artifact/firmware/ || exit 1
		# cp `find ./bin/targets/ -type f -name '*-sysupgrade.*'` ./artifact/firmware/ || exit 1
		# cp -rf $(find ./bin/targets/ -type f) ./artifact/firmware/
		c=`ls ${bin3} | grep '\-breed-factory\.'`
		if [ -z $c ]; then
			cp -rf ${bin3}* './artifact/firmware/'
		else
			cp ${bin3}${c} './artifact/firmware/'
			cp -f ${bin3}`ls ${bin3} | grep -E '\-sysupgrade\.'` './artifact/firmware/'
		fi
		
	done
done

