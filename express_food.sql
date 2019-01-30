-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 05 Septembre 2017 à 23:33
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(10) UNSIGNED NOT NULL,
  `rue` varchar(45) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `code_postal` char(5) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `zone_id` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`id`, `rue`, `ville`, `code_postal`, `client_id`, `zone_id`) VALUES
(1, '18 Rue des Abbesses', 'Paris', '75018', 1, 2),
(2, '7 Pont des Arts', 'Paris', '75001', 1, 1),
(3, '3 Boulevard de Belleville', 'Paris', '75011', 2, 3),
(4, '14Rue d\'Alésia', 'Paris', '75014', 3, 4),
(5, 'Rue Alfred-Dehodencq', 'Paris', '75016', 4, 5),
(6, '1 bis Rue Jean-Dollfus', 'Paris', '75018', 6, 2),
(7, '85 Rue Montorgueil', 'Paris', '75002', 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `balise_gps`
--

CREATE TABLE `balise_gps` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `reference` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `catalogue`
--

CREATE TABLE `catalogue` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `quantite` smallint(5) UNSIGNED DEFAULT NULL,
  `produit_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `catalogue`
--

INSERT INTO `catalogue` (`id`, `date`, `quantite`, `produit_id`) VALUES
(1, '2017-09-04', 7, 1),
(2, '2017-09-04', 12, 2),
(3, '2017-09-04', 7, 3),
(4, '2017-09-04', 8, 4),
(5, '2017-09-05', 12, 5),
(6, '2017-09-05', 3, 6),
(7, '2017-09-05', 9, 7),
(8, '2017-09-05', 12, 8),
(9, '2017-09-06', 48, 9),
(10, '2017-09-06', 49, 10),
(11, '2017-09-06', 49, 11),
(12, '2017-09-06', 48, 12),
(13, '2017-09-07', NULL, 13),
(14, '2017-09-07', NULL, 14),
(15, '2017-09-07', NULL, 15),
(16, '2017-09-07', NULL, 16);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_inscription` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `telephone` char(10) DEFAULT NULL,
  `utilisateur_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id`, `date_inscription`, `email`, `telephone`, `utilisateur_id`) VALUES
(1, '2017-08-03', 'mi.enim.condimentum@dictumeu.edu', '0416349375', 4),
(2, '2017-08-03', 'eros@commodo.net', '0166712483', 5),
(3, '2017-07-24', 'dignissim@pharetrafeliseget.ca', NULL, 6),
(4, '2017-08-26', 'pellentesque.a@quam.org', '0650479796', 8),
(5, '2017-06-14', 'parturient.montes@eu.net', NULL, 9),
(6, '2017-08-25', 'quis.pede@magna.com', '0647929122', 10);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL,
  `statut` enum('en attente','en cours de livraison','livrée') NOT NULL,
  `numero` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id`, `date`, `statut`, `numero`, `client_id`) VALUES
(1, '2017-09-04 10:27:50', 'livrée', 1693061761, 1),
(2, '2017-09-06 11:12:35', 'livrée', 1658101032, 3),
(3, '2017-09-06 11:25:44', 'en cours de livraison', 1656121784, 4);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `commande_id` int(10) UNSIGNED NOT NULL,
  `produit_id` int(10) UNSIGNED NOT NULL,
  `quantite` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`commande_id`, `produit_id`, `quantite`) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 9, 2),
(2, 11, 1),
(2, 12, 1),
(3, 10, 1),
(3, 12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL,
  `numero_facture` int(10) UNSIGNED NOT NULL,
  `commande_id` int(10) UNSIGNED NOT NULL,
  `adresse_id` int(10) UNSIGNED NOT NULL,
  `livreur_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livraison`
--

INSERT INTO `livraison` (`id`, `date`, `numero_facture`, `commande_id`, `adresse_id`, `livreur_id`) VALUES
(1, '2017-09-04 10:40:32', 16920415, 1, 2, 1),
(2, '2017-09-06 11:31:24', 16600924, 2, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `id` int(10) UNSIGNED NOT NULL,
  `statut` enum('indisponible','disponible','en cours de livraison') NOT NULL DEFAULT 'indisponible',
  `position` varchar(22) DEFAULT NULL,
  `utilisateur_id` int(10) UNSIGNED NOT NULL,
  `zone_id` tinyint(1) UNSIGNED NOT NULL,
  `velo_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `sac_isotherme_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `balise_gps_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livreur`
--

INSERT INTO `livreur` (`id`, `statut`, `position`, `utilisateur_id`, `zone_id`, `velo_id`, `sac_isotherme_id`, `balise_gps_id`) VALUES
(1, 'disponible', '19.19144, -106.74976', 3, 4, NULL, NULL, NULL),
(2, 'en cours de livraison', '-19.5095, 103.5388', 7, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL,
  `sujet` varchar(45) NOT NULL,
  `contenu` longtext NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `client_id` int(10) UNSIGNED NOT NULL,
  `produits_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `quantite` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `panier`
--

INSERT INTO `panier` (`client_id`, `produits_id`, `date`, `quantite`) VALUES
(1, 1, '2017-08-05', 2),
(1, 3, '2017-08-05', 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('plat','dessert') NOT NULL,
  `reference` varchar(45) NOT NULL,
  `nom` varchar(128) NOT NULL,
  `descriptif` longtext,
  `prix_unitaire_ht` decimal(4,2) NOT NULL,
  `tx_tva` decimal(6,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `type`, `reference`, `nom`, `descriptif`, `prix_unitaire_ht`, `tx_tva`) VALUES
(1, 'plat', '16390218-9160', 'Escalope de dinde-pommes de terre-compote', NULL, '14.75', '20.0000'),
(2, 'plat', '16800720-3683', 'Pain de viande-Purée-Petits pois', NULL, '17.75', '20.0000'),
(3, 'dessert', '16640518-2616', 'Fondant au chocolat', NULL, '8.35', '20.0000'),
(4, 'dessert', '16850811-1005', 'Tarte au citron meringuée', NULL, '9.90', '20.0000'),
(5, 'plat', '16800727-2803', 'Quiche Lorraine', NULL, '18.75', '20.0000'),
(6, 'plat', '16070418-5958', 'Rösti - Escalopes milanaises - Légumes surgelés', NULL, '17.60', '20.0000'),
(7, 'dessert', '16500507-0247', 'Tiramisu', NULL, '8.10', '20.0000'),
(8, 'dessert', '16090710-9037', 'Muffins', NULL, '6.30', '20.0000'),
(9, 'plat', '16950419-4789', 'Couscous', NULL, '19.25', '20.0000'),
(10, 'plat', '16150325-8996', 'Salade de riz aux haricots rouges et au thon', NULL, '15.45', '20.0000'),
(11, 'dessert', '16210514-2588', 'Tarte normande', NULL, '5.65', '20.0000'),
(12, 'dessert', '16700526-1370', 'Crumble', NULL, '3.25', '20.0000'),
(13, 'plat', '16780307-5865', 'Saucisses de volaille-pommes de terre-brocoli ', NULL, '17.35', '20.0000'),
(14, 'plat', '16600607-7595', 'Mijoté de boeuf léger aux petits pois et aux carottes', NULL, '16.15', '20.0000'),
(15, 'dessert', '16170526-5583', 'Roulé à la fraise', NULL, '5.85', '20.0000'),
(16, 'dessert', '16230601-5526', 'Pannacotta', NULL, '8.60', '20.0000');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `nom` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `nom`) VALUES
(1, 'administrateur'),
(4, 'client'),
(3, 'livreur'),
(2, 'service client');

-- --------------------------------------------------------

--
-- Structure de la table `sac_isotherme`
--

CREATE TABLE `sac_isotherme` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `reference` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sac_livreur`
--

CREATE TABLE `sac_livreur` (
  `livreur_id` int(10) UNSIGNED NOT NULL,
  `produit_id` int(10) UNSIGNED NOT NULL,
  `quantite` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sac_livreur`
--

INSERT INTO `sac_livreur` (`livreur_id`, `produit_id`, `quantite`) VALUES
(1, 9, 25),
(1, 10, 25),
(1, 11, 25),
(1, 12, 25),
(2, 9, 25),
(2, 10, 25),
(2, 11, 25),
(2, 12, 25);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantite` smallint(5) UNSIGNED NOT NULL,
  `produit_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `stock`
--

INSERT INTO `stock` (`id`, `quantite`, `produit_id`) VALUES
(1, 48, 9),
(2, 49, 10),
(3, 50, 11),
(4, 50, 12);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom_utilisateur` varchar(45) NOT NULL,
  `mot_de_passe` varchar(45) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `sexe` enum('M','F') NOT NULL,
  `role_id` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom_utilisateur`, `mot_de_passe`, `nom`, `prenom`, `sexe`, `role_id`) VALUES
(1, 'romain.rolland', 'SAP01OGW7WG', 'Rolland', 'Romain', 'M', 1),
(2, 'leane.chevalier', 'IYI11ZAA5IK', 'Chevalier', 'Léane', 'F', 2),
(3, 'chloe.guerin', 'KRI37PXR4PC', 'Guerin', 'Chloé', 'F', 3),
(4, 'elena.clement', 'ODA83IYS3BW', 'Clement', 'Éléna', 'F', 4),
(5, 'renaud.bouvier', 'UVM18FTZ7BT', 'Bouvier', 'Renaud', 'M', 4),
(6, 'noemie.michel', 'WYL46EAP3CY', 'Michel', 'Noémie', 'F', 4),
(7, 'elouan.louis', 'ZAS77JZY9DD', 'Louis', 'Élouan', 'M', 3),
(8, 'tatiana.roger', 'XJD35EHY7LQ', 'Roger', 'Tatiana', 'F', 4),
(9, 'juliette.pereira', 'NRW80BKQ8UO', 'Pereira', 'Juliette', 'F', 4),
(10, 'timothee.masson', 'WRJ10XOS6IM', 'Masson', 'Timothée', 'M', 4);

-- --------------------------------------------------------

--
-- Structure de la table `velo`
--

CREATE TABLE `velo` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `reference` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE `zone` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `nom` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `zone`
--

INSERT INTO `zone` (`id`, `nom`) VALUES
(1, 'CENTRE'),
(3, 'EST'),
(2, 'NORD'),
(5, 'OUEST'),
(4, 'SUD');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_adresse_client1_idx` (`client_id`),
  ADD KEY `fk_adresse_zone1_idx` (`zone_id`);

--
-- Index pour la table `balise_gps`
--
ALTER TABLE `balise_gps`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `catalogue`
--
ALTER TABLE `catalogue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stock_produit1_idx` (`produit_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `telephone_UNIQUE` (`telephone`),
  ADD KEY `fk_client_utilisateur1_idx` (`utilisateur_id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_UNIQUE` (`numero`),
  ADD KEY `fk_commande_client1_idx` (`client_id`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`commande_id`,`produit_id`),
  ADD KEY `fk_commande_has_produit_produit1_idx` (`produit_id`),
  ADD KEY `fk_commande_has_produit_commande1_idx` (`commande_id`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_facture_UNIQUE` (`numero_facture`),
  ADD KEY `fk_livraison_commande1_idx` (`commande_id`),
  ADD KEY `fk_livraison_livreur1_idx` (`livreur_id`),
  ADD KEY `fk_livraison_adresse1_idx` (`adresse_id`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_livreur_utilisateur1_idx` (`utilisateur_id`),
  ADD KEY `fk_livreur_zone1_idx` (`zone_id`),
  ADD KEY `fk_livreur_velo1_idx` (`velo_id`),
  ADD KEY `fk_livreur_sac_isotherme1_idx` (`sac_isotherme_id`),
  ADD KEY `fk_livreur_balise_gps1_idx` (`balise_gps_id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_message_client1_idx` (`client_id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`client_id`,`produits_id`),
  ADD KEY `fk_client_has_produits_produits1_idx` (`produits_id`),
  ADD KEY `fk_client_has_produits_client1_idx` (`client_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference_UNIQUE` (`reference`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_UNIQUE` (`nom`);

--
-- Index pour la table `sac_isotherme`
--
ALTER TABLE `sac_isotherme`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sac_livreur`
--
ALTER TABLE `sac_livreur`
  ADD PRIMARY KEY (`livreur_id`,`produit_id`),
  ADD KEY `fk_livreur_has_produit_produit1_idx` (`produit_id`),
  ADD KEY `fk_livreur_has_produit_livreur1_idx` (`livreur_id`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stock_produit1_idx` (`produit_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_utilsateur_UNIQUE` (`nom_utilisateur`),
  ADD KEY `fk_utilisateur_role1_idx` (`role_id`);

--
-- Index pour la table `velo`
--
ALTER TABLE `velo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_UNIQUE` (`nom`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `balise_gps`
--
ALTER TABLE `balise_gps`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `catalogue`
--
ALTER TABLE `catalogue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `sac_isotherme`
--
ALTER TABLE `sac_isotherme`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `velo`
--
ALTER TABLE `velo`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_adresse_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_adresse_zone1` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `catalogue`
--
ALTER TABLE `catalogue`
  ADD CONSTRAINT `fk_stock_produit10` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_commande_has_produit_commande1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_has_produit_produit1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `fk_livraison_adresse1` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livraison_commande1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livraison_livreur1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_balise_gps1` FOREIGN KEY (`balise_gps_id`) REFERENCES `balise_gps` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_sac_isotherme1` FOREIGN KEY (`sac_isotherme_id`) REFERENCES `sac_isotherme` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_velo1` FOREIGN KEY (`velo_id`) REFERENCES `velo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_zone1` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `fk_client_has_produits_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_has_produits_produits1` FOREIGN KEY (`produits_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sac_livreur`
--
ALTER TABLE `sac_livreur`
  ADD CONSTRAINT `fk_livreur_has_produit_livreur1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_has_produit_produit1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_produit1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
