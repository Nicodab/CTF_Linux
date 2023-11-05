# Utilisez l'image Ubuntu officielle comme image de base
FROM ubuntu:latest

# Installez des outils de base
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Répertoire caché et Fichier caché contenant le texte encodé
#RUN mkdir -p /.dossier_caché \
#    && touch /.dossier_caché/.encoded_flag \
#    && echo "TW9uX1RleHRlX0ltcG9zZdQ=" > /.dossier_caché/.encoded_flag

# Copie du dossier src et du fichier Makefile dans le conteneur
COPY ./flag.zip /app
COPY ./image.png /app

# Définition du répertoire de travail
WORKDIR /app

# Exécutez la commande 'yes' avec un script pour décoder le flag au moment de l'exécution
#CMD ["sh", "-c", "decoded_flag=$(cat /dossier_caché/.encoded_flag | base64 -d) && yes \"$decoded_flag\" &"]