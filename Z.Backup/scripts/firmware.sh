#!/bin/bash
# Create By NueXini


bin1="$(ls -F ./bin/targets/ | grep "/$")"
for a in $bin1; do
	bin2="$(ls -F ./bin/targets/${a} | grep "/$")"
	for b in $bin2; do
		echo "=========${b}========="
		
		bin3="./bin/targets/${a}${b}"

		rm -rf "${bin3}packages"
		find ${bin3} -maxdepth 1 -type f -name '*initramfs*' -exec rm -rf {} \;
		
		ls ${bin3}
		du --max-depth=1 -h ${bin3}
		
		echo "---------${b}---------"
		
		c=`ls ${bin3} | grep '\-breed-factory\.'`
		if [ -z $c ]; then
			cp -rf ${bin3}* './artifact/firmware/'
		else
			cp ${bin3}${c} './artifact/firmware/'
			cp -f ${bin3}`ls ${bin3} | grep -E '\-kernel1\.'` './artifact/firmware/'
			cp -f ${bin3}`ls ${bin3} | grep -E '\-rootfs0\.'` './artifact/firmware/'
			cp -f ${bin3}`ls ${bin3} | grep -E '\-sysupgrade\.'` './artifact/firmware/'
		fi
		
	done
done

exit 0
