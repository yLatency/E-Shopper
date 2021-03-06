---------------------------------------------------------------------------------
---------------  Tables  MICROSERVICE ORDER  ------------------------------------
---------------------------------------------------------------------------------

CREATE TABLE `status_order` (
  `ID_STATUS` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `status_order` WRITE;
INSERT INTO `status_order` VALUES (1,'OPEN'),(2,'CLOSED'),(3,'CANCELLED'),(4,'ARCHIVED'),(5,'SEND');
UNLOCK TABLES;

CREATE TABLE `order` (
  `ID_ORDER` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) NOT NULL,
  `TOT_PRICE` decimal(10,2) DEFAULT NULL,
  `ID_STATUS` int(11) DEFAULT NULL,
  `ID_ACCOUNT` varchar(45) DEFAULT NULL,
  `ID_ADDRESS` int(11) DEFAULT NULL,
  `ID_PAYMENT` int(11) DEFAULT NULL,
  `ID_GIFT` int(11) DEFAULT NULL,
  `NOTE` varchar(1039) DEFAULT NULL,
  `INSERT_DATE` date DEFAULT NULL,
  `MODIFY_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER`),
  UNIQUE KEY `CODE_UNIQUE` (`CODE`),
  KEY `ID_STATUS_idx` (`ID_STATUS`),
  CONSTRAINT `ID_STATUS` FOREIGN KEY (`ID_STATUS`) REFERENCES `status_order` (`ID_STATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `rel_cart_order` (
  `ID_REL` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ORDER` int(11) DEFAULT NULL,
  `ID_CART` int(11) DEFAULT NULL,
  `INSERT_DATE` date DEFAULT NULL,
  `MODIFY_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID_REL`),
  KEY `ID_ORDER_REL_idx` (`ID_ORDER`),
  CONSTRAINT `ID_ORDER_REL` FOREIGN KEY (`ID_ORDER`) REFERENCES `order` (`ID_ORDER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `history_order` (
  `ID_HISTORY` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ORDER` int(11) DEFAULT NULL,
  `ID_STATUS` int(11) DEFAULT NULL,
  `STATUS_DATE` date DEFAULT NULL,
  `INSERT_DATE` date DEFAULT NULL,
  `MODIFY_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_HISTORY`),
  KEY `ID_ORDER_idx` (`ID_ORDER`),
  CONSTRAINT `ID_ORDER` FOREIGN KEY (`ID_ORDER`) REFERENCES `order` (`ID_ORDER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;