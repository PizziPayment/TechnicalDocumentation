# Application frontales

## Application mobile

### Technologies utilisées

Le projet mobile a été développé en [typescript](https://www.typescriptlang.org/) en utilisant [react-native](https://reactnative.dev/) afin d’avoir un seul code pour l’application mobile. Pizzi utilise le kit d'outil [expo](https://docs.expo.dev/) afin de faciliter le déploiement de l’application mobile.
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

#### Normes du projet

Afin de contribuer au développement de l’application mobile, vous devez vous assurer d’avoir le linter d’activer et de formater votre code. Cela permet de standardiser le code, d’éviter des changements inutiles et de faire en sorte que toute l’équipe se base sur un même style de code. L'équipe utilise actuellement [Eslint](https://eslint.org/) et [Prettier](https://prettier.io/) afin de corriger et de formater le code.

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

Nous utilisons bugsnag pour monitorer l'activité utilisateur et également détecter chaque bug ou erreur remontée par le logiciel.

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
