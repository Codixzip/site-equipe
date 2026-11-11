#!/bin/bash
# Indique que le script s'exécute avec Bash

DOSSIER="$HOME/serveur/site-equipe"
# Stocke le chemin du projet dans une variable pour ne pas le répéter

if [ ! -d "$DOSSIER" ]; then
# Teste si le dossier n'existe PAS (le ! inverse la condition, -d vérifie un dossier)
    echo "Erreur : le dossier $DOSSIER n'existe pas."
    # Affiche un message d'erreur pour expliquer pourquoi on s'arrête
    exit 1
    # Quitte le script avec un code différent de 0 pour signaler une erreur
fi
# Ferme le bloc if

cd "$DOSSIER" || exit 1
# Se place dans le dossier du projet (et quitte si le cd échoue, par sécurité)

git pull
# Récupère les dernières modifications du dépôt distant

cp index.html style.css /var/www/html/
# Copie les deux fichiers du site vers le dossier servi par le serveur web

echo "Déploiement terminé avec succès !"
# Affiche le message de fin
