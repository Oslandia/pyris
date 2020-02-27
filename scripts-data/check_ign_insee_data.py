"""Vérifier les données IRIS de l'IGN et de l'Insee.

Activer l'environnement virtualenv dédié pour bien avoir toutes les dépendances.

*Attention* : Python 3 uniquement !

Usage :

    > python verification_donnees.py --ign path/to/CONTOURS-IRIS.shp --insee path/to/reference_IRIS_geo2017.xls

Testé avec les données 2017

* https://wxs-telechargement.ign.fr/1yhlj2ehpqf3q6dt6a2y7b64/telechargement/inspire/CONTOURS-IRIS-2018-06-08$CONTOURS-IRIS_2-1__SHP__FRA_2018-06-08/file/CONTOURS-IRIS_2-1__SHP__FRA_2018-06-08.7z
* https://www.insee.fr/fr/statistiques/fichier/2017499/reference_IRIS_geo2017.zip
"""

import sys
import logging
import argparse
from pathlib import Path

import fiona

import pandas as pd

import daiquiri

daiquiri.setup(level=logging.INFO)
logger = daiquiri.getLogger("integrité")


# Les champs issus fichier shp IGN
IGN_FIELDS = ("INSEE_COM", "NOM_COM", "IRIS", "CODE_IRIS", "NOM_IRIS", "TYP_IRIS")
IGN_SRID = "epsg:2154"  # Lambert 93
# Les champs de l'export de données QGIS -> CSV
QGIS_EXPORT_FIELDS = ('IRIS', 'NOM_IRIS', 'segment', 'id_num', 'IRIST', 'INSEE_COMMUNE', 'NOM_COMMUNE', 'TYP_IRIS',
                      'PDV', 'MENAGES_2015')

# Les champs issues du fichier Excel Insee
INSEE_FIELDS = ('CODE_IRIS', 'LIB_IRIS', 'TYP_IRIS', 'MODIF_IRIS', 'TRIRIS', 'GRD_QUART', 'DEPCOM', 'LIBCOM', 'UU2010', 'REG', 'DEP')
INSEE_SHEETNAME = "Emboitements_IRIS"
DEPARTEMENTS_HORS_METROPOLE = ('971', '972', '973', '974', '976')


def _cmd_parser():
    parser = argparse.ArgumentParser(usage="python {}".format(__file__),
                                     allow_abbrev=False,
                                     description="Vérifie les données IRIS IGN et Insee.")
    parser.add_argument("--ign", type=Path, required=True, help="Fichier shapefile IRIS de l'IGN")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--insee", type=Path, help="Fichier Excel IRIS de l'Insee")
    group.add_argument("--export-qgis", type=Path, help="Fichier CSV d'export QGIS des IRIS")
    return parser


def lire_fichier_ign(fpath):
    """Retourne les données du fichier shapefile IGN

    Vérifie aussi le nom des champs et le système de projection.

    Parameters
    ----------
    fpath : Path
        Chemin du fichier shapefile

    Returns
    -------
    pd.DataFrame
    """
    logger.info("lecture du fichier shapefile IGN")
    with fiona.open(fpath) as reader:
        properties = reader.meta["schema"]["properties"]
        srid = reader.meta["crs"]["init"]
        # on vérifie que le nom des champs sont conformes
        if tuple(properties.keys()) != IGN_FIELDS:
            logger.error("Les champs IGN ont changé.")
            logger.info("Champs IGN demandés : %s", IGN_FIELDS)
            logger.info("Champs IGN trouvés : %s", tuple(properties.keys()))
            sys.exit(1)

        # on vérifie que le système de projection est lambert 93
        if srid != IGN_SRID:
            logger.error("Le système de projection devrait être '%s' et non '%s'", IGN_SRID, srid)
            sys.exit(1)

        data = [row["properties"] for row in reader]
        return pd.DataFrame(data)


def lire_fichier_insee(fpath):
    """Retourne les données IRIS de l'Insee

    Parameters
    ----------
    fpath : Path
        Chemin du fichier Excel

    Returns
    -------
    pd.DataFrame
    """
    logger.info("lecture du fichier Excel Insee")
    data = pd.read_excel(fpath, sheet_name=INSEE_SHEETNAME, skiprows=5)
    if tuple(data.columns) != INSEE_FIELDS:
        logger.error("Les champs Insee ont changé")
        logger.info("Champs Insee demandés : %s", INSEE_FIELDS)
        logger.info("Champs Insee trouvés : %s", tuple(data.columns))
        sys.exit(1)
    return data


def lire_fichier_csv_qgis(fpath):
    """Retourne les données IRIS de l'export QGIS CSV

    Parameters
    ----------
    fpath : Path
        Chemin du fichier CSV

    Returns
    -------
    pd.DataFrame
    """
    logger.info("lecture du fichier CSV export QGIS")
    data = pd.read_csv(fpath, dtype={"IRIS": str, "IRIST": str, "INSEE_COMMUNE": str})
    if tuple(data.columns) != QGIS_EXPORT_FIELDS:
        logger.error("Les champs QGIS export Insee ont changé")
        logger.info("Champs QGIS demandés : %s", QGIS_EXPORT_FIELDS)
        logger.info("Champs QGIS trouvés : %s", tuple(data.columns))
        sys.exit(1)
    return data


def check_unicite(data, field):
    """Vérifie l'unicité d'un champs.

    Parameters
    ----------
    data : pd.DataFrame
    field : str

    Returns
    -------
    bool
    """
    return len(data) == data[field].nunique()


def comparaison_iris(left, right, left_field="CODE_IRIS", right_field="CODE_IRIS"):
    """On compare les IRIS qui sont dans un dataset et pas dans l'autre dataset
    """
    left, right = set(left[left_field]), set(right[right_field])
    return left.difference(right)


def comparaison_avec_insee(fpath, data_ign):
    """On compare les données issues de l'IGN avec celles de l'Insee
    """
    data_insee = lire_fichier_insee(fpath)

    logger.info("vérification d'unicité des codes IRIS")
    if not check_unicite(data_ign, "CODE_IRIS"):
        raise ValueError("Les données CODE_IRIS ne sont pas uniques dans la donnée IGN")
    if not check_unicite(data_insee, "CODE_IRIS"):
        raise ValueError("Les données CODE_IRIS ne sont pas uniques dans la donnée Insee")

    logger.info("Vérification des codes IRIS dans Insee & IGN")
    diff_insee_ign = comparaison_iris(data_insee, data_ign)
    if len(diff_insee_ign):
        logger.warning("Il y a des codes IRIS qui sont dans Insee mais pas dans IGN")
        # cas particulier de l'Insee qui peut avoir des IRIS dans les départements outre-mer.
        sample = data_insee[data_insee["CODE_IRIS"].isin(diff_insee_ign)]
        departement = sample["DEP"].unique()
        departement.sort()
        if tuple(departement) == DEPARTEMENTS_HORS_METROPOLE:
            logger.info("Différences d'IRIS entre Insee et IGN seulement dans les départements hors métropole")
        else:
            logger.error("Différences d'IRIS entre Insee et IGN même en métropole")
            logger.error("Il y en a %s", len(diff_insee_ign))
            with open("check_iris_insee_ign.csv", "w") as fobj:
                sample.to_csv(fobj, index=False)
            logger.info("Voir fichier 'check_iris_insee_ign.csv' avec l'ensemble des IRIS différents")
            sys.exit(1)

    diff_ign_insee = comparaison_iris(data_ign, data_insee)
    if len(diff_ign_insee):
        logger.error("Il y a des codes IRIS qui sont dans IGN mais pas dans Insee")
        logger.error("Il y en a %s", len(diff_ign_insee))
        sample = data_ign[data_ign["CODE_IRIS"].isin(diff_ign_insee)]
        with open("check_iris_ign_insee.csv", "w") as fobj:
            sample.to_csv(fobj, index=False)
        logger.info("Voir fichier 'check_iris_insee_ign.csv' avec l'ensemble des IRIS différents")
        sys.exit(1)

    logger.info("Vérification OK !")
    return {"ign": data_ign, "insee": data_insee}


def comparaison_avec_export_qgis(fpath, data_ign):
    """On compare les données issues de l'IGN avec celles issues de l'export QGIS CSV
    """
    data_qgis = lire_fichier_csv_qgis(fpath)

    logger.info("vérification d'unicité des codes IRIS")
    if not check_unicite(data_ign, "CODE_IRIS"):
        raise ValueError("Les données CODE_IRIS ne sont pas uniques dans la donnée IGN")
    if not check_unicite(data_qgis, "IRIST"):
        raise ValueError("Les données CODE_IRIS ne sont pas uniques dans la donnée Insee")

    logger.info("Vérification des codes IRIS dans QGIS export CSV & IGN")
    diff_qgis_ign = comparaison_iris(data_qgis, data_ign, "IRIST", "CODE_IRIS")
    if len(diff_qgis_ign):
        logger.warning("Il y a des codes IRIS qui sont dans export QGIS CSV mais pas dans IGN")
        # cas particulier on peut avoir des IRIS dans les départements outre-mer.
        sample = data_qgis[data_qgis["IRIST"].isin(diff_qgis_ign)]
        communes = sample["INSEE_COMMUNE"].unique().tolist()
        communes.sort()
        if all(x.startswith('97') for x in communes):
            logger.info("Différences d'IRIS entre export QGIS CSV et IGN seulement dans les communes hors métropole")
        else:
            logger.error("Différences d'IRIS entre export QGIS CSV et IGN même en métropole")
            logger.error("Il y en a %s", len(diff_qgis_ign))
            with open("check_iris_qgis_export_ign.csv", "w") as fobj:
                sample.to_csv(fobj, index=False)
        logger.info("Voir fichier 'check_iris_qgis_export_ign.csv' avec l'ensemble des IRIS différents")
        sys.exit(1)

    diff_ign_qgis = comparaison_iris(data_ign, data_qgis, "CODE_IRIS", "IRIST")
    if len(diff_ign_qgis):
        logger.error("Il y a des codes IRIS qui sont dans IGN mais pas dans export QGIS CSV")
        logger.error("Il y en a %s", len(diff_ign_qgis))
        sample = data_ign[data_ign["CODE_IRIS"].isin(diff_ign_qgis)]
        with open("check_iris_ign_qgis_export.csv", "w") as fobj:
            sample.to_csv(fobj, index=False)
        logger.info("Voir fichier 'check_iris_qgis_export_ign.csv' avec l'ensemble des IRIS différents")
        sys.exit(1)

    logger.info("Vérification OK !")
    return {"ign": data_ign, "qgis": data_qgis}


def main(args):
    parser = _cmd_parser()
    opt = parser.parse_args(args)
    # on vérifie les fichiers
    logger.info("vérification des fichiers")
    if not opt.ign.is_file():
        logger.error("Aucun fichier IGN '%s'", opt.ign)
        parser.exit()
    fichier_a_comparer = opt.insee or opt.export_qgis
    if not fichier_a_comparer.is_file():
        logger.error("Aucun fichier Insee ou export QGIS '%s' à comparer", fichier_a_comparer)
        parser.exit()
    if opt.ign.suffix.lower() != ".shp":
        logger.error("Fichier IGN '%s' doit être un fichier shapefile", opt.ign)
        parser.exit()
    if opt.insee and opt.insee.suffix.lower() not in (".xls", ".xlsx"):
        logger.error("Fichier Insee '%s' doit être un fichier Excel", opt.insee)
        parser.exit()
    if opt.export_qgis and opt.export_qgis.suffix.lower() != ".csv":
        logger.error("Fichier export QGIS '%s' doit être un fichier CSV", opt.export_qgis)
        parser.exit()

    # lecture des données IGN et Insee
    data_ign = lire_fichier_ign(opt.ign)

    if opt.insee:
        result = comparaison_avec_insee(opt.insee, data_ign)
    elif opt.export_qgis:
        result = comparaison_avec_export_qgis(opt.export_qgis, data_ign)

    return result

if __name__ == '__main__':
    result = main(sys.argv[1:])
    ign = result["ign"]
    if "insee" in result:
        insee = result["insee"]
    if "qgis" in result:
        qgis = result["qgis"]
