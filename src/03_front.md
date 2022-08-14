# Application frontales

## Logiciel commerçant

Le logiciel commerçant est basé sur une web application en Vue.JS 2.7,

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

Nous utilisons Labelmake pour génerer des pdf à partir de template javascript. Nous utilisons notamment cette librairie pour exporter les reçu en pdf. 

- [Moment](https://momentjs.com)

Nous utilisons moment pour manipuler et afficher aisément les dates en javascript

- [Vuelidate](https://github.com/vuelidate/vuelidate)

Une librairie permettant d'effectuer des validations sur un modèle d'objet. Nous nous en servons notamment pour les formulaires d'inscription.

- [Vuetify](https://vuetifyjs.com/en/)

Nous utilisons vuetify comme framework de material design. Cela nous assure une cohérence visuelle sur toute la plateforme et un design moderne et accessible.



### Norme

Nous utilisons la norme ESLINT ainsi que Prettier.

### Déploiement

Le déploiement se fait de manière automatique sur `netfliy` à chaque `git push` sur la branche `master`

Le logiciel commerçant est accessible en suivant le lien suivant : [Logiciel Commerçant](https://pizzi-webapp.netlify.app/dashboard)