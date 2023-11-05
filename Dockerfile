FROM ubuntu:latest

# Création du épertoire /CTF/directory
RUN mkdir -p /CTF/directory


#RUN apt-get update

# 300 fichiers avec string aléatoires (sauf pour le vrai flag)
RUN for i in {1..300}; do \
      if [ "$i" -eq 150 ]; then \
        echo "Le_vrai_flag" > /CTF/directory/flag$i.txt; \
      else \
        head -c 30 /dev/urandom | base64 > /CTF/directory/flag$i.txt; \
      fi; \
    done

# Archivage avec tar
RUN tar cf /CTF/directory.tar /CTF/directory
# Suppression des fichiers individuels non nécessaires
RUN rm -rf /CTF/directory
RUN mv /CTF/directory/directory.tar directory
# droits de lecture à tous
RUN chmod 444 directory

# Définition du répertoire de travail
WORKDIR /CTF

# Commande par défaut pour lancer le conteneur
CMD ["/bin/bash"]
