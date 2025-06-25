#!/bin/bash

# GoldenGate installation directory
GG_HOME=/u01/app/ogg
cd $GG_HOME

# Exécution des commandes GGSCI via script
./ggsci << EOF

-- Connexion sécurisée avec USERIDALIAS
DBLOGIN USERIDALIAS ggadmin

-- Créer la table de checkpoint (si ce n'est pas déjà fait)
ADD CHECKPOINTTABLE ggadmin.checkpointtable

-- Ajouter l'Extract principal
ADD EXTRACT extract, TRANLOG, BEGIN NOW

-- Enregistrer l'Extract dans la base de données source
REGISTER EXTRACT extract DATABASE

-- Ajouter le trail local pour l'extract
ADD EXTTRAIL G:\OGG\dirdat\e1, EXTRACT extract

-- Ajouter le process de Pump (Data Pump)
ADD EXTRACT pumpora, EXTTRAILSOURCE G:\OGG\dirdat\e1

-- Ajouter le trail distant pour le Pump
ADD RMTTRAIL G:\OGG\dirdat\pt, EXTRACT pumpora

-- Ajouter le Replicat sur le serveur cible avec checkpoint
ADD REPLICAT repora, EXTTRAIL G:\OGG\dirdat\pt, CHECKPOINTTABLE ggadmin.checkpointtable

EXIT
EOF

echo "✅ GoldenGate configuration completed securely."
