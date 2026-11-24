CREATE DATABASE  IF NOT EXISTS `catalogo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `catalogo`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: catalogo
-- ------------------------------------------------------
-- Server version	8.4.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Celulares'),(2,'Computadores'),(3,'Audífonos'),(4,'Teclados'),(5,'Mouse'),(6,'Tabletas'),(7,'Accesorios');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `imagen_url` varchar(255) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (21,'Samsung Galaxy A54','Smartphone de 128 GB con pantalla AMOLED de 6.4\"',1399000.00,15,NULL,1),(22,'iPhone 18','Smartphone de 128 GB con chip A15 Bionic',2799000.00,8,NULL,1),(23,'Xiaomi Redmi Note 15','Smartphone de 128 GB con cámara de 50 MP',799000.00,20,NULL,1),(24,'Motorola Moto G54','Smartphone de 256 GB con batería de 5000 mAh',749000.00,18,NULL,1),(25,'Lenovo IdeaPad 3','Portátil de 15.6\" con Ryzen 5 y 8 GB de RAM',2199000.00,10,NULL,2),(26,'HP 15','Portátil de 15.6\" con Intel Core i5 y SSD de 512 GB',2499000.00,7,NULL,2),(27,'Asus VivoBook 14','Portátil de 14\" con Intel Core i5 y 16 GB de RAM',2899000.00,6,NULL,2),(28,'Sony WH-CH520','Audífonos inalámbricos Bluetooth con 50 h de batería',199000.00,25,NULL,3),(29,'JBL Tune 510BT','Audífonos Bluetooth tipo diadema con graves potentes',179000.00,30,NULL,3),(30,'Xiaomi Redmi Buds 4','Audífonos inalámbricos con cancelación de ruido',129000.00,22,NULL,3),(31,'Logitech K380','Teclado inalámbrico compacto multidispositivo',150000.00,20,NULL,4),(32,'Redragon Kumara','Teclado mecánico gamer con iluminación RGB',189000.00,14,NULL,4),(33,'Logitech M170','Mouse inalámbrico de 2.4 GHz',55000.00,40,NULL,5),(34,'Redragon Cobra','Mouse gamer RGB de 12400 DPI',99000.00,16,NULL,5),(35,'Samsung Galaxy Tab A9','Tableta de 8.7\" con 64 GB de almacenamiento',699000.00,12,NULL,6),(36,'iPad 9.ª generación','Tableta de 10.2\" con 64 GB y chip A13',1799000.00,9,NULL,6),(37,'Lenovo Tab M10','Tableta de 10.1\" con 128 GB y pantalla HD',849000.00,11,NULL,6),(38,'Cargador USB-C 20W','Cargador rápido compatible con celulares y tabletas',49000.00,50,NULL,7),(39,'Power Bank Xiaomi 10000 mAh','Batería portátil con carga rápida',89000.00,35,NULL,7),(40,'Memoria USB Kingston 64 GB','Memoria USB 3.2 de alta velocidad',39000.00,45,NULL,7);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-24 16:34:26
