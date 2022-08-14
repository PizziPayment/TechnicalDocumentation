# Application frontales

## Application mobile

### Technologies utilisées
Le projet mobile a été développé en [typescript](https://www.typescriptlang.org/) en utilisant [react-native](https://reactnative.dev/) afin d’avoir un seul code pour l’application mobile. Pizzi utilise le kit d'outil [expo](https://docs.expo.dev/) afin de faciliter le déploiement de l’application mobile.
À la racine du dépôt, vous trouverez tous les fichiers de configurations nécessaires au projet:
- [App.json](https://docs.expo.dev/versions/latest/config/app/): pour configurer expo.
- [Tsconfig.json](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html): pour préciser les paramètres de compilation typescript.
- [setupJest.ts](https://jestjs.io/docs/configuration): défini l’initialisation du kit d'outil Jest.
- [Metro.config.js](https://docs.expo.dev/guides/customizing-metro/): défini les paramètres pour le serveur metro utilisé par expo.
- Index.js: c’est l’entrée de l’application mobile. Le fichier est en javascript car Pizzi utilise Expo Application Services (EAS) afin de déployer l’application mobile qui fonctionne seulement avec une entrée avec un fichier javascript.
- [Eas.json](https://docs.expo.dev/build/eas-json/): configuration de EAS.
- [Babel.config.js](https://babeljs.io/docs/en/configuration): configuration pour compiler différentes version de javascript.
- [.eslintrc.js](https://eslint.org/docs/latest/user-guide/configuring/): configuration pour le vérifier certaines erreurs dans le code.

### Contribution
L’équipe Pizzi utilise la gestion de configuration Git afin de garder une trace de chaque version de l’application et du travail de chacun.

#### Normes du projet
Afin de contribuer au développement de l’application mobile, vous devez vous assurer d’avoir le linter d’activer et de formater votre code. Cela permet de standardiser le code, d’éviter des changements négligeables et de faire en sorte que toute l’équipe se base sur un même style de code. L'équipe utilise actuellement [Eslint](https://eslint.org/) et [Prettier](https://prettier.io/) afin de corriger et de formater le code.

#### Git
Lorsque vous créez une branche, assurer que celle-ci se nomme en respectant le format `kebab-case`. Si la branche est créée pour résoudre un ticket alors celle-ci doit préfixer le numéro du ticket comme `123-map-view`.

Chaque message (`commit`) du projet doit respecter la norme du [commit convetionnel](https://www.conventionalcommits.org/en/v1.0.0/).

À chaque fois que vous envoyez votre contribution sur le dépôt de git, le code se formate automatiquement. Pendant une requête de fusion vers la branche `develop` du dépôt, une pipeline comportant le linter ainsi que les tests va se lancer et vérifier que votre contribution peut être acceptée dans la nouvelle branche. Chaque requête de fusion doit être revue par un membre de l'équipe. Si la pipeline est un succès et que votre travail a été revu par une personne alors vous pourrez fusionner votre travail en vous assurant de lier le ticket correspondant s'il y en a un.

Une fois que votre contribution sera fusionné avec la branche `develop` un déploiement Expo Application Services (EAS) s'effectuera afin de générer l'Android Package (APK) pour les appareils Android (nous ne générons pour l'instant aucun package ou déploiement vers les appareils iOS pour le moment).

#### Tests
Il est obligatoire d'écrire des tests unitaires pour chaque nouvelle fonctionnalité. Les tests doivent couvrir le projet à 90% minimum. Différents types de tests existent afin d'arriver à cet objectif. Les tests `snapshots` pour vérifier que l'interface corresponde aux attentes et les tests unitaires pour tester chaque fonctionnalité. Dans le cas où votre contribution ne posséderait pas de tests unitaires, celle-ci se verra refusée lors de la demande de fusion.

#### Organisation de développement
Afin de mener à bien le développement de l'application mobile, le projet s'organise de façon agile sous forme de sprint. La durée d'un sprint est d'une semaine. Toutes les semaines un compte rendu de sprint est organisé avec toute l'équipe mobile afin d'attribuer les prochaines tâches, bugs du projet à chacun. Aussi c'est à ce moment-là que l'ensemble de l'équipe défini la complexité des tâches afin d'avoir une estimation de temps sur leurs réalisations.

Chaque jour un compte rendu est réalisé avec l'équipe mobile sur les tâches effectuées la veille et sur les prochaines tâches du jour. Cela permet de savoir où chacun en est et éventuellement d'avancer sur certains points bloquants. 

#### Sortie d'une nouvelle version de l'application
Tous les mois une nouvelle version bêta de l'application mobile est déployée afin d'y ajouter les avancements de chaque sprint. La précédente version bêta devient la nouvelle version pour les utilisateurs si celle-ci possède plus de 90% de couverture de tests et que la stabilité a été validée par l'équipe. Pour le format de la version, l'équipe se base sur le standard de [semantice version](https://semver.org.). La version production pour les utilisateurs se trouve sur la branche `main` tandis que la version pour la branche bêta se trouve sur `develop`.

#### Les outils utilisés
Dans le cadre de votre collaboration avec le reste de l’équipe, vous aurez accès à différents outils de communication. Le premier outil de l’équipe s’appelle Discord. Si vous avez besoin d’une invitation veuillez envoyer un e-mail à l’adresse pizzi_2023@labeip.epitech.eu avec pour objet “[Invitation Discord]”. Un salon vocal intitulé `mobile` permet de faire les points avec l'équipe. Le salon textuel pour l'équipe mobile s'appelle `mobile` et les messages de statut sur le déploiement dans `mobile-deployment`.

Dans l’objectif de centraliser les outils que Pizzi utilise, la gestion de tickets, les remontés de bugs s’effectuent directement sur GitHub. 

## Logiciel commerçant

Le logiciel commerçant est basé sur une web application en Vue.JS 2.7,

Vue.JS fonctionne en `vue` qui possèdent des composants. Nous nous efforçons au maximum de scinder ces composants afin de pouvoir par exemple les réutiliser.

Nous utilisons Vuetify et nous servons des composants Vuetify afin de développer de manière plus rapide et consistante en terme de design les différentes fonctionnalités.

### Dépendances

Nous utilisons les dépendances suivantes : 

- [Axios](https://axios-http.com/fr/docs/intro)

Nous utilisons Axios pour effectuer les requêtes au back-end.

- [Vuex](https://vuex.vuejs.org)

Nous utilisons Vuex afin de créer un store pour cacher les données et y accéder plus facilement entre les différents composant VueJS. 

- [VueRouter](https://router.vuejs.org)

Nous utilisons vueRouter pour créer et relier les différentes vue entre elles.

- [Bugsnag](https://www.bugsnag.com)

Nous utilisons bugsnag pour monitorer l'activité utilisateur et également détecter chaque bug ou erreur remontée par le logiciel.

- [Labelmake](https://labelmake.jp)

Nous utilisons Labelmake pour génerer des pdf à partir de template javascript. Nous utilisons notamment ce paquet pour exporter les reçu en pdf. 

- [Moment](https://momentjs.com)

Nous utilisons moment pour manipuler et afficher aisément les dates en javascript

- [Vuelidate](https://github.com/vuelidate/vuelidate)

Un paquet permettant d'effectuer des validations sur un modèle d'objet. Nous nous en servons notamment pour les formulaires d'inscription.

- [Vuetify](https://vuetifyjs.com/en/)

Nous utilisons vuetify comme framework de material design. Cela nous assure une cohérence visuelle sur toute la plateforme et un design moderne et accessible.



### Norme

Nous utilisons la norme ESLINT ainsi que Prettier.

### Déploiement

Nous utilisons Git et travaillons sur des branches qui sont ensuite ré-évalués par des pairs afin d'intégrer le travail dans la branche principale.

Le déploiement se fait de manière automatique sur `netfliy` à chaque `git push` sur la branche `master`

Le logiciel commerçant est accessible en suivant le lien suivant : [Logiciel Commerçant](https://pizzi-webapp.netlify.app/dashboard)
