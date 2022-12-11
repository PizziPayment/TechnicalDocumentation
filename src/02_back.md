# Services dorsaux

## Technologies Utilisées 

Les projets sont développés à l'aide du langage [TypeScript](https://www.typescriptlang.org)
dans un environement [NodeJS](https://nodejs.org/en/).
Un [tsconfig.json](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html) est présent 
dans chaque projet pour spécifier les options de compilation.

Pour les serveurs d'autorisation et ressources, le framework [ExpressJS](https://expressjs.com/fr/) 
est utilisé. Ce framework permet de spécifier les paramètres des API, notamment les routes ou les 
opérations HTTP acceptées sur les API au travers des routeurs, disponibles dans chaqun des domaines 
situés dans les répertoires des projets, et inclus dans les fichiers `api.ts` des deux API.

La base de données, quant à elle, utilise le moteur [PostgreSQL](https://www.postgresql.org).

Afin de communiquer avec la base via les API [Sequelize](https://sequelize.org) est utilisé. 
Sequelize est un ORM qui permet de générer et lier les différentes tables de la base de données à
des classes TypeScript. Les modèles des tables sont tous disponibles dans le répertoire 
`src/commons/services/orm/models` dans le répository `pizzi-db` (voir dans la partie dédiée).

Pour déployer et migrer la base de données, un script, dépendant de `pizzi-db` est disponible.
Ce script est situé dans le repository `DeployDB` et est utilisé pour déployer et mettre à jours 
la base en production. Afin d'avoir un environnement de développement le plus proche possible de 
l'environnement de production, utiliser ce script pour déployer ou migrer les tables sur son 
environnement de développement est fortement recommandé.

## Serveurs (autorisation et ressources)

Le serveur d'autorisation et le serveur de ressources bien que servant
différent buts, possèdent une architecture, un modèle de contribution, des
normes et conventions similaire. Ainsi dans la prochaine section, "le serveur"
s'applique aux deux serveurs (autorisation et ressources).

### Architecture et organisation du projet

Le code se trouve dans le répertoire `app/`. Le point d'entrée est le fichier
`index.ts`. Le reste du code du code se trouve dans des sous-dossiers ou chacun
correspond à un domaine. Un domaine est une ressources (exemples: utilisateur,
magasin, etc...).
Un dossier de domaine se décompose en quatre parties comme indiqué sur la
figure \ref{fig:back-domain-struct}.

\begin{figure}[H]
  \centering
  \begin{BVerbatim}
  nom_du_domaine
  |-controllers
  | |-nom_du_domaine.controller.ts
  |
  |-middlewares
  | |-un.middleware.ts
  |
  |-models
  | |-request.model.ts
  |
  |-routes.config.ts
  \end{BVerbatim}
  \caption{Structure d'un domaine}
  \label{fig:back-domain-struct}
\end{figure}

Premièrement, le fichier `routes.config.ts` où sont spécifiées les routes du
domaine. Deuxièment les `middlewares` qui permettent de vérifier la validité
d'une requête entrante. Ceux-ci sont chargés de vérifier que les champs requis
soient bien présents. Troisièment les `controllers` qui s'occupent d'effectuer
les opérations dit buisness. Enfin les `model` qui sont les structures de
données d'un domaine qui les stockent lors des entrées et sorties.

A noter que le dossier `common` ne représente pas une ressource mais un
regroupement de `controllers`, `middleware` et `model` utilisés dans plusieurs
domaines, comme par exemple le middleware d'identification des utilisateurs.

### Tests

Les tests sont stockés dans le dossier `tests`. Chaque fichier dans le dossier
est une suite de tests pour un domaine spécifique. A noter que, à l'instar du dossier `app`, 
le dossier `common` regroupe des services et `models` servants pour de multiple tests.

### Documentation

La documentation des routes HTTP du serveur se trouve dans le dossier
`documentation`. La documentation est faîte grâce à la spécification [OpenAPI
specification](https://spec.openapis.org/oas/v3.1.0).

### Convention de code

Une configuration `prettier` est disponible dans chacun des projets
afin de correctement formatter le code. La majorité des IDE modernes sont
capable de charger une configuration prettier via le `.prettierrc.json` à 
la racine, que ce soit nativement ou via une extension.

Néanmoins, si votre IDE n'est pas compatible, il est toujours possible de 
formatter votre code directement à l'aide de la commande `yarn run prettier app/ --write`.

Une configuration `eslint` est également disponible et peut être utilisé via la 
commande `yarn lint` si non supporté par votre IDE.

Cependant, le développement de ce projet prenant place en l'an de grâce 2022, nous vous 
conseillons fortement d'utiliser un IDE capable de supporter ces outils qui font partie des 
bases du développement sur NodeJS depuis **plus de 5 ans**.

### Méthode de travail

Les tâches à effectuer sont fournies sous formes d'issue GitHub directement dans leurs 
répertoire respectifs. Nous nous répartissons les tâches en utilisant Discord. Assignez-vous 
la ou les issues qui vous ont été attribuées lors de la répartition. 

Par la suite il vous suffit de créer une branche pour votre issue en la tirant depuis la 
**dernière version de la branche `develop`**. Lorsque votre fonctionnalité est terminée 
**et validée par des tests**, vous pouvez créer une Pull Request en mentionnant l'issue 
que cette dernière est sensée résoudre. **N'oubliez pas de vous assigner votre Pull Request 
nouvellement créée**. Sélectionnez un autre membre de l'équipe pour effectuer votre revue
de code, n'hésitez pas à le contacter sur Discord pour l'informer, il arrive que les 
notifications de GitHub se perdent en chemin.

## Abstraction de la Base de Données Pizzi-DB

Afin de respecter une architecture de dépendances saines entre nos projets, l'abstraction vers notre
base de données est séparée du reste des projets et constitue un projet à part entière.

Ce projet est constitué d'un paquet, `pizzi-db` qui est importé par les deux serveurs ansi que l'outil 
de migration.

### Architecture et organisation du projet

`pizzi-db` se base sur l'orm et outil de migration [Sequelize](https://sequelize.org) et abstrait tout ses
usages. Ni le paquet `sequelize`, ni aucun de ses types ne sont exportés en dehors du paquet.

Les descriptions des tables et des relations dans notre base de données sont stockées dans le dossier 
`src/common/services/orm/models`. 

\begin{figure}[H]
  \centering
  \begin{BVerbatim}
  common
  |-services
  | |-orm
      |-models
        |-admins.database.model.ts
        |-...
  \end{BVerbatim}
  \caption{Emplacement des modèles}
  \label{fig:back-db-models}
\end{figure}

Chaque fichier se trouvant dans ce dossier contient une classe TypeScript décrivant la table.
Cette classe est ensuite chargée par Sequelize pour synchroniser ou créer les tables dans la 
base de donnée. **Pour toute information quant à l'utilisation du paquet veuillez vous référer au 
`README.md` disponible à la racine de [celui-ci](https://github.com/PizziPayment/PizziAPIDB).**

\begin{figure}[H]
  \centering
  \begin{BVerbatim}
  client
  |-models
  | |-client.model.ts
  |
  |-client.database.service.ts
  \end{BVerbatim}
  \caption{Structure d'un service}
  \label{fig:back-service-struct}
\end{figure}

Les fonctionnalités du projet sont situées à l'intérieur du dossier `src`. Ici vous trouverez
un dossier pour chaque domaine de l'application, généralement relié à une (ou plusieurs tables)
dans la base de données. Dans chacuns des ces dossiers se trouve un sous-dossier `models` avec les
modèles utililisés et un fichier `database.service` qui regroupe le code métier du service.

Chacune des fonctions situées dans les services retournent un objet `Result` basé sur un `Result` du 
paquet [neverthrow](https://github.com/supermacro/neverthrow) qui est utilisé pour une gestion 
d'erreurs plus efficace et sécurisée. Il va sans dire que nous vous conseillons également de lire 
la documentation de `neverthrow` afin de comprendre comment fonctionne le paquet.

A noter que le dossier `common` ne représente pas une service en soit mais un
regroupement de `services`, et `models` utilisés dans plusieurs autres services, 
comme par exemple le model d'erreur qui est commun. Le dossier `extensions`, lui,
rajoute des fonctions utiles lors de l'écriture d'un service.

### Tests

Les tests sont stockés dans le dossier `tests` et le sous-dossier `services`. Chaque fichier dans le dossier
est une suite de tests pour un service spécifique. A noter que, à l'instar du dossier `src`, 
le dossier `common` regroupe des services et `models` servants pour de multiple tests.

### Convention de code

Une configuration `prettier` est disponible dans le projet afin de correctement formatter le code. 
La majorité des IDE modernes sont capable de charger une configuration prettier via le 
`.prettierrc.json` à la racine, que ce soit nativement ou via une extension.

Néanmoins, si votre IDE n'est pas compatible, il est toujours possible de 
formatter votre code directement à l'aide de la commande `yarn run prettier app/ --write`.

### Méthode de travail

La méthode de travail sur ce projet est éxactement la même que pour les serveurs. D'ailleurs, vous remarquerez
que l'implémentation d'une fonctionnalité sur un serveur mènera généralement à la modification du code sur celui-ci.

**Il va également sans dire que chaque nouvelle fonctionnalité implémentée de ce côté se doit d'être correctement
testée.**

### Déploiement

Lorsque votre Pull Request est validée et reportée sur la branche `develop` du projet, un tag devra être poussé sur le 
répertoire. Ce tag sera la nouvelle version du paquet qui pourra ensuite être utilisé dans les autres projets. Ce tag
doit respecter le format `v{MAJEURE}.{MINEURE}.{PATCH}` par exemple `v1.2.0` est une version valide, ce que n'est pas 
`v1a.2`.

Chaque version est ensuite envoyée en preprod pour que les nouvelles
fonctionnalités soient disponible pour le développement des applications
frontales. Une fois testées par celle-ci également, la version est envoyée en
production.

## Infrastructure

Actuellement les APIs de production sont deployées chez Mathieu POINTECOUTEAU
sur un serveur personnel par faute de moyens. L'architecture réseau est
représentée sur la Figure-\ref{fig:network-arch}.

\input{src/network.tex}

Sur ce schéma, chaque noeud est un conteneur Docker. Ceux préfixés par
`Pizzi` sont issus d'images Docker faites grâce aux outils de déploiement (voir
\nameref{sec:deployment_tool}).

Dans ce dépôt se trouve aussi un fichier `docker_compose.yaml` qui permet de
déployer les services dorsaux comme sur la Figure-\ref{fig:network-arch} (voir
\nameref{sec:deployment_docker_compose}). Sur la figure, les différents réseaux
sont représentés.
Ceux dans la couche `Docker` sont des réseaux accessibles uniquement aux membres
de celui-ci.
Les flèches entre les couches `Docker` et `Localhost` représentent la
communication entre les conteneurs et la machine, qui s'effectue via un port
exposé.

Le conteneur `Swag` est utilisé comme un reverse proxy afin d'être le seul
point d'entrée de la machine. Il redirige les requêtes entrantes depuis
internet vers le bon service. Les requêtes sont redirigées en fonction de leur
URI. Celui-ci permet également de garder un registre des requêtes qui ont été
effectuées.

Le conteneur `Pizzi Deploy DB` permet d'effectuer des migrations de la base de
données. Il doit être lancé avant chaque mise en production afin de mettre à
jour la base de donnéés.

### Outils de déploiement {#sec:deployment_tool}

Le dépôt
[PizziBackDeploymentTools](https://github.com/PizziPayment/PizziBackDeploymentTools)
contient les outils nécessaires pour déployer la partie backend de Pizzi.

#### Génération des applications

Dans ce dépôt, se trouve un script `update.sh` permettant de créer les trois
images. Elles sont générées chacune en suivant les mêmes étapes. Nous allons
ici prendre comme exemple le serveur d'autorisation:

- Téléchargement des sources du projet depuis le dépôt de celui-ci
  ```bash
  GIT_URL="git@github.com:PizziPayment"
  AUTH_SERVER_REPO="$GIT_URL/PizziAuthorizationServer"
  AUTH_SERVER_BASE_DIR="PizziAuthorizationServer/sources"
  AUTH_SERVER_BRANCH="master"
  
  fetch_projet_source
    $AUTH_SERVER_BASE_DIR \
    $AUTH_SERVER_REPO \
    $AUTH_SERVER_BRANCH
  ```
  La fonction `fetch_projet_source` télécharge les sources du projet directement
  dans le dossier spécifié par la variable `$AUTH_SERVER_BASE_DIR`.

\vspace{\baselineskip}

- Génération de l'application de production
  ```bash
  build 'PizziAuthorizationServer'
  ```
  La fonction `build` effectue les opérations suivantes:
    - Téléchargement des dépendances de production
    - Copie des dépendances de production dans le dossier d'artéfact
    - Téléchargement des dépendances de développement
    - Transpilation des sources du projet
    - Copie des sources transpilées dans le dossier d'artéfact
    - Copie de la configuration du projet dans le dossier d'artéfact

\vspace{\baselineskip}

- Génération de l'image Docker
  ```bash
  build_runner 'PizziAuthorizationServer' 'pizzi-auth-runner'
  ```
  La fonction `build_runner` s'occupe de générer l'image Docker via un
  Dockerfile. Celui-ci effectue les opérations suivantes:
    - Copie du dossier d'artéfact généré à l'étape précédente
    - Dans le cas d'un serveur, exposition d'un port
    - Définition du point d'entrée

Un script `clean.sh` se trouve également dans le dépôt, il permet de supprimer
les artéfacts, caches et images docker créés par le script `update.sh`.

#### Déploiement {#sec:deployment_docker_compose}

Une fois les images Docker générées, le déploiement s'effectue à l'aide des
commandes suivantes:
```bash
docker compose up -d db
docker compose run --rm db-migration
docker compose up -d auth-server rsc-server
```
La première commande permet de lancer la base de données (`PostgreSQL`). La
deuxième lance `Pizzi Deploy DB`. Et enfin la dernière lance les serveurs de
ressources et d'autorisation.
