# Gestion de la stack de monitoring avec helmfile

# Prérequis

Juste avoir installé helmfile sur votre système en suivant le [modop](https://github.com/helmfile/helmfile?tab=readme-ov-file#installation).

Se positionner dans le dossier et faire un simple `helmfile init`.

Cette commande va :

* Installer helm si non installé
* Installer le plugin helm-diff si non installé
* Installer le plugin helm-secrets si non installé
* Installer le plugin s3 si non installé
* Installer le plugin helm-git si non installé

Et c'est tout.

# Première installation

Faire un `helmfile apply

# Mise à jour des variables

## Cas d'un secret

J'ai déjà installé gpg sur mon système et j'ai créé une clé de chiffrement.

`gpg --full-generate-key`

RSA to RSA
Passphrase: mdp

`gpg --list-secret-keys --keyid-format=long`

Pour chiffrer avec helm secrets (backend sops à installze avant https://github.com/getsops/sops) j'ai fait :

`helm secrets encrypt ./grafana/secrets-clear.yaml > ./grafana/secrets.yaml`

# Mise à jour des packages

## Diff




