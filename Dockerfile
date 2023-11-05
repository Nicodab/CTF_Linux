FROM ubuntu:latest

# Création du épertoire /CTF/directory
RUN mkdir -p /CTF/directory

# Installer zip
RUN apt-get update && apt-get install -y zip

# 300 fichiers avec string aléatoires (sauf pour le vrai flag)
RUN for i in {1..300}; do \
      if [ "$i" -eq 1 ]; then \
        echo "Le_vrai_flag" > /CTF/directory/flag$i.txt; \
      else \
        head -c 30 /dev/urandom | base64 > /CTF/directory/flag$i.txt; \
      fi; \
    done

# Créez une archive ZIP à partir des fichiers générés
RUN cd /CTF/directory && zip -r /CTF/directory.zip .

# Suppression des fichiers individuels non nécessaires
RUN rm -rf /CTF/directory

# Commande par défaut pour lancer le conteneur
CMD ["/bin/bash"]
