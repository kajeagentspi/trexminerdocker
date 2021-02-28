#!/bin/sh
set -ex
/t-rex -a ethash -o jp.sparkpool.com:13333 -u sp_heather -p x -w Heather --dag-build-mode 2 --gpu-report-interval 5
exec "$@"