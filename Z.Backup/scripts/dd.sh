#!/bin/bash

# NueXini

grep '^CONFIG_TARGET.*DEVICE.*=y' .config | sed -r 's/.*DEVICE_(.*)=y/\1/' > NX_DEVICE_NAME

cp -rf .config ./nuexini/$(cat NX_DEVICE_NAME).config

