# Services dorsaux

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

Les descriptions de chaque tables disponibles dans notre base de données sont stoquées dans le dossier 
`app/common/services/orm/models`. 

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

