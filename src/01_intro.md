# Introduction

## Architecture

Le projet Pizzi se compose d'une partie dorsale sur laquelle s'appuie la partie
frontale.

\input{src/project-architecture.tex}

La Figure-\ref{fig:project-arch} permet d'avoir un aperçu sur l'architecture du
projet. Les différents flux y sont également spécifiés avec leur protocole de
communication respectif.

Les applications frontales regroupent l'application mobile (PizziMobile) et
l'application commerçante (PizziWeb). Ces deux applications communiquent en
HTTP avec le serveur de ressources (PizziResourceServer) ainsi que le serveur
d'autorisation (PizziAuthorizationServer).

PizziAuthorizationServer et PizziResourceServer communiquent aussi avec la
base de données (PostgreSQL) en SQL.

## Dépôts

Tous les dépôts du projet sont hébergés sur github dans l'organisation
[PizziPayment](https://github.com/PizziPayment). Faute de moyens, tous les
dépôts sont à la racine de l'organisation. Nous allons ici les passer en revue,
cependant le détail de chacun sera explicité dans leur section dédiée.

\input{src/repository-architecture.tex}

L'organisation des dépôts est la suivante:

- Application frontales:
  - [PizziMobile](https://github.com/PizziPayment/PizziMobile) est le dépôt
    contenant les sources de l'application mobile.

  - [PizziWeb](https://github.com/PizziPayment/PizziWeb) est le dépôt contenant
    les sources de l'application web.

- Services dorsaux:
  - [PizziAuthorizationServer](https://github.com/PizziPayment/PizziAuthorizationServer)
    est le dépôt contenant les sources du serveur d'autorisation.

  - [PizziResourceServer](https://github.com/PizziPayment/PizziResourceServer)
    est le dépôt contenant les sources du serveur de ressources.

  - [PizziAPIDB](https://github.com/PizziPayment/PizziAPIDB) est un dépôt
    contenant les sources de l'abstraction sous forme de paquet de notre base de
    données.

  - [PizziPayment.github.io](https://github.com/PizziPayment/PizziPayment.github.io.git)
    est le dépôt contenant la documentation publiée des APIs ainsi qu'une
    collection Postman pour tester les APIs.

  - [Documentation](https://github.com/PizziPayment/Documentation) est un dépôt
    qui permet le stockage temporaire de la documentation de l'API.

- Devops:
  - [PizziBackDeploymentTools](https://github.com/PizziPayment/PizziBackDeploymentTools)
    est un dépôt contenant les outils pour effectuer un déploiement.

  - [DeployDB](https://github.com/PizziPayment/DeployDB) est un dépôt contenant
    l'outil permettant d'effectuer les migrations sur la base de données.

- Dédié à Epitech:
  - [TemplateForPDF](https://github.com/PizziPayment/TemplateForPDF) est un
    dépôt contenant un template pour un document destiné à EPITECH.

  - [DocumentBuilder](https://github.com/PizziPayment/DocumentBuilder) est un
    dépôt contenant une image Docker capable de compiler un PDF (ex:
    TemplateForPDF).

  - [TechnicalDocumentation](https://github.com/PizziPayment/TechnicalDocumentation)
    est un dépôt contenant les sources de ce document.

  - [PizziPLD](https://github.com/PizziPayment/PizziPLD) est un dépôt contenant
    les sources qui permettent de créer le PLD.

  - [PizziLandingPage](https://github.com/PizziPayment/PizziLandingPage) est un
    dépôt contenant les sources de la page web de présentation du projet Pizzi.
