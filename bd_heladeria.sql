# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: bd_heladeria
# ------------------------------------------------------
# Server version 5.6.11

#
# Source for table detalle_pedido
#

CREATE TABLE `detalle_pedido` (
  `Id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `Id_pedido` int(11) DEFAULT NULL,
  `Id_producto` int(11) DEFAULT NULL,
  `Precio_pedido` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`Id_detalle_pedido`),
  KEY `PEDDET` (`Id_pedido`),
  KEY `Id_producto` (`Id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Dumping data for table detalle_pedido
#

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,NULL,NULL);
INSERT INTO `detalle_pedido` VALUES (2,2,NULL,NULL);
INSERT INTO `detalle_pedido` VALUES (3,3,NULL,NULL);
INSERT INTO `detalle_pedido` VALUES (4,4,NULL,NULL);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table ingredientes
#

CREATE TABLE `ingredientes` (
  `Id_ingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_ingrediente` varchar(150) DEFAULT NULL,
  `Precio_ingrediente` double(11,2) DEFAULT NULL,
  `Estado_ingrediente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

#
# Dumping data for table ingredientes
#

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'Chocolate',5,'Disponible');
INSERT INTO `ingredientes` VALUES (2,'Vainilla',9,'Disponible');
INSERT INTO `ingredientes` VALUES (3,'Fresa',4.5,'Disponible');
INSERT INTO `ingredientes` VALUES (4,'Menta',5,'Disponible');
INSERT INTO `ingredientes` VALUES (5,'Plátano',4.2,'Disponible');
INSERT INTO `ingredientes` VALUES (6,'Caramelo',4.6,'Disponible');
INSERT INTO `ingredientes` VALUES (7,'Avellana',5.5,'Disponible');
INSERT INTO `ingredientes` VALUES (8,'Café',5,'Disponible');
INSERT INTO `ingredientes` VALUES (9,'Mango',4.8,'Disponible');
INSERT INTO `ingredientes` VALUES (10,'Piña',4.5,'Disponible');
INSERT INTO `ingredientes` VALUES (11,'Nuez',5.3,'Disponible');
INSERT INTO `ingredientes` VALUES (12,'Limón',4,'Disponible');
INSERT INTO `ingredientes` VALUES (13,'Mora',4.6,'Disponible');
INSERT INTO `ingredientes` VALUES (14,'Mandarina',4.5,'Disponible');
INSERT INTO `ingredientes` VALUES (15,'Melocotón',4.8,'Disponible');
INSERT INTO `ingredientes` VALUES (16,'Coco',5.2,'Disponible');
INSERT INTO `ingredientes` VALUES (17,'Arándano',4.6,'Disponible');
INSERT INTO `ingredientes` VALUES (18,'Frutos Rojos',5,'Disponible');
INSERT INTO `ingredientes` VALUES (19,'Pistacho',5.3,'Disponible');
INSERT INTO `ingredientes` VALUES (20,'Manzana',4.5,'Disponible');
INSERT INTO `ingredientes` VALUES (21,'Maracuyá',4.8,'Disponible');
INSERT INTO `ingredientes` VALUES (22,'Naranja',4,'Disponible');
INSERT INTO `ingredientes` VALUES (23,'Sandía',4.6,'Disponible');
INSERT INTO `ingredientes` VALUES (24,'Kiwi',4.5,'Disponible');
INSERT INTO `ingredientes` VALUES (25,'Uva',4.8,'Disponible');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table pedidos
#

CREATE TABLE `pedidos` (
  `Id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `Id_usuario` int(11) DEFAULT NULL,
  `Razon_social` varchar(150) DEFAULT NULL,
  `Nit_factura` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Estado_pedido` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`Id_pedido`),
  KEY `PEDUSU` (`Id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Dumping data for table pedidos
#

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'WENDY',123,'2023-06-28','Pendiente');
INSERT INTO `pedidos` VALUES (2,1,'WENDY',1234,'2023-06-28','Pendiente');
INSERT INTO `pedidos` VALUES (3,1,'BRAYAN',12345,'2023-06-28','Pendiente');
INSERT INTO `pedidos` VALUES (4,1,'EMERGENTES',9947416,'2023-06-28','Pendiente');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table productos
#

CREATE TABLE `productos` (
  `Id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_producto` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `Dir_imagen` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Precio` double(11,2) DEFAULT NULL,
  `Descripcion` text CHARACTER SET latin1,
  `Cod_capa1` int(11) DEFAULT NULL,
  `Cod_capa2` int(11) DEFAULT NULL,
  `Cod_capa3` int(11) DEFAULT NULL,
  `Cod_jalea1` int(11) DEFAULT NULL,
  `Cod_jalea2` int(11) DEFAULT NULL,
  `Cod_jalea3` int(11) DEFAULT NULL,
  `Cod_chispas1` int(11) DEFAULT NULL,
  `Cod_chispas2` int(11) DEFAULT NULL,
  `Estado_producto` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`Id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

#
# Dumping data for table productos
#

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,'Cono a la Wendy','Cono a la Wendy.jpg',20,'Helado de 2 copos de helado crema sabor Vainilla con jalea de chocolate y chispas de colores.',2,0,0,6,0,0,16,0,'Disponible');
INSERT INTO `productos` VALUES (4,'betterbricleice cream','crema de betterbri.jpg',25.5,'helado de crema de betterbri',16,0,0,6,6,0,10,0,'Disponible');
INSERT INTO `productos` VALUES (5,'galletas & crema de helado ','galletas & crema.jpg',35,'crema de helado con galletas',2,0,0,13,0,0,1,0,'Disponible');
INSERT INTO `productos` VALUES (6,'helado brownie','helado de brownie.jpg',38,'helado de brownie',1,16,0,23,0,0,1,0,'Disponible');
INSERT INTO `productos` VALUES (7,'Helado de Menta de Galletas','Helado de Menta de Galletas.jpg',18.5,'Helado de Menta con Galletas de vainilla',4,4,0,6,0,0,0,0,'Disponible');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table usuarios
#

CREATE TABLE `usuarios` (
  `Id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Usuario` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `Password` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `Tipo_usuario` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`Id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

#
# Dumping data for table usuarios
#

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin','40bd001563085fc35165329ea1ff5c5ecbdbbeef','admin');
INSERT INTO `usuarios` VALUES (2,'Brayan','bray','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','oper');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table detalle_pedido
#

ALTER TABLE `detalle_pedido`
ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`),
ADD CONSTRAINT `PEDDET` FOREIGN KEY (`Id_pedido`) REFERENCES `pedidos` (`Id_pedido`);

#
#  Foreign keys for table pedidos
#

ALTER TABLE `pedidos`
ADD CONSTRAINT `PEDUSU` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`Id_usuario`);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
