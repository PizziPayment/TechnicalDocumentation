# TPE

## HARDWARE

### `composant utilisées`

> - [esp32](https://www.espressif.com/en/products/socs/esp32), module de programmation qui intègre directement Wifi et BLE.
> - [Écran](https://fr.aliexpress.com/item/1005001999296476.html?spm=a2g0o.productlist.0.0.6a9580d2zZOAoY&algo_pvid=4948553b-13dc-44af-ba77-a004d1cad1a7&algo_exp_id=4948553b-13dc-44af-ba77-a004d1cad1a7-0&pdp_ext_f=%7B%22sku_id%22%3A%2212000018365356571%22%7D&pdp_npi=2%40dis%21EUR%219.53%218.58%21%21%21%21%21%402100bddd16705076985542768ebb9d%2112000018365356571%21sea&curPageLogUid=HsVstVVf9EIC): Module d'affichage LCD série SPI HD 3.5 pouces, 480x320 TFT.
> - [RFID](https://www.amazon.fr/AZDelivery-lecteur-Arduino-Raspberry-d%C3%A9marrage/dp/B074S8MRQ7/ref=sr_1_1_sspa?keywords=Arduino+Rfid&qid=1670507863&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1&smid=A1X7QLRQH87QA3): module de communication RFID, pour effectuer un payment sans contacts.
> - [Buzzer](https://www.amazon.fr/AZDelivery-KY-006-dalarme-Arduino-compris/dp/B089QHLRSG/ref=sr_1_1_sspa?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=4U33JS1R58CS&keywords=Arduino+buzzer&qid=1670508056&sprefix=arduino+buzzer%2Caps%2C111&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1&smid=A1X7QLRQH87QA3): permet d’émettre un sons lorsque les données en RFID on été lu.

### `Autre`

> - la coque du terminal a ete crée a l'aide d'une imprimante3D et du plastique dis PLA
> - la coque a été désigné sur le logiciel [Tinkercad](https://www.tinkercad.com/)
> - le fichier 3D a été slicer a l'aide de [Simplify3D](https://www.simplify3d.com/)

---

## LOGICIEL

### `Technologies utilisées`

Le Projet a été coder avec le Framework Arduino. Nous avons aussi utilisé, [PlatformIo](https://platformio.org/) avec le quel nous avons générer le projet, installé les dépendances et téléchargé le programme sur le TPE.

### `Dépendances`

- [TFT_eSPI](https://github.com/Bodmer/TFT_eSPI?utm_source=platformio&utm_medium=piohome): Lib utilisé pour l'affichage sur l’écran TFT.
- [MFRC522-spi-i2c-uart-async](https://github.com/makerspaceleiden/rfid?utm_source=platformio&utm_medium=piohome): Lib utilisé pour le module RFID.

#### `Normes du projet`

Afin de contribuer au développement du TPE, et dans le but de standardiser le code, d’éviter des changements inutiles et de maintenir la qualité du code. L'équipe ce base sur les normes utilisé pour les projets C/C++.

### `Déploiement`

Nous utilisons Git et travaillons sur des branches qui sont ensuite ré-évaluées par des pairs afin d'intégrer le travail dans la branche principale.

Le déploiement se fait par la suite grace a platformIO, qui permet de compiler le projet, puis le téléverser sur le TPE via l'USB.

### `Contribution`

L’équipe Pizzi utilise la gestion de configuration Git afin de garder une trace de chaque version de l’application et du travail de chacun.
