/*
Navicat MySQL Data Transfer

Source Server         : banco
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : sysoncompiler

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-07-18 00:26:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `entrada`
-- ----------------------------
DROP TABLE IF EXISTS `entrada`;
CREATE TABLE `entrada` (
  `id` int(255) NOT NULL,
  `id_listadeentradasaida` int(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrada
-- ----------------------------
INSERT INTO `entrada` VALUES ('1', '1', '5');
INSERT INTO `entrada` VALUES ('2', '1', '5');
INSERT INTO `entrada` VALUES ('3', '2', '10');
INSERT INTO `entrada` VALUES ('4', '2', '5');
INSERT INTO `entrada` VALUES ('5', '3', '10');
INSERT INTO `entrada` VALUES ('6', '4', '5');

-- ----------------------------
-- Table structure for `listaentradasaida`
-- ----------------------------
DROP TABLE IF EXISTS `listaentradasaida`;
CREATE TABLE `listaentradasaida` (
  `id` int(255) NOT NULL,
  `id_questoes` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listaentradasaida
-- ----------------------------
INSERT INTO `listaentradasaida` VALUES ('1', '1');
INSERT INTO `listaentradasaida` VALUES ('2', '1');
INSERT INTO `listaentradasaida` VALUES ('3', '2');
INSERT INTO `listaentradasaida` VALUES ('4', '2');

-- ----------------------------
-- Table structure for `questoes`
-- ----------------------------
DROP TABLE IF EXISTS `questoes`;
CREATE TABLE `questoes` (
  `id` int(255) NOT NULL,
  `titulo` text NOT NULL,
  `descricao` text NOT NULL,
  `pontos` int(255) DEFAULT NULL,
  `descricao_entrada` text,
  `descricao_saida` text,
  `entrada` text,
  `saida` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questoes
-- ----------------------------
INSERT INTO `questoes` VALUES ('1', 'Soma de 2 numeros', 'Faça um codigo que some 2 numeros inteiros', '10', 'A entrada é composta por 2 entradas de numeros inteiros', 'A saida deve mostrar a soma dos dois inteiros em uma unica linha', '1</br>2', '3');
INSERT INTO `questoes` VALUES ('2', 'par ou impar', 'impar par', '20', 'A entrada é composta por ...', 'A saida é composta por ...', '1', 'impar');

-- ----------------------------
-- Table structure for `relacaoquestaousuario`
-- ----------------------------
DROP TABLE IF EXISTS `relacaoquestaousuario`;
CREATE TABLE `relacaoquestaousuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `id_questao` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relacaoquestaousuario
-- ----------------------------
INSERT INTO `relacaoquestaousuario` VALUES ('1', '1', '1');
INSERT INTO `relacaoquestaousuario` VALUES ('3', '1', '2');
INSERT INTO `relacaoquestaousuario` VALUES ('4', '6', '1');
INSERT INTO `relacaoquestaousuario` VALUES ('5', '6', '2');

-- ----------------------------
-- Table structure for `saida`
-- ----------------------------
DROP TABLE IF EXISTS `saida`;
CREATE TABLE `saida` (
  `id` int(255) NOT NULL,
  `id_listadeentradasaida` int(255) NOT NULL,
  `valor` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of saida
-- ----------------------------
INSERT INTO `saida` VALUES ('1', '1', '10');
INSERT INTO `saida` VALUES ('2', '2', '15');
INSERT INTO `saida` VALUES ('3', '3', 'par');
INSERT INTO `saida` VALUES ('4', '4', 'impar');

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text,
  `nome` text,
  `senha` text,
  `foto` text,
  `pontos` int(255) DEFAULT NULL COMMENT '0',
  `submissoes` int(255) DEFAULT NULL COMMENT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'paulo100games@gmail.com', 'Danilo Rodrigues', '123', null, '110', '14');
INSERT INTO `usuario` VALUES ('2', 'paulo100gamess@gmail.com', 'Paulo Henrique', '123', null, '0', '0');
INSERT INTO `usuario` VALUES ('3', 'jose@jose.jose', 'jose123', 'Jose', null, '0', '0');
INSERT INTO `usuario` VALUES ('4', 'jose@jose.joses', 'jose123', 'Jose', null, '0', '0');
INSERT INTO `usuario` VALUES ('5', 'teste@teste.teste', 'jose teste', '123321', null, '0', '0');
INSERT INTO `usuario` VALUES ('6', 'llinyaraujo@gmail.com', 'Aliny', 'paulo123', null, '30', '2');
INSERT INTO `usuario` VALUES ('7', 'luizrodrigomarques@gmail.com', 'Rodrigo', '230394', '0', '60', '3');
