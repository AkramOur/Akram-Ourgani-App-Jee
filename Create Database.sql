SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DBbiblio`
--
CREATE DATABASE IF NOT EXISTS `DBbiblio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `DBbiblio`;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id`, `catName`) VALUES
(12, 'Chimie'),
(10, 'Informatique'),
(11, 'physique');

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `email`, `password`) VALUES
(11, 'Ourgani', 'Akram', 'ourgani.akram@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `id` int(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `idCat` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`id`, `titre`, `auteur`, `idCat`) VALUES
(15, 'Programmation Python avancee', 'Xavier Olive', 10),
(16, 'Chaos: Making a New Science', 'James Gleick', 11),
(17, 'Cours de chimie organique', 'Paul Arnaud', 12),
(18, 'Algorithms For Dummies', 'John Mueller', 10),
(19, 'HTML  XHTML and CSS for Dummies', 'Jeff Noble', 10),
(20, 'The Order of Time', 'Carlo Rovelli', 11),
(21, '50 Physics Ideas You Really Need to Know', 'Joanne Baker', 11),
(22, 'Analyse chimique', 'Francis Rouessac', 12),
(23, 'Pericyclic Reactions', 'Ian Fleming', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catName` (`catName`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rel` (`idCat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `rel` FOREIGN KEY (`idCat`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
