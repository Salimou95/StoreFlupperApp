# 🛍️ Store – Application Flutter

**Membres du groupe** : Keziah, Lucas Fernandes, Salimou

**Store** est une application Flutter de démonstration développée dans le cadre d’un projet de groupe. Elle met en œuvre les concepts de navigation, gestion d’état, persistance locale, et interface utilisateur dynamique.

---

## 🚀 Fonctionnalités principales

- Navigation entre les écrans avec **GoRouter**
- Ajout et suppression de produits dans le **panier**
- Gestion des **favoris persistants** grâce à SharedPreferences
- Affichage des **catégories** et des **produits** par catégorie
- Authentification **mockée** (simulation simple)
- **Thème personnalisé** pour l'ensemble de l'application

---

## 🧠 Convention de commentaires

Pour faciliter la relecture du code et attribuer les contributions de chacun, chaque membre utilise une **convention de couleur et de symbole** dans les commentaires du code source :

| Membre            | Préfixe de commentaire | Couleur (éditeur) |
|-------------------|------------------------|-------------------|
| Keziah            | `// ?`                 | Bleu              |
| Lucas Fernandes   | `// *`                 | Vert              |
| Salimou           | `// !`                 | Rouge             |

Ces conventions permettent d’identifier rapidement l’auteur d’un bloc de code ou d’une modification.

---

## 👥 Répartition des tâches

### 🔸 Lucas Fernandes
- Débogage du layout et du router pour `product_detail_screen.dart`
- Résolution des conflits liés au clonage et aux merges Git
- Première version de la page produit (`product_detail_screen.dart`) et du layout associé

### 🔸 Salimou
- Version finale du layout et du router de `product_detail_screen.dart`
- Mise en place du layout et du router de `cart_screen.dart`
- Développement de la fonctionnalité d’ajout au panier
- Affichage des produits ajoutés au panier
- Gestion des conflits Git

### 🔸 Keziah
- Mise en place du router et de la page favoris
- Intégration des icônes panier et favori
- Développement de la fonctionnalité d’ajout/suppression des favoris
- Affichage des produits favoris
- Gestion des conflits Git

### 🤝 Travail collaboratif
- Résolution des problèmes liés au clonage du dépôt et aux merges Git
- La majorité des développements ont été réalisés ensemble, via appels Teams pour une meilleure coordination

---

## ⚙️ Démarrage rapide

1. **Cloner** le dépôt :
   ```bash
   git clone <URL_DU_DEPOT>
   cd store
