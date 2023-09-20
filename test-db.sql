-- -------------------------------------------------------------
-- TablePlus 5.4.0(504)
--
-- https://tableplus.com/
--
-- Database: test-db
-- Generation Time: 2023-09-19 23:37:42.4080
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `Companies`;
CREATE TABLE `Companies` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Company_Sells_Product`;
CREATE TABLE `Company_Sells_Product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Product_Id` int NOT NULL,
  `Company_Id` int NOT NULL,
  `Sale_Price` int NOT NULL,
  `Product_Active` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Product_Id` (`Product_Id`),
  KEY `Company_Id` (`Company_Id`),
  CONSTRAINT `company_sells_product_ibfk_1` FOREIGN KEY (`Product_Id`) REFERENCES `Products` (`id`),
  CONSTRAINT `company_sells_product_ibfk_2` FOREIGN KEY (`Company_Id`) REFERENCES `Companies` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Products`;
CREATE TABLE `Products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cost` int NOT NULL,
  `MSRP` int NOT NULL,
  `WholeSaler` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wholesealer` (`WholeSaler`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`WholeSaler`) REFERENCES `WholeSalers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `WholeSalers`;
CREATE TABLE `WholeSalers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Companies` (`Id`, `Name`, `Address`, `City`) VALUES
(1, 'Registry Connect', 'Suite 207, 236 91 Street SW', 'Calgary'),
(2, 'ABC Company', 'Suite 2 , 123 90 Street NW', 'Calgary');

INSERT INTO `Company_Sells_Product` (`id`, `Product_Id`, `Company_Id`, `Sale_Price`, `Product_Active`) VALUES
(1, 1, 1, 5000, 1),
(2, 1, 2, 12000, 1),
(4, 2, 1, 2000, 1),
(5, 2, 1, 3000, 1),
(6, 1, 1, 12000, 1),
(7, 3, 1, 9000, 1),
(8, 3, 1, 200, 1);

INSERT INTO `Products` (`id`, `Name`, `Description`, `Cost`, `MSRP`, `WholeSaler`) VALUES
(1, 'Product 1', 'Product 1 Description', 10000, 10000, 1),
(2, 'Another Product 2 ', 'Product 2 Description', 50000, 12000, 1),
(3, 'Extra Product 3', 'Product 3 Description', 30000, 20000, 1),
(4, 'Tiney Product 4', 'Product 4 Description', 190000, 10000, 2);

INSERT INTO `WholeSalers` (`Id`, `Name`, `Address`, `Contact`) VALUES
(1, 'Whole Saler 1', 'Address of Whole Saler 1', '+8254882545'),
(2, 'Whole Saler 2', 'Address of Whole Saler 2', '+8254662461');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;