CREATE OR REPLACE TABLE velib (
    identifiant_station INTEGER,
    nom_station STRING,
    station_en_fonctionnement BOOLEAN,
    nombre_bornettes_libres INTEGER,
    nombre_total_velos_disponibles INTEGER,
    velos_mecaniques_disponibles INTEGER,
    velos_electriques_disponibles INTEGER,
    capacite_station INTEGER,
    borne_paiement_disponible BOOLEAN,
    retour_velib_possible BOOLEAN,
    actualisation_donnee TIMESTAMP,
    coordonnees_geographiques GEOGRAPHY,
    nom_communes_equipees STRING

);