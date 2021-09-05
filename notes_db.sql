-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: notes_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Cine','2020-10-01 03:00:00',NULL),(2,'Música','2021-09-05 18:12:04','2020-10-10 00:00:00'),(3,'Deporte','2020-10-01 03:00:00',NULL),(4,'Política','2020-10-01 03:00:00','2020-11-01 00:00:00'),(5,'Series','2020-10-10 03:00:00',NULL),(6,'Historia','2020-11-01 03:00:00','2020-11-15 00:00:00'),(7,'Idiomas','2020-10-01 03:00:00',NULL),(8,'Arte','2020-10-01 03:00:00',NULL),(9,'Tecnología','2021-09-05 18:12:04','2020-10-20 00:00:00'),(10,'Economía','2021-09-05 18:21:34',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_note`
--

DROP TABLE IF EXISTS `category_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_note` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `category_note_FK` FOREIGN KEY (`id`) REFERENCES `notes` (`id`),
  CONSTRAINT `category_note_FK_1` FOREIGN KEY (`id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_note`
--

LOCK TABLES `category_note` WRITE;
/*!40000 ALTER TABLE `category_note` DISABLE KEYS */;
INSERT INTO `category_note` VALUES (1,2,4),(2,2,10),(3,3,9),(4,5,9),(5,7,1),(6,7,8),(7,6,4),(8,9,9),(9,9,10),(10,10,3);
/*!40000 ALTER TABLE `category_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `description` text NOT NULL,
  `can_delete` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Donec lacinia porta nisi eget','2020-11-12 13:12:00',NULL,'Donec dapibus, ante id tempor dictum, velit nunc venenatis est, ut consequat justo nulla quis orci. Phasellus aliquam consequat commodo. Donec laoreet purus enim, varius fermentum orci pharetra quis. Ut tincidunt libero id lacus eleifend pharetra. Pellentesque eget ex suscipit, commodo turpis a, vestibulum ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam semper eleifend turpis, quis euismod elit luctus eget. Mauris augue velit, cursus sit amet auctor et, congue ac eros. Sed auctor id enim nec laoreet. Donec et varius arcu, a eleifend ante.\r\n\r\nSed ut consequat elit. Sed sit amet posuere velit. Praesent gravida non nunc eu pretium. Fusce non diam ac ipsum egestas gravida. Sed venenatis nisi venenatis sem blandit scelerisque quis non elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam sagittis scelerisque nisl, sed elementum augue iaculis vel. Pellentesque at viverra ante. Praesent ut enim commodo, sollicitudin ex a, gravida mauris. Maecenas eget elit quis neque mollis viverra. In vel nunc eu tellus condimentum pulvinar. Vivamus aliquam felis eget urna aliquam finibus. Aenean suscipit elit libero, id tempor ipsum tincidunt sed. Morbi in erat tincidunt, condimentum tortor posuere, viverra risus. Ut imperdiet gravida nulla in rutrum.',0,3),(2,'Class aptent taciti sociosqu ad litora torquent','2020-11-17 15:00:00',NULL,'Nulla feugiat ipsum in nulla dictum dignissim. Suspendisse potenti. Morbi quis orci sit amet augue mollis scelerisque sit amet sit amet felis. Nam pharetra sodales efficitur. Aenean a mollis lacus. Etiam imperdiet placerat mattis. Vivamus et est ac justo dignissim hendrerit at eget tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus eleifend convallis felis, id faucibus dui ultrices nec. Praesent in blandit nisi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras at massa ultricies, tincidunt purus vitae, dictum libero. Vivamus ac aliquet dolor. Nunc mattis purus ut nulla sagittis laoreet. Nulla egestas dapibus tortor vel commodo. Praesent mi nulla, sagittis ut pulvinar eu, congue sed lorem.\r\n\r\nDonec porta sapien ante, et sollicitudin dui accumsan ut. Mauris blandit ipsum eu gravida efficitur. Phasellus ac leo sit amet eros dapibus accumsan efficitur a arcu. Duis ex arcu, egestas ac dignissim vel, consectetur ut metus. Mauris volutpat sapien ac tortor porta, vitae lobortis elit fringilla. Fusce posuere in felis rhoncus consectetur. Fusce sodales placerat ullamcorper. In sodales elit nec dui malesuada efficitur. Etiam quis sem sit amet quam lacinia scelerisque. In ultrices tortor eu aliquam fringilla. Suspendisse blandit auctor elit, sit amet consectetur mauris. Curabitur vitae nibh eget risus euismod semper. Suspendisse nisi sapien, dapibus sed ullamcorper ac, porttitor a sem. Nunc tincidunt nisl vel consequat dictum. Phasellus tincidunt tellus sit amet ante sagittis feugiat non in arcu. Maecenas sagittis pharetra rhoncus.\r\n\r\nSed eleifend, velit ac semper congue, mauris nunc gravida risus, ac rhoncus augue lectus vel justo. Donec lobortis rutrum augue, at posuere enim tempor eget. Sed pellentesque sit amet magna sed lobortis. Ut sed mollis nunc. Nulla iaculis rhoncus lectus, sit amet tincidunt mi facilisis in. In bibendum leo at metus viverra condimentum. Proin ex urna, fermentum a interdum vitae, pretium sed ipsum. Aenean consectetur sagittis blandit. Pellentesque vel ex elementum, ultricies tellus nec, mollis diam. Morbi accumsan quis velit eu sollicitudin. Curabitur ultrices metus sit amet varius efficitur. Nulla facilisi. Ut vestibulum nibh in libero ornare interdum. Nam feugiat tempor nibh ut molestie. Duis scelerisque tincidunt est, vitae cursus justo condimentum vitae.',0,1),(3,'Vestibulum fringilla consequat placerat','2020-10-17 23:00:00','2020-10-19 10:00:00','Nam nec euismod leo, in facilisis metus. Integer dolor orci, sodales sed purus at, elementum rhoncus dui. Duis quis hendrerit justo. Suspendisse scelerisque varius tortor, nec porttitor lectus molestie ullamcorper. Nullam eros ex, tempor ut metus vitae, hendrerit ultrices est. Etiam varius leo turpis, vel elementum orci viverra non. Fusce iaculis ultricies metus molestie egestas. Morbi maximus ullamcorper ipsum id sagittis. Ut commodo libero nec odio venenatis varius. Nam quis turpis augue. Nunc quis lacus sit amet augue pharetra ultricies vel vel turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nVestibulum nec semper massa. Morbi feugiat nisi urna, quis vestibulum erat pharetra sed. Vestibulum vel eros consectetur, posuere purus quis, blandit turpis. Phasellus in erat et augue dictum ultrices vitae sit amet odio. Integer imperdiet vestibulum viverra. Nam sed quam in quam interdum suscipit ut nec libero. Vivamus eget leo in ante aliquet dignissim. Mauris vel egestas dolor. Aliquam elit neque, lacinia quis rutrum vulputate, sodales id tortor. Suspendisse vitae euismod arcu, quis mollis augue. Fusce ultrices ac purus efficitur consequat.\r\n\r\nNullam non lectus convallis, porttitor lorem a, mollis felis. Fusce sed convallis nulla, ac convallis nibh. Fusce eget metus id dui suscipit efficitur. Sed accumsan faucibus purus eu viverra. Nam imperdiet, turpis id feugiat tristique, turpis nisi interdum enim, nec feugiat est eros vitae massa. Donec finibus ante eget dolor lacinia, non vehicula erat pharetra. Cras in lobortis neque, sed accumsan ipsum.',1,2),(4,'Proin eu venenatis nibh. Sed vulputate','2020-10-15 21:10:00','2020-10-20 10:00:00','Vestibulum a ullamcorper massa. Donec in nisi egestas, pretium neque in, porttitor dolor. Praesent semper, ex in ultricies pellentesque, justo nisi elementum sapien, efficitur varius urna neque sed magna. Morbi volutpat finibus purus et semper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec fermentum turpis et tortor volutpat, ut imperdiet eros maximus. Duis tellus diam, fringilla sed pharetra vitae, placerat tristique ex.\r\n\r\nCurabitur nulla nisi, convallis et lacinia vulputate, gravida eget leo. Nulla ultrices cursus dui, sed posuere ex. Sed euismod, sem et porta sodales, lorem velit fermentum leo, et tincidunt lorem nisi eget diam. Praesent et metus ac urna euismod auctor sed in risus. Donec purus est, pharetra tempus tincidunt et, interdum a justo. Pellentesque dui felis, faucibus quis vestibulum ut, aliquet id metus. Integer porta eu augue vitae porta. Praesent eget nibh eu ex dictum tempor. Vivamus pellentesque, orci nec gravida viverra, erat ante tincidunt metus, id sodales ex risus nec nisi. Phasellus et ligula nec ipsum sollicitudin bibendum.',0,2),(5,'Integer efficitur','2020-10-20 13:00:00',NULL,'Maecenas eget elit non est dapibus varius mattis vel est. Sed congue auctor arcu ut faucibus. Sed vestibulum luctus nisi efficitur sagittis. Aliquam erat volutpat. Donec tristique nisi eget sollicitudin placerat. Proin euismod turpis vitae purus elementum dignissim consequat ac dolor. Maecenas elementum ac purus ac euismod. Praesent sit amet congue dui. Donec ut nunc vitae ipsum lobortis pretium a ut ipsum.\r\n\r\nVivamus gravida tempor purus, vel euismod libero egestas sed. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut feugiat, leo sit amet rhoncus ultricies, lacus libero venenatis justo, nec consectetur enim magna a nulla. Sed in fermentum diam, vel fermentum est. Curabitur maximus lectus nibh. Sed cursus aliquam libero. Curabitur purus massa, consectetur vel tortor a, laoreet viverra metus. Vestibulum placerat pretium purus. Nam tempus, nisi eget ullamcorper fermentum, risus est consequat arcu, nec ullamcorper dolor est nec nunc. Suspendisse vel neque risus. In hendrerit massa vitae faucibus accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\r\n\r\nOrci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce ultrices dolor quis eros mollis tincidunt. Nullam porta orci augue. Etiam pulvinar ex lectus, sed vulputate enim congue non. Suspendisse ullamcorper mollis diam, eu auctor lacus pretium vitae. Morbi sit amet arcu at justo fermentum tincidunt. Quisque egestas a ipsum eget dictum. Pellentesque convallis, sem sit amet efficitur luctus, risus eros fermentum massa, eget ullamcorper sapien ligula vitae dolor. In eleifend elit erat, feugiat rhoncus risus ullamcorper sed. Mauris sit amet pellentesque augue, at condimentum neque. In dignissim aliquam justo et tincidunt.\r\n\r\nVivamus viverra sit amet quam nec euismod. Quisque pretium odio odio, in mattis nulla maximus id. In hac habitasse platea dictumst. Nunc vulputate, velit quis fringilla semper, tellus nunc pellentesque justo, nec sollicitudin lorem libero sit amet magna. Nullam id ultrices dolor. Cras convallis ex nec lacinia vestibulum. Vestibulum vel dui sit amet sapien blandit gravida. Quisque consectetur interdum quam, vitae dictum ligula imperdiet sit amet. Nulla vehicula ornare magna, non hendrerit massa ultricies a.',0,7),(6,'Nullam gravida quam in','2020-10-20 13:00:00',NULL,'Pellentesque in interdum mauris, at elementum ligula. Vivamus dui massa, iaculis non nisi eu, vehicula tristique nunc. Curabitur ac lectus sit amet ante tincidunt pharetra. Cras libero tortor, blandit eget malesuada id, sollicitudin sit amet nisi. Maecenas non nunc ante. Phasellus consequat dolor et nibh semper, sit amet dapibus felis posuere. Cras fringilla velit at venenatis vestibulum. Sed interdum leo sit amet felis placerat, cursus convallis nisl ultrices. Phasellus et mi id tellus convallis iaculis et eget ipsum.\r\n\r\nNam libero lacus, semper mattis imperdiet auctor, ornare et quam. Suspendisse aliquam facilisis velit, ut dictum est ornare et. Vestibulum blandit lobortis ipsum vel sollicitudin. Mauris ultricies, lectus vel pulvinar facilisis, libero est eleifend lacus, sit amet porta urna magna eu justo. Etiam imperdiet urna eu sodales congue. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis tortor mauris, accumsan non dui tincidunt, gravida bibendum felis. Donec interdum risus vitae velit vehicula hendrerit.',1,4),(7,'Duis quis orci tincidunt, fermentum mi vel','2021-01-08 03:00:00',NULL,'Duis sit amet commodo ex. Morbi a mattis mi, ut ornare quam. Proin ullamcorper nulla metus, condimentum lacinia risus interdum non. Cras lobortis fringilla metus non volutpat. Nullam rhoncus tortor eleifend, auctor augue vel, ornare lorem. Quisque in diam lacus. Aliquam erat volutpat. Vivamus elementum malesuada nulla, sed euismod ligula fringilla id. Curabitur ultrices id turpis eleifend vehicula. Fusce gravida pulvinar lorem, at efficitur nibh maximus a.\r\n\r\nProin facilisis, magna pretium sodales ornare, lorem quam tempor est, ac vulputate odio magna elementum quam. Praesent rutrum erat urna, vitae imperdiet ligula tristique ac. In vitae dictum mauris, ac posuere nunc. Mauris sit amet ornare dui. Etiam sit amet blandit risus, eget pharetra orci. Pellentesque quis nulla lacus. Sed quis risus ac enim iaculis iaculis. Nullam tristique ullamcorper ligula in sagittis. Nullam orci elit, auctor in tincidunt pretium, ornare id enim.\r\n\r\nSuspendisse ut interdum eros. Quisque ut volutpat lacus. Quisque mattis erat ut libero maximus, quis pulvinar enim auctor. Donec rutrum dui sed elementum ultrices. Morbi lobortis sit amet nisl nec sagittis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam pellentesque est enim, id feugiat eros sagittis sed. Nunc tincidunt volutpat laoreet. Etiam interdum leo ac arcu tempor interdum. Phasellus diam mauris, porttitor eget feugiat at, venenatis ac risus.',0,5),(8,'Phasellus eu massa','2021-09-05 18:37:30','2021-01-12 10:00:00','Aenean vel malesuada magna. Nullam at mauris at tellus dapibus efficitur in at arcu. Proin pharetra, augue at auctor euismod, ligula diam hendrerit elit, in pretium turpis felis sed magna. Sed et tincidunt lacus. Ut porta justo sed tempor blandit. Phasellus eget elit risus. Etiam est nibh, efficitur ac nulla eget, lobortis cursus lorem. Etiam placerat porta cursus. Nulla sit amet metus elementum, dapibus ipsum id, mollis eros. Cras mi neque, convallis eu scelerisque ac, gravida sed elit. Mauris et tortor a mauris blandit gravida. Ut nulla tellus, fringilla eu ex id, egestas dapibus est. Duis sodales in libero et scelerisque. In dictum sed ipsum vitae blandit. Mauris placerat lorem ultricies velit vestibulum, sed malesuada ex mattis. Integer porttitor cursus elit.\r\n\r\nFusce eget libero libero. Vivamus consequat lacus tortor, tempor rhoncus ligula convallis id. Quisque gravida dapibus egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec cursus sollicitudin elit at imperdiet. Nulla molestie tempus consectetur. Morbi sed orci turpis. Vestibulum et est sed velit euismod blandit. Nam sed odio placerat, feugiat libero nec, laoreet diam. Sed nec dui rhoncus eros mattis laoreet. Mauris aliquam orci sit amet auctor mollis. Aenean et leo condimentum nulla fermentum tincidunt a sed metus. Aliquam lacinia eros sapien, et laoreet enim dignissim sed.\r\n\r\nPhasellus id sodales dui, at molestie ex. Quisque at erat non tortor egestas tempus. Donec commodo urna non odio sodales, vitae faucibus leo euismod. In mattis fermentum tincidunt. Nulla eget eleifend risus, eu cursus enim. Sed non venenatis enim. Proin bibendum facilisis ligula, in vestibulum augue sagittis at. Praesent tortor nunc, scelerisque sed facilisis quis, accumsan nec arcu. Mauris vel enim in massa hendrerit dapibus. Vestibulum vitae cursus quam, at pretium massa. Integer dapibus et velit vitae dignissim. Vivamus volutpat porta nisi, nec semper ex scelerisque ut. Cras congue urna in enim faucibus, ut lobortis purus volutpat. Pellentesque volutpat efficitur est, a rhoncus nisl tincidunt luctus. Duis urna arcu, ultrices at aliquet eget, rhoncus vel augue. Ut semper dui vel metus faucibus interdum ac sed urna.',0,10),(9,'Etiam at justo lorem. Mauris nec','2021-01-12 13:00:00',NULL,'Aliquam ultrices vitae ipsum laoreet vestibulum. Nunc facilisis dignissim neque, non maximus velit tincidunt non. Donec semper ligula ut augue facilisis tempor. Pellentesque consectetur est risus, nec ullamcorper elit malesuada vel. Nulla condimentum sem et quam iaculis lobortis. Maecenas facilisis porttitor augue ut feugiat. Vivamus convallis lacus arcu, in pretium felis ullamcorper sit amet. Integer tristique cursus justo sed vestibulum.\r\n\r\nCurabitur tincidunt, mauris ut porttitor commodo, ante enim sollicitudin orci, ut luctus risus urna consectetur ipsum. Donec maximus sit amet tortor sit amet hendrerit. Proin ornare tincidunt eros, a dapibus dolor aliquet quis. Praesent a ultrices turpis. Morbi cursus nibh sed dui dictum finibus. Vivamus porta elementum sagittis. Aliquam erat volutpat. Pellentesque enim ante, pulvinar eget est vitae, viverra suscipit libero. Sed porta lacinia nunc, et ultricies diam facilisis egestas. Nullam feugiat dignissim pharetra. Vestibulum ullamcorper, lacus non rhoncus lobortis, quam ligula congue leo, vel viverra enim erat vel ipsum.\r\n\r\nPellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse quis velit tristique, ultrices metus nec, blandit massa. Cras vitae aliquam magna. Nunc commodo dui vitae euismod blandit. Phasellus dignissim sit amet mauris sit amet vestibulum. Proin maximus pretium diam, maximus consectetur purus bibendum vitae. Aliquam hendrerit faucibus malesuada. Donec et interdum purus, finibus dictum ante. Nulla faucibus magna sit amet finibus volutpat. Quisque nec diam accumsan, tristique sem sed, eleifend orci.',1,8),(10,'Pellentesque habitant morbi tristique senectus et','2021-09-05 18:37:30','2021-03-10 07:45:00','Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eget pulvinar ante. Sed quis maximus lectus. Donec nec augue nec nunc aliquam interdum. Donec ac metus fringilla, laoreet quam et, eleifend erat. Praesent vitae dictum magna. Ut id finibus orci, quis eleifend justo. Integer eget elementum dui, tincidunt fermentum nibh. Nunc fermentum sapien at nulla fermentum aliquam. Vivamus pharetra, quam a faucibus semper, metus justo porttitor enim, ac semper odio nisi eu metus. Nulla non rutrum nulla. Maecenas fringilla massa non laoreet aliquam. Vivamus non aliquam risus, quis malesuada purus. In ultricies nisl vitae sagittis ornare. Fusce non facilisis neque. Donec porta nisl sed tempor vulputate.\r\n\r\nNullam sed lectus vestibulum, ultricies libero eu, placerat magna. Etiam volutpat id metus vel sodales. Quisque consectetur venenatis ex non pulvinar. Vestibulum tempor eu augue vel lobortis. Donec accumsan odio ut tellus cursus, at congue justo maximus. Vivamus porta, quam non ornare mattis, metus mauris consequat lorem, a gravida quam eros vel lacus. In id eleifend tellus. Vivamus erat mi, eleifend quis eleifend id, malesuada et orci. Integer congue lacus vitae eros eleifend, non sagittis odio pulvinar. Mauris sapien massa, tristique id arcu non, tristique consequat eros.\r\n\r\nProin ante massa, vulputate laoreet turpis non, tristique tincidunt ex. Nullam quis dapibus nunc. Sed ornare auctor eleifend. Proin at ultrices odio, vitae porttitor justo. Vivamus fringilla lorem nec mauris luctus, non pellentesque purus egestas. Integer eu aliquet ante. Sed eu nibh nec massa efficitur tempus. Vivamus eros elit, ullamcorper ut dolor vel, feugiat malesuada diam. Quisque ultrices mollis dapibus. Proin in ante rutrum, laoreet libero et, vestibulum libero. Sed nec pulvinar nisi. Aliquam sem sapien, luctus quis euismod venenatis, malesuada suscipit odio. Praesent a condimentum magna. Nulla vestibulum tellus nec tempus lobortis. Mauris tempus diam lacinia mi tincidunt, non posuere est auctor. Curabitur vel venenatis lectus.\r\n\r\nDonec ultrices mattis mollis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin et commodo lectus, et fermentum orci. Morbi sed sapien sit amet nulla feugiat facilisis pretium id orci. In fermentum mi nec aliquam egestas. Quisque dignissim sodales nibh in lacinia. Nam interdum libero nec dictum sodales. Fusce vel magna molestie nibh interdum suscipit et semper erat. Cras ut hendrerit enim, in ullamcorper ligula. Maecenas et elit eget nibh condimentum congue. Aliquam sit amet nisl eu orci luctus porta.',0,4);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(15) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Samuel','Sherar','ssherar0@cornell.edu','7lTgx8rm','2021-03-26 03:00:00',1),(2,'Janet','Couzens','jcouzens1@com.com','YefG0xjOqYb','2021-03-20 03:00:00',1),(3,'Will','Laneham','wlaneham2@wp.com','8aJprqROj','2020-11-05 03:00:00',0),(4,'Thomas','Frail','tfrail3@vkontakte.ru','RbAIZqHp','2020-10-31 03:00:00',1),(5,'Daniel','Bartaloni','dbartaloni4@loc.gov','G9lB8Pw','2021-05-21 03:00:00',1),(6,'Mariel','Handes','mhandes5@wordpress.org','x0SV2P4go0cl','2021-01-30 03:00:00',0),(7,'Staford','Gaveltone','sgaveltone6@weibo.com','OMrRLfKelf4','2020-10-06 03:00:00',0),(8,'Gerty','Sutch','gsutch7@tripadvisor.com','2jQ1PmTYt','2021-08-13 03:00:00',1),(9,'Lucas','Oates','loates8@economist.com','biFeB89','2021-01-11 03:00:00',1),(10,'Marcela','Johannes','mjohannes9@netscape.com','ANgeMfj99','2021-01-25 03:00:00',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'notes_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-05 17:19:54
