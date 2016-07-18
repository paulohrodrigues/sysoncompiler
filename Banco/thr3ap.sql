/*
Navicat MySQL Data Transfer

Source Server         : banco
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : thr3ap

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-04-03 11:16:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `anunciantes`
-- ----------------------------
DROP TABLE IF EXISTS `anunciantes`;
CREATE TABLE `anunciantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusSistema` int(1) NOT NULL,
  `ganhosIndicacao` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `saldo` float(10,2) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dados_banco` varchar(50) NOT NULL,
  `dados_agencia` varchar(50) NOT NULL,
  `dados_tipoconta` enum('poupanca','corrente') NOT NULL,
  `dados_conta` varchar(50) NOT NULL,
  `dados_nome` varchar(80) NOT NULL,
  `dados_op` varchar(10) NOT NULL,
  `status` enum('pendente','ativo') NOT NULL,
  `pincode` int(20) NOT NULL,
  `skype` varchar(30) NOT NULL,
  `registro` bigint(20) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `pagseguro` varchar(155) NOT NULL,
  `moip` varchar(155) NOT NULL,
  `akatus` varchar(155) NOT NULL,
  `hits` varchar(30) NOT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `remada` int(5) DEFAULT NULL,
  `datainicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recebeutodosnetos` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `idIndicador` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of anunciantes
-- ----------------------------

-- ----------------------------
-- Table structure for `arvore`
-- ----------------------------
DROP TABLE IF EXISTS `arvore`;
CREATE TABLE `arvore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_login` (`id_login`),
  CONSTRAINT `arvore_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of arvore
-- ----------------------------
/*
INSERT INTO `arvore` VALUES ('1', '5');
INSERT INTO `arvore` VALUES ('2', '6');
INSERT INTO `arvore` VALUES ('3', '7');
INSERT INTO `arvore` VALUES ('4', '8');
INSERT INTO `arvore` VALUES ('5', '9');
INSERT INTO `arvore` VALUES ('6', '10');
INSERT INTO `arvore` VALUES ('7', '11');
INSERT INTO `arvore` VALUES ('8', '12');
INSERT INTO `arvore` VALUES ('9', '13');
INSERT INTO `arvore` VALUES ('10', '14');
INSERT INTO `arvore` VALUES ('11', '15');
INSERT INTO `arvore` VALUES ('12', '16');
INSERT INTO `arvore` VALUES ('13', '17');
INSERT INTO `arvore` VALUES ('14', '18');
*/
-- ----------------------------
-- Table structure for `caixa`
-- ----------------------------
DROP TABLE IF EXISTS `caixa`;
CREATE TABLE `caixa` (
  `id` int(111) NOT NULL AUTO_INCREMENT,
  `saldo` float(100,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caixa
-- ----------------------------
INSERT INTO `caixa` VALUES ('1', '0');

-- ----------------------------
-- Table structure for `debitos`
-- ----------------------------
DROP TABLE IF EXISTS `debitos`;
CREATE TABLE `debitos` (
  `idDebito` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `valorDebito` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tipoDebito` int(1) NOT NULL,
  `idTransacao` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigoTransacao` text COLLATE utf8_unicode_ci,
  `dataDebito` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idDebito`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of debitos
-- ----------------------------

-- ----------------------------
-- Table structure for `divulgacao`
-- ----------------------------
DROP TABLE IF EXISTS `divulgacao`;
CREATE TABLE `divulgacao` (
  `idDivulgacao` int(11) NOT NULL AUTO_INCREMENT,
  `idAnunciante` int(11) DEFAULT NULL,
  `assuntoDivulgacao` varchar(250) DEFAULT NULL,
  `imagemDivulgacao` varchar(300) DEFAULT NULL,
  `linkDivulgacao` varchar(500) DEFAULT NULL,
  `statusDivulgacao` int(1) DEFAULT NULL,
  `dataDivulgacao` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idDivulgacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of divulgacao
-- ----------------------------

-- ----------------------------
-- Table structure for `divulgacaousuario`
-- ----------------------------
DROP TABLE IF EXISTS `divulgacaousuario`;
CREATE TABLE `divulgacaousuario` (
  `idDivulgacaoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idDivulgacao` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `tipoRede` varchar(30) DEFAULT NULL,
  `dataCompartilhamento` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idDivulgacaoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of divulgacaousuario
-- ----------------------------

-- ----------------------------
-- Table structure for `estatisticas`
-- ----------------------------
DROP TABLE IF EXISTS `estatisticas`;
CREATE TABLE `estatisticas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitas` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estatisticas
-- ----------------------------

-- ----------------------------
-- Table structure for `extrato`
-- ----------------------------
DROP TABLE IF EXISTS `extrato`;
CREATE TABLE `extrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `detalhe` text NOT NULL,
  `valor` int(5) NOT NULL,
  `data` bigint(20) NOT NULL,
  `downline` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of extrato
-- ----------------------------

-- ----------------------------
-- Table structure for `indicados`
-- ----------------------------
DROP TABLE IF EXISTS `indicados`;
CREATE TABLE `indicados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indicador` int(11) DEFAULT NULL,
  `id_indicado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indicados
-- ----------------------------

-- ----------------------------
-- Table structure for `msg`
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `de` varchar(30) NOT NULL,
  `para` varchar(30) NOT NULL,
  `assunto` varchar(200) NOT NULL,
  `texto` text NOT NULL,
  `data` bigint(30) NOT NULL,
  `status` enum('read','unread') NOT NULL,
  `situacao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of msg
-- ----------------------------

-- ----------------------------
-- Table structure for `pagamentos`
-- ----------------------------
DROP TABLE IF EXISTS `pagamentos`;
CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `indicador` varchar(30) NOT NULL,
  `indicador_nivel` int(11) NOT NULL,
  `status` enum('nao pago','pendente','pago','recusado') NOT NULL,
  `comprovante` text NOT NULL,
  `hora` bigint(30) NOT NULL,
  `idavo` int(11) DEFAULT NULL,
  `idremada` int(11) DEFAULT NULL,
  `idlogin` int(11) DEFAULT NULL,
  `nivelderodadas` int(5) DEFAULT NULL,
  `pago` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pagamentos
-- ----------------------------

-- ----------------------------
-- Table structure for `relacoes`
-- ----------------------------
DROP TABLE IF EXISTS `relacoes`;
CREATE TABLE `relacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idlogin` int(11) DEFAULT NULL,
  `idfilho` int(11) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relacoes
-- ----------------------------

-- ----------------------------
-- Table structure for `remando`
-- ----------------------------
DROP TABLE IF EXISTS `remando`;
CREATE TABLE `remando` (
  `idRemando` int(11) NOT NULL AUTO_INCREMENT,
  `remaidlogin` int(11) DEFAULT NULL,
  `remaidremada` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRemando`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of remando
-- ----------------------------

-- ----------------------------
-- Table structure for `saques`
-- ----------------------------
DROP TABLE IF EXISTS `saques`;
CREATE TABLE `saques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT '0',
  `data_saque` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `data_transferencia` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `id_usuario` int(11) unsigned DEFAULT NULL,
  `valor_saque` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of saques
-- ----------------------------

-- ----------------------------
-- Table structure for `ultimo_usuario`
-- ----------------------------
DROP TABLE IF EXISTS `ultimo_usuario`;
CREATE TABLE `ultimo_usuario` (
  `id` int(11) NOT NULL DEFAULT '0',
  `posicao_ultimo_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ultimo_usuario
-- ----------------------------

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusSistema` int(1) NOT NULL,
  `ganhosIndicacao` int(11) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `saldo` float(10,2) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dados_banco` varchar(50) NOT NULL,
  `dados_agencia` varchar(50) NOT NULL,
  `dados_tipoconta` enum('poupanca','corrente') NOT NULL,
  `dados_conta` varchar(50) NOT NULL,
  `dados_nome` varchar(80) NOT NULL,
  `dados_op` varchar(10) NOT NULL,
  `status` enum('pendente','ativo') NOT NULL,
  `pincode` int(20) NOT NULL,
  `skype` varchar(30) NOT NULL,
  `registro` bigint(20) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `pagseguro` varchar(155) NOT NULL,
  `moip` varchar(155) NOT NULL,
  `akatus` varchar(155) NOT NULL,
  `hits` varchar(30) NOT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `rodada` int(5) DEFAULT NULL,
  `datainicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recebeutodosnetos` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `indicador` text NOT NULL,
  `pagou` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
/*
INSERT INTO `usuarios` VALUES ('5', '0', '0', 'admin', '1', 'admin@admin.admin', '398.50', 'admin', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '1', '2016-04-02 20:03:05', '0000-00-00 00:00:00', '1', null);
INSERT INTO `usuarios` VALUES ('6', '0', '0', 'filho1', '1', 'filho1@filho1.filho1', '0.00', 'filho1', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 19:59:38', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('7', '0', '0', 'filho2', '1', 'filho2@filho2.filho2', '0.00', 'filho2', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 19:59:45', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('8', '0', '0', 'filho3', '1', 'filho3@filho3.filho3', '0.00', 'filho3', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 19:59:48', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('9', '0', '0', 'neto1', '1', 'neto1@neto1.neto1', '0.00', 'neto1', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 19:59:51', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('10', '0', '0', 'neto2', '1', 'neto2@neto2.neto2', '0.00', 'neto2', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 19:59:55', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('11', '0', '0', 'neto3', '1', 'neto3@neto3.neto3', '0.00', 'neto3', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 19:59:58', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('12', '0', '0', 'neto4', '1', 'neto4@neto4.neto4', '0.00', 'neto4', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 20:00:01', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('13', '0', '0', 'neto5', '1', 'neto5@neto5.neto5', '0.00', 'neto5', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 20:00:04', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('14', '0', '0', 'neto6', '1', 'neto6@neto6.neto6', '0.00', 'neto6', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 20:00:07', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('15', '0', '0', 'neto7', '1', 'neto7@neto7.neto7', '0.00', 'neto7', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 20:00:10', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('16', '0', '0', 'neto8', '1', 'neto8@neto8.neto8', '0.00', 'neto8', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 20:00:13', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('17', '0', '0', 'neto9', '1', 'neto9@neto9.neto9', '0.00', 'neto9', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 20:01:45', '0000-00-00 00:00:00', 'admin', null);
INSERT INTO `usuarios` VALUES ('18', '0', '0', 'bisneto1', '1', 'bisneto1@bisneto1.bisneto1', '0.00', 'bisneto1', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-02 20:03:04', '0000-00-00 00:00:00', 'admin', null);
*/
-- ----------------------------
-- Table structure for `visitantes`
-- ----------------------------
DROP TABLE IF EXISTS `visitantes`;
CREATE TABLE `visitantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of visitantes
-- ----------------------------
