#!/bin/bash

GG_HOME=/u01/app/ogg
cd $GG_HOME

./ggsci << EOF
START MGR
START EXTRACT extract
START REPLICAT replic
EXIT
EOF

echo "GoldenGate processes started."
