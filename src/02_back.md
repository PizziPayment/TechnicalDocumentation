# Services dorsaux

## Serveurs (autorisation et ressources)

Le serveur d'autorisation et le serveur de ressources bien que servant
différent buts, possèdent une architecture, un modèle de contribution, des
normes et conventions similaire. Ainsi dans la prochaine section, "le serveur"
s'applique au deux serveurs (autorisation et ressources).

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

Premièrement, le fichier `routes.config.ts` ou sont spécifiées les routes du
domaine. Deuxièment les `middlewares` qui permettent de vérifier la validité
d'une requête entrante. Ceci sont chargés de vérifier que les champs requis
soient bien présents. Troisièment les `controllers` qui s'occupent d'effectuer
les opérations dit buisness. Enfin les `model` qui sont les structures de
données d'un domaine qui les stockent lors des entrées et sorties.

A noter que le dossier `common` ne représente pas une ressource mais un
regroupement de `controllers`, `middleware` et `model` utilisés dans plusieurs
domaines, comme par exemple le middleware d'identification des utilisateurs.

### Tests

Les tests sont stockés dans le dossier `tests`. Chaque fichier dans le dossier
est une suite de tests pour un domaine spécifique. A noter que comme pour les
domaines le dossier `common` regroupent des services et `models` servant pour
de multiple tests.

### Documentation

La documention des routes HTTP du serveur se trouve dans le répertoire
`documentation`. La documention est faîte grâce à la spécification [OpenAPI
specification](https://spec.openapis.org/oas/v3.1.0).

### Convention de code

### Méthode de travail
