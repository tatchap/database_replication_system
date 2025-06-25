#!/bin/bash

GG_HOME=/u01/app/ogg
cd $GG_HOME

./ggsci << EOF
STOP REPLICAT replic
STOP EXTRACT extract
STOP MGR
EXIT
EOF

echo "GoldenGate processes stopped."
