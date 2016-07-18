/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : thr3ap

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-04-29 14:45:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `produtos`
-- ----------------------------
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `desc_curta` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `categoria` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `comissao` float DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `imagem` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `data` date DEFAULT NULL,
  `descricacao` varchar(191) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of produtos
-- ----------------------------
INSERT INTO `produtos` VALUES ('3', 'Teclado Mox', 'Teclado wirelles', '56', '', '5', '50', '', null, null);
INSERT INTO `produtos` VALUES ('5', 'Webcam', 'Webcam com 2 mpx ', '25', '', '3', '23', '', null, null);
