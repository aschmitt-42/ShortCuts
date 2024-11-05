#!/bin/bash

# Vérifie si un message a été passé en argument
if [ "$#" -ne 1 ]; then
    echo -e "Usage: $0 'message_de_commit'"
    exit 1
fi

# Stocke le message de commit
commit_message="$1"

# Ajoute tous les fichiers modifiés au staging
echo -e "\n<git add>\n"
git add .
if [ $? -ne 0 ]; then
    echo -e "\n\nErreur lors de l'exécution de <git add>"
    exit 1
fi

# Fait un commit avec le message fourni
echo -e "\n<git commit>\n"
git commit -m "$commit_message"
if [ $? -ne 0 ]; then
    echo -e "\n\nErreur lors de l'exécution de <git commit>"
    exit 1
fi

# Pousse les changements
echo -e "\n<git push>\n"
git push
if [ $? -ne 0 ]; then
    echo -e "\n\nErreur lors de l'exécution de <git push>"
    exit 1
fi

echo -e "\n\nGOOOOD JOB !"