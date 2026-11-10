# APPSIA — SIA Interface & Menu Circulaire

Application web interactive pour la plateforme étudiante **SIA**, dotée d'une navigation innovante par menu orbital et gestes tactiles/glisser-déposer.

## 🚀 Fonctionnalités

- **Menu circulaire orbital** :
  - Bouton central interactif (clic ou glisser-déposer vers les satellites).
  - 5 satellites de navigation :
    - 🔍 **Recherche** : Recherche de documents par matière ou niveau.
    - 📚 **Documents** : Consultation du catalogue de documents disponibles.
    - ⬇️ **Fichiers / Téléchargements** : Accès aux documents achetés.
    - ➕ **Publier** : Mise en vente et partage de nouveaux documents.
    - 👤 **Profil** : Gestion du compte étudiant et des publications.
- **Support tactile & gestuel** (Pointer Events pour mobile et desktop).
- **Mode sombre automatique** (`prefers-color-scheme: dark`).
- **Design fluide et responsive** (adapté smartphones et navigateurs desktop).

## 📂 Structure du projet

```
APP-1/
├── index.html   # Application complète (HTML, CSS et JavaScript)
└── README.md    # Documentation du projet
```

## 💻 Démarrage rapide

Ouvrez simplement le fichier `index.html` dans n'importe quel navigateur web moderne :

```bash
# Directement avec votre navigateur par défaut (Windows)
start index.html
```

## 🛠️ Technologies utilisées

- **HTML5**
- **CSS3** (Flexbox, CSS Variables, Animations et Transitions cubic-bezier)
- **JavaScript (Vanilla)** (Pointer Events API, calcul de collision et coordonnées)
