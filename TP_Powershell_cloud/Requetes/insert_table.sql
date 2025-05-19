INSERT INTO VELIB (
    identifiant_station,
    nom_station,
    station_en_fonctionnement,
    nombre_bornettes_libres,
    nombre_total_velos_disponibles,
    velos_mecaniques_disponibles,
    velos_electriques_disponibles,
    capacite_station,
    borne_paiement_disponible,
    retour_velib_possible,
    actualisation_donnee,
    coordonnees_geographiques,
    nom_communes_equipees
)


SELECT
    40001, 'Hôpital Mondor', TRUE, 17, 11, 3, 8, 28, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:14:41'), TO_GEOGRAPHY('POINT(2.4537451531298 48.798922410229)'), 'Créteil'
UNION ALL
SELECT
    16107, 'Benjamin Godard - Victor Hugo', TRUE, 33, 2, 2, 0, 35, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:12:24'), TO_GEOGRAPHY('POINT(2.275725 48.865983)'), 'Paris'
UNION ALL
SELECT
    14111, 'Cassini - Denfert-Rochereau', TRUE, 23, 2, 0, 2, 25, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:13:49'), TO_GEOGRAPHY('POINT(2.3360354080796 48.837525839067)'), 'Paris'
UNION ALL
SELECT
    44015, 'Rouget de L''isle - Watteau', TRUE, 10, 8, 2, 6, 20, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:13:27'), TO_GEOGRAPHY('POINT(2.3963020229163 48.778192750803)'), 'Vitry-sur-Seine'
UNION ALL
SELECT
    8026, 'Messine - Place Du Pérou', TRUE, 0, 11, 4, 7, 12, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:13:26'), TO_GEOGRAPHY('POINT(2.315508019010038 48.875448033960744)'), 'Paris'
UNION ALL
SELECT
    9020, 'Toudouze - Clauzel', TRUE, 17, 4, 0, 4, 21, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:14:02'), TO_GEOGRAPHY('POINT(2.3373600840568547 48.87929591733507)'), 'Paris'
UNION ALL
SELECT
    7002, 'Vaneau - Sèvres', TRUE, 11, 21, 18, 3, 35, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:11:45'), TO_GEOGRAPHY('POINT(2.3204218259346 48.848563233059)'), 'Paris'
UNION ALL
SELECT
    14014, 'Jourdan - Stade Charléty', TRUE, 55, 2, 0, 2, 60, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:12:05'), TO_GEOGRAPHY('POINT(2.3433353751898 48.819428333369)'), 'Paris'
UNION ALL
SELECT
    5110, 'Lacépède - Monge', TRUE, 6, 17, 5, 12, 23, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:14:29'), TO_GEOGRAPHY('POINT(2.3519663885235786 48.84389286531899)'), 'Paris'
UNION ALL
SELECT
    32017, 'Basilique', TRUE, 14, 8, 6, 2, 22, TRUE, TRUE, TO_TIMESTAMP('2025-05-19 11:14:21'), TO_GEOGRAPHY('POINT(2.3588666820200914 48.93626891059109)'), 'Saint-Denis';