# Introduction

## Architecture

Le projet Pizzi se compose d'une partie dorsale sur laquelle s'appuie la partie
frontale.

\begin{figure}[H]
  \centering
  \includegraphics[width=\textwidth]{resources/mermaid/project-arch.png}
  \caption{Schéma de l'architecture du projet Pizzi}
  \label{fig:project-arch}
\end{figure}

La Figure-\ref{fig:project-arch} permet d'avoir un aperçu sur l'architecture du
projet ainsi que ses différents composants. Les principaux composants y sont
présents.

Les services dorsaux de composent d'un serveur d'autorisation et d'un serveur
de ressources, tout deux s'appuyant sur une base de données.

Quand aux applications frontales que sont l'application sur toile et la mobile,
elles s'appuyent toutes deux sur les serveurs d'autorisation et de resources.

## Dépôts

Tous les dépôts du projet sont hébergés sur github dans l'organisation
[PizziPayment](https://github.com/PizziPayment). Faute de moyen, tous les
dépôts sont à la racine de l'organisation. Nous allons ici les passer en revue,
cependant le détail de chacun sera explicité dans leur section dédiée.

L'organisation des dépôts est la suivante:

- Application frontales:
  - [PizziMobile](https://github.com/PizziPayment/PizziMobile) est le dépôt
    contenant les sources de l'application mobile.

  - [PizziWeb](https://github.com/PizziPayment/PizziWeb) est le dépôt contenant
    les sources de l'application sur toile.

- Services dorsaux:
  - [PizziAuthorizationServer](https://github.com/PizziPayment/PizziAuthorizationServer)
    est le dépôt contenant les sources du serveur d'autorisation.

  - [PizziResourceServer](https://github.com/PizziPayment/PizziResourceServer)
    est le dépôt contenant les sources du serveur de ressources.

  - [PizziAPIDB](https://github.com/PizziPayment/PizziAPIDB) est un dépôt
    contenant les sources une abstraction sous forme de services de la base de
    données.

  - [PizziPayment.github.io](https://github.com/PizziPayment/PizziPayment.github.io.git)
    est le dépôt contenant la documentation publiée des APIs ainsi qu'une
    collection Postman.

  - [Documentation](https://github.com/PizziPayment/Documentation) est un dépôt
    qui permet le stockage temporaire de la documentation de l'API.

- Devops:
  - [PizziBackDeploymentTools](https://github.com/PizziPayment/PizziBackDeploymentTools)
    est le dépôt contenant les outils pour effectuer un déploiement.

  - [DeployDB](https://github.com/PizziPayment/DeployDB) est un dépôt contenant
    l'outil permettant d'effectuer les migrations sur la base de données.

- Dédié à Epitech:
  - [TemplateForPDF](https://github.com/PizziPayment/TemplateForPDF) est un
    dépôt contenant un template pour un document destiné à EPITECH.

  - [DocumentBuilder](https://github.com/PizziPayment/DocumentBuilder) est un
    dépôt qui permet de créer une image Docker afin de compiler un PDF (ex:
    TemplateForPDF).

  - [TechnicalDocumentation](https://github.com/PizziPayment/TechnicalDocumentation)
    est le dépôt contenant les sources de ce document.

  - [PizziPLD](https://github.com/PizziPayment/PizziPLD) est le dépôt contenant
    les sources qui permettent de créer le PLD.

  - [PizziLandingPage](https://github.com/PizziPayment/PizziLandingPage) est le
    dépôt contenant les sources de la page d'atterrissage.
