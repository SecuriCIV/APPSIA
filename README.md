# APPSIA — Plateforme Étudiante SIA (SecuriCIV)

Application web officielle pour la plateforme étudiante **SIA**, développée par **SecuriCIV**. Dotée d'une navigation orbitale interactive et connectée à Supabase pour l'authentification et la gestion des données académiques.

- **Organisation GitHub :** [SecuriCIV](https://github.com/SecuriCIV)
- **Dépôt officiel :** [SecuriCIV/APPSIA](https://github.com/SecuriCIV/APPSIA)
- **Branche principale :** `main`

---

## 🚀 Fonctionnalités

- **Menu circulaire orbital (6 satellites) :**
  - Bouton central interactif (clic ou glisser-déposer vers les satellites).
  - 👤 **Profil** : Gestion du compte étudiant, filière et niveau.
  - 📚 **Cours** : Espace cours et supports académiques.
  - 📝 **TD** : Travaux dirigés, fiches d'exercices et annales.
  - 🗒️ **Notes** : Prise de notes personnelles par matière.
  - 📷 **Caméra** : Capture visuelle du projecteur/tableau en amphi.
  - 🎙️ **Audio** : Enregistreur dictaphone pour les explications orales.
- **Authentification & Profils (Supabase) :**
  - Connexion & Inscription sécurisées par email.
  - Profil étudiant lié aux filières (Technologie, Management, Autre).
- **Design & Ergonomie :**
  - Support tactile & gestuel Pointer Events (mobile & desktop).
  - Mode sombre automatique et design responsive.

---

## 📂 Structure du projet

```
APPSIA/
├── index.html       # Application complète (HTML, CSS et JavaScript)
├── schema.sql       # Schéma de base de données Supabase (tables, RLS, triggers)
├── vercel.json      # Configuration de déploiement et routage SPA Vercel
├── .gitignore       # Exclusion des fichiers locaux et sensibles
├── .env.example     # Exemple de configuration des clés API Supabase
└── README.md        # Documentation officielle SecuriCIV
```

---

## 💻 Déploiement & Hébergement

### Déploiement Vercel
Pour déployer l'application sur Vercel avec le dépôt **SecuriCIV/APPSIA** :
1. Rendez-vous sur [Vercel Dashboard](https://vercel.com/new).
2. Importez le dépôt Git : **`SecuriCIV/APPSIA`**.
3. **Paramètres de configuration :**
   - **Framework Preset :** `Other`
   - **Root Directory :** `./` (racine)
   - **Build Command :** Aucune (désactivé)
   - **Output Directory :** `./` (désactivé)
4. Cliquez sur **Deploy**.

---

## 🗄️ Configuration Supabase

L'application est configurée pour communiquer avec le backend Supabase :
- **URL :** `https://vpmedcmjmdsggcllmflg.supabase.co`
- Le schéma complet et les règles de sécurité RLS sont définis dans [schema.sql](schema.sql).

---

© SecuriCIV — Tous droits réservés.
