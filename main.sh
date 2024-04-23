#!/bin/bash
source functions.sh
source quit.sh

# Identifiants par défaut
default_login="user"
default_password="azerty"

# Fonction pour vérifier le login et le mot de passe
check_login() {
  read -p "Login: " entered_login
  read -s -p "Mot de passe: " entered_password
  echo

  if [[ "$entered_login" != "$default_login" || "$entered_password" != "$default_password" ]]; then
    echo "Login ou mot de passe incorrect."
    exit 1
  fi
}

# Vérification du login et du mot de passe
check_login

# Fonction pour gérer les commandes
cmd() {
  cmd=$1
  argv=("$@")

  case "${cmd}" in
    quit | exit ) quit;;
    help ) help;;
    ls ) ls;;
    rm ) rm "${argv[@]:1}";;
    rmd | rmdir ) rmdir "${argv[@]:1}";;
    about ) about;;
    version | --v | vers ) version;;
    age ) age;;
    profil ) profil;;
    passw ) passw;;
    cd ) cd "${argv[@]:1}";;
    pwd ) pwd;;
    hour ) hour;;
    httpget ) httpget;;
    smtp ) smtp;;
    open ) open;;
    * ) echo "Commande inconnue: ${cmd}";;
  esac
}

main() {
  lineCount=1

  while [ 1 ]; do
    date=$(date +%H:%M)
    echo -ne "${date} - [\033[31m${lineCount}\033[m] - \033[33mXzen\033[m ~ ☠️ ~ "
    read -r string

    cmd $string
    lineCount=$(($lineCount+1))
  done
}

main
