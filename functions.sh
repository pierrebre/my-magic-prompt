#!/bin/bash

help() {
  echo "Commandes disponibles :"
  echo "help : affiche les commandes disponibles"
  echo "ls : lister des fichiers et les dossiers visible comme caché"
  echo "rm <fichier> : supprimer un fichier"
  echo "rmd|rmdir <dossier> : supprimer un dossier"
  echo "about : une description de votre programme"
  echo "version| --v| vers : affiche la version de votre prompt"
  echo "age : demande votre âge et vous dit si vous êtes majeur ou mineur"
  echo "quit : permet de sortir du prompt"
  echo "profil : affiche toutes les informations sur vous-même : First Name, Last Name, age, email"
  echo "passw : permet de changer le mot de passe avec une demande de confirmation"
  echo "cd <dossier> : aller dans un dossier que vous venez de créer ou de revenir à un dossier précédent"
  echo "pwd : indique le répertoire actuel"
  echo "hour : donne l'heure actuelle"
  echo "* : indique une commande inconnue"
  echo "httpget : télécharger le code source HTML d'une page web et l'enregistrer dans un fichier spécifique"
  echo "smtp : envoyer un mail avec une adresse, un sujet et le corps du mail"
}

ls() {
  command ls -a "$@"
}


about() {
  echo "Ce prompt Shell a été créé dans le cadre d'un exercice. Il comporte diverses fonctionnalités utiles pour la gestion de fichiers, l'interaction avec l'utilisateur et d'autres tâches de base en Shell."
}

version() {
  echo "Version 1.0"
}

age() {
  read -p "Quel est votre âge ? " age
  if [ "$age" -ge 18 ]; then
    echo "Vous êtes majeur."
  else
    echo "Vous êtes mineur."
  fi
}

profil() {
  echo "Prénom: Pierre"
  echo "Nom: Barbé"
  echo "Âge: 23 ans"
  echo "Email: pierre.barbe@my-digital-school.org"
}

passw() {
  read -s -p "Entrez votre ancien mot de passe : " old_password
  echo
  read -s -p "Entrez votre nouveau mot de passe : " new_password
  echo
  read -s -p "Confirmez votre nouveau mot de passe : " confirm_password
  echo
  if [ "$new_password" == "$confirm_password" ]; then
    echo "Mot de passe changé avec succès."
  else
    echo "Les mots de passe ne correspondent pas. Veuillez réessayer."
  fi
}

hour() {
  date +"Il est %H:%M."
}

httpget() {
  read -p "Entrez l'URL de la page web : " url
  read -p "Entrez le nom du fichier de destination : " filename
  curl -o "$filename" "$url"
}

smtp() {
  read -p "Entrez l'adresse email du destinataire : " to
  read -p "Entrez le sujet du mail : " subject
  read -p "Entrez le corps du mail : " body
  echo "$body" | mail -s "$subject" "$to"
}


open() {
  vim "$@"
}