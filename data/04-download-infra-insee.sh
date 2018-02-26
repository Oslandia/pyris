#!/bin/bash

set -e
set -u

# INSEE infracommunal (IRIS)

# population 2013 - https://www.insee.fr/fr/information/2383358
# https://www.insee.fr/fr/statistiques/2386737
wget https://www.insee.fr/fr/statistiques/fichier/2386737/base-ic-evol-struct-pop-2013.zip
unzip base-ic-evol-struct-pop-2013.zip

# logement 2013 - https://www.insee.fr/fr/information/2383355
# https://www.insee.fr/fr/statistiques/2386703
wget https://www.insee.fr/fr/statistiques/fichier/2386703/base-ic-logement-2013.zip
unzip base-ic-logement-2013.zip

# couple, familles & ménages 2013 - https://www.insee.fr/fr/information/2383347
# https://www.insee.fr/fr/statistiques/2386664
wget https://www.insee.fr/fr/statistiques/fichier/2386664/base-ic-couples-familles-menages-2013.xls

# diplômes, formation 2013 - https://www.insee.fr/fr/information/2383350
# https://www.insee.fr/fr/statistiques/2386698
wget https://www.insee.fr/fr/statistiques/fichier/2386698/base-ic-diplomes-formation-2013.zip
unzip base-ic-diplomes-formation-2013.zip

# activité des résidents 2013 - https://www.insee.fr/fr/information/2383368
# https://www.insee.fr/fr/statistiques/2386631
wget https://www.insee.fr/fr/statistiques/fichier/2386631/base-ic-activite-residents-2013.zip
unzip base-ic-activite-residents-2013.zip
