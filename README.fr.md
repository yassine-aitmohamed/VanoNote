<div align="center">

<img src="assets/icon.svg" width="88" alt="Icône de VanoNote">

# VanoNote

**Un cahier manuscrit et un tableau de classe, gratuits et open source, pour votre ordinateur.**

Écrivez avec une tablette graphique ou une souris, annotez des PDF, enseignez sur un tableau noir et partagez la page en direct avec vos élèves. Pas de compte, pas d'abonnement, pas de cloud : vos notes restent sur votre disque.

[![Licence : MIT](https://img.shields.io/badge/Licence-MIT-1f4e37.svg)](LICENSE)
![Plateformes](https://img.shields.io/badge/plateformes-macOS%20%7C%20Windows%20%7C%20Linux-7a5c2e)
![Python](https://img.shields.io/badge/python-3.9%2B-355e4a)

[English](README.md) · [Installation](#installation) · [Fonctionnalités](#fonctionnalités) · [Enseigner avec VanoNote](#enseigner-avec-vanonote) · [FAQ](#faq)

<img src="docs/screenshots/01-handwritten-note.jpg" alt="Une note manuscrite de calcul dans VanoNote" width="100%">

</div>

## Pourquoi VanoNote

Notability et Goodnotes sont d'excellentes applications, mais leurs versions gratuites sont limitées (Goodnotes gratuit s'arrête par exemple à 3 fichiers) et leurs versions complètes sont payantes, liées à un compte et à un cloud. La facture monte vite pour celles et ceux qui ont besoin d'un cahier numérique tous les jours : **cours de soutien, auxiliaires d'enseignement, enseignants en ligne, présentations et étudiants**.

VanoNote est fait pour ce travail-là :

| | VanoNote |
|---|---|
| **Prix** | Gratuit, pour toujours. Licence MIT. |
| **Compte** | Aucun. Rien à créer. |
| **Où sont vos notes** | Une base SQLite dans le dossier VanoNote, sur votre propre ordinateur. |
| **Plateformes** | macOS, Windows et Linux (l'interface s'ouvre dans votre navigateur, servie par un petit serveur Python local). |
| **Tablettes graphiques** | XP-Pen, Wacom, Huion et toute tablette qui transmet la pression au navigateur. La souris et le trackpad fonctionnent aussi. |
| **Enseignement** | Mode présentation plein écran, papier tableau noir, pointeur laser et lien en direct que les élèves ouvrent sur le même Wi-Fi. |
| **Légèreté** | Un fichier Python, une page HTML, un script. Seule dépendance optionnelle : PyMuPDF pour l'import de PDF. |

## Fonctionnalités

<table>
<tr>
<td width="50%"><img src="docs/screenshots/02-pdf-annotation.jpg" alt="Annotation d'une feuille d'exercices en PDF"></td>
<td width="50%"><img src="docs/screenshots/03-blackboard.jpg" alt="Papier tableau noir"></td>
</tr>
<tr>
<td><b>Annoter PDF et diapositives.</b> Importez un PDF, une image, un fichier Word ou PowerPoint et écrivez directement sur les pages.</td>
<td><b>Tableau noir et cinq autres papiers.</b> Vierge, ligné, quadrillé, pointillé, Cornell et tableau noir, par page ou pour toute la note.</td>
</tr>
<tr>
<td><img src="docs/screenshots/04-present-mode.jpg" alt="Mode présentation"></td>
<td><img src="docs/screenshots/05-share-with-students.jpg" alt="Lien en direct pour les élèves"></td>
</tr>
<tr>
<td><b>Mode présentation.</b> Une touche (<code>F</code>) transforme la page en tableau plein écran pour Zoom, Meet, Teams ou un projecteur.</td>
<td><b>Lien en direct pour les élèves.</b> Les élèves suivent la page dans leur navigateur, en lecture seule ou en mode collaboratif, sans rien installer.</td>
</tr>
<tr>
<td><img src="docs/screenshots/06-flashcards.jpg" alt="Cartes de révision"></td>
<td><img src="docs/screenshots/09-night-theme.jpg" alt="Thème Night"></td>
</tr>
<tr>
<td><b>Outils de révision.</b> Résumé, cartes à trous et quiz construits à partir de vos notes tapées et de la transcription, entièrement hors ligne.</td>
<td><b>Notes tapées et thèmes.</b> Un volet de texte (gras, italique, LaTeX) à côté de l'encre, en thème Autumn, Night ou Quantum.</td>
</tr>
</table>

**Écriture**
- Stylo sensible à la pression, plume calligraphique, surligneur, gomme et pointeur laser
- Sélection au lasso, zones de texte, lignes, rectangles, ellipses et flèches
- Palette de couleurs, couleur personnalisée, épaisseur réglable, annuler et rétablir
- Cahiers de plusieurs pages avec miniatures
- Mode *Pen only* : la paume, la souris ou le trackpad ne dessinent jamais par erreur

**Organisation**
- Dossiers, favoris, notes récentes et corbeille restaurable
- Recherche dans les titres, le texte tapé et les transcriptions
- Bibliothèque en liste ou en grille, tri, et *Split note* pour garder une note de référence ouverte à côté
- Historique des versions avec restauration en un clic

**Audio**
- Enregistrement audio pendant l'écriture, dans le dossier `audio/`
- Transcription en direct avec la reconnaissance vocale du navigateur (Chrome ou Edge)

**Vos données**
- Sauvegardes automatiques toutes les 6 heures (les 20 dernières sont gardées) et sauvegardes manuelles téléchargeables
- Export d'une note en `.vnote` pour l'ouvrir sur un autre ordinateur
- Impression ou enregistrement de n'importe quelle note en PDF

## Installation

**macOS ou Linux**, dans un terminal :

```bash
curl -fsSL https://raw.githubusercontent.com/yassine-aitmohamed/VanoNote/main/install.sh | bash
```

**Windows**, dans PowerShell :

```powershell
irm https://raw.githubusercontent.com/yassine-aitmohamed/VanoNote/main/install.ps1 | iex
```

L'installateur télécharge VanoNote dans `~/VanoNote`, crée un environnement Python privé, installe PyMuPDF pour l'import de PDF, ajoute un raccourci sur le Bureau et ouvre l'application à l'adresse <http://localhost:8766>. Python 3.9 ou plus récent est nécessaire ; sous Windows, l'installateur propose de l'installer avec `winget`.

Pour installer ailleurs, définissez `VANONOTE_DIR` avant de lancer la commande.

<details>
<summary><b>Installation manuelle</b></summary>

```bash
git clone https://github.com/yassine-aitmohamed/VanoNote.git
cd VanoNote
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt     # Windows : .venv\Scripts\pip install -r requirements.txt
./start.command                               # Windows : start.bat
```

VanoNote fonctionne même sans aucune dépendance (`python3 vanonote.py`) ; seul l'import de PDF demande PyMuPDF. L'import de fichiers Word et PowerPoint demande [LibreOffice](https://fr.libreoffice.org/).

</details>

**Astuce :** dans Chrome ou Edge, choisissez *Installer VanoNote* dans la barre d'adresse pour obtenir une fenêtre indépendante avec sa propre icône.

## Enseigner avec VanoNote

1. Ouvrez une note et choisissez le papier **tableau noir** ou **quadrillé** avec le bouton papier de la barre d'outils.
2. Appuyez sur **Present** (ou `F`) pour un tableau plein écran. Partagez cette fenêtre dans Zoom, Meet ou Teams, ou affichez-la au projecteur.
3. Pour que les élèves suivent sur leurs appareils, appuyez sur **Share**, choisissez *Read only* ou *Collaborative*, puis créez le lien. Toute personne sur le même Wi-Fi (ou le même réseau [Tailscale](https://tailscale.com)) l'ouvre dans un navigateur.
4. Utilisez le **laser** (`L`) pour pointer sans laisser de trace, et `←` / `→` pour changer de page.

## Raccourcis clavier

Pratiques aussi à associer aux boutons d'une tablette graphique.

| Touche | Action | Touche | Action |
|---|---|---|---|
| `P` | Stylo | `T` | Texte |
| `H` | Surligneur | `C` | Calligraphie |
| `E` | Gomme | `Z` / `Shift+Z` | Annuler / Rétablir |
| `L` | Laser | `[` / `]` | Plus fin / plus épais |
| `V` | Lasso | `F` | Mode présentation |
| `←` / `→` | Page précédente / suivante (présentation) | `Esc` | Quitter la présentation |
| `Suppr` | Supprimer la sélection au lasso | `Y` | Rétablir |

## Confidentialité

VanoNote fonctionne entièrement sur votre ordinateur. Notes, pièces jointes, audio et sauvegardes sont dans le dossier VanoNote (`data/`, `attachments/`, `audio/`, `backups/`). Aucun compte, aucune statistique, aucune requête externe.

Le serveur écoute sur votre réseau local pour que les élèves puissent ouvrir un lien partagé. Tout ce qui est privé (votre bibliothèque, vos notes, la modification, les sauvegardes) ne répond qu'à l'ordinateur qui fait tourner VanoNote ; un autre appareil n'accède à une note que par un lien de partage que vous avez créé, et que vous pouvez désactiver à tout moment. La transcription en direct utilise le service de reconnaissance vocale de votre navigateur.

## FAQ

**Est-ce que ça marche sur iPad ?**
VanoNote tourne sur un ordinateur. Un iPad sur le même Wi-Fi peut ouvrir un lien partagé dans Safari, ce qui est idéal pour des élèves qui suivent un cours.

**Puis-je déplacer mes notes sur un autre ordinateur ?**
Oui. Copiez tout le dossier VanoNote, ou téléchargez une sauvegarde depuis *Backup* et décompressez-la dans la nouvelle installation. Une note seule s'exporte en `.vnote`.

**Le port 8766 est déjà utilisé.**
VanoNote tourne sans doute déjà : ouvrez <http://localhost:8766>.

**L'import de PDF dit que PyMuPDF manque.**
Relancez l'installateur, ou `pip install PyMuPDF` dans le `.venv`.

## Contribuer

Les issues et pull requests sont les bienvenues. Si vous enseignez ou donnez des cours de soutien avec VanoNote, dites-nous ce qui vous manque : c'est ce qui oriente la prochaine version.

## Licence

[MIT](LICENSE). Libre d'utiliser, modifier et partager, en classe ou ailleurs.
