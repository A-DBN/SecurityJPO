# Epitech Open Days Security Presentation Script - English

## Overview
This Bash script is designed for Epitech Open Days to facilitate the installation and uninstallation of various security tools on Linux systems. It automatically detects the Linux distribution and uses the appropriate package manager for operations.

[French Version](#script-de-présentation-de-la-sécurité-des-journées-portes-ouvertes-depitech)

## Requirements
- Linux Distribution: Debian/Ubuntu, Fedora, or Arch-based
- Internet Connection
- Sudo Privileges

## Script Features
- Automatically detects Linux distribution
- Supports installation and uninstallation of:
  - Nmap
  - John the Ripper
  - Hashcat
  - Linpeas
  - Gobuster
- Downloads essential wordlists like `rockyou.txt` and `common.txt`

## Installation & Execution
1. Clone the repository or download the script.
2. Make the script executable:
   ```bash
   chmod +x install.sh
   ```
3. Run the script
    ```bash
    ./install.sh
    ```

## Usage Instructions
Upon running the script, you will be prompted to choose between installing or uninstalling tools.

## Install tools
Enter your choice of tools to install by specifying their corresponding numbers, separated by spaces.

## Uninstall Tools
Similar to installation, choose the tools you wish to uninstall.

## Run Tools
Each `.sh` files except `install.sh` run one of the previous tool with a setup included except `nmap.sh` and `gobuster.sh` that requires an URL.

## Contact
Mail: antoine.dabin@epitech.eu or antoine1.dabin@epitech.eu

## Scripts

### Gobuster Directory Scan
This script uses Gobuster, a tool for brute-forcing URIs (directories and files) in web sites. The command `gobuster dir -u $1 -w common.txt` is used to initiate a directory brute-forcing attack on a given website. Here, `$1` represents the target website's URL, and `common.txt` is the file containing a list of common directory names to try. This script is useful for finding hidden or non-linked content on the specified website.

### Hashcat Password Cracking
This script utilizes Hashcat, an advanced password recovery tool, to crack hashed passwords. The command `hashcat -a 0 -m 100 b89eaac7e61417341b710b727768294d0e6a277b rockyou.txt` indicates a straightforward dictionary attack (`-a 0`) using the `rockyou.txt` wordlist. The hash `b89eaac7e61417341b710b727768294d0e6a277b` is cracked against this dictionary. The `-m 100` specifies the hash type as SHA1. This script is effectively used for recovering passwords from their SHA1 hashes.

### John the Ripper Password Cracking
This script uses John the Ripper, a popular password cracking tool, to decrypt MD5 hashes. Initially, it generates MD5 hashes for two sample strings ("rainbow" and "bulldog19") and saves them into `passwords.txt` with user labels (user1 and user2). The command `john --show --format=raw-md5 passwords.txt` is then used to crack these hashes using John the Ripper. The `--format=raw-md5` option specifies the hash type as raw MD5. This script demonstrates how to crack MD5 hashed passwords with known hashes.

### Nmap Scan with Filtered Output
This script performs a network scan using Nmap and then filters the output for cleaner results. The command `nmap $1` initiates a scan on the target specified by `$1`. The output of this scan is then processed by two `sed` commands. The first `sed '/Nmap scan report for/d'` command removes lines containing 'Nmap scan report for', and the second `sed '/rDNS record for/d'` command removes lines containing 'rDNS record for'. This results in a more concise and readable output, focusing on the essential details of the Nmap scan.

===========================================================================

# Script de présentation de la sécurité des journées portes ouvertes d'Epitech

# Epitech Open Days Security Presentation Script

## Overview
Ce script Bash est conçu pour les Journées Portes Ouvertes d'Epitech pour faciliter l'installation et la désinstallation de divers outils de sécurité sur les systèmes Linux. Il détecte automatiquement la distribution Linux et utilise le gestionnaire de paquets approprié pour les opérations.

## Requirements (Exigences)
- Distribution Linux : Debian/Ubuntu, Fedora ou basée sur Arch
- Connexion Internet
- Privilèges Sudo

## Script Features (Fonctionnalités du script)
- Détecte automatiquement la distribution Linux
- Prend en charge l'installation et la désinstallation de :
  - Nmap
  - John the Ripper
  - Hashcat
  - Linpeas
  - Gobuster
- Télécharge des listes de mots essentiels comme `rockyou.txt` et `common.txt`

## Installation & Execution (Installation et exécution)
1. Clonez le dépôt ou téléchargez le script.
2. Rendez le script exécutable :
   ```bash
   chmod +x install.sh
    ```
3. Exécuter le script :
    ```
    ./install.sh
    ```

## Instructions d'utilisation
Entrez votre choix d'outils à installer en spécifiant leurs numéros correspondants, séparés par des espaces.

## Installer les outils
Entrez votre choix d'outils à installer en spécifiant leurs numéros correspondants, séparés par des espaces.

## Désinstaller les outils
Comme pour l'installation, choisissez les outils que vous souhaitez désinstaller.

## Utiliser les outils
Chaque fichier `.sh`, sauf `install.sh`, exécute l'un des outils précédents avec une configuration incluse, sauf `nmap.sh` et `gobuster.sh` qui nécessitent une URL.

# Scripts
### Gobuster Directory Scan
Ce script utilise Gobuster, un outil pour forcer brutalement les URI (répertoires et fichiers) dans les sites Web. La commande `gobuster dir -u $1 -w common.txt` est utilisée pour initier une attaque de force brute sur un site Web donné. Ici, `$1` représente l'URL du site cible, et `common.txt` est le fichier contenant une liste de noms de répertoires courants à essayer. Ce script est utile pour trouver du contenu caché ou non lié sur le site spécifié.

### Hashcat Password Cracking
Ce script utilise Hashcat, un outil avancé de récupération de mot de passe, pour craquer des mots de passe hachés. La commande ` -a 0 -m 100 b89eaac7e61417341b710b727768294d0e6a277b rockyou.txt`indique une attaque par dictionnaire simple (`-a 0`) en utilisant la liste de mots `rockyou.txt`. Le hachage `b89eaac7e61417341b710b727768294d0e6a277b` est craqué contre ce dictionnaire. Le `-m 100` spécifie le type de hachage comme SHA1. Ce script est efficacement utilisé pour récupérer des mots de passe à partir de leurs hachages SHA1.

### John the Ripper Password Cracking
Ce script utilise John the Ripper, un outil populaire de craquage de mots de passe, pour déchiffrer des hachages MD5. Initialement, il génère des hachages MD5 pour deux chaînes d'exemple ("rainbow" et "bulldog19") et les sauvegarde dans `passwords.txt` avec des étiquettes utilisateur (user1 et user2). La commande `john --show --format=raw-md5 passwords.txt` est ensuite utilisée pour craquer ces hachages en utilisant John the Ripper. L'option `--format=raw-md5` spécifie le type de hachage comme MD5 brut. Ce script démontre comment craquer des mots de passe hachés MD5 avec des hachages connus.

### Nmap Scan with Filtered Output
Ce script effectue un scan réseau en utilisant Nmap, puis filtre la sortie pour des résultats plus clairs. La commande `nmap $1` initie un scan sur la cible spécifiée par `$1`. La sortie de ce scan est ensuite traitée par deux commandes sed. La première commande `sed '/Nmap scan report for/d'` supprime les lignes contenant 'Nmap scan report for', et la seconde commande `sed '/rDNS record for/d'` supprime les lignes contenant 'rDNS record for'. Cela résulte en une sortie plus concise et lisible, se concentrant sur les détails essentiels du scan Nmap.






