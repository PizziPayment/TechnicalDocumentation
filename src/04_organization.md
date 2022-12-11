# Organisation et communication

## Organisation

Afin de gérer le projet et les différentes tâches à effectuer dans le cadre du développement du projet Pizzi nous utilisons [Clickup](https://clickup.com). Cela nous permet d'avoir un suivi en vue Kanban et un espace tout en un où nous entreprosons nos documents.

Le projet s'inscrivant dans le cadre de l'Epitech Innovative Project (EIP) et conformément aux méthodes pédagogiques, nous organisons chaque tâche ainsi que son scope associé dans un document nommé PLD (Projet Log Document). Cela nous permet de détailler avec précision l'impact de chaque tâche sur le projet et les conditions qui doivent être complétées afin de valider la tâche. Le PLD est divisé en grandes parties en respesctant l'architecture du projet : application mobile, logiciel commerçant, services dorsaux et enfin le terminal de paiement connecté.

La rédaction du Project Log Document se fait en LaTeX. Dans un but de simplification, l'équipe a mis en place un convertisseur permettant d'écrire des fichiers directement en `.yaml` qui seront ensuite interprétés pour réaliser le PLD. Il faut être vigilant sur l'architecture et le format de vos fichiers sous peine de faire échouer la composition du document.

Pour toute participation sur le PLD, nous nous efforçons de réaliser une Pull-Request sur le repository Git afin que l'équipe puisse relire et corriger les modifications apportées.

Nous utilisons également massivement [Github](https://github.com) pour le développement et le versionning du code. Nous utilisons le système des `issues` afin de se concerter pour des évolutions ou des améliorations de nos fonctionnalités. 

Vous pouvez retrouver nos discussions quant au système de transaction dans la partie `issues` de Github.

L'équipe Pizzi se sépare en plusieurs pôles :

### Applications Frontales

- Application Mobile (Valentin Mille)
- Application Web (Rémi Poulenard, Simon Houliat, Florian Antoine)

### Service Dorsaux

- CI / CD (Mathieu Pointecouteau)
- API (Lilian Verlhac, Alban Garofoli, Mathieu Pointecouteau)
- Tests unitaires (Alban Garofoli)

### Hardware

- Terminal de paiement connecté (Florian Antoine)

### Communication

Nous utilisons plusieurs outils pour communiquer :

Afin de communiquer entre nous en tant que groupe, nous utilisons [Discord](https://discord.com)

Pour communiquer avec notre référent Epitech, nous utilisons [Microsoft Teams](https://www.microsoft.com/fr-fr/microsoft-teams/group-chat-software).

Pour les appels en visioconférence, nous privilégions [Google Meet](https://meet.google.com).

### Git

Lorsque vous créez une branche, assurez-vous que celle-ci se nomme en respectant le format `kebab-case`. Si la branche est créée pour résoudre un ticket alors celle-ci doit préfixer le numéro du ticket comme `123-map-view`.

Chaque message (`commit`) du projet doit respecter la norme du [commit conventionnel](https://www.conventionalcommits.org/en/v1.0.0/).

À chaque fois que vous envoyez votre contribution sur le dépôt de git, le code se formate automatiquement. Pendant une requête de fusion vers la branche `develop` du dépôt, une pipeline comportant le linter ainsi que les tests va se lancer et vérifier que votre contribution peut être acceptée dans la nouvelle branche. Chaque requête de fusion doit être revue par un membre de l'équipe. Si la pipeline est un succès et que votre travail a été revu par une personne alors vous pourrez fusionner votre travail en vous assurant de lier le ticket correspondant s'il y en a un.

Une fois que votre contribution sera fusionnée avec la branche `develop` un déploiement Expo Application Services (EAS) s'effectuera afin de générer l'Android Package (APK) pour les appareils Android (nous ne générons pour l'instant aucun package ou ni déployons vers les appareils iOS).

### Tests

Il est obligatoire d'écrire des tests unitaires pour chaque nouvelle fonctionnalité. Les tests doivent couvrir le projet à 90% minimum. Différents types de tests existent afin d'arriver à cet objectif. Les tests `snapshots` pour vérifier que l'interface corresponde aux attentes et les tests unitaires pour tester chaque fonctionnalité pour tester les cas d'usage. Dans le cas où votre contribution ne posséderait pas de tests unitaires, celle-ci se verra refusée lors de la demande de fusion.

### Organisation de développement

Afin de mener à bien le développement des applications, le projet s'organise de façon agile sous forme de sprint. La durée d'un sprint est d'une semaine. Toute le semaine un compte rendu de sprint est organisé avec toute l'équipe afin d'attribuer les prochaines tâches et bugs du projet à chacun. Aussi c'est à ce moment-là que l'ensemble de l'équipe définit la complexité des tâches afin d'avoir une estimation de temps sur leur réalisation.

Chaque jour un compte rendu est réalisé avec l'équipe sur les tâches effectuées la veille et sur les prochaines tâches du jour. Cela permet de savoir où chacun en est et éventuellement d'avancer sur certains points bloquants.

\input{src/organization-workflow.tex}

#### Sortie d'une nouvelle version de l'application

Tous les mois une nouvelle version bêta de d'une application est déployée afin d'y ajouter les avancements de chaque sprint. La précédente version bêta devient la nouvelle version pour les utilisateurs si celle-ci possède plus de 90% de couverture de tests et que la stabilité a été validée par l'équipe. Pour le format de la version, l'équipe se base sur le standard de [semantice version](https://semver.org.). La version production pour les utilisateurs se trouve sur la branche `main` tandis que la version pour la branche bêta se trouve sur `develop`.

\clearpage

### Les outils utilisés

Dans le cadre de votre collaboration avec le reste de l’équipe, vous aurez accès à différents outils de communication:

- [Discord](https://discord.com): C'est l'outil de communication au sein de l'équipe Pizz. Veuillez envoyer un e-mail à l’adresse suivante `pizzi_2023@labeip.epitech.eu` avec pour objet “[Invitation Discord]” pour y être invité. Une fois accepté dans le serveur, vous y trouverez divers canaux de communication, le plus utilisé étant le channel `général` où les informations importantes y sont promulguées. Vous aurez également accès au canal `ressources` et `access` contenant des informations importantes sur le projet.

- [Github](https://github.com/): Dans l’objectif de centraliser les outils que Pizzi utilise, la gestion de tickets, les remontés de bugs s’effectuent directement sur GitHub dans la catégorie `issues`. Une fois l'issue créée, il est préférable d'y assigner un membre afin d'avoir une réponse promptement. Si vous ne savez pas qui assigner, ne vous en faites pas; un membre de l'équipe s'en chargera.

- [ClickUp](https://clickup.com): Intègre les issues GitHub afin de pouvoir plus facilement voir des informations et mesures sur les performances de l'équipe. Le chef de projet se chargera de vous attribuer des tâches et des objectifs en fonction de ce que vous souhaitez réaliser sur le projet. Vous pouvez également proposer de nouvelles fonctionnalités avec le tag `open`.