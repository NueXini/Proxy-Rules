#!/bin/bash
# Create By NueXini

if [ ${1}x == 'all'x ]; then
	rm -rf $(find ./bin/targets/ -type d -name "packages")
	cp -rf $(find ./bin/targets/ -type f) ./artifact/firmware/
else
	cp `find ./bin/targets/ -type f -name '*-breed-factory.*'` ./artifact/firmware/
	cp `find ./bin/targets/ -type f -name '*-sysupgrade.*'` ./artifact/firmware/
fi

