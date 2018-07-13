#!/bin/sh

apm install --packages-file atom-packages.list
cp atom-config.cson ~/.atom/config.cson
cp atom-styles.less ~/.atom/styles.less
