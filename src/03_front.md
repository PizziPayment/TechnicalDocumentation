# Application frontales

## Application mobile

### Technologies utilisées

Le projet mobile a été développé en [typescript](https://www.typescriptlang.org/). Le choix du langage s'est fait naturellement pour faciliter le développement et profiter du typage afin de clarifier le code et trouver des bugs plus facilement. Nous utilisons le framework [react-native](https://reactnative.dev/) dans le but d'unifier le code pour les plateformes Android et iOS. Pizzi utilise le kit d'outil [expo](https://docs.expo.dev/) permettant de faciliter le déploiement de l’application mobile mais également d'accéder à de nombreux outils de développement.

Puisque que nous utilisons react-native, nous utilisons le gestionnaire de store [Redux](https://redux.js.org/). Malgré son initialisation coûteuse en développement, il permet de rendre l'application beaucoup plus scalable comparer aux autres solutions existantes. 

En tant que coordinateur des écrans, l'application Pizzi utilise [react-navigation](https://reactnavigation.org/) un projet développé par de nombreux experts en react-native. Cette librairie s'est démarquée dans sa simplicité d'intégration, sa syntaxe simple à comprendre mais aussi sur les nombreux comportements adaptatifs.

Sur le plan architecture, l'application se base sur la [clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html). Ce choix permet de séparer type de couche et d'isoler le comportement des librairies. Ainsi, si nous voulons changer de librairie de navigation ou de requête HTTP dans le futur nous pourrons le faire sans problème.

À la racine du dépôt, vous trouverez tous les fichiers de configurations nécessaires au projet:

- [app.json](https://docs.expo.dev/versions/latest/config/app/): pour configurer expo.
- [tsconfig.json](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html): pour préciser les paramètres de compilation typescript.
- [setupJest.ts](https://jestjs.io/docs/configuration): définit l’initialisation du kit d'outil Jest.
- [metro.config.js](https://docs.expo.dev/guides/customizing-metro/): définit les paramètres pour le serveur metro utilisé par expo.
- index.js: c’est l’entrée de l’application mobile. Le fichier est en javascript car Pizzi utilise Expo Application Services (EAS) afin de déployer l’application mobile qui fonctionne seulement avec une entrée avec un fichier javascript.
- [eas.json](https://docs.expo.dev/build/eas-json/): configuration de EAS.
- [babel.config.js](https://babeljs.io/docs/en/configuration): configuration pour compiler vers différentes versions de javascript.
- [.eslintrc.js](https://eslint.org/docs/latest/user-guide/configuring/): configuration pour vérifier certaines erreurs dans le code.

### Contribution

L’équipe Pizzi utilise la gestion de configuration Git afin de garder une trace de chaque version de l’application et du travail de chacun.
L'ensemble des membres de Pizzi ont préféré utiliser [GitHub](https://github.com/) vu que l'ensemble de l'équipe était déjà présent sur cette plateforme.

#### Normes du projet

Afin de contribuer au développement de l’application mobile, vous devez vous assurer d’avoir le linter d’activer et de formater votre code. Cela permet de standardiser le code, d’éviter des changements inutiles et de faire en sorte que toute l’équipe se base sur un même style de code. L'équipe utilise actuellement [Eslint](https://eslint.org/) et [Prettier](https://prettier.io/) afin de corriger et de formater le code.

### Déploiement de l'application mobile sur Android (APK)

Le déploiement de l'application mobile s'effectue automatiquement lorsque des changements sont réalisés sur la branche `master` de GitHub. Le déploiement est réalisé avec [GitHub Actions](https://github.com/features/actions) outil directement intégré à `GitHub`. Dans l'organisation du projet chaque membre souhaitant développer sur l'application mobile doit ouvrir une branche se basant sur la branche `develop`. Une fois que la fonctionnalité est réalisée, la personne peut créer une demande de fusion dans laquelle le code sera revu par ses pairs. Des changements pourront être demandés afin de préserver la qualité du code puis la branche contenant la nouvelle fonctionnalité pourra être fusionnée avec la branche `develop`.

Chaque branche du dépôt contient une action à chaque mise à jour du code. Cette action lançant les tests unitaires sur l'ensemble du projet permet de détecter toute régression sur le projet.

Ainsi l'application se construit sur la plateforme de déploiement [EAS Build](https://docs.expo.dev/build/introduction/). Le choix était évident sur l'outil de déploiement puisque nous utilisions déjà `expo` qui fourni cette solution clé en main.
Une fois que la construction de la version d'Android, l'APK (Android Package) est disponible et peut être utilisé sur un appareil Android.

Vous pouvez visionner le schéma suivant montrant le workflow de tests et déploiement de l'application.

## Logiciel commerçant

Le logiciel commerçant est basé sur une web application en Vue.JS 2.7,

Vue.JS fonctionne en `vue` qui possède des composants. Nous nous efforçons au maximum de scinder ces composants afin de pouvoir par exemple les réutiliser.

Nous utilisons Vuetify et nous servons des composants Vuetify afin de développer de manière plus rapide et consistante en terme de design les différentes fonctionnalités.

### Dépendances

Nous utilisons les dépendances suivantes : 

- [Axios](https://axios-http.com/fr/docs/intro)

Nous utilisons Axios pour effectuer les requêtes au back-end.

- [Vuex](https://vuex.vuejs.org)

Nous utilisons Vuex afin de créer un store pour cacher les données et y accéder plus facilement entre les différents composants VueJS.

- [VueRouter](https://router.vuejs.org)

Nous utilisons vueRouter pour créer et relier les différentes vue entre elles.

- [Bugsnag](https://www.bugsnag.com)

Nous utilisons Bugsnag pour monitorer l'activité utilisateur et également détecter chaque bug ou erreur remontée par le logiciel.

- [Labelmake](https://labelmake.jp)

Nous utilisons Labelmake pour génerer des PDFs à partir de template javascript. Nous utilisons notamment ce paquet pour exporter les reçus en PDF.

- [Moment](https://momentjs.com)

Nous utilisons moment pour manipuler et afficher aisément les dates en javascript

- [Vuelidate](https://github.com/vuelidate/vuelidate)

Un paquet permettant d'effectuer des validations sur un modèle d'objet. Nous nous en servons notamment pour les formulaires d'inscription.

- [Vuetify](https://vuetifyjs.com/en/)

Nous utilisons vuetify comme framework de material design. Cela nous assure une cohérence visuelle sur toute la plateforme et un design moderne et accessible.

### Norme

Nous utilisons la norme ESLINT ainsi que Prettier.

### Déploiement

Nous utilisons Git et travaillons sur des branches qui sont ensuite ré-évaluées par des pairs afin d'intégrer le travail dans la branche principale.

Le déploiement se fait de manière automatique sur `netfliy` à chaque `git push` sur la branche `master`.

Le logiciel commerçant est accessible en suivant le lien suivant : [Logiciel Commerçant](https://pizzi-webapp.netlify.app/dashboard).
