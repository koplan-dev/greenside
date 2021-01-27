-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: greenside.co3urwuxniff.us-east-1.rds.amazonaws.com
-- Tempo de geração: 16/09/2018 às 23:33
-- Versão do servidor: 5.6.37-log
-- Versão do PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `greenside`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `911calls`
--

CREATE TABLE `911calls` (
  `callerSQLID` int(11) NOT NULL,
  `callerNumber` int(11) NOT NULL,
  `serviceType` int(11) NOT NULL,
  `emerReason` int(11) NOT NULL,
  `nameGiven` varchar(24) NOT NULL,
  `nameRetrieved` varchar(32) NOT NULL,
  `location` varchar(32) NOT NULL,
  `emergencyInfo` varchar(128) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `addInfo` varchar(128) NOT NULL,
  `unitsResponding` varchar(128) NOT NULL DEFAULT ',,,,',
  `unitsRes` int(11) NOT NULL,
  `callCleared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `911calls`
--

INSERT INTO `911calls` (`callerSQLID`, `callerNumber`, `serviceType`, `emerReason`, `nameGiven`, `nameRetrieved`, `location`, `emergencyInfo`, `timestamp`, `addInfo`, `unitsResponding`, `unitsRes`, `callCleared`) VALUES
(2, 4145983, 1, 0, 'não', 'Zac Deutch', 'Montgomery', 'alo é da rádio?', 1534715927, '', ',,,,', 0, 0),
(2, 4145983, 1, 9, 'UUEHE ', 'Zac Deutch', 'Blueberry', 'Montgeomery', 1534806167, '', ',,,,', 0, 0),
(2, 4145983, 1, 15, 'UAHSUAHDUAS HUDAHS ', 'Zac Deutch', 'Blueberry', 'adjiasjdasidsajsiadasjdisad', 1534806192, '', ',,,,', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_comments`
--

CREATE TABLE `account_comments` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `value` varchar(8000) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `reported` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `achievements`
--

CREATE TABLE `achievements` (
  `id` int(11) NOT NULL,
  `AchPoints` int(11) NOT NULL,
  `AchName` varchar(50) NOT NULL,
  `AchDescription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `achievements`
--

INSERT INTO `achievements` (`id`, `AchPoints`, `AchName`, `AchDescription`) VALUES
(3, 10, 'Primeira Conversa', 'Você recebeu +10 pontos de conquista por sua primeira conversa no servidor.'),
(5, 10, 'Novo Membro', 'Você recebeu +10 pontos de conquista por ser um novo membro de uma facção');

-- --------------------------------------------------------

--
-- Estrutura para tabela `adminlog`
--

CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL,
  `AdminName` varchar(26) DEFAULT NULL,
  `AdminSQLID` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(18) NOT NULL DEFAULT '0',
  `Timestamp` int(11) NOT NULL DEFAULT '0',
  `Action` varchar(100) DEFAULT NULL,
  `AgainstName` varchar(26) DEFAULT NULL,
  `AgainstSQLID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `adminlog`
--

INSERT INTO `adminlog` (`id`, `AdminName`, `AdminSQLID`, `IP`, `Timestamp`, `Action`, `AgainstName`, `AgainstSQLID`) VALUES
(1, 'Vincent_Henderson', 1, '164.163.207.5', 1530911856, 'Login (in-game)', '', 0),
(2, 'Vincent_Henderson', 1, '164.163.207.5', 1530911901, 'Login (in-game)', '', 0),
(3, 'Vincent_Henderson', 1, '164.163.207.5', 1530912076, 'Reloaded todas as empresas do banco de dados', '', 0),
(4, 'Vincent_Henderson', 1, '127.0.0.1', 1530912221, 'Login (in-game)', '', 0),
(5, 'Vincent_Henderson', 1, '127.0.0.1', 1530912741, 'Login (in-game)', '', 0),
(6, 'Vincent_Henderson', 1, '164.163.207.5', 1530913060, 'Login (in-game)', '', 0),
(7, 'Vincent_Henderson', 1, '164.163.207.5', 1530913288, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(8, 'Vincent_Henderson', 1, '127.0.0.1', 1530913491, 'Login (in-game)', '', 0),
(9, 'Vincent_Henderson', 1, '127.0.0.1', 1530913538, 'Reloaded todas as empresas do banco de dados', '', 0),
(10, 'Vincent_Henderson', 1, '164.163.207.5', 1530913838, 'Login (in-game)', '', 0),
(11, 'Vincent_Henderson', 1, '164.163.207.5', 1530913859, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(12, 'Vincent_Henderson', 1, '127.0.0.1', 1530935000, 'Login (in-game)', '', 0),
(13, 'Vincent_Henderson', 1, '127.0.0.1', 1530937103, 'Login (in-game)', '', 0),
(14, 'Vincent_Henderson', 1, '192.168.1.5', 1531014630, 'Login (in-game)', '', 0),
(15, 'Vincent_Henderson', 1, '192.168.1.5', 1531014945, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(16, 'Vincent_Henderson', 1, '192.168.1.5', 1531014954, 'Reloaded todas as empresas do banco de dados', '', 0),
(17, 'Vincent_Henderson', 1, '192.168.1.5', 1531015008, 'Login (in-game)', '', 0),
(18, 'Vincent_Henderson', 1, '192.168.1.5', 1531015012, 'Reloaded todas as empresas do banco de dados', '', 0),
(19, 'Vincent_Henderson', 1, '192.168.1.5', 1531015492, 'Login (in-game)', '', 0),
(20, 'Vincent_Henderson', 1, '192.168.1.5', 1531015974, 'Veiculo spawnado: Sandking (ID 168, Model 495)', '', 0),
(21, 'Vincent_Henderson', 1, '192.168.1.5', 1531017228, 'Login (in-game)', '', 0),
(22, 'Vincent_Henderson', 1, '192.168.1.5', 1531047770, 'Login (in-game)', '', 0),
(23, 'Vincent_Henderson', 1, '192.168.1.4', 1531414761, 'Login (in-game)', '', 0),
(24, 'Veronica_Alexandra', 11, '192.168.1.4', 1531415157, 'Login (in-game)', '', 0),
(25, 'Veronica_Alexandra', 11, '192.168.1.4', 1531415587, 'Login (in-game)', '', 0),
(26, 'Veronica_Alexandra', 11, '192.168.1.4', 1531415709, 'Login (in-game)', '', 0),
(27, 'Veronica_Alexandra', 11, '192.168.1.4', 1531417967, 'Login (in-game)', '', 0),
(28, 'Veronica_Alexandra', 11, '164.163.207.100', 1531505123, 'Login (in-game)', '', 0),
(29, 'Veronica_Alexandra', 11, '192.168.1.6', 1531506274, 'Login (in-game)', '', 0),
(30, 'Veronica_Alexandra', 11, '192.168.1.6', 1531509831, 'Login (in-game)', '', 0),
(31, 'Veronica_Alexandra', 11, '192.168.1.6', 1531510600, 'Login (in-game)', '', 0),
(32, 'Veronica_Alexandra', 11, '192.168.1.6', 1531512053, 'Login (in-game)', '', 0),
(33, 'Veronica_Alexandra', 11, '192.168.1.6', 1531512120, 'Teleportado para Montgomery', 'Veronica_Alexandra', 11),
(34, 'Veronica_Alexandra', 11, '192.168.1.4', 1531514120, 'Login (in-game)', '', 0),
(35, 'Veronica_Alexandra', 11, '192.168.1.4', 1531515983, 'Login (in-game)', '', 0),
(36, 'Veronica_Alexandra', 11, '192.168.1.4', 1531516106, 'Teleportado para Montgomery', 'Veronica_Alexandra', 11),
(37, 'Veronica_Alexandra', 11, '164.163.207.8', 1531540213, 'Login (in-game)', '', 0),
(38, 'Veronica_Alexandra', 11, '164.163.207.8', 1531540368, 'Teleportado para Blueberry', 'Veronica_Alexandra', 11),
(39, 'Veronica_Alexandra', 11, '164.163.207.8', 1531540406, 'Login (in-game)', '', 0),
(40, 'Rowan_Ballard', 4, '186.225.187.250', 1531540631, 'Login (in-game)', '', 0),
(41, 'Veronica_Alexandra', 11, '164.163.207.8', 1531541023, 'Login (in-game)', '', 0),
(42, 'Veronica_Alexandra', 11, '164.163.207.8', 1531541918, 'Teleportado para Montgomery', 'Veronica_Alexandra', 11),
(43, 'Veronica_Alexandra', 11, '164.163.207.8', 1531542068, 'Teleportado para Montgomery', 'Veronica_Alexandra', 11),
(44, 'Veronica_Alexandra', 11, '164.163.207.8', 1531542288, 'Login (in-game)', '', 0),
(45, 'Veronica_Alexandra', 11, '164.163.207.8', 1531542351, 'Definir nível de administrador para 4', 'Rowan_Ballard', 4),
(46, 'Veronica_Alexandra', 11, '164.163.207.8', 1531542357, 'Jogador puxado', 'Rowan_Ballard', 4),
(47, 'Veronica_Alexandra', 11, '164.163.207.8', 1531542569, 'Veiculo spawnado: Sandking (ID 168, Model 495)', '', 0),
(48, 'Veronica_Alexandra', 11, '164.163.207.8', 1531543039, 'Imediato GMX', '', 0),
(49, 'Veronica_Alexandra', 11, '164.163.207.8', 1531543060, 'Login (in-game)', '', 0),
(50, 'Rowan_Ballard', 4, '186.225.187.250', 1531543067, 'Login (in-game)', '', 0),
(51, 'Veronica_Alexandra', 11, '164.163.207.8', 1531543208, 'Jogador puxado', 'Rowan_Ballard', 4),
(52, 'Veronica_Alexandra', 11, '164.163.207.8', 1531543212, 'Imediato GMX', '', 0),
(53, 'Veronica_Alexandra', 11, '164.163.207.8', 1531543283, 'Login (in-game)', '', 0),
(54, 'Rowan_Ballard', 4, '186.225.187.250', 1531543291, 'Login (in-game)', '', 0),
(55, 'Veronica_Alexandra', 11, '164.163.207.8', 1531543442, 'Login (in-game)', '', 0),
(56, 'Rowan_Ballard', 4, '186.225.187.250', 1531543456, 'Login (in-game)', '', 0),
(57, 'Veronica_Alexandra', 11, '164.163.207.8', 1531544236, 'Inicia sessão de assistência', 'Rowan_Ballard', 4),
(58, 'Veronica_Alexandra', 11, '164.163.207.8', 1531544479, 'Veiculo spawnado: Sandking (ID 168, Model 495)', '', 0),
(59, 'Veronica_Alexandra', 11, '164.163.207.8', 1531544953, 'Jogador teleportado', 'Rowan_Ballard', 4),
(60, 'Vincent_Henderson', 1, '164.163.207.8', 1531546972, 'Login (in-game)', '', 0),
(61, 'Veronica_Alexandra', 11, '164.163.207.8', 1531548917, 'Login (in-game)', '', 0),
(62, 'Veronica_Alexandra', 11, '164.163.207.8', 1531549562, 'Login (in-game)', '', 0),
(63, 'Rowan_Ballard', 4, '186.225.187.250', 1531549734, 'Login (in-game)', '', 0),
(64, 'Veronica_Alexandra', 11, '164.163.207.8', 1531549785, 'Jogador teleportado', 'Rowan_Ballard', 4),
(65, 'Rowan_Ballard', 4, '186.225.187.250', 1531550298, 'Jogador teleportado', 'Veronica_Alexandra', 11),
(66, 'Rowan_Ballard', 4, '186.225.187.250', 1531550317, 'Jogador teleportado', 'Veronica_Alexandra', 11),
(67, 'Veronica_Alexandra', 11, '164.163.207.8', 1531550461, 'Veiculo spawnado: Sandking (ID 168, Model 495)', '', 0),
(68, 'Rowan_Ballard', 4, '186.225.187.250', 1531550977, 'Login (in-game)', '', 0),
(69, 'Rowan_Ballard', 4, '186.225.187.250', 1531550990, 'Jogador teleportado', 'Veronica_Alexandra', 11),
(70, 'Veronica_Alexandra', 11, '164.163.207.8', 1531551037, 'Jogador puxado', 'Rowan_Ballard', 4),
(71, 'Veronica_Alexandra', 11, '164.163.207.8', 1531551399, 'Jogador teleportado', 'Rowan_Ballard', 4),
(72, 'Veronica_Alexandra', 11, '164.163.207.8', 1531551498, 'Jogador puxado', 'Rowan_Ballard', 4),
(73, 'Veronica_Alexandra', 11, '164.163.207.8', 1531552152, 'Teleportado para Dillimore', 'Veronica_Alexandra', 11),
(74, 'Veronica_Alexandra', 11, '164.163.207.8', 1531552170, 'Jogador teleportado', 'Rowan_Ballard', 4),
(75, 'Veronica_Alexandra', 11, '164.163.207.8', 1531552512, 'Jogador teleportado', 'Rowan_Ballard', 4),
(76, 'Veronica_Alexandra', 11, '164.163.207.8', 1531552587, 'Jogador puxado', 'Rowan_Ballard', 4),
(77, 'Veronica_Alexandra', 11, '164.163.207.8', 1531552855, 'Teleportado para Dillimore', 'Veronica_Alexandra', 11),
(78, 'Rowan_Ballard', 4, '186.225.187.250', 1531553488, 'Mudou o número de telefone para 2651999', 'Rowan_Ballard', 4),
(79, 'Rowan_Ballard', 4, '186.225.187.250', 1531553519, 'Anúncio: Alô.', '', 0),
(80, 'Rowan_Ballard', 4, '186.225.187.250', 1531553550, 'Defina saúde para 0', 'Rowan_Ballard', 4),
(81, 'Rowan_Ballard', 4, '186.225.187.250', 1531553562, 'Colete definido para 0', 'Rowan_Ballard', 4),
(82, 'Rowan_Ballard', 4, '186.225.187.250', 1531553571, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(83, 'Rowan_Ballard', 4, '186.225.187.250', 1531553642, 'Veiculo destruido: Sandking (ID 168)', '', 0),
(84, 'Rowan_Ballard', 4, '186.225.187.250', 1531553672, 'Veiculo spawnado: Rancher (ID 168, Model 489)', '', 0),
(85, 'Veronica_Alexandra', 11, '164.163.207.8', 1531553709, 'Login (in-game)', '', 0),
(86, 'Veronica_Alexandra', 11, '164.163.207.8', 1531553731, 'Jogador teleportado', 'Rowan_Ballard', 4),
(87, 'Veronica_Alexandra', 11, '164.163.207.8', 1531553788, 'Jogador teleportado', 'Rowan_Ballard', 4),
(88, 'Veronica_Alexandra', 11, '164.163.207.8', 1531553855, 'Login (in-game)', '', 0),
(89, 'Veronica_Alexandra', 11, '164.163.207.8', 1531554040, 'Login (in-game)', '', 0),
(90, 'Veronica_Alexandra', 11, '164.163.207.8', 1531555510, 'Jogador puxado', 'Rowan_Ballard', 4),
(91, 'Veronica_Alexandra', 11, '164.163.207.8', 1531555848, 'Login (in-game)', '', 0),
(92, 'Veronica_Alexandra', 11, '164.163.207.8', 1531555900, 'Jogador puxado', 'Rowan_Ballard', 4),
(93, 'Veronica_Alexandra', 11, '164.163.207.8', 1531555921, 'Jogador puxado', 'Rowan_Ballard', 4),
(94, 'Veronica_Alexandra', 11, '164.163.207.8', 1531555980, 'Jogador puxado', 'Rowan_Ballard', 4),
(95, 'Veronica_Alexandra', 11, '164.163.207.8', 1531555987, 'Jogador puxado', 'Rowan_Ballard', 4),
(96, 'Veronica_Alexandra', 11, '164.163.207.8', 1531556148, 'Jogador teleportado', 'Rowan_Ballard', 4),
(97, 'Veronica_Alexandra', 11, '164.163.207.8', 1531557383, 'Login (in-game)', '', 0),
(98, 'Rowan_Ballard', 4, '186.225.187.250', 1531557612, 'Login (in-game)', '', 0),
(99, 'Rowan_Ballard', 4, '186.225.187.250', 1531557702, 'Veiculo spawnado: Rancher (ID 168, Model 489)', '', 0),
(100, 'Veronica_Alexandra', 11, '164.163.207.8', 1531557730, 'Jogador teleportado', 'Rowan_Ballard', 4),
(101, 'Veronica_Alexandra', 11, '164.163.207.8', 1531558507, 'Jogador teleportado', 'Rowan_Ballard', 4),
(102, 'Veronica_Alexandra', 11, '164.163.207.8', 1531558964, 'Jogador teleportado', 'Rowan_Ballard', 4),
(103, 'Veronica_Alexandra', 11, '164.163.207.8', 1531559738, 'Teleportado para Montgomery', 'Veronica_Alexandra', 11),
(104, 'Veronica_Alexandra', 11, '164.163.207.8', 1531560684, 'Login (in-game)', '', 0),
(105, 'Vincent_Henderson', 1, '192.168.1.5', 1531588922, 'Login (in-game)', '', 0),
(106, 'Rowan_Ballard', 4, '186.225.187.250', 1531588945, 'Login (in-game)', '', 0),
(107, 'Rowan_Ballard', 4, '186.225.187.250', 1531589078, 'Admin duty on', '', 0),
(108, 'Rowan_Ballard', 4, '186.225.187.250', 1531589107, 'Veiculo spawnado: Yosemite (ID 169, Model 554)', '', 0),
(109, 'Vincent_Henderson', 1, '192.168.1.5', 1531591368, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(110, 'Rowan_Ballard', 4, '186.225.187.250', 1531591369, 'Login (in-game)', '', 0),
(111, 'Rowan_Ballard', 4, '186.225.187.250', 1531591795, 'Veiculo spawnado: Sanchez (ID 170, Model 468)', '', 0),
(112, 'Vincent_Henderson', 1, '192.168.1.5', 1531733096, 'Login (in-game)', '', 0),
(113, 'Vincent_Henderson', 1, '192.168.1.5', 1531734603, 'Login (in-game)', '', 0),
(114, 'Vincent_Henderson', 1, '192.168.1.5', 1531736976, 'Login (in-game)', '', 0),
(115, 'Vincent_Henderson', 1, '192.168.1.5', 1531736986, 'Skin definida para 20002', 'Vincent_Henderson', 1),
(116, 'Vincent_Henderson', 1, '192.168.1.5', 1531737931, 'Login (in-game)', '', 0),
(117, 'Vincent_Henderson', 1, '192.168.1.5', 1531737945, 'Skin definida para 20003', 'Vincent_Henderson', 1),
(118, 'Vincent_Henderson', 1, '192.168.1.5', 1531737952, 'Skin definida para 20002', 'Vincent_Henderson', 1),
(119, 'Vincent_Henderson', 1, '192.168.1.5', 1531739486, 'Objeto temporário spawnado. (2879)', '', 0),
(120, 'Vincent_Henderson', 1, '192.168.1.5', 1531742930, 'Login (in-game)', '', 0),
(121, 'Vincent_Henderson', 1, '192.168.1.5', 1531742987, 'Objeto temporário spawnado. (2876)', '', 0),
(122, 'Vincent_Henderson', 1, '192.168.1.5', 1531743286, 'Login (in-game)', '', 0),
(123, 'Vincent_Henderson', 1, '192.168.1.5', 1531743761, 'Login (in-game)', '', 0),
(124, 'Vincent_Henderson', 1, '192.168.1.5', 1531744009, 'Login (in-game)', '', 0),
(125, 'Vincent_Henderson', 1, '192.168.1.5', 1531744017, 'Objeto temporário spawnado. (-2005)', '', 0),
(126, 'Vincent_Henderson', 1, '192.168.1.2', 1531834738, 'Login (in-game)', '', 0),
(127, 'Vincent_Henderson', 1, '192.168.1.2', 1531835375, 'Login (in-game)', '', 0),
(128, 'Vincent_Henderson', 1, '192.168.1.2', 1531836705, 'Login (in-game)', '', 0),
(129, 'Vincent_Henderson', 1, '192.168.1.2', 1531836720, 'Colete definido para 100', 'Vincent_Henderson', 1),
(130, 'Vincent_Henderson', 1, '192.168.1.2', 1531837403, 'Login (in-game)', '', 0),
(131, 'Vincent_Henderson', 1, '192.168.1.2', 1531838699, 'Login (in-game)', '', 0),
(132, 'Vincent_Henderson', 1, '192.168.1.2', 1531838817, 'Adicionado na Help Team', 'Vincent_Henderson', 1),
(133, 'Vincent_Henderson', 1, '192.168.1.2', 1531839620, 'Login (in-game)', '', 0),
(134, 'Vincent_Henderson', 1, '192.168.1.2', 1531839743, 'Admin duty on', '', 0),
(135, 'Vincent_Henderson', 1, '192.168.1.2', 1531839942, 'Login (in-game)', '', 0),
(136, 'Vincent_Henderson', 1, '192.168.1.2', 1531861130, 'Login (in-game)', '', 0),
(137, 'Vincent_Henderson', 1, '127.0.0.1', 1532131325, 'Login (in-game)', '', 0),
(138, 'Vincent_Henderson', 1, '127.0.0.1', 1532132577, 'Login (in-game)', '', 0),
(139, 'Vincent_Henderson', 1, '127.0.0.1', 1532133558, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(140, 'Vincent_Henderson', 1, '127.0.0.1', 1532133666, 'Login (in-game)', '', 0),
(141, 'Vincent_Henderson', 1, '127.0.0.1', 1532133936, 'Login (in-game)', '', 0),
(142, 'Veronica_Alexandra', 11, '192.168.1.4', 1532990905, 'Login (in-game)', '', 0),
(143, 'Veronica_Alexandra', 11, '192.168.1.4', 1532994246, 'Login (in-game)', '', 0),
(144, 'Veronica_Alexandra', 11, '192.168.1.4', 1533042565, 'Login (in-game)', '', 0),
(145, 'Veronica_Alexandra', 11, '192.168.1.4', 1533043306, 'Login (in-game)', '', 0),
(146, 'Vincent_Henderson', 1, '192.168.1.4', 1533044791, 'Login (in-game)', '', 0),
(147, 'Vincent_Henderson', 1, '192.168.1.4', 1533045802, 'Login (in-game)', '', 0),
(148, 'Vincent_Henderson', 1, '192.168.1.4', 1533046199, 'Login (in-game)', '', 0),
(149, 'Vincent_Henderson', 1, '192.168.1.4', 1533046287, 'Veiculo spawnado: Sandking (ID 168, Model 495)', '', 0),
(150, 'Vincent_Henderson', 1, '127.0.0.1', 1533046366, 'Login (in-game)', '', 0),
(151, 'Vincent_Henderson', 1, '127.0.0.1', 1533046377, 'Veiculo spawnado: Sandking (ID 169, Model 495)', '', 0),
(152, 'Vincent_Henderson', 1, '127.0.0.1', 1533050378, 'Login (in-game)', '', 0),
(153, 'Vincent_Henderson', 1, '127.0.0.1', 1533050456, 'Mudou o tempo para 11', '', 0),
(154, 'Vincent_Henderson', 1, '127.0.0.1', 1533050460, 'Mudou o tempo para 1', '', 0),
(155, 'Vincent_Henderson', 1, '127.0.0.1', 1533050462, 'Mudou o tempo para 2', '', 0),
(156, 'Vincent_Henderson', 1, '127.0.0.1', 1533050464, 'Mudou o tempo para 21', '', 0),
(157, 'Vincent_Henderson', 1, '127.0.0.1', 1533050475, 'Mudou o tempo para 12', '', 0),
(158, 'Vincent_Henderson', 1, '127.0.0.1', 1533050477, 'Mudou o tempo para 14', '', 0),
(159, 'Vincent_Henderson', 1, '127.0.0.1', 1533050543, 'Imediato GMX', '', 0),
(160, 'Vincent_Henderson', 1, '127.0.0.1', 1533050572, 'Login (in-game)', '', 0),
(161, 'Veronica_Alexandra', 11, '127.0.0.1', 1533052708, 'Login (in-game)', '', 0),
(162, 'Veronica_Alexandra', 11, '127.0.0.1', 1533052741, 'Veiculo spawnado: Sandking (ID 168, Model 495)', '', 0),
(163, 'Veronica_Alexandra', 11, '127.0.0.1', 1533052766, 'Mudou o tempo para 11', '', 0),
(164, 'Veronica_Alexandra', 11, '127.0.0.1', 1533052775, 'Mudou o tempo para 13', '', 0),
(165, 'Vincent_Henderson', 1, '127.0.0.1', 1533052980, 'Login (in-game)', '', 0),
(166, 'Vincent_Henderson', 1, '127.0.0.1', 1533053142, 'Veiculo spawnado: Sandking (ID 168, Model 495)', '', 0),
(167, 'Vincent_Henderson', 1, '127.0.0.1', 1533054954, 'Login (in-game)', '', 0),
(168, 'Vincent_Henderson', 1, '127.0.0.1', 1533055246, 'Objeto temporário spawnado. (8378)', '', 0),
(169, 'Vincent_Henderson', 1, '127.0.0.1', 1533055423, 'Objeto temporário spawnado. (8378)', '', 0),
(170, 'Vincent_Henderson', 1, '127.0.0.1', 1533055510, 'Objeto temporário spawnado. (8378)', '', 0),
(171, 'Vincent_Henderson', 1, '127.0.0.1', 1533055808, 'Login (in-game)', '', 0),
(172, 'Vincent_Henderson', 1, '127.0.0.1', 1533055859, 'Veiculo spawnado: Newsvan (ID 168, Model 582)', '', 0),
(173, 'Vincent_Henderson', 1, '127.0.0.1', 1533061617, 'Login (in-game)', '', 0),
(174, 'Vincent_Henderson', 1, '127.0.0.1', 1533062229, 'Login (in-game)', '', 0),
(175, 'Vincent_Henderson', 1, '127.0.0.1', 1533062247, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(176, 'Vincent_Henderson', 1, '127.0.0.1', 1533062316, 'Set faction to 6', 'Vincent_Henderson', 1),
(177, 'Vincent_Henderson', 1, '127.0.0.1', 1533062467, 'Veiculo spawnado: News Chopper (ID 168, Model 488)', '', 0),
(178, 'Vincent_Henderson', 1, '127.0.0.1', 1533063553, 'Todos facções da base de dados foram recarregadas', '', 0),
(179, 'Vincent_Henderson', 1, '127.0.0.1', 1533063711, 'Login (in-game)', '', 0),
(180, 'Vincent_Henderson', 1, '127.0.0.1', 1533063762, 'Veiculo spawnado: News Chopper (ID 168, Model 488)', '', 0),
(181, 'Vincent_Henderson', 1, '127.0.0.1', 1533063789, 'Criado f.veh por San Network(fid 6), ', '', 0),
(182, 'Vincent_Henderson', 1, '127.0.0.1', 1533063867, 'Veiculo spawnado: News Chopper (ID 169, Model 488)', '', 0),
(183, 'Vincent_Henderson', 1, '127.0.0.1', 1533063905, 'Criado f.veh por San Network(fid 6), ', '', 0),
(184, 'Vincent_Henderson', 1, '127.0.0.1', 1533063957, 'Veiculo spawnado: Newsvan (ID 170, Model 582)', '', 0),
(185, 'Vincent_Henderson', 1, '127.0.0.1', 1533063979, 'Veiculo spawnado: Newsvan (ID 171, Model 582)', '', 0),
(186, 'Vincent_Henderson', 1, '127.0.0.1', 1533064019, 'Veiculo spawnado: Newsvan (ID 172, Model 582)', '', 0),
(187, 'Vincent_Henderson', 1, '127.0.0.1', 1533064058, 'Veiculo spawnado: Newsvan (ID 173, Model 582)', '', 0),
(188, 'Vincent_Henderson', 1, '127.0.0.1', 1533064061, 'Veiculo spawnado: Newsvan (ID 174, Model 582)', '', 0),
(189, 'Vincent_Henderson', 1, '127.0.0.1', 1533064063, 'Veiculo spawnado: Newsvan (ID 175, Model 582)', '', 0),
(190, 'Vincent_Henderson', 1, '127.0.0.1', 1533064070, 'Veiculo spawnado: Newsvan (ID 176, Model 582)', '', 0),
(191, 'Vincent_Henderson', 1, '127.0.0.1', 1533064073, 'Veiculo spawnado: Newsvan (ID 177, Model 582)', '', 0),
(192, 'Vincent_Henderson', 1, '127.0.0.1', 1533064153, 'Veiculo spawnado: Newsvan (ID 178, Model 582)', '', 0),
(193, 'Vincent_Henderson', 1, '127.0.0.1', 1533064157, 'Veiculo spawnado: Newsvan (ID 179, Model 582)', '', 0),
(194, 'Vincent_Henderson', 1, '127.0.0.1', 1533064160, 'Veiculo spawnado: Newsvan (ID 180, Model 582)', '', 0),
(195, 'Vincent_Henderson', 1, '127.0.0.1', 1533064163, 'Veiculo spawnado: Newsvan (ID 181, Model 582)', '', 0),
(196, 'Vincent_Henderson', 1, '127.0.0.1', 1533064739, 'Veiculo spawnado: Stafford (ID 182, Model 580)', '', 0),
(197, 'Vincent_Henderson', 1, '127.0.0.1', 1533064747, 'Veiculo spawnado: Stafford (ID 183, Model 580)', '', 0),
(198, 'Vincent_Henderson', 1, '127.0.0.1', 1533064778, 'Veiculo spawnado: Washington (ID 184, Model 421)', '', 0),
(199, 'Vincent_Henderson', 1, '127.0.0.1', 1533064785, 'Veiculo spawnado: Washington (ID 185, Model 421)', '', 0),
(200, 'Vincent_Henderson', 1, '127.0.0.1', 1533064824, 'Veiculo spawnado: Elegant (ID 186, Model 507)', '', 0),
(201, 'Vincent_Henderson', 1, '127.0.0.1', 1533064829, 'Veiculo spawnado: Elegant (ID 187, Model 507)', '', 0),
(202, 'Vincent_Henderson', 1, '127.0.0.1', 1533064857, 'Veiculo spawnado: Premier (ID 188, Model 426)', '', 0),
(203, 'Vincent_Henderson', 1, '127.0.0.1', 1533064861, 'Veiculo spawnado: Premier (ID 189, Model 426)', '', 0),
(204, 'Vincent_Henderson', 1, '127.0.0.1', 1533064866, 'Veiculo spawnado: Premier (ID 190, Model 426)', '', 0),
(205, 'Vincent_Henderson', 1, '127.0.0.1', 1533064872, 'Veiculo spawnado: Premier (ID 191, Model 426)', '', 0),
(206, 'Vincent_Henderson', 1, '127.0.0.1', 1533064914, 'Veiculo spawnado: Quad (ID 192, Model 471)', '', 0),
(207, 'Vincent_Henderson', 1, '127.0.0.1', 1533064917, 'Veiculo spawnado: Quad (ID 193, Model 471)', '', 0),
(208, 'Vincent_Henderson', 1, '127.0.0.1', 1533064921, 'Veiculo spawnado: Quad (ID 194, Model 471)', '', 0),
(209, 'Vincent_Henderson', 1, '127.0.0.1', 1533064957, 'Veiculo spawnado: Mountain Bike (ID 195, Model 510)', '', 0),
(210, 'Vincent_Henderson', 1, '127.0.0.1', 1533064960, 'Veiculo spawnado: Mountain Bike (ID 196, Model 510)', '', 0),
(211, 'Vincent_Henderson', 1, '127.0.0.1', 1533065012, 'Veiculo spawnado: Mountain Bike (ID 197, Model 510)', '', 0),
(212, 'Vincent_Henderson', 1, '127.0.0.1', 1533065135, 'Veiculo spawnado: Huntley (ID 198, Model 579)', '', 0),
(213, 'Vincent_Henderson', 1, '127.0.0.1', 1533065137, 'Veiculo spawnado: Huntley (ID 199, Model 579)', '', 0),
(214, 'Vincent_Henderson', 1, '127.0.0.1', 1533065140, 'Veiculo spawnado: Huntley (ID 200, Model 579)', '', 0),
(215, 'Vincent_Henderson', 1, '127.0.0.1', 1533065142, 'Veiculo spawnado: Huntley (ID 201, Model 579)', '', 0),
(216, 'Vincent_Henderson', 1, '127.0.0.1', 1533065153, 'Veiculo spawnado: Huntley (ID 202, Model 579)', '', 0),
(217, 'Vincent_Henderson', 1, '127.0.0.1', 1533065240, 'Veiculo spawnado: Sanchez (ID 203, Model 468)', '', 0),
(218, 'Vincent_Henderson', 1, '127.0.0.1', 1533065244, 'Veiculo spawnado: Sanchez (ID 204, Model 468)', '', 0),
(219, 'Vincent_Henderson', 1, '127.0.0.1', 1533065261, 'Veiculo spawnado: Sanchez (ID 205, Model 468)', '', 0),
(220, 'Vincent_Henderson', 1, '127.0.0.1', 1533065264, 'Veiculo spawnado: Sanchez (ID 206, Model 468)', '', 0),
(221, 'Vincent_Henderson', 1, '127.0.0.1', 1533065412, 'Criado f.veh por San Network(fid 6), ', '', 0),
(222, 'Vincent_Henderson', 1, '127.0.0.1', 1533065421, 'Criado f.veh por San Network(fid 6), ', '', 0),
(223, 'Vincent_Henderson', 1, '127.0.0.1', 1533065433, 'Criado f.veh por San Network(fid 6), ', '', 0),
(224, 'Vincent_Henderson', 1, '127.0.0.1', 1533065440, 'Criado f.veh por San Network(fid 6), ', '', 0),
(225, 'Vincent_Henderson', 1, '127.0.0.1', 1533065446, 'Criado f.veh por San Network(fid 6), ', '', 0),
(226, 'Vincent_Henderson', 1, '127.0.0.1', 1533065452, 'Criado f.veh por San Network(fid 6), ', '', 0),
(227, 'Vincent_Henderson', 1, '127.0.0.1', 1533065564, 'Veiculo spawnado: Newsvan (ID 174, Model 582)', '', 0),
(228, 'Vincent_Henderson', 1, '127.0.0.1', 1533065566, 'Veiculo spawnado: Newsvan (ID 175, Model 582)', '', 0),
(229, 'Vincent_Henderson', 1, '127.0.0.1', 1533065569, 'Veiculo spawnado: Newsvan (ID 176, Model 582)', '', 0),
(230, 'Vincent_Henderson', 1, '127.0.0.1', 1533065579, 'Veiculo spawnado: Newsvan (ID 177, Model 582)', '', 0),
(231, 'Vincent_Henderson', 1, '127.0.0.1', 1533065581, 'Veiculo spawnado: Newsvan (ID 178, Model 582)', '', 0),
(232, 'Vincent_Henderson', 1, '127.0.0.1', 1533065583, 'Veiculo spawnado: Newsvan (ID 179, Model 582)', '', 0),
(233, 'Vincent_Henderson', 1, '127.0.0.1', 1533065601, 'Criado f.veh por San Network(fid 6), ', '', 0),
(234, 'Vincent_Henderson', 1, '127.0.0.1', 1533065617, 'Criado f.veh por San Network(fid 6), ', '', 0),
(235, 'Vincent_Henderson', 1, '127.0.0.1', 1533065633, 'Criado f.veh por San Network(fid 6), ', '', 0),
(236, 'Vincent_Henderson', 1, '127.0.0.1', 1533065645, 'Criado f.veh por San Network(fid 6), ', '', 0),
(237, 'Vincent_Henderson', 1, '127.0.0.1', 1533065670, 'Criado f.veh por San Network(fid 6), ', '', 0),
(238, 'Vincent_Henderson', 1, '127.0.0.1', 1533065687, 'Criado f.veh por San Network(fid 6), ', '', 0),
(239, 'Vincent_Henderson', 1, '127.0.0.1', 1533065733, 'Veiculo spawnado: Stafford (ID 182, Model 580)', '', 0),
(240, 'Vincent_Henderson', 1, '127.0.0.1', 1533065735, 'Veiculo spawnado: Stafford (ID 183, Model 580)', '', 0),
(241, 'Vincent_Henderson', 1, '127.0.0.1', 1533065748, 'Criado f.veh por San Network(fid 6), ', '', 0),
(242, 'Vincent_Henderson', 1, '127.0.0.1', 1533065757, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(243, 'Vincent_Henderson', 1, '127.0.0.1', 1533065761, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(244, 'Vincent_Henderson', 1, '127.0.0.1', 1533065805, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(245, 'Vincent_Henderson', 1, '127.0.0.1', 1533065890, 'Criado f.veh por San Network(fid 6), ', '', 0),
(246, 'Vincent_Henderson', 1, '127.0.0.1', 1533065910, 'Veiculo spawnado: Stafford (ID 184, Model 580)', '', 0),
(247, 'Vincent_Henderson', 1, '127.0.0.1', 1533065921, 'Criado f.veh por San Network(fid 6), ', '', 0),
(248, 'Vincent_Henderson', 1, '127.0.0.1', 1533065956, 'Veiculo spawnado: Elegant (ID 185, Model 507)', '', 0),
(249, 'Vincent_Henderson', 1, '127.0.0.1', 1533065957, 'Veiculo spawnado: Elegant (ID 186, Model 507)', '', 0),
(250, 'Vincent_Henderson', 1, '127.0.0.1', 1533065972, 'Veiculo spawnado: Elegant (ID 187, Model 507)', '', 0),
(251, 'Vincent_Henderson', 1, '127.0.0.1', 1533065990, 'Criado f.veh por San Network(fid 6), ', '', 0),
(252, 'Vincent_Henderson', 1, '127.0.0.1', 1533066019, 'Criado f.veh por San Network(fid 6), ', '', 0),
(253, 'Vincent_Henderson', 1, '127.0.0.1', 1533066034, 'Criado f.veh por San Network(fid 6), ', '', 0),
(254, 'Vincent_Henderson', 1, '127.0.0.1', 1533067217, 'Veiculo spawnado: Premier (ID 188, Model 426)', '', 0),
(255, 'Vincent_Henderson', 1, '127.0.0.1', 1533067219, 'Veiculo spawnado: Premier (ID 189, Model 426)', '', 0),
(256, 'Vincent_Henderson', 1, '127.0.0.1', 1533067224, 'Veiculo spawnado: Premier (ID 190, Model 426)', '', 0),
(257, 'Vincent_Henderson', 1, '127.0.0.1', 1533067252, 'Criado f.veh por San Network(fid 6), ', '', 0),
(258, 'Vincent_Henderson', 1, '127.0.0.1', 1533067279, 'Criado f.veh por San Network(fid 6), ', '', 0),
(259, 'Vincent_Henderson', 1, '127.0.0.1', 1533067296, 'Criado f.veh por San Network(fid 6), ', '', 0),
(260, 'Vincent_Henderson', 1, '127.0.0.1', 1533067353, 'Veiculo spawnado: Huntley (ID 191, Model 579)', '', 0),
(261, 'Vincent_Henderson', 1, '127.0.0.1', 1533067369, 'Criado f.veh por San Network(fid 6), ', '', 0),
(262, 'Vincent_Henderson', 1, '127.0.0.1', 1533067377, 'Veiculo spawnado: Huntley (ID 192, Model 579)', '', 0),
(263, 'Vincent_Henderson', 1, '127.0.0.1', 1533067380, 'Veiculo spawnado: Huntley (ID 193, Model 579)', '', 0),
(264, 'Vincent_Henderson', 1, '127.0.0.1', 1533067382, 'Veiculo spawnado: Huntley (ID 194, Model 579)', '', 0),
(265, 'Vincent_Henderson', 1, '127.0.0.1', 1533067389, 'Criado f.veh por San Network(fid 6), ', '', 0),
(266, 'Vincent_Henderson', 1, '127.0.0.1', 1533067404, 'Criado f.veh por San Network(fid 6), ', '', 0),
(267, 'Vincent_Henderson', 1, '127.0.0.1', 1533067419, 'Criado f.veh por San Network(fid 6), ', '', 0),
(268, 'Vincent_Henderson', 1, '127.0.0.1', 1533067471, 'Veiculo spawnado: Bus (ID 195, Model 431)', '', 0),
(269, 'Vincent_Henderson', 1, '127.0.0.1', 1533067502, 'Admin duty on', '', 0),
(270, 'Vincent_Henderson', 1, '127.0.0.1', 1533067547, 'Veiculo spawnado: Coach (ID 195, Model 437)', '', 0),
(271, 'Vincent_Henderson', 1, '127.0.0.1', 1533067580, 'Criado f.veh por San Network(fid 6), ', '', 0),
(272, 'Vincent_Henderson', 1, '127.0.0.1', 1533067604, 'Veiculo spawnado: Quad (ID 196, Model 471)', '', 0),
(273, 'Vincent_Henderson', 1, '127.0.0.1', 1533067607, 'Veiculo spawnado: Quad (ID 197, Model 471)', '', 0),
(274, 'Vincent_Henderson', 1, '127.0.0.1', 1533067613, 'Veiculo spawnado: Quad (ID 198, Model 471)', '', 0),
(275, 'Vincent_Henderson', 1, '127.0.0.1', 1533067634, 'Criado f.veh por San Network(fid 6), ', '', 0),
(276, 'Vincent_Henderson', 1, '127.0.0.1', 1533067638, 'Criado f.veh por San Network(fid 6), ', '', 0),
(277, 'Vincent_Henderson', 1, '127.0.0.1', 1533067642, 'Criado f.veh por San Network(fid 6), ', '', 0),
(278, 'Vincent_Henderson', 1, '127.0.0.1', 1533067651, 'Veiculo spawnado: Sanchez (ID 199, Model 468)', '', 0),
(279, 'Vincent_Henderson', 1, '127.0.0.1', 1533067660, 'Veiculo spawnado: Sanchez (ID 200, Model 468)', '', 0),
(280, 'Vincent_Henderson', 1, '127.0.0.1', 1533067662, 'Veiculo spawnado: Sanchez (ID 201, Model 468)', '', 0),
(281, 'Vincent_Henderson', 1, '127.0.0.1', 1533067686, 'Criado f.veh por San Network(fid 6), ', '', 0),
(282, 'Vincent_Henderson', 1, '127.0.0.1', 1533067689, 'Criado f.veh por San Network(fid 6), ', '', 0),
(283, 'Vincent_Henderson', 1, '127.0.0.1', 1533067693, 'Criado f.veh por San Network(fid 6), ', '', 0),
(284, 'Vincent_Henderson', 1, '127.0.0.1', 1533067736, 'Veiculo spawnado: Mountain Bike (ID 202, Model 510)', '', 0),
(285, 'Vincent_Henderson', 1, '127.0.0.1', 1533067748, 'Veiculo spawnado: Mountain Bike (ID 203, Model 510)', '', 0),
(286, 'Vincent_Henderson', 1, '127.0.0.1', 1533067761, 'Veiculo spawnado: Mountain Bike (ID 204, Model 510)', '', 0),
(287, 'Vincent_Henderson', 1, '127.0.0.1', 1533067776, 'Veiculo spawnado: Mountain Bike (ID 205, Model 510)', '', 0),
(288, 'Vincent_Henderson', 1, '127.0.0.1', 1533067783, 'Veiculo spawnado: Mountain Bike (ID 206, Model 510)', '', 0),
(289, 'Vincent_Henderson', 1, '127.0.0.1', 1533067795, 'Veiculo spawnado: Mountain Bike (ID 207, Model 510)', '', 0),
(290, 'Vincent_Henderson', 1, '127.0.0.1', 1533067811, 'Criado f.veh por San Network(fid 6), ', '', 0),
(291, 'Vincent_Henderson', 1, '127.0.0.1', 1533067815, 'Criado f.veh por San Network(fid 6), ', '', 0),
(292, 'Vincent_Henderson', 1, '127.0.0.1', 1533067819, 'Criado f.veh por San Network(fid 6), ', '', 0),
(293, 'Vincent_Henderson', 1, '127.0.0.1', 1533067876, 'Criado f.veh por San Network(fid 6), ', '', 0),
(294, 'Vincent_Henderson', 1, '127.0.0.1', 1533067880, 'Criado f.veh por San Network(fid 6), ', '', 0),
(295, 'Vincent_Henderson', 1, '127.0.0.1', 1533067932, 'Criado f.veh por San Network(fid 6), ', '', 0),
(296, 'Vincent_Henderson', 1, '127.0.0.1', 1533068002, 'Veiculo spawnado: Sentinel (ID 208, Model 405)', '', 0),
(297, 'Vincent_Henderson', 1, '127.0.0.1', 1533068016, 'Veiculo spawnado: Sentinel (ID 209, Model 405)', '', 0),
(298, 'Vincent_Henderson', 1, '127.0.0.1', 1533068043, 'Criado f.veh por San Network(fid 6), ', '', 0),
(299, 'Vincent_Henderson', 1, '127.0.0.1', 1533068049, 'Criado f.veh por San Network(fid 6), ', '', 0),
(300, 'Vincent_Henderson', 1, '127.0.0.1', 1533068112, 'Login (in-game)', '', 0),
(301, 'Vincent_Henderson', 1, '127.0.0.1', 1533068226, 'Login (in-game)', '', 0),
(302, 'Vincent_Henderson', 1, '127.0.0.1', 1533068273, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(303, 'Vincent_Henderson', 1, '127.0.0.1', 1533068757, 'Veiculo spawnado: Moonbeam (ID 210, Model 418)', '', 0),
(304, 'Vincent_Henderson', 1, '127.0.0.1', 1533068808, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(305, 'Vincent_Henderson', 1, '127.0.0.1', 1533068872, 'Set faction to 0', 'Vincent_Henderson', 1),
(306, 'Vincent_Henderson', 1, '127.0.0.1', 1533068875, 'Set faction to 1', 'Vincent_Henderson', 1),
(307, 'Vincent_Henderson', 1, '127.0.0.1', 1533069806, 'Login (in-game)', '', 0),
(308, 'Vincent_Henderson', 1, '127.0.0.1', 1533069843, 'Login (in-game)', '', 0),
(309, 'Vincent_Henderson', 1, '127.0.0.1', 1533069854, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(310, 'Vincent_Henderson', 1, '127.0.0.1', 1533070470, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(311, 'Vincent_Henderson', 1, '127.0.0.1', 1533070483, 'Set faction to 6', 'Vincent_Henderson', 1),
(312, 'Vincent_Henderson', 1, '127.0.0.1', 1533070700, 'Login (in-game)', '', 0),
(313, 'Vincent_Henderson', 1, '127.0.0.1', 1533071041, 'Login (in-game)', '', 0),
(314, 'Vincent_Henderson', 1, '127.0.0.1', 1533071444, 'Login (in-game)', '', 0),
(315, 'Vincent_Henderson', 1, '127.0.0.1', 1533072985, 'Login (in-game)', '', 0),
(316, 'Vincent_Henderson', 1, '127.0.0.1', 1533073022, 'Login (in-game)', '', 0),
(317, 'Vincent_Henderson', 1, '127.0.0.1', 1533073062, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(318, 'Vincent_Henderson', 1, '127.0.0.1', 1533076030, 'Login (in-game)', '', 0),
(319, 'Vincent_Henderson', 1, '127.0.0.1', 1533076233, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(320, 'Vincent_Henderson', 1, '127.0.0.1', 1533077161, 'Set faction to 1', 'Vincent_Henderson', 1),
(321, 'Mingau_Reptiliano', 12, '127.0.0.1', 1533083248, 'Login (in-game)', '', 0),
(322, 'Veronica_Alexandra', 11, '192.168.1.5', 1533406441, 'Login (in-game)', '', 0),
(323, 'Veronica_Alexandra', 11, '164.163.207.59', 1533413949, 'Login (in-game)', '', 0),
(324, 'Veronica_Alexandra', 11, '127.0.0.1', 1533418378, 'Login (in-game)', '', 0),
(325, 'Veronica_Alexandra', 11, '192.168.1.5', 1533448936, 'Login (in-game)', '', 0),
(326, 'Veronica_Alexandra', 11, '164.163.207.59', 1533511706, 'Login (in-game)', '', 0),
(327, 'Veronica_Alexandra', 11, '164.163.207.59', 1533512122, 'Login (in-game)', '', 0),
(328, 'Veronica_Alexandra', 11, '164.163.207.59', 1533512380, 'Login (in-game)', '', 0),
(329, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565181, 'Login (in-game)', '', 0),
(330, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565372, 'Mudou o tempo para 11', '', 0),
(331, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565374, 'Mudou o tempo para 21', '', 0),
(332, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565384, 'Mudou o tempo para 19', '', 0),
(333, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565387, 'Mudou o tempo para 20', '', 0),
(334, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565389, 'Mudou o tempo para 21', '', 0),
(335, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565390, 'Mudou o tempo para 23', '', 0),
(336, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565392, 'Mudou o tempo para 22', '', 0),
(337, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565399, 'Mudou o tempo para 7', '', 0),
(338, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565402, 'Mudou o tempo para 10', '', 0),
(339, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565404, 'Mudou o tempo para 6', '', 0),
(340, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565405, 'Mudou o tempo para 3', '', 0),
(341, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565408, 'Mudou o tempo para 4', '', 0),
(342, 'Veronica_Alexandra', 11, '127.0.0.1', 1533565413, 'Mudou o tempo para 21', '', 0),
(343, 'Veronica_Alexandra', 11, '192.168.1.6', 1533655443, 'Login (in-game)', '', 0),
(344, 'Veronica_Alexandra', 11, '192.168.1.6', 1533655507, 'Mudou o tempo para 11', '', 0),
(345, 'Vincent_Henderson', 1, '192.168.1.6', 1533658297, 'Login (in-game)', '', 0),
(346, 'Vincent_Henderson', 1, '192.168.1.6', 1533658428, 'Veiculo spawnado: Baggage (ID 210, Model 485)', '', 0),
(347, 'Vincent_Henderson', 1, '192.168.1.6', 1533658441, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(348, 'Vincent_Henderson', 1, '192.168.1.6', 1533658449, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(349, 'Vincent_Henderson', 1, '192.168.1.6', 1533658509, 'Colete definido para 0', 'Vincent_Henderson', 1),
(350, 'Vincent_Henderson', 1, '192.168.1.6', 1533658704, 'Login (in-game)', '', 0),
(351, 'Vincent_Henderson', 1, '192.168.1.6', 1533659155, 'Login (in-game)', '', 0),
(352, 'Vincent_Henderson', 1, '192.168.1.6', 1533659165, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(353, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659546, 'Login (in-game)', '', 0),
(354, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659628, 'Mudou o tempo para 21', '', 0),
(355, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659631, 'Mudou o tempo para 22', '', 0),
(356, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659639, 'Mudou o tempo para 23', '', 0),
(357, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659654, 'Mudou o tempo para 23', '', 0),
(358, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659660, 'Mudou o tempo para 24', '', 0),
(359, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659666, 'Defina saúde para 100', 'Veronica_Alexandra', 11),
(360, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659676, 'Defina saúde para 11', 'Veronica_Alexandra', 11),
(361, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659680, 'Defina saúde para 100', 'Veronica_Alexandra', 11),
(362, 'Veronica_Alexandra', 11, '192.168.1.6', 1533659684, 'Mudou o tempo para 11', '', 0),
(363, 'Veronica_Alexandra', 11, '192.168.1.6', 1533660019, 'Login (in-game)', '', 0),
(364, 'Veronica_Alexandra', 11, '192.168.1.6', 1533660137, 'Mudou o tempo para 21', '', 0),
(365, 'Veronica_Alexandra', 11, '192.168.1.6', 1533660142, 'Mudou o tempo para 23', '', 0),
(366, 'Veronica_Alexandra', 11, '192.168.1.6', 1533660150, 'Mudou o tempo para 24', '', 0),
(367, 'Veronica_Alexandra', 11, '192.168.1.6', 1533660151, 'Mudou o tempo para 1', '', 0),
(368, 'Veronica_Alexandra', 11, '192.168.1.6', 1533660153, 'Mudou o tempo para 3', '', 0),
(369, 'Veronica_Alexandra', 11, '192.168.1.6', 1533660156, 'Mudou o tempo para 21', '', 0),
(370, 'Veronica_Alexandra', 11, '192.168.1.6', 1533660164, 'Mudou o tempo para 11', '', 0),
(371, 'Veronica_Alexandra', 11, '192.168.1.4', 1533674643, 'Login (in-game)', '', 0),
(372, 'Veronica_Alexandra', 11, '192.168.1.4', 1533674981, 'Login (in-game)', '', 0),
(373, 'Veronica_Alexandra', 11, '192.168.1.4', 1533681786, 'Login (in-game)', '', 0),
(374, 'Veronica_Alexandra', 11, '192.168.1.4', 1533682595, 'Login (in-game)', '', 0),
(375, 'Veronica_Alexandra', 11, '192.168.1.4', 1533683068, 'Login (in-game)', '', 0),
(376, 'Veronica_Alexandra', 11, '192.168.1.4', 1533683995, 'Login (in-game)', '', 0),
(377, 'Veronica_Alexandra', 11, '192.168.1.4', 1533684012, 'Objeto temporário spawnado. (-1000)', '', 0),
(378, 'Veronica_Alexandra', 11, '192.168.1.4', 1533685840, 'Login (in-game)', '', 0),
(379, 'Veronica_Alexandra', 11, '192.168.1.4', 1533685883, 'Objeto temporário spawnado. (-1000)', '', 0),
(380, 'Veronica_Alexandra', 11, '192.168.1.4', 1533686521, 'Login (in-game)', '', 0),
(381, 'Vincent_Henderson', 1, '192.168.1.4', 1533686859, 'Login (in-game)', '', 0),
(382, 'Vincent_Henderson', 1, '192.168.1.4', 1533686911, 'Skin definida para 20000', 'Vincent_Henderson', 1),
(383, 'Vincent_Henderson', 1, '192.168.1.4', 1533686920, 'Skin definida para 20001', 'Vincent_Henderson', 1),
(384, 'Veronica_Alexandra', 11, '192.168.1.3', 1533729854, 'Login (in-game)', '', 0),
(385, 'Veronica_Alexandra', 11, '192.168.1.3', 1533730058, 'Imediato GMX', '', 0),
(386, 'Veronica_Alexandra', 11, '192.168.1.3', 1533730083, 'Login (in-game)', '', 0),
(387, 'Veronica_Alexandra', 11, '192.168.1.3', 1533730561, 'Login (in-game)', '', 0),
(388, 'Veronica_Alexandra', 11, '192.168.1.3', 1533731010, 'Login (in-game)', '', 0),
(389, 'Veronica_Alexandra', 11, '192.168.1.3', 1533731029, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(390, 'Vincent_Henderson', 1, '192.168.1.3', 1533731216, 'Login (in-game)', '', 0),
(391, 'Vincent_Henderson', 1, '192.168.1.3', 1533731229, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(392, 'Vincent_Henderson', 1, '192.168.1.3', 1533732096, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(393, 'Vincent_Henderson', 1, '192.168.1.3', 1533732101, 'Imediato GMX', '', 0),
(394, 'Veronica_Alexandra', 11, '192.168.1.3', 1533732129, 'Login (in-game)', '', 0),
(395, 'Vincent_Henderson', 1, '192.168.1.3', 1533732145, 'Login (in-game)', '', 0),
(396, 'Veronica_Alexandra', 11, '192.168.1.3', 1533759127, 'Login (in-game)', '', 0),
(397, 'Vincent_Henderson', 1, '192.168.1.3', 1533759224, 'Login (in-game)', '', 0),
(398, 'Vincent_Henderson', 1, '192.168.1.3', 1533759251, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(399, 'Scottler_Johnson', 13, '177.102.11.125', 1533769707, 'Login (in-game)', '', 0),
(400, 'Veronica_Alexandra', 11, '164.163.207.30', 1533769719, 'Login (in-game)', '', 0),
(401, 'Veronica_Alexandra', 11, '164.163.207.30', 1533769751, 'Jogador teleportado', 'Scottler_Johnson', 13),
(402, 'Veronica_Alexandra', 11, '164.163.207.30', 1533769988, 'Login (in-game)', '', 0),
(403, 'Scottler_Johnson', 13, '177.102.11.125', 1533770025, 'Login (in-game)', '', 0),
(404, 'Scottler_Johnson', 13, '177.102.11.125', 1533770325, 'Login (in-game)', '', 0),
(405, 'Scottler_Johnson', 13, '177.102.11.125', 1533771025, 'Login (in-game)', '', 0),
(406, 'Vincent_Henderson', 1, '164.163.207.30', 1533771087, 'Login (in-game)', '', 0),
(407, 'Vincent_Henderson', 1, '164.163.207.30', 1533771162, 'Jogador teleportado', 'Scottler_Johnson', 13),
(408, 'Scottler_Johnson', 13, '177.102.11.125', 1533771287, 'Login (in-game)', '', 0),
(409, 'Veronica_Alexandra', 11, '164.163.207.30', 1533771613, 'Login (in-game)', '', 0),
(410, 'Scottler_Johnson', 13, '177.102.11.125', 1533771746, 'Login (in-game)', '', 0),
(411, 'Veronica_Alexandra', 11, '164.163.207.30', 1533771769, 'Jogador puxado', 'Scottler_Johnson', 13),
(412, 'Vincent_Henderson', 1, '164.163.207.30', 1533771883, 'Login (in-game)', '', 0),
(413, 'Veronica_Alexandra', 11, '164.163.207.30', 1533771899, 'Login (in-game)', '', 0),
(414, 'Scottler_Johnson', 13, '177.102.11.125', 1533773048, 'Login (in-game)', '', 0),
(415, 'Vincent_Henderson', 1, '164.163.207.30', 1533773057, 'Login (in-game)', '', 0),
(416, 'Scottler_Johnson', 13, '177.102.11.125', 1533773076, 'Jogador teleportado', 'Vincent_Henderson', 1),
(417, 'Scottler_Johnson', 13, '177.102.11.125', 1533773110, 'Login (in-game)', '', 0),
(418, 'Scottler_Johnson', 13, '177.102.11.125', 1533773136, 'Login (in-game)', '', 0),
(419, 'Vincent_Henderson', 1, '164.163.207.30', 1533773321, 'Jogador teleportado', 'Scottler_Johnson', 13),
(420, 'Vincent_Henderson', 1, '164.163.207.30', 1533773333, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(421, 'Scottler_Johnson', 13, '177.102.11.125', 1533773351, 'Jogador teleportado', 'Vincent_Henderson', 1),
(422, 'Scottler_Johnson', 13, '177.102.11.125', 1533773362, 'Jogador teleportado', 'Vincent_Henderson', 1),
(423, 'Veronica_Alexandra', 11, '164.163.207.30', 1533773471, 'Login (in-game)', '', 0),
(424, 'Scottler_Johnson', 13, '177.102.11.125', 1533774281, 'Login (in-game)', '', 0),
(425, 'Scottler_Johnson', 13, '177.102.11.125', 1533774287, 'Login (in-game)', '', 0),
(426, 'Scottler_Johnson', 13, '177.102.11.125', 1533777185, 'Login (in-game)', '', 0),
(427, 'Vincent_Henderson', 1, '164.163.207.30', 1533777349, 'Login (in-game)', '', 0),
(428, 'Scottler_Johnson', 13, '177.102.11.125', 1533777353, 'Jogador teleportado', 'Vincent_Henderson', 1),
(429, 'Vincent_Henderson', 1, '164.163.207.30', 1533777380, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(430, 'Scottler_Johnson', 13, '177.102.11.125', 1533777383, 'Jogador teleportado', 'Vincent_Henderson', 1),
(431, 'Scottler_Johnson', 13, '177.102.11.125', 1533777439, 'Jogador teleportado', 'Vincent_Henderson', 1),
(432, 'Scottler_Johnson', 13, '177.102.11.125', 1533777448, 'Jogador teleportado', 'Vincent_Henderson', 1),
(433, 'Vincent_Henderson', 1, '192.168.1.8', 1533832344, 'Login (in-game)', '', 0),
(434, 'Vincent_Henderson', 1, '192.168.1.8', 1533833068, 'Login (in-game)', '', 0),
(435, 'Vincent_Henderson', 1, '192.168.1.8', 1533833270, 'Set faction to 0', 'Vincent_Henderson', 1),
(436, 'Vincent_Henderson', 1, '192.168.1.8', 1533833396, 'Set faction to 6', 'Vincent_Henderson', 1),
(437, 'Vincent_Henderson', 1, '192.168.1.8', 1533835340, 'Login (in-game)', '', 0),
(438, 'Vincent_Henderson', 1, '192.168.1.8', 1533835382, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(439, 'Vincent_Henderson', 1, '192.168.1.8', 1533839910, 'Login (in-game)', '', 0),
(440, 'Vincent_Henderson', 1, '192.168.1.8', 1533841024, 'Imediato GMX', '', 0),
(441, 'Vincent_Henderson', 1, '192.168.1.8', 1533841048, 'Login (in-game)', '', 0),
(442, 'Vincent_Henderson', 1, '192.168.1.8', 1533844400, 'Login (in-game)', '', 0),
(443, 'Vincent_Henderson', 1, '192.168.1.6', 1533939255, 'Login (in-game)', '', 0),
(444, 'Vincent_Henderson', 1, '192.168.1.2', 1534010463, 'Login (in-game)', '', 0),
(445, 'Vincent_Henderson', 1, '192.168.1.2', 1534010514, 'Colete definido para 100', 'Vincent_Henderson', 1),
(446, 'Vincent_Henderson', 1, '192.168.1.2', 1534010519, 'Colete definido para 0', 'Vincent_Henderson', 1),
(447, 'Vincent_Henderson', 1, '192.168.1.2', 1534010530, 'Set faction to 1', 'Vincent_Henderson', 1),
(448, 'Vincent_Henderson', 1, '192.168.1.2', 1534010533, 'Colete definido para 100', 'Vincent_Henderson', 1),
(449, 'Vincent_Henderson', 1, '192.168.1.2', 1534010606, 'Colete definido para 0', 'Vincent_Henderson', 1),
(450, 'Vincent_Henderson', 1, '192.168.1.2', 1534227373, 'Login (in-game)', '', 0),
(451, 'Vincent_Henderson', 1, '192.168.1.2', 1534227911, 'Login (in-game)', '', 0),
(452, 'Vincent_Henderson', 1, '192.168.1.7', 1534297177, 'Login (in-game)', '', 0),
(453, 'Vincent_Henderson', 1, '192.168.1.7', 1534297318, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(454, 'Vincent_Henderson', 1, '192.168.1.7', 1534297704, 'Login (in-game)', '', 0),
(455, 'Vincent_Henderson', 1, '127.0.0.1', 1534297806, 'Login (in-game)', '', 0),
(456, 'Vincent_Henderson', 1, '127.0.0.1', 1534300140, 'Login (in-game)', '', 0),
(457, 'Vincent_Henderson', 1, '127.0.0.1', 1534300170, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(458, 'Vincent_Henderson', 1, '127.0.0.1', 1534300259, 'Login (in-game)', '', 0),
(459, 'Vincent_Henderson', 1, '127.0.0.1', 1534304787, 'Login (in-game)', '', 0),
(460, 'Vincent_Henderson', 1, '127.0.0.1', 1534305304, 'Login (in-game)', '', 0),
(461, 'Vincent_Henderson', 1, '127.0.0.1', 1534305325, 'Colete definido para 100', 'Vincent_Henderson', 1),
(462, 'Vincent_Henderson', 1, '127.0.0.1', 1534305330, 'Colete definido para 0', 'Vincent_Henderson', 1),
(463, 'Vincent_Henderson', 1, '127.0.0.1', 1534305673, 'Login (in-game)', '', 0),
(464, 'Vincent_Henderson', 1, '127.0.0.1', 1534305684, 'Colete definido para 100', 'Vincent_Henderson', 1),
(465, 'Vincent_Henderson', 1, '127.0.0.1', 1534307016, 'Login (in-game)', '', 0),
(466, 'Vincent_Henderson', 1, '127.0.0.1', 1534307294, 'Login (in-game)', '', 0),
(467, 'Vincent_Henderson', 1, '127.0.0.1', 1534308351, 'Login (in-game)', '', 0),
(468, 'Vincent_Henderson', 1, '127.0.0.1', 1534308534, 'Login (in-game)', '', 0),
(469, 'Vincent_Henderson', 1, '127.0.0.1', 1534308754, 'Login (in-game)', '', 0),
(470, 'Vincent_Henderson', 1, '127.0.0.1', 1534308894, 'Login (in-game)', '', 0),
(471, 'Vincent_Henderson', 1, '127.0.0.1', 1534309882, 'Login (in-game)', '', 0),
(472, 'Vincent_Henderson', 1, '127.0.0.1', 1534310593, 'Login (in-game)', '', 0),
(473, 'Vincent_Henderson', 1, '127.0.0.1', 1534310614, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(474, 'Vincent_Henderson', 1, '127.0.0.1', 1534310652, 'Login (in-game)', '', 0),
(475, 'Vincent_Henderson', 1, '127.0.0.1', 1534310665, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(476, 'Vincent_Henderson', 1, '127.0.0.1', 1534311070, 'Login (in-game)', '', 0),
(477, 'Vincent_Henderson', 1, '127.0.0.1', 1534311306, 'Login (in-game)', '', 0),
(478, 'Vincent_Henderson', 1, '127.0.0.1', 1534312166, 'Login (in-game)', '', 0),
(479, 'Vincent_Henderson', 1, '127.0.0.1', 1534312637, 'Login (in-game)', '', 0),
(480, 'Vincent_Henderson', 1, '127.0.0.1', 1534312963, 'Login (in-game)', '', 0),
(481, 'Vincent_Henderson', 1, '127.0.0.1', 1534313401, 'Login (in-game)', '', 0),
(482, 'Vincent_Henderson', 1, '127.0.0.1', 1534313959, 'Login (in-game)', '', 0),
(483, 'Vincent_Henderson', 1, '127.0.0.1', 1534348099, 'Login (in-game)', '', 0),
(484, 'Vincent_Henderson', 1, '127.0.0.1', 1534348566, 'Imediato GMX', '', 0),
(485, 'Vincent_Henderson', 1, '127.0.0.1', 1534348589, 'Login (in-game)', '', 0),
(486, 'Vincent_Henderson', 1, '127.0.0.1', 1534348604, 'Login (in-game)', '', 0),
(487, 'Vincent_Henderson', 1, '127.0.0.1', 1534348621, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(488, 'Vincent_Henderson', 1, '127.0.0.1', 1534349033, 'Login (in-game)', '', 0),
(489, 'Vincent_Henderson', 1, '127.0.0.1', 1534349185, 'Login (in-game)', '', 0),
(490, 'Vincent_Henderson', 1, '127.0.0.1', 1534349310, 'Login (in-game)', '', 0),
(491, 'Vincent_Henderson', 1, '127.0.0.1', 1534349405, 'Imediato GMX', '', 0),
(492, 'Vincent_Henderson', 1, '127.0.0.1', 1534349428, 'Login (in-game)', '', 0),
(493, 'Vincent_Henderson', 1, '127.0.0.1', 1534349610, 'Login (in-game)', '', 0),
(494, 'Vincent_Henderson', 1, '127.0.0.1', 1534350198, 'Imediato GMX', '', 0),
(495, 'Vincent_Henderson', 1, '127.0.0.1', 1534350229, 'Login (in-game)', '', 0),
(496, 'Vincent_Henderson', 1, '127.0.0.1', 1534350252, 'Teleportado para Bayside', 'Vincent_Henderson', 1),
(497, 'Vincent_Henderson', 1, '127.0.0.1', 1534351567, 'Login (in-game)', '', 0),
(498, 'Vincent_Henderson', 1, '127.0.0.1', 1534351896, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(499, 'Vincent_Henderson', 1, '192.168.1.8', 1534459825, 'Login (in-game)', '', 0),
(500, 'Vincent_Henderson', 1, '192.168.1.8', 1534459829, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(501, 'Vincent_Henderson', 1, '192.168.1.8', 1534459902, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(502, 'Vincent_Henderson', 1, '192.168.1.8', 1534460208, 'Login (in-game)', '', 0),
(503, 'Vincent_Henderson', 1, '192.168.1.8', 1534460214, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(504, 'Vincent_Henderson', 1, '192.168.1.8', 1534460658, 'Login (in-game)', '', 0),
(505, 'Vincent_Henderson', 1, '192.168.1.8', 1534460665, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(506, 'Vincent_Henderson', 1, '192.168.1.8', 1534460882, 'Imediato GMX', '', 0),
(507, 'Vincent_Henderson', 1, '192.168.1.8', 1534460904, 'Login (in-game)', '', 0),
(508, 'Vincent_Henderson', 1, '192.168.1.8', 1534460912, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(509, 'Vincent_Henderson', 1, '192.168.1.8', 1534462004, 'Login (in-game)', '', 0),
(510, 'Vincent_Henderson', 1, '192.168.1.8', 1534462016, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(511, 'Vincent_Henderson', 1, '192.168.1.8', 1534463003, 'Imediato GMX', '', 0),
(512, 'Vincent_Henderson', 1, '192.168.1.8', 1534463025, 'Login (in-game)', '', 0),
(513, 'Vincent_Henderson', 1, '192.168.1.8', 1534463034, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(514, 'Vincent_Henderson', 1, '192.168.1.8', 1534463229, 'Set faction to 6', 'Vincent_Henderson', 1),
(515, 'Vincent_Henderson', 1, '192.168.1.8', 1534464887, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(516, 'Vincent_Henderson', 1, '192.168.1.8', 1534464921, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(517, 'Vincent_Henderson', 1, '192.168.1.8', 1534464984, 'Set faction to 13', 'Vincent_Henderson', 1),
(518, 'Vincent_Henderson', 1, '192.168.1.8', 1534464987, 'Set faction to 2', 'Vincent_Henderson', 1),
(519, 'Vincent_Henderson', 1, '192.168.1.8', 1534465309, 'Colete definido para 0', 'Vincent_Henderson', 1),
(520, 'Vincent_Henderson', 1, '192.168.1.8', 1534465327, 'Set faction to 10', 'Vincent_Henderson', 1),
(521, 'Vincent_Henderson', 1, '192.168.1.8', 1534465422, 'Imediato GMX', '', 0),
(522, 'Vincent_Henderson', 1, '127.0.0.1', 1534465479, 'Login (in-game)', '', 0);
INSERT INTO `adminlog` (`id`, `AdminName`, `AdminSQLID`, `IP`, `Timestamp`, `Action`, `AgainstName`, `AgainstSQLID`) VALUES
(523, 'Vincent_Henderson', 1, '127.0.0.1', 1534465502, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(524, 'Vincent_Henderson', 1, '127.0.0.1', 1534465508, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(525, 'Vincent_Henderson', 1, '127.0.0.1', 1534466144, 'Imediato GMX', '', 0),
(526, 'Vincent_Henderson', 1, '127.0.0.1', 1534466170, 'Login (in-game)', '', 0),
(527, 'Vincent_Henderson', 1, '127.0.0.1', 1534466204, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(528, 'Vincent_Henderson', 1, '127.0.0.1', 1534466233, 'Set faction to 1', 'Vincent_Henderson', 1),
(529, 'Vincent_Henderson', 1, '127.0.0.1', 1534468620, 'Login (in-game)', '', 0),
(530, 'Vincent_Henderson', 1, '127.0.0.1', 1534468650, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(531, 'Vincent_Henderson', 1, '127.0.0.1', 1534469855, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(532, 'Vincent_Henderson', 1, '127.0.0.1', 1534470037, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(533, 'Vincent_Henderson', 1, '127.0.0.1', 1534471012, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(534, 'Vincent_Henderson', 1, '127.0.0.1', 1534471201, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(535, 'Vincent_Henderson', 1, '127.0.0.1', 1534471675, 'Imediato GMX', '', 0),
(536, 'Vincent_Henderson', 1, '127.0.0.1', 1534471702, 'Login (in-game)', '', 0),
(537, 'Vincent_Henderson', 1, '127.0.0.1', 1534471705, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(538, 'Vincent_Henderson', 1, '127.0.0.1', 1534472146, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(539, 'Vincent_Henderson', 1, '127.0.0.1', 1534472170, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(540, 'Vincent_Henderson', 1, '127.0.0.1', 1534472198, 'Login (in-game)', '', 0),
(541, 'Vincent_Henderson', 1, '127.0.0.1', 1534472205, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(542, 'Vincent_Henderson', 1, '127.0.0.1', 1534472280, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(543, 'Doquinha_Teste', 14, '127.0.0.1', 1534472887, 'Login (in-game)', '', 0),
(544, 'Doquinha_Teste', 14, '127.0.0.1', 1534472915, 'Login (in-game)', '', 0),
(545, 'Vincent_Henderson', 1, '127.0.0.1', 1534473500, 'Login (in-game)', '', 0),
(546, 'Vincent_Henderson', 1, '127.0.0.1', 1534473512, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(547, 'Vincent_Henderson', 1, '127.0.0.1', 1534483597, 'Login (in-game)', '', 0),
(548, 'Vincent_Henderson', 1, '127.0.0.1', 1534483605, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(549, 'Vincent_Henderson', 1, '127.0.0.1', 1534485020, 'Login (in-game)', '', 0),
(550, 'Vincent_Henderson', 1, '127.0.0.1', 1534485271, 'Login (in-game)', '', 0),
(551, 'Vincent_Henderson', 1, '127.0.0.1', 1534485284, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(552, 'Vincent_Henderson', 1, '127.0.0.1', 1534485476, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(553, 'Vincent_Henderson', 1, '127.0.0.1', 1534485481, 'Imediato GMX', '', 0),
(554, 'Vincent_Henderson', 1, '127.0.0.1', 1534485506, 'Login (in-game)', '', 0),
(555, 'Vincent_Henderson', 1, '127.0.0.1', 1534485830, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(556, 'Vincent_Henderson', 1, '127.0.0.1', 1534486423, 'Imediato GMX', '', 0),
(557, 'Vincent_Henderson', 1, '127.0.0.1', 1534486470, 'Login (in-game)', '', 0),
(558, 'Vincent_Henderson', 1, '127.0.0.1', 1534486483, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(559, 'Vincent_Henderson', 1, '127.0.0.1', 1534486799, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(560, 'Vincent_Henderson', 1, '127.0.0.1', 1534487525, 'Imediato GMX', '', 0),
(561, 'Vincent_Henderson', 1, '127.0.0.1', 1534487557, 'Login (in-game)', '', 0),
(562, 'Vincent_Henderson', 1, '127.0.0.1', 1534487566, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(563, 'Vincent_Henderson', 1, '127.0.0.1', 1534487673, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(564, 'Vincent_Henderson', 1, '127.0.0.1', 1534488229, 'Imediato GMX', '', 0),
(565, 'Vincent_Henderson', 1, '127.0.0.1', 1534488279, 'Login (in-game)', '', 0),
(566, 'Vincent_Henderson', 1, '127.0.0.1', 1534488291, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(567, 'Vincent_Henderson', 1, '127.0.0.1', 1534488633, 'Set faction to 10', 'Vincent_Henderson', 1),
(568, 'Vincent_Henderson', 1, '127.0.0.1', 1534490548, 'Login (in-game)', '', 0),
(569, 'Vincent_Henderson', 1, '127.0.0.1', 1534490559, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(570, 'Vincent_Henderson', 1, '127.0.0.1', 1534490570, 'Set faction to 1', 'Vincent_Henderson', 1),
(571, 'Vincent_Henderson', 1, '127.0.0.1', 1534491621, 'Login (in-game)', '', 0),
(572, 'Vincent_Henderson', 1, '127.0.0.1', 1534491629, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(573, 'Vincent_Henderson', 1, '164.163.207.101', 1534527693, 'Login (in-game)', '', 0),
(574, 'Vincent_Henderson', 1, '164.163.207.101', 1534527730, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(575, 'Scottler_Johnson', 13, '177.188.198.248', 1534527797, 'Login (in-game)', '', 0),
(576, 'Scottler_Johnson', 13, '177.188.198.248', 1534527822, 'Jogador teleportado', 'Vincent_Henderson', 1),
(577, 'Vincent_Henderson', 1, '164.163.207.101', 1534527949, 'Jogador puxado', 'Scottler_Johnson', 13),
(578, 'Vincent_Henderson', 1, '164.163.207.101', 1534528495, 'Todos facções da base de dados foram recarregadas', '', 0),
(579, 'Vincent_Henderson', 1, '164.163.207.101', 1534529543, 'Login (in-game)', '', 0),
(580, 'Scottler_Johnson', 13, '177.188.198.248', 1534529561, 'Login (in-game)', '', 0),
(581, 'Vincent_Henderson', 1, '164.163.207.101', 1534529562, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(582, 'Scottler_Johnson', 13, '177.188.198.248', 1534529577, 'Jogador teleportado', 'Vincent_Henderson', 1),
(583, 'Vincent_Henderson', 1, '164.163.207.101', 1534530000, 'Login (in-game)', '', 0),
(584, 'Vincent_Henderson', 1, '164.163.207.101', 1534530035, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(585, 'Scottler_Johnson', 13, '177.188.198.248', 1534530038, 'Jogador teleportado', 'Vincent_Henderson', 1),
(586, 'Vincent_Henderson', 1, '164.163.207.101', 1534530096, 'Set faction to 10', 'Scottler_Johnson', 13),
(587, 'Vincent_Henderson', 1, '164.163.207.101', 1534530106, 'Set faction to 10', 'Vincent_Henderson', 1),
(588, 'Vincent_Henderson', 1, '164.163.207.101', 1534530401, 'Todos facções da base de dados foram recarregadas', '', 0),
(589, 'Vincent_Henderson', 1, '164.163.207.101', 1534532710, 'Login (in-game)', '', 0),
(590, 'Dwayner_Marquez', 15, '164.163.207.101', 1534532715, 'Login (in-game)', '', 0),
(591, 'Vincent_Henderson', 1, '164.163.207.101', 1534536828, 'Login (in-game)', '', 0),
(592, 'Vincent_Henderson', 1, '164.163.207.101', 1534537332, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(593, 'Vincent_Henderson', 1, '164.163.207.101', 1534537707, 'Set faction to 1', 'Aidan_Lodge', 17),
(594, 'Vincent_Henderson', 1, '164.163.207.101', 1534537717, 'Set faction to 1', 'Vincent_Henderson', 1),
(595, 'Vincent_Henderson', 1, '164.163.207.101', 1534538143, 'Skin definida para 1', 'Aidan_Lodge', 17),
(596, 'Aidan_Lodge', 17, '186.192.235.173', 1534538959, 'Veiculo spawnado: Sultan (ID 211, Model 560)', '', 0),
(597, 'Aidan_Lodge', 17, '186.192.235.173', 1534539022, 'Veiculo spawnado: Sultan (ID 212, Model 560)', '', 0),
(598, 'Aidan_Lodge', 17, '186.192.235.173', 1534539332, 'Veiculo spawnado: NRG-500 (ID 213, Model 522)', '', 0),
(599, 'Vincent_Henderson', 1, '164.163.207.101', 1534539514, 'Login (in-game)', '', 0),
(600, 'Vincent_Henderson', 1, '164.163.207.101', 1534539533, 'Jogador teleportado', 'Aidan_Lodge', 17),
(601, 'Rowan_Ballard', 4, '186.225.187.250', 1534539536, 'Login (in-game)', '', 0),
(602, 'Vincent_Henderson', 1, '164.163.207.101', 1534539565, 'Jogador teleportado', 'Rowan_Ballard', 4),
(603, 'Rowan_Ballard', 4, '186.225.187.250', 1534539637, 'Login (in-game)', '', 0),
(604, 'Rowan_Ballard', 4, '186.225.187.250', 1534539679, 'Jogador teleportado', 'Aidan_Lodge', 17),
(605, 'Vincent_Henderson', 1, '164.163.207.101', 1534539904, 'Spectate', 'Rowan_Ballard', 4),
(606, 'Vincent_Henderson', 1, '164.163.207.101', 1534539919, 'Spectate', 'Aidan_Lodge', 17),
(607, 'Vincent_Henderson', 1, '164.163.207.101', 1534540687, 'Casa criada \'Trailer 1\' por $15000', '', 0),
(608, 'Vincent_Henderson', 1, '164.163.207.101', 1534540698, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(609, 'Aidan_Lodge', 17, '186.192.235.173', 1534540831, 'Jogador teleportado', 'Vincent_Henderson', 1),
(610, 'Vincent_Henderson', 1, '164.163.207.101', 1534540882, 'Jogador teleportado', 'Aidan_Lodge', 17),
(611, 'Aidan_Lodge', 17, '186.192.235.173', 1534540950, 'Veiculo spawnado: Kart (ID 214, Model 571)', '', 0),
(612, 'Aidan_Lodge', 17, '186.192.235.173', 1534541111, 'Spectate', 'Rowan_Ballard', 4),
(613, 'Aidan_Lodge', 17, '186.192.235.173', 1534541114, 'Spectate', 'Rowan_Ballard', 4),
(614, 'Aidan_Lodge', 17, '186.192.235.173', 1534541118, 'Spectate', 'Vincent_Henderson', 1),
(615, 'Rowan_Ballard', 4, '186.225.187.250', 1534542242, 'Jogador teleportado', 'Vincent_Henderson', 1),
(616, 'Vincent_Henderson', 1, '164.163.207.101', 1534544458, 'Login (in-game)', '', 0),
(617, 'Vincent_Henderson', 1, '164.163.207.101', 1534544466, 'Jogador teleportado', 'Tutin', 18),
(618, 'Rowan_Ballard', 4, '186.225.187.250', 1534544551, 'Jogador teleportado', 'Vincent_Henderson', 1),
(619, 'Rowan_Ballard', 4, '186.225.187.250', 1534545028, 'Jogador teleportado', 'Vincent_Henderson', 1),
(620, 'Vincent_Henderson', 1, '164.163.207.101', 1534545388, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(621, 'Vincent_Henderson', 1, '164.163.207.101', 1534545406, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(622, 'Vincent_Henderson', 1, '164.163.207.101', 1534546685, 'Login (in-game)', '', 0),
(623, 'Zac_Deutch', 2, '191.253.248.211', 1534546726, 'Login (in-game)', '', 0),
(624, 'Vincent_Henderson', 1, '164.163.207.101', 1534547017, 'Jogador teleportado', 'Rowan_Ballard', 4),
(625, 'Vincent_Henderson', 1, '164.163.207.101', 1534547021, 'Jogador teleportado', 'Zac_Deutch', 2),
(626, 'Vincent_Henderson', 1, '164.163.207.101', 1534547106, 'Deu uma lincesa de BOAT', 'Vincent_Henderson', 1),
(627, 'Zac_Deutch', 2, '191.253.248.211', 1534547135, 'Teleportado para LS Airport', 'Zac_Deutch', 2),
(628, 'Vincent_Henderson', 1, '164.163.207.101', 1534547198, 'Jogador teleportado', 'Zac_Deutch', 2),
(629, 'Vincent_Henderson', 1, '164.163.207.101', 1534547237, 'Jogador puxado', 'Zac_Deutch', 2),
(630, 'Vincent_Henderson', 1, '164.163.207.101', 1534547264, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(631, 'Zac_Deutch', 2, '191.253.248.211', 1534547281, 'Teleportado para Fisher\'s Lagoon', 'Zac_Deutch', 2),
(632, 'Zac_Deutch', 2, '191.253.248.211', 1534547612, 'Veiculo spawnado: Sentinel (ID 210, Model 405)', '', 0),
(633, 'Zac_Deutch', 2, '191.253.248.211', 1534547851, 'Veiculo spawnado: Infernus (ID 211, Model 411)', '', 0),
(634, 'Zac_Deutch', 2, '191.253.248.211', 1534547887, 'Login (in-game)', '', 0),
(635, 'Zac_Deutch', 2, '191.253.248.211', 1534547895, 'Veiculo spawnado: Infernus (ID 212, Model 411)', '', 0),
(636, 'Zac_Deutch', 2, '191.253.248.211', 1534548087, 'Jogador teleportado', 'Rowan_Ballard', 4),
(637, 'Rowan_Ballard', 4, '186.225.187.250', 1534548540, 'Jogador teleportado', 'Wesley_Vianna', 18),
(638, 'Rowan_Ballard', 4, '186.225.187.250', 1534548559, 'Jogador teleportado', 'Zac_Deutch', 2),
(639, 'Rowan_Ballard', 4, '186.225.187.250', 1534549033, 'Jogador teleportado', 'Wesley_Vianna', 18),
(640, 'Zac_Deutch', 2, '191.253.248.211', 1534549086, 'Jogador teleportado', 'Rowan_Ballard', 4),
(641, 'Zac_Deutch', 2, '191.253.248.211', 1534549105, 'Jogador teleportado', 'Rowan_Ballard', 4),
(642, 'Zac_Deutch', 2, '191.253.248.211', 1534549136, 'Teleportado para Admin Jail', 'Zac_Deutch', 2),
(643, 'Zac_Deutch', 2, '191.253.248.211', 1534549147, 'Teleportado para LS Airport', 'Zac_Deutch', 2),
(644, 'Zac_Deutch', 2, '191.253.248.211', 1534549151, 'Teleportado para Richman', 'Zac_Deutch', 2),
(645, 'Zac_Deutch', 2, '191.253.248.211', 1534549156, 'Teleportado para Northstar Rock', 'Zac_Deutch', 2),
(646, 'Zac_Deutch', 2, '191.253.248.211', 1534549171, 'Teleportado para Los Santos', 'Zac_Deutch', 2),
(647, 'Zac_Deutch', 2, '191.253.248.211', 1534549178, 'Veiculo spawnado: Infernus (ID 214, Model 411)', '', 0),
(648, 'Zac_Deutch', 2, '191.253.248.211', 1534549394, 'Login (in-game)', '', 0),
(649, 'Vincent_Henderson', 1, '164.163.207.101', 1534550058, 'Login (in-game)', '', 0),
(650, 'Vincent_Henderson', 1, '164.163.207.101', 1534550113, 'Jogador teleportado', 'Wesley_Vianna', 18),
(651, 'Vincent_Henderson', 1, '164.163.207.101', 1534550119, 'Jogador teleportado', 'Wesley_Vianna', 18),
(652, 'Vincent_Henderson', 1, '164.163.207.101', 1534550129, 'Jogador teleportado', 'Zac_Deutch', 2),
(653, 'Rowan_Ballard', 4, '186.225.187.250', 1534550163, 'Veiculo spawnado: Rancher (ID 213, Model 489)', '', 0),
(654, 'Vincent_Henderson', 1, '164.163.207.101', 1534550907, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(655, 'Rowan_Ballard', 4, '186.225.187.250', 1534550911, 'Veiculo spawnado: BMX (ID 216, Model 481)', '', 0),
(656, 'Rowan_Ballard', 4, '186.225.187.250', 1534550941, 'Jogador teleportado', 'Vincent_Henderson', 1),
(657, 'Vincent_Henderson', 1, '164.163.207.101', 1534551094, 'Jogador puxado', 'Rowan_Ballard', 4),
(658, 'Rowan_Ballard', 4, '186.225.187.250', 1534551206, 'Veiculo spawnado: Primo (ID 215, Model 547)', '', 0),
(659, 'Vincent_Henderson', 1, '164.163.207.101', 1534553164, 'Login (in-game)', '', 0),
(660, 'Vincent_Henderson', 1, '164.163.207.101', 1534553191, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(661, 'Vincent_Henderson', 1, '164.163.207.101', 1534558338, 'Login (in-game)', '', 0),
(662, 'Vincent_Henderson', 1, '164.163.207.101', 1534558374, 'Casa editada #0 Inside ID para 28', '', 0),
(663, 'Vincent_Henderson', 1, '164.163.207.101', 1534558554, 'Login (in-game)', '', 0),
(664, 'Vincent_Henderson', 1, '164.163.207.101', 1534558579, 'Casa editada #0 Inside ID para 30', '', 0),
(665, 'Vincent_Henderson', 1, '164.163.207.101', 1534564473, 'Login (in-game)', '', 0),
(666, 'Vincent_Henderson', 1, '164.163.207.101', 1534564562, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(667, 'Rowan_Ballard', 4, '186.225.187.250', 1534564567, 'Login (in-game)', '', 0),
(668, 'Vincent_Henderson', 1, '164.163.207.101', 1534564635, 'Jogador puxado', 'Rowan_Ballard', 4),
(669, 'Vincent_Henderson', 1, '164.163.207.101', 1534564731, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(670, 'Rowan_Ballard', 4, '186.225.187.250', 1534564736, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(671, 'Vincent_Henderson', 1, '164.163.207.101', 1534564872, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(672, 'Rowan_Ballard', 4, '186.225.187.250', 1534564881, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(673, 'Vincent_Henderson', 1, '164.163.207.101', 1534564893, 'Objeto temporário spawnado. (19981)', '', 0),
(674, 'Vincent_Henderson', 1, '164.163.207.101', 1534565454, 'Jogador teleportado', 'Rowan_Ballard', 4),
(675, 'Vincent_Henderson', 1, '164.163.207.101', 1534565718, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(676, 'Vincent_Henderson', 1, '164.163.207.101', 1534566825, 'Login (in-game)', '', 0),
(677, 'Aidan_Lodge', 17, '186.192.235.173', 1534594663, 'Login (in-game)', '', 0),
(678, 'Aidan_Lodge', 17, '186.192.235.173', 1534594703, 'Admin duty on', '', 0),
(679, 'Aidan_Lodge', 17, '186.192.235.173', 1534594724, 'Veiculo spawnado: Maverick (ID 210, Model 487)', '', 0),
(680, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534609297, 'Veiculo spawnado: Maverick (ID 211, Model 487)', '', 0),
(681, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534609389, 'Admin duty on', '', 0),
(682, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534609885, 'Veiculo spawnado: Police Ranger (ID 212, Model 599)', '', 0),
(683, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534609899, 'Veiculo spawnado: Police Ranger (ID 213, Model 599)', '', 0),
(684, 'Vincent_Henderson', 1, '164.163.207.13', 1534610407, 'Login (in-game)', '', 0),
(685, 'Vincent_Henderson', 1, '164.163.207.13', 1534610419, 'Jogador teleportado', 'Lennaert_Schuurman', 16),
(686, 'Vincent_Henderson', 1, '164.163.207.13', 1534610533, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(687, 'Vincent_Henderson', 1, '164.163.207.13', 1534610863, 'Jogador puxado', 'Lennaert_Schuurman', 16),
(688, 'Vincent_Henderson', 1, '164.163.207.13', 1534610875, 'Set faction to 1', 'Lennaert_Schuurman', 16),
(689, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534610913, 'Admin duty off', '', 0),
(690, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534611096, 'Login (in-game)', '', 0),
(691, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534611144, 'Login (in-game)', '', 0),
(692, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534611210, 'Login (in-game)', '', 0),
(693, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534611252, 'Login (in-game)', '', 0),
(694, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534611366, 'Login (in-game)', '', 0),
(695, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534611398, 'Jogador teleportado', 'Vincent_Henderson', 1),
(696, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534611407, 'Jogador teleportado', 'Vincent_Henderson', 1),
(697, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534611708, 'Jogador teleportado', 'Vincent_Henderson', 1),
(698, 'Vincent_Henderson', 1, '164.163.207.13', 1534612049, 'Give weapon M4, ammo=200, reason=Refund', 'Lennaert_Schuurman', 16),
(699, 'Vincent_Henderson', 1, '164.163.207.13', 1534612482, 'Defina saúde para 100', 'Wesley_Vianna', 18),
(700, 'Vincent_Henderson', 1, '164.163.207.13', 1534612486, 'Defina saúde para 100', 'Vincent_Henderson', 1),
(701, 'Vincent_Henderson', 1, '164.163.207.13', 1534612625, 'Adicionado na Help Team', 'Wesley_Vianna', 18),
(702, 'Vincent_Henderson', 1, '164.163.207.13', 1534612679, 'Jogador teleportado', 'Lennaert_Schuurman', 16),
(703, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534612847, 'Login (in-game)', '', 0),
(704, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534612874, 'Jogador teleportado', 'Vincent_Henderson', 1),
(705, 'Vincent_Henderson', 1, '164.163.207.13', 1534614199, 'Jogador teleportado', 'Lennaert_Schuurman', 16),
(706, 'Rowan_Ballard', 4, '186.225.187.250', 1534614577, 'Login (in-game)', '', 0),
(707, 'Rowan_Ballard', 4, '186.225.187.250', 1534614645, 'Veiculo spawnado: Bravura (ID 214, Model 401)', '', 0),
(708, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534616850, 'Veiculo spawnado: SFPD Cruiser (ID 215, Model 597)', '', 0),
(709, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534617719, 'Veiculo spawnado: FCR-900 (ID 216, Model 521)', '', 0),
(710, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534618279, 'Veiculo spawnado: NRG-500 (ID 217, Model 522)', '', 0),
(711, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534618302, 'Veiculo spawnado: NRG-500 (ID 218, Model 522)', '', 0),
(712, 'Lennaert_Schuurman', 16, '179.106.74.120', 1534618365, 'Veiculo spawnado: Stretch (ID 219, Model 409)', '', 0),
(713, 'Vincent_Henderson', 1, '164.163.207.13', 1534620004, 'Login (in-game)', '', 0),
(714, 'Rowan_Ballard', 4, '186.225.187.250', 1534644489, 'Login (in-game)', '', 0),
(715, 'Vincent_Henderson', 1, '164.163.207.13', 1534645039, 'Login (in-game)', '', 0),
(716, 'Rowan_Ballard', 4, '186.225.187.250', 1534645048, 'Jogador teleportado', 'Vincent_Henderson', 1),
(717, 'Zac_Deutch', 2, '186.224.179.219', 1534645137, 'Login (in-game)', '', 0),
(718, 'Zac_Deutch', 2, '186.224.179.219', 1534645248, 'Veiculo spawnado: Infernus (ID 210, Model 411)', '', 0),
(719, 'Vincent_Henderson', 1, '164.163.207.13', 1534645328, 'Veiculo spawnado: Stafford (ID 211, Model 580)', '', 0),
(720, 'Vincent_Henderson', 1, '164.163.207.13', 1534645460, 'Set faction to 1', 'Rowan_Ballard', 4),
(721, 'Zac_Deutch', 2, '186.224.179.219', 1534645460, 'Veiculo spawnado: Infernus (ID 212, Model 411)', '', 0),
(722, 'Vincent_Henderson', 1, '164.163.207.13', 1534645486, 'Mudou o tempo para 11', '', 0),
(723, 'Vincent_Henderson', 1, '164.163.207.13', 1534645508, 'Set faction to 1', 'Asamoah_Gibson', 19),
(724, 'Zac_Deutch', 2, '186.224.179.219', 1534645749, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(725, 'Zac_Deutch', 2, '186.224.179.219', 1534645836, 'Teleportado para Pescaria', 'Zac_Deutch', 2),
(726, 'Vincent_Henderson', 1, '164.163.207.13', 1534646020, 'Colete definido para 0', 'Rowan_Ballard', 4),
(727, 'Zac_Deutch', 2, '186.224.179.219', 1534646609, 'Teleportado para Area 51', 'Zac_Deutch', 2),
(728, 'Zac_Deutch', 2, '186.224.179.219', 1534646641, 'Teleportado para Elite Trucking', 'Zac_Deutch', 2),
(729, 'Rowan_Ballard', 4, '186.225.187.250', 1534646800, 'Jogador teleportado', 'Rowan_Ballard', 4),
(730, 'Rowan_Ballard', 4, '186.225.187.250', 1534646807, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(731, 'Rowan_Ballard', 4, '186.225.187.250', 1534647075, 'Veiculo spawnado: BMX (ID 213, Model 481)', '', 0),
(732, 'Zac_Deutch', 2, '186.224.179.219', 1534647235, 'Jogador teleportado', 'Rowan_Ballard', 4),
(733, 'Zac_Deutch', 2, '186.224.179.219', 1534647241, 'Jogador teleportado', 'Rowan_Ballard', 4),
(734, 'Rowan_Ballard', 4, '186.225.187.250', 1534648254, 'Login (in-game)', '', 0),
(735, 'Rowan_Ballard', 4, '186.225.187.250', 1534648339, 'Login (in-game)', '', 0),
(736, 'Rowan_Ballard', 4, '186.225.187.250', 1534648356, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(737, 'Rowan_Ballard', 4, '186.225.187.250', 1534648577, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(738, 'Rowan_Ballard', 4, '186.225.187.250', 1534648585, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(739, 'Rowan_Ballard', 4, '186.225.187.250', 1534648595, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(740, 'Zac_Deutch', 2, '186.224.179.219', 1534648632, 'Login (in-game)', '', 0),
(741, 'Rowan_Ballard', 4, '186.225.187.250', 1534648693, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(742, 'Zac_Deutch', 2, '186.224.179.219', 1534648709, 'Login (in-game)', '', 0),
(743, 'Rowan_Ballard', 4, '186.225.187.250', 1534648808, 'Skin definida para 150', 'Rowan_Ballard', 4),
(744, 'Zac_Deutch', 2, '186.224.179.219', 1534648809, 'Skin definida para 1', 'Rowan_Ballard', 4),
(745, 'Rowan_Ballard', 4, '186.225.187.250', 1534648811, 'Skin definida para 140', 'Rowan_Ballard', 4),
(746, 'Zac_Deutch', 2, '186.224.179.219', 1534648813, 'Skin definida para 12', 'Rowan_Ballard', 4),
(747, 'Rowan_Ballard', 4, '186.225.187.250', 1534648822, 'Skin definida para 130', 'Rowan_Ballard', 4),
(748, 'Rowan_Ballard', 4, '186.225.187.250', 1534648827, 'Skin definida para 250', 'Rowan_Ballard', 4),
(749, 'Zac_Deutch', 2, '186.224.179.219', 1534648844, 'Skin definida para 12', 'Zac_Deutch', 2),
(750, 'Zac_Deutch', 2, '186.224.179.219', 1534648847, 'Skin definida para 124', 'Zac_Deutch', 2),
(751, 'Zac_Deutch', 2, '186.224.179.219', 1534648849, 'Skin definida para 99', 'Zac_Deutch', 2),
(752, 'Zac_Deutch', 2, '186.224.179.219', 1534648851, 'Skin definida para 299', 'Zac_Deutch', 2),
(753, 'Zac_Deutch', 2, '186.224.179.219', 1534648852, 'Skin definida para 294', 'Zac_Deutch', 2),
(754, 'Zac_Deutch', 2, '186.224.179.219', 1534648853, 'Skin definida para 299', 'Zac_Deutch', 2),
(755, 'Zac_Deutch', 2, '186.224.179.219', 1534648855, 'Skin definida para 99', 'Zac_Deutch', 2),
(756, 'Rowan_Ballard', 4, '186.225.187.250', 1534648860, 'Veiculo spawnado: BMX (ID 214, Model 481)', '', 0),
(757, 'Zac_Deutch', 2, '186.224.179.219', 1534648867, 'Skin definida para 399', 'Zac_Deutch', 2),
(758, 'Zac_Deutch', 2, '186.224.179.219', 1534648871, 'Skin definida para 302', 'Zac_Deutch', 2),
(759, 'Zac_Deutch', 2, '186.224.179.219', 1534648874, 'Skin definida para 309', 'Zac_Deutch', 2),
(760, 'Zac_Deutch', 2, '186.224.179.219', 1534648877, 'Skin definida para 311', 'Zac_Deutch', 2),
(761, 'Zac_Deutch', 2, '186.224.179.219', 1534648879, 'Skin definida para 318', 'Zac_Deutch', 2),
(762, 'Zac_Deutch', 2, '186.224.179.219', 1534648880, 'Skin definida para 319', 'Zac_Deutch', 2),
(763, 'Zac_Deutch', 2, '186.224.179.219', 1534648885, 'Skin definida para 1', 'Zac_Deutch', 2),
(764, 'Zac_Deutch', 2, '186.224.179.219', 1534648888, 'Skin definida para 22', 'Zac_Deutch', 2),
(765, 'Zac_Deutch', 2, '186.224.179.219', 1534648890, 'Skin definida para 23', 'Zac_Deutch', 2),
(766, 'Zac_Deutch', 2, '186.224.179.219', 1534648891, 'Skin definida para 24', 'Zac_Deutch', 2),
(767, 'Zac_Deutch', 2, '186.224.179.219', 1534648892, 'Skin definida para 25', 'Zac_Deutch', 2),
(768, 'Zac_Deutch', 2, '186.224.179.219', 1534648895, 'Skin definida para 98', 'Zac_Deutch', 2),
(769, 'Zac_Deutch', 2, '186.224.179.219', 1534648897, 'Skin definida para 99', 'Zac_Deutch', 2),
(770, 'Zac_Deutch', 2, '186.224.179.219', 1534648922, 'Mudou o tempo para 12', '', 0),
(771, 'Zac_Deutch', 2, '186.224.179.219', 1534648925, 'Mudou o tempo para 0', '', 0),
(772, 'Zac_Deutch', 2, '186.224.179.219', 1534649128, 'Colete definido para 0', 'Zac_Deutch', 2),
(773, 'Zac_Deutch', 2, '186.224.179.219', 1534649131, 'Colete definido para 100', 'Zac_Deutch', 2),
(774, 'Zac_Deutch', 2, '186.224.179.219', 1534649150, 'Mudou o tempo para 10', '', 0),
(775, 'Zac_Deutch', 2, '186.224.179.219', 1534649153, 'Mudou o tempo para 5', '', 0),
(776, 'Zac_Deutch', 2, '186.224.179.219', 1534649156, 'Mudou o tempo para 9', '', 0),
(777, 'Zac_Deutch', 2, '186.224.179.219', 1534649160, 'Mudou o tempo para 7', '', 0),
(778, 'Zac_Deutch', 2, '186.224.179.219', 1534649162, 'Mudou o tempo para 6', '', 0),
(779, 'Zac_Deutch', 2, '186.224.179.219', 1534649164, 'Mudou o tempo para 0', '', 0),
(780, 'Zac_Deutch', 2, '186.224.179.219', 1534649188, 'Mudou o tempo para 100', '', 0),
(781, 'Zac_Deutch', 2, '186.224.179.219', 1534649198, 'Mudou o tempo para 2009', '', 0),
(782, 'Zac_Deutch', 2, '186.224.179.219', 1534649210, 'Mudou o tempo para 15', '', 0),
(783, 'Zac_Deutch', 2, '186.224.179.219', 1534649213, 'Mudou o tempo para 25', '', 0),
(784, 'Zac_Deutch', 2, '186.224.179.219', 1534649243, 'Mudou o tempo para 42', '', 0),
(785, 'Zac_Deutch', 2, '186.224.179.219', 1534649251, 'Mudou o tempo para 250', '', 0),
(786, 'Zac_Deutch', 2, '186.224.179.219', 1534649258, 'Mudou o tempo para 0', '', 0),
(787, 'Zac_Deutch', 2, '186.224.179.219', 1534649265, 'Jogador teleportado', 'Rowan_Ballard', 4),
(788, 'Zac_Deutch', 2, '186.224.179.219', 1534649286, 'Mudou o tempo para 2009', '', 0),
(789, 'Zac_Deutch', 2, '186.224.179.219', 1534649289, 'Mudou o tempo para 0', '', 0),
(790, 'Zac_Deutch', 2, '186.224.179.219', 1534649299, 'Mudou o tempo para 100', '', 0),
(791, 'Zac_Deutch', 2, '186.224.179.219', 1534649302, 'Mudou o tempo para 0', '', 0),
(792, 'Zac_Deutch', 2, '186.224.179.219', 1534649330, 'Skin definida para 1', 'Zac_Deutch', 2),
(793, 'Zac_Deutch', 2, '186.224.179.219', 1534649335, 'Skin definida para 2', 'Zac_Deutch', 2),
(794, 'Zac_Deutch', 2, '186.224.179.219', 1534649337, 'Skin definida para 3', 'Zac_Deutch', 2),
(795, 'Zac_Deutch', 2, '186.224.179.219', 1534649340, 'Skin definida para 4', 'Zac_Deutch', 2),
(796, 'Zac_Deutch', 2, '186.224.179.219', 1534649341, 'Skin definida para 5', 'Zac_Deutch', 2),
(797, 'Zac_Deutch', 2, '186.224.179.219', 1534649343, 'Skin definida para 6', 'Zac_Deutch', 2),
(798, 'Zac_Deutch', 2, '186.224.179.219', 1534649344, 'Skin definida para 7', 'Zac_Deutch', 2),
(799, 'Zac_Deutch', 2, '186.224.179.219', 1534649345, 'Skin definida para 8', 'Zac_Deutch', 2),
(800, 'Zac_Deutch', 2, '186.224.179.219', 1534649348, 'Skin definida para 9', 'Zac_Deutch', 2),
(801, 'Zac_Deutch', 2, '186.224.179.219', 1534649349, 'Skin definida para 10', 'Zac_Deutch', 2),
(802, 'Zac_Deutch', 2, '186.224.179.219', 1534649350, 'Skin definida para 11', 'Zac_Deutch', 2),
(803, 'Zac_Deutch', 2, '186.224.179.219', 1534649351, 'Skin definida para 12', 'Zac_Deutch', 2),
(804, 'Zac_Deutch', 2, '186.224.179.219', 1534649352, 'Skin definida para 13', 'Zac_Deutch', 2),
(805, 'Zac_Deutch', 2, '186.224.179.219', 1534649353, 'Skin definida para 14', 'Zac_Deutch', 2),
(806, 'Zac_Deutch', 2, '186.224.179.219', 1534649354, 'Skin definida para 15', 'Zac_Deutch', 2),
(807, 'Zac_Deutch', 2, '186.224.179.219', 1534649356, 'Skin definida para 16', 'Zac_Deutch', 2),
(808, 'Zac_Deutch', 2, '186.224.179.219', 1534649357, 'Skin definida para 17', 'Zac_Deutch', 2),
(809, 'Zac_Deutch', 2, '186.224.179.219', 1534649359, 'Skin definida para 16', 'Zac_Deutch', 2),
(810, 'Zac_Deutch', 2, '186.224.179.219', 1534649372, 'Veiculo spawnado: Infernus (ID 215, Model 411)', '', 0),
(811, 'Rowan_Ballard', 4, '186.225.187.250', 1534650064, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(812, 'Rowan_Ballard', 4, '186.225.187.250', 1534650720, 'Skin definida para 20001', 'Rowan_Ballard', 4),
(813, 'Rowan_Ballard', 4, '186.225.187.250', 1534650723, 'Skin definida para 20002', 'Rowan_Ballard', 4),
(814, 'Rowan_Ballard', 4, '186.225.187.250', 1534650726, 'Skin definida para 20003', 'Rowan_Ballard', 4),
(815, 'Rowan_Ballard', 4, '186.225.187.250', 1534650727, 'Skin definida para 20004', 'Rowan_Ballard', 4),
(816, 'Rowan_Ballard', 4, '186.225.187.250', 1534650729, 'Skin definida para 20005', 'Rowan_Ballard', 4),
(817, 'Rowan_Ballard', 4, '186.225.187.250', 1534650765, 'Skin definida para 20006', 'Rowan_Ballard', 4),
(818, 'Rowan_Ballard', 4, '186.225.187.250', 1534650771, 'Skin definida para 20007', 'Rowan_Ballard', 4),
(819, 'Zac_Deutch', 2, '186.224.179.219', 1534650774, 'Login (in-game)', '', 0),
(820, 'Zac_Deutch', 2, '186.224.179.219', 1534650786, 'Jogador teleportado', 'Rowan_Ballard', 4),
(821, 'Rowan_Ballard', 4, '186.225.187.250', 1534650810, 'Skin definida para 20009', 'Rowan_Ballard', 4),
(822, 'Rowan_Ballard', 4, '186.225.187.250', 1534650868, 'Skin definida para 20007', 'Rowan_Ballard', 4),
(823, 'Rowan_Ballard', 4, '186.225.187.250', 1534650898, 'Skin definida para 20010', 'Rowan_Ballard', 4),
(824, 'Rowan_Ballard', 4, '186.225.187.250', 1534650907, 'Skin definida para 20011', 'Rowan_Ballard', 4),
(825, 'Rowan_Ballard', 4, '186.225.187.250', 1534650933, 'Skin definida para 20011', 'Rowan_Ballard', 4),
(826, 'Rowan_Ballard', 4, '186.225.187.250', 1534650935, 'Skin definida para 20012', 'Rowan_Ballard', 4),
(827, 'Rowan_Ballard', 4, '186.225.187.250', 1534650939, 'Skin definida para 20013', 'Rowan_Ballard', 4),
(828, 'Rowan_Ballard', 4, '186.225.187.250', 1534650944, 'Skin definida para 20014', 'Rowan_Ballard', 4),
(829, 'Rowan_Ballard', 4, '186.225.187.250', 1534650946, 'Skin definida para 20016', 'Rowan_Ballard', 4),
(830, 'Rowan_Ballard', 4, '186.225.187.250', 1534650988, 'Skin definida para 20015', 'Rowan_Ballard', 4),
(831, 'Rowan_Ballard', 4, '186.225.187.250', 1534650998, 'Skin definida para 20017', 'Rowan_Ballard', 4),
(832, 'Rowan_Ballard', 4, '186.225.187.250', 1534651013, 'Skin definida para 20018', 'Rowan_Ballard', 4),
(833, 'Rowan_Ballard', 4, '186.225.187.250', 1534651019, 'Skin definida para 20019', 'Rowan_Ballard', 4),
(834, 'Rowan_Ballard', 4, '186.225.187.250', 1534651033, 'Skin definida para 20020', 'Rowan_Ballard', 4),
(835, 'Rowan_Ballard', 4, '186.225.187.250', 1534651038, 'Skin definida para 20021', 'Rowan_Ballard', 4),
(836, 'Rowan_Ballard', 4, '186.225.187.250', 1534651047, 'Skin definida para 20022', 'Rowan_Ballard', 4),
(837, 'Rowan_Ballard', 4, '186.225.187.250', 1534651052, 'Skin definida para 20023', 'Rowan_Ballard', 4),
(838, 'Rowan_Ballard', 4, '186.225.187.250', 1534651057, 'Skin definida para 20024', 'Rowan_Ballard', 4),
(839, 'Zac_Deutch', 2, '186.224.179.219', 1534651072, 'Skin definida para 20009', 'Rowan_Ballard', 4),
(840, 'Zac_Deutch', 2, '186.224.179.219', 1534651075, 'Skin definida para 20001', 'Rowan_Ballard', 4),
(841, 'Rowan_Ballard', 4, '186.225.187.250', 1534651082, 'Skin definida para 20029', 'Rowan_Ballard', 4),
(842, 'Zac_Deutch', 2, '186.224.179.219', 1534651083, 'Skin definida para 20009', 'Zac_Deutch', 2),
(843, 'Rowan_Ballard', 4, '186.225.187.250', 1534651084, 'Skin definida para 20025', 'Rowan_Ballard', 4),
(844, 'Zac_Deutch', 2, '186.224.179.219', 1534651098, 'Skin definida para 20008', 'Zac_Deutch', 2),
(845, 'Rowan_Ballard', 4, '186.225.187.250', 1534651099, 'Skin definida para 20029', 'Rowan_Ballard', 4),
(846, 'Zac_Deutch', 2, '186.224.179.219', 1534651100, 'Skin definida para 20009', 'Zac_Deutch', 2),
(847, 'Zac_Deutch', 2, '186.224.179.219', 1534651103, 'Skin definida para 20010', 'Zac_Deutch', 2),
(848, 'Zac_Deutch', 2, '186.224.179.219', 1534651123, 'Colete definido para 0', 'Zac_Deutch', 2),
(849, 'Rowan_Ballard', 4, '186.225.187.250', 1534651586, 'Skin definida para 20030', 'Rowan_Ballard', 4),
(850, 'Rowan_Ballard', 4, '186.225.187.250', 1534651588, 'Skin definida para 20031', 'Rowan_Ballard', 4),
(851, 'Rowan_Ballard', 4, '186.225.187.250', 1534651591, 'Skin definida para 20000', 'Rowan_Ballard', 4),
(852, 'Rowan_Ballard', 4, '186.225.187.250', 1534651598, 'Skin definida para 19999', 'Rowan_Ballard', 4),
(853, 'Rowan_Ballard', 4, '186.225.187.250', 1534651599, 'Skin definida para 1999', 'Rowan_Ballard', 4),
(854, 'Rowan_Ballard', 4, '186.225.187.250', 1534651604, 'Skin definida para 20001', 'Rowan_Ballard', 4),
(855, 'Rowan_Ballard', 4, '186.225.187.250', 1534651606, 'Skin definida para 20002', 'Rowan_Ballard', 4),
(856, 'Rowan_Ballard', 4, '186.225.187.250', 1534651608, 'Skin definida para 20001', 'Rowan_Ballard', 4),
(857, 'Rowan_Ballard', 4, '186.225.187.250', 1534651613, 'Skin definida para 20002', 'Rowan_Ballard', 4),
(858, 'Rowan_Ballard', 4, '186.225.187.250', 1534651615, 'Skin definida para 20003', 'Rowan_Ballard', 4),
(859, 'Rowan_Ballard', 4, '186.225.187.250', 1534651616, 'Skin definida para 20004', 'Rowan_Ballard', 4),
(860, 'Vincent_Henderson', 1, '164.163.207.13', 1534660777, 'Login (in-game)', '', 0),
(861, 'Vincent_Henderson', 1, '164.163.207.13', 1534660795, 'Teleportado para Bone County Prison', 'Vincent_Henderson', 1),
(862, 'Vincent_Henderson', 1, '164.163.207.13', 1534660804, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(863, 'Vincent_Henderson', 1, '164.163.207.13', 1534660872, 'Login (in-game)', '', 0),
(864, 'Vincent_Henderson', 1, '164.163.207.13', 1534660883, 'Teleportado para Fort Carson', 'Vincent_Henderson', 1),
(865, 'Vincent_Henderson', 1, '164.163.207.13', 1534660916, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(866, 'Rowan_Ballard', 4, '186.225.187.250', 1534660956, 'Login (in-game)', '', 0),
(867, 'Vincent_Henderson', 1, '164.163.207.13', 1534660983, 'Jogador puxado', 'Rowan_Ballard', 4),
(868, 'Vincent_Henderson', 1, '164.163.207.13', 1534661031, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(869, 'Rowan_Ballard', 4, '186.225.187.250', 1534661190, 'Skin definida para 2000', 'Rowan_Ballard', 4),
(870, 'Rowan_Ballard', 4, '186.225.187.250', 1534661193, 'Skin definida para 20000', 'Rowan_Ballard', 4),
(871, 'Rowan_Ballard', 4, '186.225.187.250', 1534661197, 'Skin definida para 20001', 'Rowan_Ballard', 4),
(872, 'Rowan_Ballard', 4, '186.225.187.250', 1534661200, 'Skin definida para 20002', 'Rowan_Ballard', 4),
(873, 'Rowan_Ballard', 4, '186.225.187.250', 1534661202, 'Skin definida para 20003', 'Rowan_Ballard', 4),
(874, 'Rowan_Ballard', 4, '186.225.187.250', 1534661203, 'Skin definida para 20004', 'Rowan_Ballard', 4),
(875, 'Rowan_Ballard', 4, '186.225.187.250', 1534661204, 'Skin definida para 20005', 'Rowan_Ballard', 4),
(876, 'Vincent_Henderson', 1, '164.163.207.13', 1534661225, 'Veiculo spawnado: Walton (ID 210, Model 478)', '', 0),
(877, 'Vincent_Henderson', 1, '164.163.207.13', 1534661331, 'Jogador puxado', 'Rowan_Ballard', 4),
(878, 'Vincent_Henderson', 1, '164.163.207.13', 1534661490, 'Skin definida para 20001', 'Vincent_Henderson', 1),
(879, 'Vincent_Henderson', 1, '164.163.207.13', 1534661493, 'Skin definida para 20002', 'Vincent_Henderson', 1),
(880, 'Vincent_Henderson', 1, '164.163.207.13', 1534661495, 'Skin definida para 20003', 'Vincent_Henderson', 1),
(881, 'Vincent_Henderson', 1, '164.163.207.13', 1534661496, 'Skin definida para 20004', 'Vincent_Henderson', 1),
(882, 'Vincent_Henderson', 1, '164.163.207.13', 1534661497, 'Skin definida para 20005', 'Vincent_Henderson', 1),
(883, 'Vincent_Henderson', 1, '164.163.207.13', 1534661499, 'Skin definida para 20006', 'Vincent_Henderson', 1),
(884, 'Vincent_Henderson', 1, '164.163.207.13', 1534661501, 'Skin definida para 20006', 'Vincent_Henderson', 1),
(885, 'Vincent_Henderson', 1, '164.163.207.13', 1534661520, 'Skin definida para 20007', 'Vincent_Henderson', 1),
(886, 'Vincent_Henderson', 1, '164.163.207.13', 1534661523, 'Skin definida para 20008', 'Vincent_Henderson', 1),
(887, 'Vincent_Henderson', 1, '164.163.207.13', 1534661665, 'Skin definida para 20009', 'Vincent_Henderson', 1),
(888, 'Vincent_Henderson', 1, '164.163.207.13', 1534661674, 'Skin definida para 20010', 'Vincent_Henderson', 1),
(889, 'Vincent_Henderson', 1, '164.163.207.13', 1534661676, 'Skin definida para 20012', 'Vincent_Henderson', 1),
(890, 'Vincent_Henderson', 1, '164.163.207.13', 1534661678, 'Skin definida para 20013', 'Vincent_Henderson', 1),
(891, 'Vincent_Henderson', 1, '164.163.207.13', 1534661681, 'Skin definida para 20014', 'Vincent_Henderson', 1),
(892, 'Vincent_Henderson', 1, '164.163.207.13', 1534661684, 'Skin definida para 20015', 'Vincent_Henderson', 1),
(893, 'Vincent_Henderson', 1, '164.163.207.13', 1534661690, 'Skin definida para 20017', 'Vincent_Henderson', 1),
(894, 'Vincent_Henderson', 1, '164.163.207.13', 1534661693, 'Skin definida para 20018', 'Vincent_Henderson', 1),
(895, 'Vincent_Henderson', 1, '164.163.207.13', 1534661703, 'Skin definida para 20019', 'Vincent_Henderson', 1),
(896, 'Vincent_Henderson', 1, '164.163.207.13', 1534662255, 'Jogador puxado', 'Rowan_Ballard', 4),
(897, 'Rowan_Ballard', 4, '186.225.187.250', 1534662644, 'Login (in-game)', '', 0),
(898, 'Vincent_Henderson', 1, '164.163.207.13', 1534662673, 'Login (in-game)', '', 0),
(899, 'Rowan_Ballard', 4, '186.225.187.250', 1534662757, 'Login (in-game)', '', 0),
(900, 'Vincent_Henderson', 1, '164.163.207.13', 1534662851, 'Jogador teleportado', 'Rowan_Ballard', 4),
(901, 'Vincent_Henderson', 1, '164.163.207.13', 1534662880, 'Login (in-game)', '', 0),
(902, 'Vincent_Henderson', 1, '164.163.207.13', 1534662928, 'Jogador puxado', 'Rowan_Ballard', 4),
(903, 'Vincent_Henderson', 1, '164.163.207.13', 1534663048, 'Jogador teleportado', 'Rowan_Ballard', 4),
(904, 'Vincent_Henderson', 1, '164.163.207.13', 1534663105, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(905, 'Vincent_Henderson', 1, '164.163.207.13', 1534663830, 'Jogador puxado', 'Rowan_Ballard', 4),
(906, 'Rowan_Ballard', 4, '186.225.187.250', 1534664127, 'Ativado global OOC', '', 0),
(907, 'Rowan_Ballard', 4, '186.225.187.250', 1534664145, 'Desativado global OOC', '', 0),
(908, 'Zac_Deutch', 2, '191.253.227.41', 1534686230, 'Login (in-game)', '', 0),
(909, 'Zac_Deutch', 2, '191.253.227.41', 1534686386, 'Mudou o tempo para 0', '', 0),
(910, 'Zac_Deutch', 2, '191.253.227.41', 1534686390, 'Mudou o tempo para 3', '', 0),
(911, 'Zac_Deutch', 2, '191.253.227.41', 1534686393, 'Mudou o tempo para 15', '', 0),
(912, 'Zac_Deutch', 2, '191.253.227.41', 1534687198, 'Silenciado por 1 min', 'Zac_Deutch', 2),
(913, 'Zac_Deutch', 2, '191.253.227.41', 1534687230, 'Unmuted', 'Zac_Deutch', 2),
(914, 'Zac_Deutch', 2, '191.253.227.41', 1534687235, 'Silenciado por 1 min', 'Zac_Deutch', 2),
(915, 'Zac_Deutch', 2, '191.253.227.41', 1534687283, 'Unmuted', 'Zac_Deutch', 2),
(916, 'Vincent_Henderson', 1, '192.168.1.3', 1534694677, 'Login (in-game)', '', 0),
(917, 'Vincent_Henderson', 1, '192.168.1.3', 1534695100, 'Login (in-game)', '', 0),
(918, 'Vincent_Henderson', 1, '192.168.1.3', 1534695154, 'Login (in-game)', '', 0),
(919, 'Vincent_Henderson', 1, '192.168.1.3', 1534696750, 'Login (in-game)', '', 0),
(920, 'Vincent_Henderson', 1, '192.168.1.3', 1534697682, 'Login (in-game)', '', 0),
(921, 'Vincent_Henderson', 1, '192.168.1.3', 1534697698, 'Silenciado por 1 min', 'Vincent_Henderson', 1),
(922, 'Vincent_Henderson', 1, '192.168.1.3', 1534698037, 'Login (in-game)', '', 0),
(923, 'Vincent_Henderson', 1, '192.168.1.3', 1534698045, 'Silenciado por 1 min', 'Vincent_Henderson', 1),
(924, 'Vincent_Henderson', 1, '164.163.207.13', 1534698549, 'Login (in-game)', '', 0),
(925, 'Zac_Deutch', 2, '191.253.227.41', 1534698625, 'Login (in-game)', '', 0),
(926, 'Zac_Deutch', 2, '191.253.227.41', 1534698635, 'Jogador teleportado', 'Vincent_Henderson', 1),
(927, 'Zac_Deutch', 2, '191.253.227.41', 1534698674, 'Silenciado por 1 min', 'Zac_Deutch', 2),
(928, 'Vincent_Henderson', 1, '164.163.207.13', 1534698675, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(929, 'Zac_Deutch', 2, '191.253.227.41', 1534698686, 'Unmuted', 'Zac_Deutch', 2),
(930, 'Vincent_Henderson', 1, '164.163.207.13', 1534698732, 'Set faction to 10', 'Vincent_Henderson', 1),
(931, 'Zac_Deutch', 2, '191.253.227.41', 1534698839, 'Jogador teleportado', 'Vincent_Henderson', 1),
(932, 'Vincent_Henderson', 1, '164.163.207.13', 1534698899, 'Give weapon Desert Eagle, ammo=70, reason=Refund', 'Vincent_Henderson', 1),
(933, 'Zac_Deutch', 2, '191.253.227.41', 1534699037, 'Jogador teleportado', 'Vincent_Henderson', 1),
(934, 'Vincent_Henderson', 1, '164.163.207.13', 1534699294, 'Jogador puxado', 'Wesley_Vianna', 18),
(935, 'Vincent_Henderson', 1, '164.163.207.13', 1534699513, 'Mudou o tempo para 11', '', 0),
(936, 'Vincent_Henderson', 1, '164.163.207.13', 1534699515, 'Mudou o tempo para 11', '', 0),
(937, 'Vincent_Henderson', 1, '164.163.207.13', 1534699522, 'Mudou o tempo para 11', '', 0),
(938, 'Zac_Deutch', 2, '191.253.227.41', 1534699594, 'Jogador puxado', 'Wesley_Vianna', 18),
(939, 'Zac_Deutch', 2, '191.253.227.41', 1534699777, 'Veiculo spawnado: Infernus (ID 210, Model 411)', '', 0),
(940, 'Vincent_Henderson', 1, '164.163.207.13', 1534699964, 'Login (in-game)', '', 0),
(941, 'Vincent_Henderson', 1, '164.163.207.13', 1534700004, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(942, 'Vincent_Henderson', 1, '164.163.207.13', 1534700075, 'Login (in-game)', '', 0),
(943, 'Vincent_Henderson', 1, '164.163.207.13', 1534700091, 'Veiculo spawnado: Infernus (ID 211, Model 411)', '', 0),
(944, 'Vincent_Henderson', 1, '164.163.207.13', 1534700173, 'Veiculo destruido: Infernus (ID 211)', '', 0),
(945, 'Vincent_Henderson', 1, '192.168.1.3', 1534700250, 'Login (in-game)', '', 0),
(946, 'Vincent_Henderson', 1, '192.168.1.3', 1534700262, 'Veiculo spawnado: Infernus (ID 210, Model 411)', '', 0),
(947, 'Vincent_Henderson', 1, '192.168.1.3', 1534700394, 'Veiculo destruido: Infernus (ID 210)', '', 0),
(948, 'Vincent_Henderson', 1, '192.168.1.3', 1534700643, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(949, 'Zac_Deutch', 2, '191.253.227.41', 1534700861, 'Login (in-game)', '', 0),
(950, 'Zac_Deutch', 2, '191.253.227.41', 1534701253, 'Login (in-game)', '', 0),
(951, 'Zac_Deutch', 2, '191.253.227.41', 1534701649, 'Jogador puxado', 'Wesley_Vianna', 18),
(952, 'Zac_Deutch', 2, '191.253.227.41', 1534701655, 'Jogador puxado', 'Wesley_Vianna', 18),
(953, 'Zac_Deutch', 2, '191.253.227.41', 1534701740, 'Jogador teleportado', 'Wesley_Vianna', 18),
(954, 'Zac_Deutch', 2, '191.253.227.41', 1534701749, 'Jogador teleportado', 'Wesley_Vianna', 18),
(955, 'Zac_Deutch', 2, '191.253.227.41', 1534701769, 'Spectate', 'Wesley_Vianna', 18),
(956, 'Zac_Deutch', 2, '191.253.227.41', 1534701781, 'Jogador puxado', 'Wesley_Vianna', 18),
(957, 'Zac_Deutch', 2, '191.253.227.41', 1534701792, 'Jogador puxado', 'Wesley_Vianna', 18),
(958, 'Wesley_Vianna', 18, '186.225.187.7', 1534701876, 'Inicia sessão de assistência', 'Zac_Deutch', 2),
(959, 'Vincent_Henderson', 1, '192.168.1.3', 1534701997, 'Login (in-game)', '', 0),
(960, 'Zac_Deutch', 2, '191.253.227.41', 1534702005, 'Jogador puxado', 'Wesley_Vianna', 18),
(961, 'Zac_Deutch', 2, '191.253.227.41', 1534702006, 'Jogador puxado', 'Wesley_Vianna', 18),
(962, 'Zac_Deutch', 2, '191.253.227.41', 1534702070, 'Veiculo spawnado: Utility (ID 210, Model 552)', '', 0),
(963, 'Zac_Deutch', 2, '191.253.227.41', 1534702095, 'Veiculo spawnado: Nevada (ID 211, Model 553)', '', 0),
(964, 'Zac_Deutch', 2, '191.253.227.41', 1534702195, 'Jogador teleportado', 'Wesley_Vianna', 18),
(965, 'Zac_Deutch', 2, '191.253.227.41', 1534702205, 'Jogador teleportado', 'Zac_Deutch', 2),
(966, 'Zac_Deutch', 2, '191.253.227.41', 1534702206, 'Jogador teleportado', 'Wesley_Vianna', 18),
(967, 'Zac_Deutch', 2, '191.253.227.41', 1534702231, 'Veiculo destruido: Nevada (ID 211)', '', 0),
(968, 'Zac_Deutch', 2, '191.253.227.41', 1534702289, 'Veiculo spawnado: Maverick (ID 210, Model 487)', '', 0),
(969, 'Vincent_Henderson', 1, '192.168.1.3', 1534702309, 'Imediato GMX', '', 0),
(970, 'Vincent_Henderson', 1, '192.168.1.3', 1534702335, 'Login (in-game)', '', 0),
(971, 'Zac_Deutch', 2, '191.253.227.41', 1534702366, 'Jogador teleportado', 'Wesley_Vianna', 18),
(972, 'Zac_Deutch', 2, '191.253.227.41', 1534702368, 'Jogador teleportado', 'Wesley_Vianna', 18),
(973, 'Zac_Deutch', 2, '191.253.227.41', 1534702438, 'Skin definida para 176', 'Wesley_Vianna', 18),
(974, 'Zac_Deutch', 2, '191.253.227.41', 1534702468, 'Skin definida para 168', 'Wesley_Vianna', 18),
(975, 'Zac_Deutch', 2, '191.253.227.41', 1534702473, 'Skin definida para 176', 'Wesley_Vianna', 18),
(976, 'Zac_Deutch', 2, '191.253.227.41', 1534702482, 'Veiculo spawnado: Bandito (ID 211, Model 568)', '', 0),
(977, 'Zac_Deutch', 2, '191.253.227.41', 1534702491, 'Jogador puxado', 'Wesley_Vianna', 18),
(978, 'Zac_Deutch', 2, '191.253.227.41', 1534702526, 'Veiculo spawnado: Sanchez (ID 210, Model 468)', '', 0),
(979, 'Zac_Deutch', 2, '191.253.227.41', 1534702551, 'Skin definida para 20009', 'Zac_Deutch', 2),
(980, 'Zac_Deutch', 2, '191.253.227.41', 1534702554, 'Skin definida para 20000', 'Zac_Deutch', 2),
(981, 'Zac_Deutch', 2, '191.253.227.41', 1534702562, 'Skin definida para 20008', 'Zac_Deutch', 2),
(982, 'Zac_Deutch', 2, '191.253.227.41', 1534702566, 'Skin definida para 20001', 'Zac_Deutch', 2),
(983, 'Zac_Deutch', 2, '191.253.227.41', 1534702583, 'Skin definida para 20000', 'Wesley_Vianna', 18),
(984, 'Zac_Deutch', 2, '191.253.227.41', 1534702588, 'Skin definida para 20001', 'Wesley_Vianna', 18),
(985, 'Zac_Deutch', 2, '191.253.227.41', 1534703065, 'Veiculo spawnado: Sanchez (ID 210, Model 468)', '', 0),
(986, 'Zac_Deutch', 2, '191.253.227.41', 1534703138, 'Veiculo spawnado: Sanchez (ID 210, Model 468)', '', 0),
(987, 'Zac_Deutch', 2, '191.253.227.41', 1534703265, 'Jogador puxado', 'Zac_Deutch', 2),
(988, 'Zac_Deutch', 2, '191.253.227.41', 1534703266, 'Jogador puxado', 'Wesley_Vianna', 18),
(989, 'Zac_Deutch', 2, '191.253.227.41', 1534703275, 'Veiculo spawnado: Sanchez (ID 210, Model 468)', '', 0),
(990, 'Vincent_Henderson', 1, '192.168.1.3', 1534704757, 'Login (in-game)', '', 0),
(991, 'Vincent_Henderson', 1, '192.168.1.3', 1534704955, 'Login (in-game)', '', 0),
(992, 'Vincent_Henderson', 1, '192.168.1.3', 1534705280, 'Login (in-game)', '', 0),
(993, 'Vincent_Henderson', 1, '192.168.1.3', 1534705388, 'Login (in-game)', '', 0),
(994, 'Vincent_Henderson', 1, '192.168.1.3', 1534705685, 'Login (in-game)', '', 0),
(995, 'Vincent_Henderson', 1, '192.168.1.3', 1534707893, 'Login (in-game)', '', 0),
(996, 'Vincent_Henderson', 1, '192.168.1.3', 1534708368, 'Imediato GMX', '', 0),
(997, 'Vincent_Henderson', 1, '192.168.1.3', 1534708393, 'Login (in-game)', '', 0),
(998, 'Rowan_Ballard', 4, '186.225.187.250', 1534709329, 'Login (in-game)', '', 0),
(999, 'Vincent_Henderson', 1, '164.163.207.13', 1534709352, 'Login (in-game)', '', 0),
(1000, 'Vincent_Henderson', 1, '164.163.207.13', 1534709368, 'Skin definida para 250', 'Vincent_Henderson', 1),
(1001, 'Vincent_Henderson', 1, '164.163.207.13', 1534709372, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1002, 'Vincent_Henderson', 1, '164.163.207.13', 1534709374, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1003, 'Rowan_Ballard', 4, '186.225.187.250', 1534709376, 'Skin definida para 250', 'Rowan_Ballard', 4),
(1004, 'Rowan_Ballard', 4, '186.225.187.250', 1534709382, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1005, 'Vincent_Henderson', 1, '164.163.207.13', 1534709409, 'Set faction to 1', 'Vincent_Henderson', 1),
(1006, 'Vincent_Henderson', 1, '164.163.207.13', 1534709701, 'Jogador puxado', 'Rowan_Ballard', 4),
(1007, 'Zac_Deutch', 2, '191.253.227.41', 1534709739, 'Login (in-game)', '', 0),
(1008, 'Zac_Deutch', 2, '191.253.227.41', 1534709748, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1009, 'Rowan_Ballard', 4, '186.225.187.250', 1534709873, 'Login (in-game)', '', 0),
(1010, 'Rowan_Ballard', 4, '186.225.187.250', 1534709916, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1011, 'Rowan_Ballard', 4, '186.225.187.250', 1534710007, 'Login (in-game)', '', 0),
(1012, 'Rowan_Ballard', 4, '186.225.187.250', 1534710027, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1013, 'Zac_Deutch', 2, '191.253.227.41', 1534710088, 'Login (in-game)', '', 0),
(1014, 'Zac_Deutch', 2, '191.253.227.41', 1534710101, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1015, 'Vincent_Henderson', 1, '164.163.207.13', 1534710841, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1016, 'Vincent_Henderson', 1, '164.163.207.13', 1534710970, 'Login (in-game)', '', 0),
(1017, 'Vincent_Henderson', 1, '164.163.207.13', 1534711303, 'Imediato GMX', '', 0),
(1018, 'Zac_Deutch', 2, '191.253.227.41', 1534711323, 'Login (in-game)', '', 0),
(1019, 'Vincent_Henderson', 1, '164.163.207.13', 1534711341, 'Login (in-game)', '', 0),
(1020, 'Vincent_Henderson', 1, '164.163.207.13', 1534711372, 'Set faction to 1', 'Zac_Deutch', 2),
(1021, 'Rowan_Ballard', 4, '186.225.187.250', 1534711458, 'Login (in-game)', '', 0),
(1022, 'Rowan_Ballard', 4, '186.225.187.250', 1534711472, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1023, 'Vincent_Henderson', 1, '164.163.207.13', 1534711542, 'Mudou o tempo para 11', '', 0),
(1024, 'Zac_Deutch', 2, '191.253.227.41', 1534711711, 'Silenciado por 60 min', 'Rowan_Ballard', 4),
(1025, 'Zac_Deutch', 2, '191.253.227.41', 1534711724, 'Unmuted', 'Rowan_Ballard', 4),
(1026, 'Vincent_Henderson', 1, '192.168.1.3', 1534711924, 'Login (in-game)', '', 0),
(1027, 'Vincent_Henderson', 1, '127.0.0.1', 1534711981, 'Login (in-game)', '', 0),
(1028, 'Rowan_Ballard', 4, '186.225.187.250', 1534713498, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(1029, 'Vincent_Henderson', 1, '164.163.207.13', 1534713794, 'Login (in-game)', '', 0);
INSERT INTO `adminlog` (`id`, `AdminName`, `AdminSQLID`, `IP`, `Timestamp`, `Action`, `AgainstName`, `AgainstSQLID`) VALUES
(1030, 'Vincent_Henderson', 1, '164.163.207.13', 1534713820, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1031, 'Rowan_Ballard', 4, '186.225.187.250', 1534713850, 'Veiculo spawnado: Sanchez (ID 212, Model 468)', '', 0),
(1032, 'Zac_Deutch', 2, '191.253.227.41', 1534714213, 'Login (in-game)', '', 0),
(1033, 'Zac_Deutch', 2, '191.253.227.41', 1534714235, 'Veiculo spawnado: Infernus (ID 213, Model 411)', '', 0),
(1034, 'Zac_Deutch', 2, '191.253.227.41', 1534714381, 'Veiculo destruido: Infernus (ID 213)', '', 0),
(1035, 'Zac_Deutch', 2, '191.253.227.41', 1534714953, 'Login (in-game)', '', 0),
(1036, 'Zac_Deutch', 2, '191.253.227.41', 1534714980, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1037, 'Zac_Deutch', 2, '191.253.227.41', 1534714983, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1038, 'Zac_Deutch', 2, '191.253.227.41', 1534714985, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1039, 'Zac_Deutch', 2, '191.253.227.41', 1534715207, 'Veiculo spawnado: LSPD Cruiser (ID 213, Model 596)', '', 0),
(1040, 'Zac_Deutch', 2, '191.253.227.41', 1534715269, 'Veiculo destruido: LSPD Cruiser (ID 213)', '', 0),
(1041, 'Zac_Deutch', 2, '191.253.227.41', 1534715357, 'Veiculo spawnado: Infernus (ID 213, Model 411)', '', 0),
(1042, 'Zac_Deutch', 2, '191.253.227.41', 1534715718, 'Veiculo destruido: Infernus (ID 213)', '', 0),
(1043, 'Zac_Deutch', 2, '191.253.227.41', 1534716288, 'Veiculo spawnado: Cargobob (ID 213, Model 548)', '', 0),
(1044, 'Zac_Deutch', 2, '191.253.227.41', 1534716292, 'Veiculo destruido: Cargobob (ID 213)', '', 0),
(1045, 'Zac_Deutch', 2, '191.253.227.41', 1534716296, 'Veiculo spawnado: Dodo (ID 213, Model 593)', '', 0),
(1046, 'Zac_Deutch', 2, '191.253.227.41', 1534716301, 'Veiculo destruido: Dodo (ID 213)', '', 0),
(1047, 'Zac_Deutch', 2, '191.253.227.41', 1534716365, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1048, 'Zac_Deutch', 2, '191.253.227.41', 1534716972, 'Teleportado para Elite Trucking', 'Zac_Deutch', 2),
(1049, 'Zac_Deutch', 2, '191.253.227.41', 1534717021, 'Login (in-game)', '', 0),
(1050, 'Zac_Deutch', 2, '191.253.227.41', 1534717043, 'Teleportado para Elite Trucking', 'Zac_Deutch', 2),
(1051, 'Rowan_Ballard', 4, '186.225.187.250', 1534717274, 'Veiculo spawnado: Cheetah (ID 210, Model 415)', '', 0),
(1052, 'Zac_Deutch', 2, '191.253.227.41', 1534717369, 'Spectate', 'Wesley_Vianna', 18),
(1053, 'Rowan_Ballard', 4, '186.225.187.250', 1534717473, 'Ativado global OOC', '', 0),
(1054, 'Rowan_Ballard', 4, '186.225.187.250', 1534717635, 'Desativado global OOC', '', 0),
(1055, 'Zac_Deutch', 2, '191.253.227.41', 1534717645, 'Diz: ola', '', 0),
(1056, 'Rowan_Ballard', 4, '186.225.187.250', 1534717689, 'Diz: maluco', '', 0),
(1057, 'Zac_Deutch', 2, '191.253.227.41', 1534717713, 'Admin duty on', '', 0),
(1058, 'Zac_Deutch', 2, '191.253.227.41', 1534717821, 'Spectate', 'Wesley_Vianna', 18),
(1059, 'Zac_Deutch', 2, '191.253.227.41', 1534718046, 'Spectate', 'Rowan_Ballard', 4),
(1060, 'Zac_Deutch', 2, '191.253.227.41', 1534718047, 'Spectate', 'Wesley_Vianna', 18),
(1061, 'Zac_Deutch', 2, '191.253.227.41', 1534718048, 'Spectate', 'Rowan_Ballard', 4),
(1062, 'Zac_Deutch', 2, '191.253.227.41', 1534718050, 'Spectate', 'Wesley_Vianna', 18),
(1063, 'Zac_Deutch', 2, '191.253.227.41', 1534718081, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1064, 'Zac_Deutch', 2, '191.253.227.41', 1534718083, 'Jogador puxado', 'Wesley_Vianna', 18),
(1065, 'Zac_Deutch', 2, '191.253.227.41', 1534718084, 'Jogador puxado', 'Rowan_Ballard', 4),
(1066, 'Rowan_Ballard', 4, '186.225.187.250', 1534718084, 'Veiculo spawnado: Squalo (ID 213, Model 446)', '', 0),
(1067, 'Zac_Deutch', 2, '191.253.227.41', 1534718086, 'Spectate', 'Wesley_Vianna', 18),
(1068, 'Zac_Deutch', 2, '191.253.227.41', 1534718118, 'Veiculo spawnado: Sanchez (ID 214, Model 468)', '', 0),
(1069, 'Zac_Deutch', 2, '191.253.227.41', 1534718122, 'Spectate', 'Rowan_Ballard', 4),
(1070, 'Zac_Deutch', 2, '191.253.227.41', 1534718132, 'Veiculo destruido: Sanchez (ID 214)', '', 0),
(1071, 'Zac_Deutch', 2, '191.253.227.41', 1534718135, 'Spectate', 'Wesley_Vianna', 18),
(1072, 'Rowan_Ballard', 4, '186.225.187.250', 1534718163, 'Veiculo destruido: Squalo (ID 213)', '', 0),
(1073, 'Rowan_Ballard', 4, '186.225.187.250', 1534718166, 'Veiculo destruido: Cheetah (ID 210)', '', 0),
(1074, 'Rowan_Ballard', 4, '186.225.187.250', 1534718169, 'Veiculo destruido: Sandking (ID 211)', '', 0),
(1075, 'Rowan_Ballard', 4, '186.225.187.250', 1534718170, 'Veiculo destruido: Sanchez (ID 212)', '', 0),
(1076, 'Rowan_Ballard', 4, '186.225.187.250', 1534718196, 'Jogador teleportado', 'Wesley_Vianna', 18),
(1077, 'Rowan_Ballard', 4, '186.225.187.250', 1534718242, 'Admin duty on', '', 0),
(1078, 'Zac_Deutch', 2, '191.253.227.41', 1534718259, 'Defina saúde para 0', 'Wesley_Vianna', 18),
(1079, 'Zac_Deutch', 2, '191.253.227.41', 1534718261, 'Defina saúde para 100', 'Wesley_Vianna', 18),
(1080, 'Zac_Deutch', 2, '191.253.227.41', 1534718280, 'Jogador puxado', 'Wesley_Vianna', 18),
(1081, 'Zac_Deutch', 2, '191.253.227.41', 1534718300, 'Skin definida para 2007', 'Wesley_Vianna', 18),
(1082, 'Zac_Deutch', 2, '191.253.227.41', 1534718303, 'Skin definida para 20007', 'Wesley_Vianna', 18),
(1083, 'Zac_Deutch', 2, '191.253.227.41', 1534718306, 'Skin definida para 20006', 'Wesley_Vianna', 18),
(1084, 'Zac_Deutch', 2, '191.253.227.41', 1534718308, 'Skin definida para 20002', 'Wesley_Vianna', 18),
(1085, 'Rowan_Ballard', 4, '186.225.187.250', 1534718384, 'Veiculo spawnado: BMX (ID 210, Model 481)', '', 0),
(1086, 'Zac_Deutch', 2, '191.253.227.41', 1534718428, 'Veiculo destruido: BMX (ID 210)', '', 0),
(1087, 'Zac_Deutch', 2, '191.253.227.41', 1534718449, 'Veiculo spawnado: BMX (ID 210, Model 481)', '', 0),
(1088, 'Rowan_Ballard', 4, '186.225.187.250', 1534718753, 'Set faction to 13', 'Rowan_Ballard', 4),
(1089, 'Zac_Deutch', 2, '191.253.227.41', 1534718834, 'Login (in-game)', '', 0),
(1090, 'Zac_Deutch', 2, '191.253.227.41', 1534718852, 'Teleportado para Elite Trucking', 'Zac_Deutch', 2),
(1091, 'Zac_Deutch', 2, '191.253.227.41', 1534718937, 'Admin duty on', '', 0),
(1092, 'Zac_Deutch', 2, '191.253.227.41', 1534719009, 'Veiculo spawnado: Infernus (ID 211, Model 411)', '', 0),
(1093, 'Zac_Deutch', 2, '191.253.227.41', 1534719019, 'Veiculo destruido: Infernus (ID 211)', '', 0),
(1094, 'Rowan_Ballard', 4, '186.225.187.250', 1534719145, 'Set faction to 1', 'Rowan_Ballard', 4),
(1095, 'Rowan_Ballard', 4, '186.225.187.250', 1534719152, 'Set faction to 13', 'Zac_Deutch', 2),
(1096, 'Zac_Deutch', 2, '191.253.227.41', 1534719183, 'Teleportado para Elite Trucking', 'Zac_Deutch', 2),
(1097, 'Zac_Deutch', 2, '191.253.227.41', 1534719227, 'Teleportado para Elite Trucking', 'Zac_Deutch', 2),
(1098, 'Rowan_Ballard', 4, '186.225.187.250', 1534719460, 'Login (in-game)', '', 0),
(1099, 'Vincent_Henderson', 1, '164.163.207.13', 1534719469, 'Login (in-game)', '', 0),
(1100, 'Zac_Deutch', 2, '191.253.227.41', 1534719546, 'Login (in-game)', '', 0),
(1101, 'Zac_Deutch', 2, '191.253.227.41', 1534719569, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1102, 'Zac_Deutch', 2, '191.253.227.41', 1534719713, 'Diz: 98# em', '', 0),
(1103, 'Rowan_Ballard', 4, '186.225.187.250', 1534719865, 'Admin duty on', '', 0),
(1104, 'Vincent_Henderson', 1, '164.163.207.13', 1534720031, 'Admin duty on', '', 0),
(1105, 'Zac_Deutch', 2, '191.253.227.41', 1534720060, 'Teleportado para Elite Trucking', 'Zac_Deutch', 2),
(1106, 'Vincent_Henderson', 1, '164.163.207.13', 1534720418, 'Jogador teleportado', 'Zac_Deutch', 2),
(1107, 'Zac_Deutch', 2, '191.253.227.41', 1534721422, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1108, 'Zac_Deutch', 2, '191.253.227.41', 1534721494, 'Admin duty on', '', 0),
(1109, 'Zac_Deutch', 2, '191.253.227.41', 1534721511, 'Spectate', 'Rowan_Ballard', 4),
(1110, 'Zac_Deutch', 2, '191.253.227.41', 1534721517, 'Spectate', 'Vincent_Henderson', 1),
(1111, 'Vincent_Henderson', 1, '127.0.0.1', 1534722486, 'Login (in-game)', '', 0),
(1112, 'Zac_Deutch', 2, '191.253.227.41', 1534723574, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1113, 'Zac_Deutch', 2, '191.253.227.41', 1534723690, 'Desarmado', 'Zac_Deutch', 2),
(1114, 'Zac_Deutch', 2, '191.253.227.41', 1534724079, 'Veiculo spawnado: Infernus (ID 210, Model 411)', '', 0),
(1115, 'Zac_Deutch', 2, '191.253.227.41', 1534724092, 'Veiculo destruido: Infernus (ID 210)', '', 0),
(1116, 'Zac_Deutch', 2, '191.253.227.41', 1534724135, 'Diz: to com 0 desde que loguei', '', 0),
(1117, 'Zac_Deutch', 2, '191.253.227.41', 1534724161, 'Admin duty DND', '', 0),
(1118, 'Vincent_Henderson', 1, '127.0.0.1', 1534724152, 'Login (in-game)', '', 0),
(1119, 'Zac_Deutch', 2, '191.253.227.41', 1534724191, 'Admin duty on', '', 0),
(1120, 'Zac_Deutch', 2, '191.253.227.41', 1534724243, 'Silenciado por 1 min', 'Rowan_Ballard', 4),
(1121, 'Zac_Deutch', 2, '191.253.227.41', 1534724253, 'Unmuted', 'Rowan_Ballard', 4),
(1122, 'Zac_Deutch', 2, '191.253.227.41', 1534724324, 'Veiculo spawnado: Infernus (ID 210, Model 411)', '', 0),
(1123, 'Zac_Deutch', 2, '191.253.227.41', 1534724442, 'Froze player', 'Zac_Deutch', 2),
(1124, 'Zac_Deutch', 2, '191.253.227.41', 1534724535, 'Unfroze player', 'Zac_Deutch', 2),
(1125, 'Rowan_Ballard', 4, '186.225.187.250', 1534724619, 'Adicionado na Help Team', 'Zac_Deutch', 2),
(1126, 'Rowan_Ballard', 4, '186.225.187.250', 1534724628, 'Adicionado na Help Team', 'Rowan_Ballard', 4),
(1127, 'Rowan_Ballard', 4, '186.225.187.250', 1534724702, 'Froze player', 'Rowan_Ballard', 4),
(1128, 'Rowan_Ballard', 4, '186.225.187.250', 1534724711, 'Unfroze player', 'Rowan_Ballard', 4),
(1129, 'Zac_Deutch', 2, '191.253.227.41', 1534724938, 'Inicia sessão de assistência', 'Rowan_Ballard', 4),
(1130, 'Rowan_Ballard', 4, '186.225.187.250', 1534725107, 'Spectate', 'Zac_Deutch', 2),
(1131, 'Rowan_Ballard', 4, '186.225.187.250', 1534725186, 'Spectate', 'Zac_Deutch', 2),
(1132, 'Rowan_Ballard', 4, '186.225.187.250', 1534725187, 'Spectate', 'Zac_Deutch', 2),
(1133, 'Rowan_Ballard', 4, '186.225.187.250', 1534725188, 'Spectate', 'Zac_Deutch', 2),
(1134, 'Rowan_Ballard', 4, '186.225.187.250', 1534725191, 'Spectate', 'Zac_Deutch', 2),
(1135, 'Rowan_Ballard', 4, '186.225.187.250', 1534725202, 'Spectate', 'Zac_Deutch', 2),
(1136, 'Rowan_Ballard', 4, '186.225.187.250', 1534725205, 'Spectate', 'Zac_Deutch', 2),
(1137, 'Rowan_Ballard', 4, '186.225.187.250', 1534725205, 'Spectate', 'Zac_Deutch', 2),
(1138, 'Rowan_Ballard', 4, '186.225.187.250', 1534725207, 'Jogador teleportado', 'Zac_Deutch', 2),
(1139, 'Vincent_Henderson', 1, '127.0.0.1', 1534725339, 'Login (in-game)', '', 0),
(1140, 'Rowan_Ballard', 4, '186.225.187.250', 1534725816, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(1141, 'Vincent_Henderson', 1, '127.0.0.1', 1534726043, 'Login (in-game)', '', 0),
(1142, 'Zac_Deutch', 2, '191.253.227.41', 1534726337, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1143, 'Zac_Deutch', 2, '191.253.227.41', 1534726766, 'Inicia sessão de assistência', 'Rowan_Ballard', 4),
(1144, 'Rowan_Ballard', 4, '186.225.187.250', 1534726857, 'Inicia sessão de assistência', 'Zac_Deutch', 2),
(1145, 'Zac_Deutch', 2, '191.253.227.41', 1534727025, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1146, 'Rowan_Ballard', 4, '186.225.187.250', 1534727041, 'Anúncio: t', '', 0),
(1147, 'Rowan_Ballard', 4, '186.225.187.250', 1534727050, 'Inicia uma contagem regressiva', '', 0),
(1148, 'Rowan_Ballard', 4, '186.225.187.250', 1534727279, 'Admin duty on', '', 0),
(1149, 'Rowan_Ballard', 4, '186.225.187.250', 1534727465, 'Veiculo destruido: Infernus (ID 210)', '', 0),
(1150, 'Zac_Deutch', 2, '191.253.227.41', 1534727590, 'Jogador puxado', 'Rowan_Ballard', 4),
(1151, 'Rowan_Ballard', 4, '186.225.187.250', 1534727640, 'Veiculo spawnado: BMX (ID 210, Model 481)', '', 0),
(1152, 'Zac_Deutch', 2, '191.253.227.41', 1534727669, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1153, 'Rowan_Ballard', 4, '186.225.187.250', 1534727673, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(1154, 'Zac_Deutch', 2, '191.253.227.41', 1534728153, 'Login (in-game)', '', 0),
(1155, 'Zac_Deutch', 2, '191.253.227.41', 1534728190, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1156, 'Rowan_Ballard', 4, '186.225.187.250', 1534728274, 'Admin duty off', '', 0),
(1157, 'Zac_Deutch', 2, '191.253.227.41', 1534728358, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1158, 'Zac_Deutch', 2, '191.253.227.41', 1534728397, 'Desarmado', 'Rowan_Ballard', 4),
(1159, 'Zac_Deutch', 2, '191.253.227.41', 1534728553, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1160, 'Zac_Deutch', 2, '191.253.227.41', 1534728656, 'Veiculo spawnado: Infernus (ID 211, Model 411)', '', 0),
(1161, 'Zac_Deutch', 2, '191.253.227.41', 1534728730, 'Admin duty on', '', 0),
(1162, 'Vincent_Henderson', 1, '127.0.0.1', 1534728905, 'Login (in-game)', '', 0),
(1163, 'Vincent_Henderson', 1, '127.0.0.1', 1534729162, 'Login (in-game)', '', 0),
(1164, 'Zac_Deutch', 2, '191.253.227.41', 1534729379, 'Inicia sessão de assistência', 'Rowan_Ballard', 4),
(1165, 'Rowan_Ballard', 4, '186.225.187.250', 1534729427, 'Inicia sessão de assistência', 'Zac_Deutch', 2),
(1166, 'Rowan_Ballard', 4, '186.225.187.250', 1534729436, 'Veiculo destruido: BMX (ID 210)', '', 0),
(1167, 'Rowan_Ballard', 4, '186.225.187.250', 1534729437, 'Veiculo destruido: Infernus (ID 211)', '', 0),
(1168, 'Zac_Deutch', 2, '191.253.227.41', 1534729497, 'Veiculo spawnado: Infernus (ID 210, Model 411)', '', 0),
(1169, 'Zac_Deutch', 2, '191.253.227.41', 1534729553, 'removido da Helper team', 'Zac_Deutch', 2),
(1170, 'Rowan_Ballard', 4, '186.225.187.250', 1534729556, 'Adicionado na Help Team', 'Zac_Deutch', 2),
(1171, 'Zac_Deutch', 2, '191.253.227.41', 1534729559, 'removido da Helper team', 'Zac_Deutch', 2),
(1172, 'Rowan_Ballard', 4, '186.225.187.250', 1534729560, 'Adicionado na Help Team', 'Zac_Deutch', 2),
(1173, 'Zac_Deutch', 2, '191.253.227.41', 1534729562, 'removido da Helper team', 'Rowan_Ballard', 4),
(1174, 'Zac_Deutch', 2, '191.253.227.41', 1534729565, 'removido da Helper team', 'Zac_Deutch', 2),
(1175, 'Zac_Deutch', 2, '191.253.227.41', 1534729569, 'Veiculo destruido: Infernus (ID 210)', '', 0),
(1176, 'Rowan_Ballard', 4, '186.225.187.250', 1534729601, 'Adicionado na Help Team', 'Zac_Deutch', 2),
(1177, 'Rowan_Ballard', 4, '186.225.187.250', 1534729602, 'removido da Helper team', 'Zac_Deutch', 2),
(1178, 'Rowan_Ballard', 4, '186.225.187.250', 1534729622, 'Veiculo spawnado: NRG-500 (ID 210, Model 522)', '', 0),
(1179, 'Zac_Deutch', 2, '191.253.227.41', 1534729934, 'Adicionado na Help Team', 'Zac_Deutch', 2),
(1180, 'Zac_Deutch', 2, '191.253.227.41', 1534729942, 'removido da Helper team', 'Zac_Deutch', 2),
(1181, 'Vincent_Henderson', 1, '127.0.0.1', 1534730087, 'Login (in-game)', '', 0),
(1182, 'Vincent_Henderson', 1, '127.0.0.1', 1534730115, 'Mudou o tempo para 11', '', 0),
(1183, 'Vincent_Henderson', 1, '127.0.0.1', 1534730136, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1184, 'Rowan_Ballard', 4, '186.225.187.250', 1534730186, 'Veiculo destruido: NRG-500 (ID 210)', '', 0),
(1185, 'Rowan_Ballard', 4, '186.225.187.250', 1534730190, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(1186, 'Zac_Deutch', 2, '191.253.227.41', 1534730216, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1187, 'Zac_Deutch', 2, '191.253.227.41', 1534730283, 'Jogador puxado', 'Rowan_Ballard', 4),
(1188, 'Vincent_Henderson', 1, '127.0.0.1', 1534730269, 'Login (in-game)', '', 0),
(1189, 'Rowan_Ballard', 4, '186.225.187.250', 1534730377, 'Jogador teleportado', 'Zac_Deutch', 2),
(1190, 'Zac_Deutch', 2, '191.253.227.41', 1534730575, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1191, 'Zac_Deutch', 2, '191.253.227.41', 1534730858, 'Login (in-game)', '', 0),
(1192, 'Vincent_Henderson', 1, '127.0.0.1', 1534730962, 'Login (in-game)', '', 0),
(1193, 'Vincent_Henderson', 1, '127.0.0.1', 1534731032, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1194, 'Rowan_Ballard', 4, '186.225.187.250', 1534731065, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(1195, 'Vincent_Henderson', 1, '127.0.0.1', 1534731059, 'Veiculo destruido: Sandking (ID 210)', '', 0),
(1196, 'Rowan_Ballard', 4, '186.225.187.250', 1534731175, 'Broadcast: a', '', 0),
(1197, 'Rowan_Ballard', 4, '186.225.187.250', 1534731185, 'Broadcast: Obrigado!', '', 0),
(1198, 'Rowan_Ballard', 4, '186.225.187.250', 1534731599, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(1199, 'Vincent_Henderson', 1, '127.0.0.1', 1534731580, 'Imediato GMX', '', 0),
(1200, 'Vincent_Henderson', 1, '127.0.0.1', 1534731605, 'Login (in-game)', '', 0),
(1201, 'Vincent_Henderson', 1, '127.0.0.1', 1534731637, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1202, 'Vincent_Henderson', 1, '127.0.0.1', 1534731658, 'Veiculo destruido: Sandking (ID 211)', '', 0),
(1203, 'Rowan_Ballard', 4, '186.225.187.250', 1534731713, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(1204, 'Vincent_Henderson', 1, '127.0.0.1', 1534731848, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1205, 'Vincent_Henderson', 1, '127.0.0.1', 1534732085, 'Veiculo destruido: Sandking (ID 211)', '', 0),
(1206, 'Vincent_Henderson', 1, '127.0.0.1', 1534732199, 'Login (in-game)', '', 0),
(1207, 'Vincent_Henderson', 1, '164.163.207.13', 1534732756, 'Login (in-game)', '', 0),
(1208, 'Vincent_Henderson', 1, '164.163.207.13', 1534734433, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1209, 'Rowan_Ballard', 4, '186.225.187.250', 1534734461, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1210, 'Rowan_Ballard', 4, '186.225.187.250', 1534734464, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1211, 'Vincent_Henderson', 1, '164.163.207.13', 1534734561, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1212, 'Rowan_Ballard', 4, '186.225.187.250', 1534734589, 'Mudou o tempo para 10', '', 0),
(1213, 'Rowan_Ballard', 4, '186.225.187.250', 1534734596, 'Mudou o tempo para 11', '', 0),
(1214, 'Rowan_Ballard', 4, '186.225.187.250', 1534734597, 'Mudou o tempo para 12', '', 0),
(1215, 'Rowan_Ballard', 4, '186.225.187.250', 1534734599, 'Mudou o tempo para 15', '', 0),
(1216, 'Rowan_Ballard', 4, '186.225.187.250', 1534734608, 'Mudou o tempo para 8', '', 0),
(1217, 'Rowan_Ballard', 4, '186.225.187.250', 1534734831, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1218, 'Rowan_Ballard', 4, '186.225.187.250', 1534735065, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(1219, 'Rowan_Ballard', 4, '186.225.187.250', 1534735145, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(1220, 'Rowan_Ballard', 4, '186.225.187.250', 1534735297, 'Teleportado para Bone County Docks', 'Rowan_Ballard', 4),
(1221, 'Rowan_Ballard', 4, '186.225.187.250', 1534735522, 'Veiculo spawnado: Sanchez (ID 210, Model 468)', '', 0),
(1222, 'Vincent_Henderson', 1, '164.163.207.13', 1534736001, 'Login (in-game)', '', 0),
(1223, 'Rowan_Ballard', 4, '186.225.187.250', 1534736019, 'Login (in-game)', '', 0),
(1224, 'Rowan_Ballard', 4, '186.225.187.250', 1534736373, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(1225, 'Rowan_Ballard', 4, '186.225.187.250', 1534736527, 'Mudou o tempo para 6', '', 0),
(1226, 'Rowan_Ballard', 4, '186.225.187.250', 1534736751, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1227, 'Vincent_Henderson', 1, '164.163.207.13', 1534737873, 'Login (in-game)', '', 0),
(1228, 'Rowan_Ballard', 4, '186.225.187.250', 1534737914, 'Login (in-game)', '', 0),
(1229, 'Vincent_Henderson', 1, '164.163.207.13', 1534741100, 'Login (in-game)', '', 0),
(1230, 'Rowan_Ballard', 4, '186.225.187.250', 1534741160, 'Login (in-game)', '', 0),
(1231, 'Vincent_Henderson', 1, '164.163.207.13', 1534741289, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1232, 'Rowan_Ballard', 4, '186.225.187.250', 1534742158, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(1233, 'Vincent_Henderson', 1, '164.163.207.13', 1534742246, 'Login (in-game)', '', 0),
(1234, 'Vincent_Henderson', 1, '164.163.207.13', 1534742260, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1235, 'Rowan_Ballard', 4, '186.225.187.250', 1534742568, 'Mudou o tempo para 6', '', 0),
(1236, 'Rowan_Ballard', 4, '186.225.187.250', 1534742707, 'Mudou o tempo para 7', '', 0),
(1237, 'Rowan_Ballard', 4, '186.225.187.250', 1534742713, 'Mudou o tempo para 8', '', 0),
(1238, 'Rowan_Ballard', 4, '186.225.187.250', 1534742714, 'Mudou o tempo para 9', '', 0),
(1239, 'Rowan_Ballard', 4, '186.225.187.250', 1534742717, 'Mudou o tempo para 10', '', 0),
(1240, 'Vincent_Henderson', 1, '164.163.207.13', 1534742918, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1241, 'Vincent_Henderson', 1, '164.163.207.13', 1534744357, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1242, 'Vincent_Henderson', 1, '164.163.207.13', 1534744880, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1243, 'Rowan_Ballard', 4, '186.225.187.250', 1534745053, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1244, 'Vincent_Henderson', 1, '164.163.207.13', 1534745076, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1245, 'Vincent_Henderson', 1, '164.163.207.13', 1534745122, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1246, 'Vincent_Henderson', 1, '164.163.207.13', 1534745324, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1247, 'Rowan_Ballard', 4, '186.225.187.250', 1534745338, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1248, 'Rowan_Ballard', 4, '186.225.187.250', 1534745342, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1249, 'Vincent_Henderson', 1, '164.163.207.13', 1534745445, 'Skin definida para 22', 'Vincent_Henderson', 1),
(1250, 'Rowan_Ballard', 4, '186.225.187.250', 1534745462, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1251, 'Rowan_Ballard', 4, '186.225.187.250', 1534745464, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1252, 'Vincent_Henderson', 1, '164.163.207.13', 1534745652, 'Login (in-game)', '', 0),
(1253, 'Vincent_Henderson', 1, '164.163.207.13', 1534745855, 'Set faction to 6', 'Vincent_Henderson', 1),
(1254, 'Vincent_Henderson', 1, '164.163.207.13', 1534745865, 'Deu uma lincesa de HELI', 'Vincent_Henderson', 1),
(1255, 'Rowan_Ballard', 4, '186.225.187.250', 1534745990, 'Mudou o tempo para 10', '', 0),
(1256, 'Rowan_Ballard', 4, '186.225.187.250', 1534745993, 'Mudou o tempo para 15', '', 0),
(1257, 'Rowan_Ballard', 4, '186.225.187.250', 1534746130, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(1258, 'Vincent_Henderson', 1, '164.163.207.13', 1534746141, 'Jogador puxado', 'Rowan_Ballard', 4),
(1259, 'Vincent_Henderson', 1, '164.163.207.13', 1534746153, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1260, 'Vincent_Henderson', 1, '164.163.207.13', 1534746177, 'Veiculo spawnado: Maverick (ID 212, Model 487)', '', 0),
(1261, 'Vincent_Henderson', 1, '164.163.207.13', 1534746198, 'Deu uma lincesa de HELI', 'Rowan_Ballard', 4),
(1262, 'Vincent_Henderson', 1, '164.163.207.13', 1534746277, 'Veiculo spawnado: Huntley (ID 210, Model 579)', '', 0),
(1263, 'Rowan_Ballard', 4, '186.225.187.250', 1534746444, 'Skin definida para 250', 'Rowan_Ballard', 4),
(1264, 'Rowan_Ballard', 4, '186.225.187.250', 1534746928, 'Admin duty DND', '', 0),
(1265, 'Rowan_Ballard', 4, '186.225.187.250', 1534746934, 'Admin duty off', '', 0),
(1266, 'Rowan_Ballard', 4, '186.225.187.250', 1534746944, 'Admin duty on', '', 0),
(1267, 'Rowan_Ballard', 4, '186.225.187.250', 1534746956, 'Admin duty off', '', 0),
(1268, 'Rowan_Ballard', 4, '186.225.187.250', 1534747417, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(1269, 'Rowan_Ballard', 4, '186.225.187.250', 1534747502, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1270, 'Rowan_Ballard', 4, '186.225.187.250', 1534747525, 'Veiculo destruido: Huntley (ID 210)', '', 0),
(1271, 'Rowan_Ballard', 4, '186.225.187.250', 1534748816, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(1272, 'Rowan_Ballard', 4, '186.225.187.250', 1534748819, 'Defina saúde para 50', 'Rowan_Ballard', 4),
(1273, 'Rowan_Ballard', 4, '186.225.187.250', 1534748821, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(1274, 'Rowan_Ballard', 4, '186.225.187.250', 1534748838, 'Admin duty on', '', 0),
(1275, 'Rowan_Ballard', 4, '186.225.187.250', 1534748860, 'Skin definida para 2000', 'Rowan_Ballard', 4),
(1276, 'Rowan_Ballard', 4, '186.225.187.250', 1534748863, 'Skin definida para 20001', 'Rowan_Ballard', 4),
(1277, 'Rowan_Ballard', 4, '186.225.187.250', 1534748865, 'Skin definida para 20002', 'Rowan_Ballard', 4),
(1278, 'Rowan_Ballard', 4, '186.225.187.250', 1534748868, 'Skin definida para 20003', 'Rowan_Ballard', 4),
(1279, 'Rowan_Ballard', 4, '186.225.187.250', 1534748869, 'Skin definida para 20004', 'Rowan_Ballard', 4),
(1280, 'Rowan_Ballard', 4, '186.225.187.250', 1534748870, 'Skin definida para 20005', 'Rowan_Ballard', 4),
(1281, 'Rowan_Ballard', 4, '186.225.187.250', 1534748873, 'Skin definida para 20006', 'Rowan_Ballard', 4),
(1282, 'Rowan_Ballard', 4, '186.225.187.250', 1534748874, 'Skin definida para 20007', 'Rowan_Ballard', 4),
(1283, 'Rowan_Ballard', 4, '186.225.187.250', 1534748876, 'Skin definida para 20008', 'Rowan_Ballard', 4),
(1284, 'Rowan_Ballard', 4, '186.225.187.250', 1534748878, 'Skin definida para 20009', 'Rowan_Ballard', 4),
(1285, 'Rowan_Ballard', 4, '186.225.187.250', 1534748883, 'Skin definida para 20010', 'Rowan_Ballard', 4),
(1286, 'Rowan_Ballard', 4, '186.225.187.250', 1534748885, 'Skin definida para 20012', 'Rowan_Ballard', 4),
(1287, 'Rowan_Ballard', 4, '186.225.187.250', 1534748886, 'Skin definida para 20013', 'Rowan_Ballard', 4),
(1288, 'Rowan_Ballard', 4, '186.225.187.250', 1534748888, 'Skin definida para 20014', 'Rowan_Ballard', 4),
(1289, 'Rowan_Ballard', 4, '186.225.187.250', 1534748889, 'Skin definida para 20015', 'Rowan_Ballard', 4),
(1290, 'Rowan_Ballard', 4, '186.225.187.250', 1534748891, 'Skin definida para 20016', 'Rowan_Ballard', 4),
(1291, 'Rowan_Ballard', 4, '186.225.187.250', 1534748893, 'Skin definida para 20017', 'Rowan_Ballard', 4),
(1292, 'Rowan_Ballard', 4, '186.225.187.250', 1534748895, 'Skin definida para 20018', 'Rowan_Ballard', 4),
(1293, 'Rowan_Ballard', 4, '186.225.187.250', 1534748898, 'Skin definida para 20020', 'Rowan_Ballard', 4),
(1294, 'Rowan_Ballard', 4, '186.225.187.250', 1534748901, 'Skin definida para 20018', 'Rowan_Ballard', 4),
(1295, 'Rowan_Ballard', 4, '186.225.187.250', 1534748903, 'Skin definida para 20017', 'Rowan_Ballard', 4),
(1296, 'Rowan_Ballard', 4, '186.225.187.250', 1534748905, 'Skin definida para 20016', 'Rowan_Ballard', 4),
(1297, 'Rowan_Ballard', 4, '186.225.187.250', 1534748906, 'Skin definida para 20015', 'Rowan_Ballard', 4),
(1298, 'Vincent_Henderson', 1, '164.163.207.13', 1534750522, 'Adicionado na Help Team', 'Rowan_Ballard', 4),
(1299, 'Vincent_Henderson', 1, '164.163.207.13', 1534750525, 'Adicionado na Help Team', 'Vincent_Henderson', 1),
(1300, 'Rowan_Ballard', 4, '186.225.187.250', 1534750646, 'Inicia sessão de assistência', 'Vincent_Henderson', 1),
(1301, 'Vincent_Henderson', 1, '164.163.207.13', 1534750708, 'Inicia sessão de assistência', 'Rowan_Ballard', 4),
(1302, 'Scottler_Johnson', 13, '191.17.149.163', 1534792544, 'Login (in-game)', '', 0),
(1303, 'Scottler_Johnson', 13, '191.17.149.163', 1534792598, 'Teleportado para LS Tower', 'Scottler_Johnson', 13),
(1304, 'Vincent_Henderson', 1, '164.163.207.13', 1534792615, 'Login (in-game)', '', 0),
(1305, 'Scottler_Johnson', 13, '191.17.149.163', 1534792619, 'Teleportado para El Quebrados', 'Scottler_Johnson', 13),
(1306, 'Scottler_Johnson', 13, '191.17.149.163', 1534792644, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1307, 'Vincent_Henderson', 1, '164.163.207.13', 1534792654, 'Give weapon Desert Eagle, ammo=70, reason=Refund', 'Scottler_Johnson', 13),
(1308, 'Scottler_Johnson', 13, '191.17.149.163', 1534792723, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1309, 'Scottler_Johnson', 13, '191.17.149.163', 1534792754, 'Teleportado para Montgomery', 'Scottler_Johnson', 13),
(1310, 'Vincent_Henderson', 1, '164.163.207.13', 1534792786, 'Jogador teleportado', 'Scottler_Johnson', 13),
(1311, 'Scottler_Johnson', 13, '191.17.149.163', 1534793585, 'Login (in-game)', '', 0),
(1312, 'Scottler_Johnson', 13, '191.17.149.163', 1534793657, 'Login (in-game)', '', 0),
(1313, 'Vincent_Henderson', 1, '164.163.207.13', 1534793660, 'Login (in-game)', '', 0),
(1314, 'Scottler_Johnson', 13, '191.17.149.163', 1534793673, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1315, 'Vincent_Henderson', 1, '164.163.207.13', 1534793828, 'Jogador teleportado', 'Scottler_Johnson', 13),
(1316, 'Vincent_Henderson', 1, '164.163.207.13', 1534793878, 'Skin definida para 20004', 'Scottler_Johnson', 13),
(1317, 'Vincent_Henderson', 1, '164.163.207.13', 1534794486, 'Login (in-game)', '', 0),
(1318, 'Scottler_Johnson', 13, '191.17.149.163', 1534794590, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1319, 'Vincent_Henderson', 1, '164.163.207.13', 1534795055, 'Login (in-game)', '', 0),
(1320, 'Scottler_Johnson', 13, '191.17.149.163', 1534795237, 'Login (in-game)', '', 0),
(1321, 'Vincent_Henderson', 1, '164.163.207.13', 1534795746, 'Login (in-game)', '', 0),
(1322, 'Scottler_Johnson', 13, '191.17.149.163', 1534795794, 'Login (in-game)', '', 0),
(1323, 'Scottler_Johnson', 13, '191.17.149.163', 1534795930, 'Login (in-game)', '', 0),
(1324, 'Vincent_Henderson', 1, '164.163.207.13', 1534795950, 'Login (in-game)', '', 0),
(1325, 'Scottler_Johnson', 13, '191.17.149.163', 1534795955, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1326, 'Vincent_Henderson', 1, '164.163.207.13', 1534795967, 'Skin definida para 20002', 'Scottler_Johnson', 13),
(1327, 'Vincent_Henderson', 1, '164.163.207.13', 1534795972, 'Skin definida para 20004', 'Scottler_Johnson', 13),
(1328, 'Vincent_Henderson', 1, '164.163.207.13', 1534795975, 'Skin definida para 20004', 'Vincent_Henderson', 1),
(1329, 'Vincent_Henderson', 1, '164.163.207.13', 1534795980, 'Skin definida para 20002', 'Vincent_Henderson', 1),
(1330, 'Vincent_Henderson', 1, '164.163.207.13', 1534796598, 'Give weapon Desert Eagle, ammo=70, reason=Refund', 'Vincent_Henderson', 1),
(1331, 'Vincent_Henderson', 1, '164.163.207.13', 1534796681, 'Skin definida para 250', 'Vincent_Henderson', 1),
(1332, 'Zac_Deutch', 2, '191.253.239.193', 1534797071, 'Login (in-game)', '', 0),
(1333, 'Zac_Deutch', 2, '191.253.239.193', 1534797080, 'Jogador teleportado', 'Scottler_Johnson', 13),
(1334, 'Vincent_Henderson', 1, '164.163.207.13', 1534797108, 'Login (in-game)', '', 0),
(1335, 'Zac_Deutch', 2, '191.253.239.193', 1534797116, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1336, 'Vincent_Henderson', 1, '164.163.207.13', 1534797129, 'Set faction to 10', 'Vincent_Henderson', 1),
(1337, 'Vincent_Henderson', 1, '164.163.207.13', 1534797138, 'Jogador puxado', 'Zac_Deutch', 2),
(1338, 'Scottler_Johnson', 13, '191.17.149.163', 1534797148, 'Jogador teleportado', 'Zac_Deutch', 2),
(1339, 'Rowan_Ballard', 4, '186.225.187.250', 1534797306, 'Login (in-game)', '', 0),
(1340, 'Rowan_Ballard', 4, '186.225.187.250', 1534797379, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(1341, 'Zac_Deutch', 2, '191.253.239.193', 1534797621, 'Spectate', 'Rowan_Ballard', 4),
(1342, 'Zac_Deutch', 2, '191.253.239.193', 1534797629, 'Spectate', 'Vincent_Henderson', 1),
(1343, 'Zac_Deutch', 2, '191.253.239.193', 1534797634, 'Spectate', 'Scottler_Johnson', 13),
(1344, 'Zac_Deutch', 2, '191.253.239.193', 1534797636, 'Spectate', 'Rowan_Ballard', 4),
(1345, 'Rowan_Ballard', 4, '186.225.187.250', 1534797737, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(1346, 'Rowan_Ballard', 4, '186.225.187.250', 1534798009, 'Admin duty on', '', 0),
(1347, 'Scottler_Johnson', 13, '191.17.149.163', 1534798310, 'Login (in-game)', '', 0),
(1348, 'Vincent_Henderson', 1, '164.163.207.13', 1534798328, 'Login (in-game)', '', 0),
(1349, 'Scottler_Johnson', 13, '191.17.149.163', 1534798333, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1350, 'Rowan_Ballard', 4, '186.225.187.250', 1534798354, 'Login (in-game)', '', 0),
(1351, 'Vincent_Henderson', 1, '164.163.207.13', 1534798374, 'Give weapon Desert Eagle, ammo=70, reason=Refund', 'Scottler_Johnson', 13),
(1352, 'Rowan_Ballard', 4, '186.225.187.250', 1534798410, 'Login (in-game)', '', 0),
(1353, 'Rowan_Ballard', 4, '186.225.187.250', 1534798421, 'Admin duty on', '', 0),
(1354, 'Vincent_Henderson', 1, '164.163.207.13', 1534798958, 'Login (in-game)', '', 0),
(1355, 'Scottler_Johnson', 13, '191.17.149.163', 1534798968, 'Login (in-game)', '', 0),
(1356, 'Scottler_Johnson', 13, '191.17.149.163', 1534798983, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1357, 'Rowan_Ballard', 4, '186.225.187.250', 1534799017, 'Login (in-game)', '', 0),
(1358, 'Rowan_Ballard', 4, '186.225.187.250', 1534799251, 'Login (in-game)', '', 0),
(1359, 'Rowan_Ballard', 4, '186.225.187.250', 1534799306, 'Login (in-game)', '', 0),
(1360, 'Scottler_Johnson', 13, '191.17.149.163', 1534799628, 'Login (in-game)', '', 0),
(1361, 'Vincent_Henderson', 1, '164.163.207.13', 1534799642, 'Login (in-game)', '', 0),
(1362, 'Scottler_Johnson', 13, '191.17.149.163', 1534799644, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1363, 'Rowan_Ballard', 4, '186.225.187.250', 1534799653, 'Login (in-game)', '', 0),
(1364, 'Scottler_Johnson', 13, '191.17.149.163', 1534799732, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1365, 'Rowan_Ballard', 4, '186.225.187.250', 1534799749, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1366, 'Scottler_Johnson', 13, '191.17.149.163', 1534799768, 'Teleportado para Montgomery', 'Scottler_Johnson', 13),
(1367, 'Rowan_Ballard', 4, '186.225.187.250', 1534800842, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(1368, 'Vincent_Henderson', 1, '164.163.207.13', 1534801028, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1369, 'Rowan_Ballard', 4, '186.225.187.250', 1534801938, 'Skin definida para 201', 'Rowan_Ballard', 4),
(1370, 'Rowan_Ballard', 4, '186.225.187.250', 1534801939, 'Skin definida para 202', 'Rowan_Ballard', 4),
(1371, 'Rowan_Ballard', 4, '186.225.187.250', 1534801941, 'Skin definida para 203', 'Rowan_Ballard', 4),
(1372, 'Rowan_Ballard', 4, '186.225.187.250', 1534801942, 'Skin definida para 204', 'Rowan_Ballard', 4),
(1373, 'Rowan_Ballard', 4, '186.225.187.250', 1534801943, 'Skin definida para 205', 'Rowan_Ballard', 4),
(1374, 'Rowan_Ballard', 4, '186.225.187.250', 1534801944, 'Skin definida para 206', 'Rowan_Ballard', 4),
(1375, 'Rowan_Ballard', 4, '186.225.187.250', 1534801945, 'Skin definida para 207', 'Rowan_Ballard', 4),
(1376, 'Rowan_Ballard', 4, '186.225.187.250', 1534801946, 'Skin definida para 207', 'Rowan_Ballard', 4),
(1377, 'Rowan_Ballard', 4, '186.225.187.250', 1534801948, 'Skin definida para 208', 'Rowan_Ballard', 4),
(1378, 'Rowan_Ballard', 4, '186.225.187.250', 1534801949, 'Skin definida para 209', 'Rowan_Ballard', 4),
(1379, 'Rowan_Ballard', 4, '186.225.187.250', 1534801952, 'Skin definida para 210', 'Rowan_Ballard', 4),
(1380, 'Rowan_Ballard', 4, '186.225.187.250', 1534801953, 'Skin definida para 211', 'Rowan_Ballard', 4),
(1381, 'Rowan_Ballard', 4, '186.225.187.250', 1534801954, 'Skin definida para 212', 'Rowan_Ballard', 4),
(1382, 'Rowan_Ballard', 4, '186.225.187.250', 1534801954, 'Skin definida para 213', 'Rowan_Ballard', 4),
(1383, 'Rowan_Ballard', 4, '186.225.187.250', 1534801956, 'Skin definida para 214', 'Rowan_Ballard', 4),
(1384, 'Rowan_Ballard', 4, '186.225.187.250', 1534801957, 'Skin definida para 215', 'Rowan_Ballard', 4),
(1385, 'Rowan_Ballard', 4, '186.225.187.250', 1534801959, 'Skin definida para 216', 'Rowan_Ballard', 4),
(1386, 'Rowan_Ballard', 4, '186.225.187.250', 1534801960, 'Skin definida para 217', 'Rowan_Ballard', 4),
(1387, 'Rowan_Ballard', 4, '186.225.187.250', 1534801961, 'Skin definida para 218', 'Rowan_Ballard', 4),
(1388, 'Rowan_Ballard', 4, '186.225.187.250', 1534801964, 'Skin definida para 219', 'Rowan_Ballard', 4),
(1389, 'Rowan_Ballard', 4, '186.225.187.250', 1534801965, 'Skin definida para 220', 'Rowan_Ballard', 4),
(1390, 'Rowan_Ballard', 4, '186.225.187.250', 1534801966, 'Skin definida para 221', 'Rowan_Ballard', 4),
(1391, 'Rowan_Ballard', 4, '186.225.187.250', 1534801967, 'Skin definida para 222', 'Rowan_Ballard', 4),
(1392, 'Rowan_Ballard', 4, '186.225.187.250', 1534801968, 'Skin definida para 223', 'Rowan_Ballard', 4),
(1393, 'Rowan_Ballard', 4, '186.225.187.250', 1534801969, 'Skin definida para 224', 'Rowan_Ballard', 4),
(1394, 'Rowan_Ballard', 4, '186.225.187.250', 1534801970, 'Skin definida para 225', 'Rowan_Ballard', 4),
(1395, 'Rowan_Ballard', 4, '186.225.187.250', 1534801971, 'Skin definida para 226', 'Rowan_Ballard', 4),
(1396, 'Rowan_Ballard', 4, '186.225.187.250', 1534801972, 'Skin definida para 227', 'Rowan_Ballard', 4),
(1397, 'Rowan_Ballard', 4, '186.225.187.250', 1534801974, 'Skin definida para 228', 'Rowan_Ballard', 4),
(1398, 'Rowan_Ballard', 4, '186.225.187.250', 1534801975, 'Skin definida para 229', 'Rowan_Ballard', 4),
(1399, 'Rowan_Ballard', 4, '186.225.187.250', 1534801976, 'Skin definida para 230', 'Rowan_Ballard', 4),
(1400, 'Rowan_Ballard', 4, '186.225.187.250', 1534801977, 'Skin definida para 231', 'Rowan_Ballard', 4),
(1401, 'Rowan_Ballard', 4, '186.225.187.250', 1534801979, 'Skin definida para 232', 'Rowan_Ballard', 4),
(1402, 'Rowan_Ballard', 4, '186.225.187.250', 1534801979, 'Skin definida para 233', 'Rowan_Ballard', 4),
(1403, 'Rowan_Ballard', 4, '186.225.187.250', 1534801980, 'Skin definida para 234', 'Rowan_Ballard', 4),
(1404, 'Rowan_Ballard', 4, '186.225.187.250', 1534801981, 'Skin definida para 235', 'Rowan_Ballard', 4),
(1405, 'Rowan_Ballard', 4, '186.225.187.250', 1534801983, 'Skin definida para 236', 'Rowan_Ballard', 4),
(1406, 'Rowan_Ballard', 4, '186.225.187.250', 1534801985, 'Skin definida para 237', 'Rowan_Ballard', 4),
(1407, 'Rowan_Ballard', 4, '186.225.187.250', 1534801986, 'Skin definida para 238', 'Rowan_Ballard', 4),
(1408, 'Rowan_Ballard', 4, '186.225.187.250', 1534801987, 'Skin definida para 239', 'Rowan_Ballard', 4),
(1409, 'Rowan_Ballard', 4, '186.225.187.250', 1534801989, 'Skin definida para 240', 'Rowan_Ballard', 4),
(1410, 'Rowan_Ballard', 4, '186.225.187.250', 1534801990, 'Skin definida para 241', 'Rowan_Ballard', 4),
(1411, 'Rowan_Ballard', 4, '186.225.187.250', 1534801991, 'Skin definida para 242', 'Rowan_Ballard', 4),
(1412, 'Rowan_Ballard', 4, '186.225.187.250', 1534801992, 'Skin definida para 243', 'Rowan_Ballard', 4),
(1413, 'Rowan_Ballard', 4, '186.225.187.250', 1534801992, 'Skin definida para 244', 'Rowan_Ballard', 4),
(1414, 'Rowan_Ballard', 4, '186.225.187.250', 1534801993, 'Skin definida para 245', 'Rowan_Ballard', 4),
(1415, 'Rowan_Ballard', 4, '186.225.187.250', 1534801995, 'Skin definida para 247', 'Rowan_Ballard', 4),
(1416, 'Rowan_Ballard', 4, '186.225.187.250', 1534801996, 'Skin definida para 248', 'Rowan_Ballard', 4),
(1417, 'Rowan_Ballard', 4, '186.225.187.250', 1534801998, 'Skin definida para 247', 'Rowan_Ballard', 4),
(1418, 'Rowan_Ballard', 4, '186.225.187.250', 1534802011, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(1419, 'Vincent_Henderson', 1, '164.163.207.13', 1534804555, 'Login (in-game)', '', 0),
(1420, 'Vincent_Henderson', 1, '164.163.207.13', 1534804570, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1421, 'Vincent_Henderson', 1, '127.0.0.1', 1534811505, 'Login (in-game)', '', 0),
(1422, 'Vincent_Henderson', 1, '127.0.0.1', 1534811706, 'Login (in-game)', '', 0),
(1423, 'Vincent_Henderson', 1, '127.0.0.1', 1534811740, 'Mudou o tempo para 11', '', 0),
(1424, 'Vincent_Henderson', 1, '127.0.0.1', 1534812087, 'Set faction to 1', 'Vincent_Henderson', 1),
(1425, 'Vincent_Henderson', 1, '127.0.0.1', 1534813050, 'Login (in-game)', '', 0),
(1426, 'Vincent_Henderson', 1, '127.0.0.1', 1534813551, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1427, 'Vincent_Henderson', 1, '127.0.0.1', 1534813583, 'Mudou o tempo para 11', '', 0),
(1428, 'Rowan_Ballard', 4, '186.225.187.250', 1534813696, 'Login (in-game)', '', 0),
(1429, 'Rowan_Ballard', 4, '186.225.187.250', 1534813790, 'Veiculo spawnado: Sanchez (ID 211, Model 468)', '', 0),
(1430, 'Rowan_Ballard', 4, '186.225.187.250', 1534813815, 'removido da Helper team', 'Rowan_Ballard', 4),
(1431, 'Rowan_Ballard', 4, '186.225.187.250', 1534813820, 'Veiculo destruido: Sanchez (ID 211)', '', 0),
(1432, 'Rowan_Ballard', 4, '186.225.187.250', 1534814134, 'Mudou o tempo para 6', '', 0),
(1433, 'Rowan_Ballard', 4, '186.225.187.250', 1534814136, 'Mudou o tempo para 7', '', 0),
(1434, 'Vincent_Henderson', 1, '127.0.0.1', 1534814126, 'Login (in-game)', '', 0),
(1435, 'Vincent_Henderson', 1, '127.0.0.1', 1534814140, 'Mudou o tempo para 11', '', 0),
(1436, 'Vincent_Henderson', 1, '127.0.0.1', 1534814148, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1437, 'Vincent_Henderson', 1, '127.0.0.1', 1534814206, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1438, 'Scottler_Johnson', 13, '191.17.149.163', 1534814637, 'Login (in-game)', '', 0),
(1439, 'Scottler_Johnson', 13, '191.17.149.163', 1534814653, 'Teleportado para Dillimore', 'Scottler_Johnson', 13),
(1440, 'Vincent_Henderson', 1, '164.163.207.13', 1534814671, 'Login (in-game)', '', 0),
(1441, 'Vincent_Henderson', 1, '164.163.207.13', 1534814738, 'Login (in-game)', '', 0),
(1442, 'Scottler_Johnson', 13, '191.17.149.163', 1534814817, 'Set faction to 0', 'Scottler_Johnson', 13),
(1443, 'Scottler_Johnson', 13, '191.17.149.163', 1534814821, 'Set faction to 1', 'Scottler_Johnson', 13),
(1444, 'Vincent_Henderson', 1, '164.163.207.13', 1534814836, 'Login (in-game)', '', 0),
(1445, 'Vincent_Henderson', 1, '164.163.207.13', 1534814863, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1446, 'Vincent_Henderson', 1, '164.163.207.13', 1534814878, 'Jogador teleportado', 'Scottler_Johnson', 13),
(1447, 'Scottler_Johnson', 13, '191.17.149.163', 1534815624, 'Login (in-game)', '', 0),
(1448, 'Scottler_Johnson', 13, '191.17.149.163', 1534815651, 'Teleportado para Montgomery', 'Scottler_Johnson', 13),
(1449, 'Vincent_Henderson', 1, '164.163.207.13', 1534815670, 'Login (in-game)', '', 0),
(1450, 'Vincent_Henderson', 1, '164.163.207.13', 1534815706, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(1451, 'Vincent_Henderson', 1, '164.163.207.13', 1534815777, 'Defina saúde para 100', 'Vincent_Henderson', 1),
(1452, 'Vincent_Henderson', 1, '164.163.207.13', 1534816503, 'Login (in-game)', '', 0),
(1453, 'Vincent_Henderson', 1, '164.163.207.13', 1534816548, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(1454, 'Rowan_Ballard', 4, '186.225.187.250', 1534817556, 'Login (in-game)', '', 0),
(1455, 'Rowan_Ballard', 4, '186.225.187.250', 1534817575, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1456, 'Rowan_Ballard', 4, '186.225.187.250', 1534817777, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1457, 'Rowan_Ballard', 4, '186.225.187.250', 1534818806, 'Admin duty on', '', 0),
(1458, 'Vincent_Henderson', 1, '164.163.207.13', 1534818858, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1459, 'Scottler_Johnson', 13, '191.17.149.163', 1534820940, 'Login (in-game)', '', 0),
(1460, 'Scottler_Johnson', 13, '191.17.149.163', 1534820961, 'Teleportado para Montgomery', 'Scottler_Johnson', 13),
(1461, 'Vincent_Henderson', 1, '164.163.207.13', 1534820962, 'Login (in-game)', '', 0),
(1462, 'Scottler_Johnson', 13, '191.17.149.163', 1534820968, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1463, 'Scottler_Johnson', 13, '191.17.149.163', 1534735165, 'Login (in-game)', '', 0),
(1464, 'Scottler_Johnson', 13, '191.17.149.163', 1534735179, 'Teleportado para Montgomery', 'Scottler_Johnson', 13),
(1465, 'Vincent_Henderson', 1, '164.163.207.13', 1534735198, 'Login (in-game)', '', 0),
(1466, 'Scottler_Johnson', 13, '191.17.149.163', 1534735200, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1467, 'Scottler_Johnson', 13, '191.17.149.163', 1534735681, 'Login (in-game)', '', 0),
(1468, 'Vincent_Henderson', 1, '164.163.207.13', 1534735691, 'Login (in-game)', '', 0),
(1469, 'Scottler_Johnson', 13, '191.17.149.163', 1534735692, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1470, 'Scottler_Johnson', 13, '191.17.149.163', 1534735712, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1471, 'Scottler_Johnson', 13, '191.17.149.163', 1534735715, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1472, 'Vincent_Henderson', 1, '127.0.0.1', 1534822190, 'Login (in-game)', '', 0),
(1473, 'Vincent_Henderson', 1, '127.0.0.1', 1534822291, 'Login (in-game)', '', 0),
(1474, 'Vincent_Henderson', 1, '164.163.207.13', 1534736043, 'Login (in-game)', '', 0),
(1475, 'Vincent_Henderson', 1, '164.163.207.13', 1534736055, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1476, 'Vincent_Henderson', 1, '164.163.207.13', 1534736061, 'Jogador teleportado', 'Scottler_Johnson', 13),
(1477, 'Vincent_Henderson', 1, '164.163.207.13', 1534736758, 'Login (in-game)', '', 0),
(1478, 'Vincent_Henderson', 1, '164.163.207.13', 1534737047, 'Login (in-game)', '', 0),
(1479, 'Vincent_Henderson', 1, '164.163.207.13', 1534737578, 'Login (in-game)', '', 0),
(1480, 'Veronica_Alexandra', 11, '164.163.207.13', 1534737681, 'Login (in-game)', '', 0),
(1481, 'Vincent_Henderson', 1, '164.163.207.13', 1534739658, 'Login (in-game)', '', 0),
(1482, 'Vincent_Henderson', 1, '164.163.207.13', 1534740333, 'Login (in-game)', '', 0),
(1483, 'Vincent_Henderson', 1, '164.163.207.13', 1534741296, 'Login (in-game)', '', 0),
(1484, 'Scottler_Johnson', 13, '191.17.149.163', 1534741299, 'Login (in-game)', '', 0),
(1485, 'Vincent_Henderson', 1, '164.163.207.13', 1534741304, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1486, 'Scottler_Johnson', 13, '191.17.149.163', 1534741304, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1487, 'Scottler_Johnson', 13, '191.17.149.163', 1534741358, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1488, 'Vincent_Henderson', 1, '164.163.207.13', 1534743019, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1489, 'Vincent_Henderson', 1, '164.163.207.13', 1534743022, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1490, 'Vincent_Henderson', 1, '164.163.207.13', 1534743311, 'Login (in-game)', '', 0),
(1491, 'Vincent_Henderson', 1, '127.0.0.1', 1534862876, 'Login (in-game)', '', 0),
(1492, 'Vincent_Henderson', 1, '127.0.0.1', 1534862977, 'Mudou o tempo para 11', '', 0),
(1493, 'Vincent_Henderson', 1, '127.0.0.1', 1534862985, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1494, 'Vincent_Henderson', 1, '127.0.0.1', 1534869756, 'Login (in-game)', '', 0),
(1495, 'Vincent_Henderson', 1, '127.0.0.1', 1534869769, 'Mudou o tempo para 11', '', 0),
(1496, 'Vincent_Henderson', 1, '127.0.0.1', 1534869773, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1497, 'Vincent_Henderson', 1, '127.0.0.1', 1534869777, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1498, 'Vincent_Henderson', 1, '127.0.0.1', 1534869929, 'Skin definida para 250', 'Vincent_Henderson', 1),
(1499, 'Vincent_Henderson', 1, '127.0.0.1', 1534871205, 'Login (in-game)', '', 0),
(1500, 'Vincent_Henderson', 1, '127.0.0.1', 1534871218, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1501, 'Vincent_Henderson', 1, '127.0.0.1', 1534871223, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1502, 'Vincent_Henderson', 1, '127.0.0.1', 1534872751, 'Login (in-game)', '', 0),
(1503, 'Vincent_Henderson', 1, '127.0.0.1', 1534872765, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1504, 'Vincent_Henderson', 1, '127.0.0.1', 1534873268, 'Login (in-game)', '', 0),
(1505, 'Vincent_Henderson', 1, '127.0.0.1', 1534873275, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1506, 'Vincent_Henderson', 1, '127.0.0.1', 1534873288, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1507, 'Vincent_Henderson', 1, '127.0.0.1', 1534873670, 'Login (in-game)', '', 0),
(1508, 'Vincent_Henderson', 1, '127.0.0.1', 1534873680, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1509, 'Vincent_Henderson', 1, '127.0.0.1', 1534873689, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1510, 'Vincent_Henderson', 1, '127.0.0.1', 1534875015, 'Login (in-game)', '', 0),
(1511, 'Vincent_Henderson', 1, '127.0.0.1', 1534875660, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1512, 'Vincent_Henderson', 1, '127.0.0.1', 1534875675, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1513, 'Vincent_Henderson', 1, '127.0.0.1', 1534875758, 'Objeto temporário spawnado. (5856)', '', 0),
(1514, 'Vincent_Henderson', 1, '127.0.0.1', 1534875870, 'Objeto temporário spawnado. (5856)', '', 0),
(1515, 'Vincent_Henderson', 1, '127.0.0.1', 1534876007, 'Objeto temporário spawnado. (5856)', '', 0),
(1516, 'Vincent_Henderson', 1, '127.0.0.1', 1534876123, 'Objeto temporário spawnado. (5856)', '', 0),
(1517, 'Vincent_Henderson', 1, '127.0.0.1', 1534876288, 'Objeto temporário spawnado. (5856)', '', 0),
(1518, 'Vincent_Henderson', 1, '127.0.0.1', 1534876378, 'Objeto temporário spawnado. (5856)', '', 0),
(1519, 'Vincent_Henderson', 1, '127.0.0.1', 1534876525, 'Objeto temporário spawnado. (5856)', '', 0),
(1520, 'Vincent_Henderson', 1, '127.0.0.1', 1534876616, 'Objeto temporário spawnado. (5856)', '', 0),
(1521, 'Vincent_Henderson', 1, '127.0.0.1', 1534876702, 'Objeto temporário spawnado. (5856)', '', 0),
(1522, 'Vincent_Henderson', 1, '127.0.0.1', 1534876838, 'Objeto temporário spawnado. (5856)', '', 0),
(1523, 'Vincent_Henderson', 1, '127.0.0.1', 1534876932, 'Objeto temporário spawnado. (5856)', '', 0),
(1524, 'Vincent_Henderson', 1, '127.0.0.1', 1534877021, 'Objeto temporário spawnado. (5856)', '', 0),
(1525, 'Vincent_Henderson', 1, '127.0.0.1', 1534877961, 'Imediato GMX', '', 0),
(1526, 'Vincent_Henderson', 1, '127.0.0.1', 1534878171, 'Login (in-game)', '', 0),
(1527, 'Vincent_Henderson', 1, '127.0.0.1', 1534878192, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1528, 'Vincent_Henderson', 1, '127.0.0.1', 1534878196, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1529, 'Vincent_Henderson', 1, '127.0.0.1', 1534878706, 'Login (in-game)', '', 0),
(1530, 'Vincent_Henderson', 1, '127.0.0.1', 1534878738, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1531, 'Zac_Deutch', 2, '186.224.152.98', 1534792364, 'Login (in-game)', '', 0),
(1532, 'Vincent_Henderson', 1, '127.0.0.1', 1534878744, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1533, 'Zac_Deutch', 2, '186.224.152.98', 1534792569, 'Veiculo spawnado: Voodoo (ID 210, Model 412)', '', 0),
(1534, 'Vincent_Henderson', 1, '127.0.0.1', 1534878982, 'Login (in-game)', '', 0),
(1535, 'Vincent_Henderson', 1, '127.0.0.1', 1534878991, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1536, 'Vincent_Henderson', 1, '127.0.0.1', 1534878997, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1537, 'Zac_Deutch', 2, '186.224.152.98', 1534793001, 'Veiculo destruido: Voodoo (ID 210)', '', 0),
(1538, 'Vincent_Henderson', 1, '127.0.0.1', 1534879487, 'Login (in-game)', '', 0);
INSERT INTO `adminlog` (`id`, `AdminName`, `AdminSQLID`, `IP`, `Timestamp`, `Action`, `AgainstName`, `AgainstSQLID`) VALUES
(1539, 'Zac_Deutch', 2, '186.224.152.98', 1534793162, 'Veiculo spawnado: Pony (ID 210, Model 413)', '', 0),
(1540, 'Zac_Deutch', 2, '186.224.152.98', 1534793166, 'Veiculo destruido: Pony (ID 210)', '', 0),
(1541, 'Zac_Deutch', 2, '186.224.152.98', 1534793686, 'Login (in-game)', '', 0),
(1542, 'Vincent_Henderson', 1, '127.0.0.1', 1534880080, 'Login (in-game)', '', 0),
(1543, 'Vincent_Henderson', 1, '127.0.0.1', 1534880092, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1544, 'Vincent_Henderson', 1, '127.0.0.1', 1534880099, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1545, 'Zac_Deutch', 2, '186.224.152.98', 1534793745, 'Login (in-game)', '', 0),
(1546, 'Zac_Deutch', 2, '186.224.152.98', 1534793814, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1547, 'Zac_Deutch', 2, '186.224.152.98', 1534794348, 'Admin duty on', '', 0),
(1548, 'Zac_Deutch', 2, '186.224.152.98', 1534794376, 'Froze player', 'Zac_Deutch', 2),
(1549, 'Zac_Deutch', 2, '186.224.152.98', 1534794391, 'Unfroze player', 'Zac_Deutch', 2),
(1550, 'Zac_Deutch', 2, '186.224.152.98', 1534794656, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1551, 'Vincent_Henderson', 1, '127.0.0.1', 1534881242, 'Login (in-game)', '', 0),
(1552, 'Vincent_Henderson', 1, '127.0.0.1', 1534881261, 'Set faction to 0', 'Vincent_Henderson', 1),
(1553, 'Vincent_Henderson', 1, '127.0.0.1', 1534881263, 'Set faction to 1', 'Vincent_Henderson', 1),
(1554, 'Vincent_Henderson', 1, '164.163.207.13', 1534795087, 'Login (in-game)', '', 0),
(1555, 'Vincent_Henderson', 1, '164.163.207.13', 1534795129, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(1556, 'Vincent_Henderson', 1, '164.163.207.13', 1534795239, 'Login (in-game)', '', 0),
(1557, 'Vincent_Henderson', 1, '164.163.207.13', 1534795566, 'Spectate', 'Zac_Deutch', 2),
(1558, 'Vincent_Henderson', 1, '164.163.207.13', 1534795583, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1559, 'Zac_Deutch', 2, '186.224.152.98', 1534795590, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1560, 'Zac_Deutch', 2, '186.224.152.98', 1534796096, 'Veiculo spawnado: Taxi (ID 210, Model 420)', '', 0),
(1561, 'Vincent_Henderson', 1, '164.163.207.13', 1534796271, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1562, 'Zac_Deutch', 2, '186.224.152.98', 1534796326, 'Login (in-game)', '', 0),
(1563, 'Zac_Deutch', 2, '186.224.152.98', 1534796334, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1564, 'Zac_Deutch', 2, '186.224.152.98', 1534796375, 'Login (in-game)', '', 0),
(1565, 'Zac_Deutch', 2, '186.224.152.98', 1534796388, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1566, 'Vincent_Henderson', 1, '164.163.207.13', 1534796428, 'Set faction to 10', 'Zac_Deutch', 2),
(1567, 'Vincent_Henderson', 1, '164.163.207.13', 1534796499, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1568, 'Vincent_Henderson', 1, '164.163.207.13', 1534796588, 'Jogador puxado', 'Vincent_Henderson', 1),
(1569, 'Vincent_Henderson', 1, '164.163.207.13', 1534796597, 'Jogador puxado', 'Zac_Deutch', 2),
(1570, 'Vincent_Henderson', 1, '164.163.207.13', 1534796603, 'Jogador puxado', 'Zac_Deutch', 2),
(1571, 'Vincent_Henderson', 1, '164.163.207.13', 1534796682, 'Login (in-game)', '', 0),
(1572, 'Vincent_Henderson', 1, '164.163.207.13', 1534796702, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1573, 'Zac_Deutch', 2, '186.224.152.98', 1534796962, 'Teleportado para Palomino Creek', 'Zac_Deutch', 2),
(1574, 'Zac_Deutch', 2, '186.224.152.98', 1534797170, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1575, 'Vincent_Henderson', 1, '164.163.207.13', 1534797407, 'Todos facções da base de dados foram recarregadas', '', 0),
(1576, 'Vincent_Henderson', 1, '164.163.207.13', 1534797833, 'Todos facções da base de dados foram recarregadas', '', 0),
(1577, 'Vincent_Henderson', 1, '164.163.207.13', 1534798365, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1578, 'Vincent_Henderson', 1, '164.163.207.13', 1534798369, 'Jogador teleportado', 'Zac_Deutch', 2),
(1579, 'Vincent_Henderson', 1, '164.163.207.13', 1534798407, 'Veiculo spawnado: Infernus (ID 211, Model 411)', '', 0),
(1580, 'Zac_Deutch', 2, '186.224.152.98', 1534798450, 'Login (in-game)', '', 0),
(1581, 'Zac_Deutch', 2, '186.224.152.98', 1534798460, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1582, 'Vincent_Henderson', 1, '164.163.207.13', 1534798512, 'Veiculo spawnado: Infernus (ID 212, Model 411)', '', 0),
(1583, 'Vincent_Henderson', 1, '164.163.207.13', 1534798645, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1584, 'Zac_Deutch', 2, '186.224.152.98', 1534798659, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1585, 'Vincent_Henderson', 1, '164.163.207.13', 1534798738, 'Veiculo spawnado: Infernus (ID 211, Model 411)', '', 0),
(1586, 'Zac_Deutch', 2, '186.224.152.98', 1534798978, 'Login (in-game)', '', 0),
(1587, 'Zac_Deutch', 2, '186.224.152.98', 1534798996, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1588, 'Vincent_Henderson', 1, '164.163.207.13', 1534799076, 'Login (in-game)', '', 0),
(1589, 'Vincent_Henderson', 1, '164.163.207.13', 1534799095, 'Jogador teleportado', 'Zac_Deutch', 2),
(1590, 'Zac_Deutch', 2, '186.224.152.98', 1534799160, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1591, 'Vincent_Henderson', 1, '164.163.207.13', 1534800044, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1592, 'Zac_Deutch', 2, '186.224.152.98', 1534800096, 'Teleportado para Dillimore', 'Zac_Deutch', 2),
(1593, 'Zac_Deutch', 2, '186.224.152.98', 1534800151, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1594, 'Zac_Deutch', 2, '186.224.152.98', 1534800177, 'Teleportado para Dillimore', 'Zac_Deutch', 2),
(1595, 'Zac_Deutch', 2, '186.224.152.98', 1534800326, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1596, 'Zac_Deutch', 2, '186.224.152.98', 1534800445, 'Login (in-game)', '', 0),
(1597, 'Zac_Deutch', 2, '186.224.152.98', 1534800461, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1598, 'Zac_Deutch', 2, '186.224.152.98', 1534800501, 'Login (in-game)', '', 0),
(1599, 'Zac_Deutch', 2, '186.224.152.98', 1534800513, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1600, 'Vincent_Henderson', 1, '164.163.207.13', 1534801113, 'Give weapon M4, ammo=200, reason=Refund', 'Vincent_Henderson', 1),
(1601, 'Vincent_Henderson', 1, '164.163.207.13', 1534802560, 'Login (in-game)', '', 0),
(1602, 'Vincent_Henderson', 1, '164.163.207.13', 1534802788, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(1603, 'Vincent_Henderson', 1, '164.163.207.13', 1534802963, 'Set Sniper weapon skill to -1', 'Vincent_Henderson', 1),
(1604, 'Zac_Deutch', 2, '186.224.152.98', 1534802985, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1605, 'Vincent_Henderson', 1, '164.163.207.13', 1534802986, 'Habilidade de 9mm Silenciada definida para -1', 'Vincent_Henderson', 1),
(1606, 'Vincent_Henderson', 1, '164.163.207.13', 1534802990, 'Set Sniper weapon skill to -1', 'Vincent_Henderson', 1),
(1607, 'Vincent_Henderson', 1, '164.163.207.13', 1534803245, 'Jogador teleportado', 'Zac_Deutch', 2),
(1608, 'Vincent_Henderson', 1, '164.163.207.13', 1534803252, 'Jogador teleportado', 'Zac_Deutch', 2),
(1609, 'Vincent_Henderson', 1, '164.163.207.13', 1534803496, 'Teleportado para County Rentals', 'Vincent_Henderson', 1),
(1610, 'Vincent_Henderson', 1, '164.163.207.13', 1534803521, 'Teleportado para Las Payasadas', 'Vincent_Henderson', 1),
(1611, 'Vincent_Henderson', 1, '164.163.207.13', 1534803526, 'Teleportado para Elite Trucking', 'Vincent_Henderson', 1),
(1612, 'Zac_Deutch', 2, '186.224.152.98', 1534803549, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1613, 'Vincent_Henderson', 1, '164.163.207.13', 1534806019, 'Login (in-game)', '', 0),
(1614, 'Zac_Deutch', 2, '186.224.152.98', 1534806035, 'Login (in-game)', '', 0),
(1615, 'Vincent_Henderson', 1, '164.163.207.13', 1534806037, 'Jogador teleportado', 'Zac_Deutch', 2),
(1616, 'Vincent_Henderson', 1, '164.163.207.13', 1534806303, 'Habilidade de M4 definida para -1', 'Vincent_Henderson', 1),
(1617, 'Vincent_Henderson', 1, '164.163.207.13', 1534806936, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1618, 'Rowan_Ballard', 4, '186.225.187.250', 1534817914, 'Login (in-game)', '', 0),
(1619, 'Rowan_Ballard', 4, '186.225.187.250', 1534818289, 'Mudou o tempo para 0', '', 0),
(1620, 'Rowan_Ballard', 4, '186.225.187.250', 1534818291, 'Mudou o tempo para 2', '', 0),
(1621, 'Rowan_Ballard', 4, '186.225.187.250', 1534818292, 'Mudou o tempo para 5', '', 0),
(1622, 'Rowan_Ballard', 4, '186.225.187.250', 1534818294, 'Mudou o tempo para 6', '', 0),
(1623, 'Rowan_Ballard', 4, '186.225.187.250', 1534818296, 'Mudou o tempo para 7', '', 0),
(1624, 'Scottler_Johnson', 13, '191.17.149.163', 1534834975, 'Login (in-game)', '', 0),
(1625, 'Vincent_Henderson', 1, '164.163.207.13', 1534834983, 'Login (in-game)', '', 0),
(1626, 'Scottler_Johnson', 13, '191.17.149.163', 1534834986, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1627, 'Vincent_Henderson', 1, '164.163.207.13', 1534835003, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1628, 'Scottler_Johnson', 13, '191.17.149.163', 1534835005, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1629, 'Vincent_Henderson', 1, '164.163.207.13', 1534835016, 'Mudou o tempo para 11', '', 0),
(1630, 'Vincent_Henderson', 1, '164.163.207.13', 1534835021, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1631, 'Vincent_Henderson', 1, '164.163.207.13', 1534836125, 'Login (in-game)', '', 0),
(1632, 'Vincent_Henderson', 1, '164.163.207.13', 1534836147, 'Definiu o level de donate para 4', 'Scottler_Johnson', 13),
(1633, 'Vincent_Henderson', 1, '164.163.207.13', 1534836722, 'Login (in-game)', '', 0),
(1634, 'Scottler_Johnson', 13, '191.17.149.163', 1534836729, 'Login (in-game)', '', 0),
(1635, 'Scottler_Johnson', 13, '191.17.149.163', 1534836746, 'Teleportado para Palomino Creek', 'Scottler_Johnson', 13),
(1636, 'Vincent_Henderson', 1, '164.163.207.13', 1534836747, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1637, 'Vincent_Henderson', 1, '164.163.207.13', 1534836962, 'Login (in-game)', '', 0),
(1638, 'Scottler_Johnson', 13, '191.17.149.163', 1534836963, 'Login (in-game)', '', 0),
(1639, 'Scottler_Johnson', 13, '191.17.149.163', 1534836970, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1640, 'Vincent_Henderson', 1, '164.163.207.13', 1534837242, 'Login (in-game)', '', 0),
(1641, 'Vincent_Henderson', 1, '164.163.207.13', 1534837726, 'Login (in-game)', '', 0),
(1642, 'Scottler_Johnson', 13, '191.17.149.163', 1534838511, 'Teleportado para Montgomery', 'Scottler_Johnson', 13),
(1643, 'Vincent_Henderson', 1, '164.163.207.13', 1534839884, 'Objeto temporário spawnado. (973)', '', 0),
(1644, 'Vincent_Henderson', 1, '164.163.207.13', 1534840035, 'Objeto temporário spawnado. (973)', '', 0),
(1645, 'Vincent_Henderson', 1, '164.163.207.13', 1534840149, 'Objeto temporário spawnado. (1459)', '', 0),
(1646, 'Vincent_Henderson', 1, '164.163.207.13', 1534840197, 'Objeto temporário spawnado. (973)', '', 0),
(1647, 'Vincent_Henderson', 1, '164.163.207.13', 1534840279, 'Objeto temporário spawnado. (973)', '', 0),
(1648, 'Vincent_Henderson', 1, '164.163.207.13', 1534840321, 'Objeto temporário spawnado. (973)', '', 0),
(1649, 'Vincent_Henderson', 1, '164.163.207.13', 1534840409, 'Objeto temporário spawnado. (973)', '', 0),
(1650, 'Vincent_Henderson', 1, '164.163.207.13', 1534840487, 'Objeto temporário spawnado. (973)', '', 0),
(1651, 'Vincent_Henderson', 1, '164.163.207.13', 1534840990, 'Login (in-game)', '', 0),
(1652, 'Scottler_Johnson', 13, '191.17.149.163', 1534841001, 'Login (in-game)', '', 0),
(1653, 'Scottler_Johnson', 13, '191.17.149.163', 1534841009, 'Teleportado para Montgomery', 'Scottler_Johnson', 13),
(1654, 'Vincent_Henderson', 1, '164.163.207.13', 1534841018, 'Jogador teleportado', 'Scottler_Johnson', 13),
(1655, 'Vincent_Henderson', 1, '164.163.207.13', 1534841058, 'Definiu o level de donate para 3', 'Vincent_Henderson', 1),
(1656, 'Vincent_Henderson', 1, '164.163.207.13', 1534841066, 'Definiu o level de donate para 4', 'Vincent_Henderson', 1),
(1657, 'Vincent_Henderson', 1, '164.163.207.13', 1534841117, 'Login (in-game)', '', 0),
(1658, 'Vincent_Henderson', 1, '164.163.207.13', 1534841121, 'Jogador teleportado', 'Scottler_Johnson', 13),
(1659, 'Vincent_Henderson', 1, '164.163.207.13', 1534841149, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1660, 'Vincent_Henderson', 1, '164.163.207.13', 1534841187, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(1661, 'Vincent_Henderson', 1, '164.163.207.13', 1534841192, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1662, 'Scottler_Johnson', 13, '191.17.149.163', 1534842155, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1663, 'Vincent_Henderson', 1, '164.163.207.13', 1534842345, 'Colete definido para 0', 'Vincent_Henderson', 1),
(1664, 'Vincent_Henderson', 1, '127.0.0.1', 1534933105, 'Login (in-game)', '', 0),
(1665, 'Vincent_Henderson', 1, '127.0.0.1', 1534933123, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1666, 'Vincent_Henderson', 1, '127.0.0.1', 1534933156, 'Login (in-game)', '', 0),
(1667, 'Vincent_Henderson', 1, '127.0.0.1', 1534933170, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1668, 'Vincent_Henderson', 1, '127.0.0.1', 1534933225, 'Login (in-game)', '', 0),
(1669, 'Vincent_Henderson', 1, '127.0.0.1', 1534933234, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(1670, 'Vincent_Henderson', 1, '127.0.0.1', 1534933331, 'Login (in-game)', '', 0),
(1671, 'Vincent_Henderson', 1, '127.0.0.1', 1534933341, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1672, 'Vincent_Henderson', 1, '127.0.0.1', 1534933468, 'Login (in-game)', '', 0),
(1673, 'Vincent_Henderson', 1, '127.0.0.1', 1534933479, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1674, 'Vincent_Henderson', 1, '127.0.0.1', 1534933485, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1675, 'Vincent_Henderson', 1, '192.168.1.7', 1534983353, 'Login (in-game)', '', 0),
(1676, 'Vincent_Henderson', 1, '192.168.1.7', 1534983403, 'Login (in-game)', '', 0),
(1677, 'Vincent_Henderson', 1, '192.168.1.7', 1534983725, 'Casa editada #0 Inside ID para 1', '', 0),
(1678, 'Vincent_Henderson', 1, '192.168.1.7', 1534984049, 'Casa editada #0 Inside ID para 2', '', 0),
(1679, 'Vincent_Henderson', 1, '192.168.1.7', 1534984091, 'Casa editada #0 Inside ID para 3', '', 0),
(1680, 'Vincent_Henderson', 1, '192.168.1.7', 1534984109, 'Casa editada #0 Inside ID para 4', '', 0),
(1681, 'Vincent_Henderson', 1, '192.168.1.7', 1534984125, 'Casa editada #0 Inside ID para 5', '', 0),
(1682, 'Vincent_Henderson', 1, '192.168.1.7', 1534984395, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1683, 'Vincent_Henderson', 1, '192.168.1.7', 1534985047, 'Login (in-game)', '', 0),
(1684, 'Vincent_Henderson', 1, '192.168.1.7', 1534985178, 'Casa editada #0 Inside ID para 4', '', 0),
(1685, 'Vincent_Henderson', 1, '192.168.1.7', 1534985187, 'Casa editada #0 Inside ID para 5', '', 0),
(1686, 'Vincent_Henderson', 1, '192.168.1.7', 1534985994, 'Login (in-game)', '', 0),
(1687, 'Vincent_Henderson', 1, '192.168.1.7', 1534986116, 'Login (in-game)', '', 0),
(1688, 'Vincent_Henderson', 1, '192.168.1.7', 1534986153, 'Casa editada #0 Inside ID para 4', '', 0),
(1689, 'Vincent_Henderson', 1, '192.168.1.7', 1534986155, 'Casa editada #0 Inside ID para 4', '', 0),
(1690, 'Vincent_Henderson', 1, '192.168.1.7', 1534986158, 'Casa editada #0 Inside ID para 5', '', 0),
(1691, 'Vincent_Henderson', 1, '192.168.1.7', 1534986976, 'Login (in-game)', '', 0),
(1692, 'Vincent_Henderson', 1, '192.168.1.7', 1534987259, 'Casa editada #0 Inside ID para 4', '', 0),
(1693, 'Vincent_Henderson', 1, '192.168.1.7', 1534987267, 'Casa editada #0 Inside ID para 5', '', 0),
(1694, 'Vincent_Henderson', 1, '192.168.1.7', 1534987291, 'Casa editada #0 Inside ID para 6', '', 0),
(1695, 'Vincent_Henderson', 1, '192.168.1.7', 1534987302, 'Casa editada #0 Inside ID para 7', '', 0),
(1696, 'Vincent_Henderson', 1, '192.168.1.7', 1534988015, 'Login (in-game)', '', 0),
(1697, 'Vincent_Henderson', 1, '192.168.1.7', 1534988307, 'Casa editada #0 Inside ID para 6', '', 0),
(1698, 'Vincent_Henderson', 1, '192.168.1.7', 1534988313, 'Casa editada #0 Inside ID para 7', '', 0),
(1699, 'Vincent_Henderson', 1, '192.168.1.7', 1534988319, 'Casa editada #0 Inside ID para 8', '', 0),
(1700, 'Vincent_Henderson', 1, '192.168.1.7', 1534988330, 'Casa editada #0 Inside ID para 9', '', 0),
(1701, 'Vincent_Henderson', 1, '192.168.1.7', 1534988360, 'Casa editada #0 Inside ID para 10', '', 0),
(1702, 'Vincent_Henderson', 1, '192.168.1.7', 1534988564, 'Casa editada #0 Inside ID para 12', '', 0),
(1703, 'Vincent_Henderson', 1, '192.168.1.7', 1534988682, 'Casa editada #0 Inside ID para 13', '', 0),
(1704, 'Vincent_Henderson', 1, '192.168.1.7', 1534988710, 'Casa editada #0 Inside ID para 14', '', 0),
(1705, 'Vincent_Henderson', 1, '192.168.1.7', 1534988735, 'Casa editada #0 Inside ID para 15', '', 0),
(1706, 'Vincent_Henderson', 1, '192.168.1.7', 1534988760, 'Casa editada #0 Inside ID para 16', '', 0),
(1707, 'Vincent_Henderson', 1, '192.168.1.7', 1534988775, 'Casa editada #0 Inside ID para 17', '', 0),
(1708, 'Vincent_Henderson', 1, '192.168.1.7', 1534988792, 'Casa editada #0 Inside ID para 18', '', 0),
(1709, 'Vincent_Henderson', 1, '192.168.1.7', 1534988800, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1710, 'Vincent_Henderson', 1, '192.168.1.7', 1534988864, 'Casa editada #0 Inside ID para 18', '', 0),
(1711, 'Vincent_Henderson', 1, '192.168.1.7', 1534989044, 'Casa editada #0 Inside ID para 19', '', 0),
(1712, 'Vincent_Henderson', 1, '192.168.1.7', 1534989060, 'Casa editada #0 Inside ID para 20', '', 0),
(1713, 'Vincent_Henderson', 1, '192.168.1.7', 1534989078, 'Casa editada #0 Inside ID para 21', '', 0),
(1714, 'Vincent_Henderson', 1, '192.168.1.7', 1534989087, 'Casa editada #0 Inside ID para 22', '', 0),
(1715, 'Vincent_Henderson', 1, '192.168.1.7', 1534989101, 'Casa editada #0 Inside ID para 23', '', 0),
(1716, 'Vincent_Henderson', 1, '192.168.1.7', 1534989114, 'Casa editada #0 Inside ID para 24', '', 0),
(1717, 'Vincent_Henderson', 1, '192.168.1.7', 1534989128, 'Casa editada #0 Inside ID para 25', '', 0),
(1718, 'Vincent_Henderson', 1, '192.168.1.7', 1534989148, 'Casa editada #0 Inside ID para 26', '', 0),
(1719, 'Vincent_Henderson', 1, '192.168.1.7', 1534989170, 'Casa editada #0 Inside ID para 27', '', 0),
(1720, 'Vincent_Henderson', 1, '192.168.1.7', 1534989198, 'Casa editada #0 Inside ID para 28', '', 0),
(1721, 'Vincent_Henderson', 1, '192.168.1.7', 1534989212, 'Casa editada #0 Inside ID para 29', '', 0),
(1722, 'Vincent_Henderson', 1, '192.168.1.7', 1534989225, 'Casa editada #0 Inside ID para 30', '', 0),
(1723, 'Vincent_Henderson', 1, '192.168.1.7', 1534989232, 'Casa editada #0 Inside ID para 31', '', 0),
(1724, 'Vincent_Henderson', 1, '192.168.1.7', 1534989245, 'Casa editada #0 Inside ID para 32', '', 0),
(1725, 'Vincent_Henderson', 1, '192.168.1.7', 1534989251, 'Casa editada #0 Inside ID para 33', '', 0),
(1726, 'Vincent_Henderson', 1, '192.168.1.7', 1534989259, 'Casa editada #0 Inside ID para 34', '', 0),
(1727, 'Vincent_Henderson', 1, '192.168.1.7', 1534989347, 'Casa editada #0 Inside ID para 30', '', 0),
(1728, 'Vincent_Henderson', 1, '192.168.1.7', 1534989352, 'Casa editada #0 Inside ID para 31', '', 0),
(1729, 'Vincent_Henderson', 1, '192.168.1.7', 1534989392, 'Casa editada #0 Inside ID para 33', '', 0),
(1730, 'Vincent_Henderson', 1, '127.0.0.1', 1534990542, 'Login (in-game)', '', 0),
(1731, 'Vincent_Henderson', 1, '127.0.0.1', 1534990661, 'Casa editada #0 Inside ID para 18', '', 0),
(1732, 'Vincent_Henderson', 1, '127.0.0.1', 1534990667, 'Casa editada #0 Inside ID para 33', '', 0),
(1733, 'Vincent_Henderson', 1, '127.0.0.1', 1534990673, 'Casa editada #0 Inside ID para 34', '', 0),
(1734, 'Vincent_Henderson', 1, '127.0.0.1', 1534990680, 'Casa editada #0 Inside ID para 35', '', 0),
(1735, 'Vincent_Henderson', 1, '127.0.0.1', 1535041975, 'Login (in-game)', '', 0),
(1736, 'Vincent_Henderson', 1, '127.0.0.1', 1535042022, 'Casa editada #0 Inside ID para 30', '', 0),
(1737, 'Vincent_Henderson', 1, '127.0.0.1', 1535042028, 'Casa editada #0 Inside ID para 31', '', 0),
(1738, 'Vincent_Henderson', 1, '127.0.0.1', 1535042035, 'Casa editada #0 Inside ID para 32', '', 0),
(1739, 'Vincent_Henderson', 1, '127.0.0.1', 1535042151, 'Casa editada #0 Inside ID para 33', '', 0),
(1740, 'Vincent_Henderson', 1, '127.0.0.1', 1535042160, 'Casa editada #0 Inside ID para 34', '', 0),
(1741, 'Vincent_Henderson', 1, '127.0.0.1', 1535042447, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1742, 'Vincent_Henderson', 1, '127.0.0.1', 1535062426, 'Login (in-game)', '', 0),
(1743, 'Vincent_Henderson', 1, '127.0.0.1', 1535062500, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1744, 'Rowan_Ballard', 4, '186.225.187.250', 1534976317, 'Login (in-game)', '', 0),
(1745, 'Vincent_Henderson', 1, '164.163.207.13', 1534976331, 'Login (in-game)', '', 0),
(1746, 'Rowan_Ballard', 4, '186.225.187.250', 1534976382, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1747, 'Vincent_Henderson', 1, '164.163.207.13', 1534976454, 'Login (in-game)', '', 0),
(1748, 'Rowan_Ballard', 4, '186.225.187.250', 1534976530, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1749, 'Vincent_Henderson', 1, '164.163.207.13', 1534976559, 'Jogador puxado', 'Rowan_Ballard', 4),
(1750, 'Vincent_Henderson', 1, '164.163.207.13', 1534976563, 'Jogador puxado', 'Rowan_Ballard', 4),
(1751, 'Rowan_Ballard', 4, '186.225.187.250', 1534976585, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1752, 'Vincent_Henderson', 1, '164.163.207.13', 1534976586, 'Mudou o tempo para 11', '', 0),
(1753, 'Vincent_Henderson', 1, '164.163.207.13', 1534976682, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(1754, 'Vincent_Henderson', 1, '164.163.207.13', 1534976824, 'Jogador puxado', 'Rowan_Ballard', 4),
(1755, 'Vincent_Henderson', 1, '164.163.207.13', 1534976831, 'Jogador puxado', 'Rowan_Ballard', 4),
(1756, 'Vincent_Henderson', 1, '164.163.207.13', 1534976905, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1757, 'Vincent_Henderson', 1, '164.163.207.13', 1534977070, 'Spectate', 'Rowan_Ballard', 4),
(1758, 'Vincent_Henderson', 1, '164.163.207.13', 1534977362, 'Spectate', 'Rowan_Ballard', 4),
(1759, 'Vincent_Henderson', 1, '164.163.207.13', 1534977406, 'Jogador puxado', 'Rowan_Ballard', 4),
(1760, 'Rowan_Ballard', 4, '186.225.187.250', 1534977411, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1761, 'Vincent_Henderson', 1, '164.163.207.13', 1534977419, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1762, 'Rowan_Ballard', 4, '186.225.187.250', 1534977640, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1763, 'Rowan_Ballard', 4, '186.225.187.250', 1534979897, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(1764, 'Vincent_Henderson', 1, '164.163.207.13', 1534981177, 'Login (in-game)', '', 0),
(1765, 'Vincent_Henderson', 1, '164.163.207.13', 1534981213, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1766, 'Rowan_Ballard', 4, '186.225.187.250', 1534982712, 'Mudou o tempo para 3', '', 0),
(1767, 'Rowan_Ballard', 4, '186.225.187.250', 1534982713, 'Mudou o tempo para 0', '', 0),
(1768, 'Rowan_Ballard', 4, '186.225.187.250', 1534982714, 'Mudou o tempo para 1', '', 0),
(1769, 'Rowan_Ballard', 4, '186.225.187.250', 1534982716, 'Mudou o tempo para 7', '', 0),
(1770, 'Rowan_Ballard', 4, '186.225.187.250', 1534982718, 'Mudou o tempo para 8', '', 0),
(1771, 'Rowan_Ballard', 4, '186.225.187.250', 1534982720, 'Mudou o tempo para 10', '', 0),
(1772, 'Rowan_Ballard', 4, '186.225.187.250', 1534982721, 'Mudou o tempo para 15', '', 0),
(1773, 'Rowan_Ballard', 4, '186.225.187.250', 1534982859, 'Mudou o tempo para 12', '', 0),
(1774, 'Rowan_Ballard', 4, '186.225.187.250', 1534982864, 'Mudou o tempo para 16', '', 0),
(1775, 'Rowan_Ballard', 4, '186.225.187.250', 1534982868, 'Mudou o tempo para 15', '', 0),
(1776, 'Vincent_Henderson', 1, '192.168.1.3', 1535069671, 'Login (in-game)', '', 0),
(1777, 'Zac_Deutch', 2, '191.253.235.45', 1534984647, 'Login (in-game)', '', 0),
(1778, 'Zac_Deutch', 2, '191.253.235.45', 1534984730, 'Teleportado para Dillimore', 'Zac_Deutch', 2),
(1779, 'Zac_Deutch', 2, '191.253.235.45', 1534985393, 'Login (in-game)', '', 0),
(1780, 'Zac_Deutch', 2, '191.253.235.45', 1534985529, 'Teleportado para Dillimore', 'Zac_Deutch', 2),
(1781, 'Zac_Deutch', 2, '191.253.235.45', 1534985687, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(1782, 'Zac_Deutch', 2, '191.253.235.45', 1534986502, 'Login (in-game)', '', 0),
(1783, 'Vincent_Henderson', 1, '164.163.207.13', 1534987388, 'Login (in-game)', '', 0),
(1784, 'Rowan_Ballard', 4, '186.225.187.250', 1534987401, 'Login (in-game)', '', 0),
(1785, 'Vincent_Henderson', 1, '164.163.207.13', 1534987637, 'Defina saúde para 100', 'Vincent_Henderson', 1),
(1786, 'Vincent_Henderson', 1, '164.163.207.13', 1534987664, 'Casa editada #0 Inside ID para 18', '', 0),
(1787, 'Vincent_Henderson', 1, '164.163.207.13', 1534987782, 'Casa editada #1 nome para Montgomery Trailer 1', '', 0),
(1788, 'Vincent_Henderson', 1, '164.163.207.13', 1534987800, 'Casa editada #1 preço para $25000', '', 0),
(1789, 'Vincent_Henderson', 1, '164.163.207.13', 1534987948, 'Login (in-game)', '', 0),
(1790, 'Vincent_Henderson', 1, '164.163.207.13', 1534987978, 'Casa criada \'Montgomery Trailer 2\' por $25000', '', 0),
(1791, 'Vincent_Henderson', 1, '164.163.207.13', 1534988069, 'Casa criada \'Montgomery Trailer 3\' por $25000', '', 0),
(1792, 'Vincent_Henderson', 1, '164.163.207.13', 1534988084, 'Casa criada \'Montgomery Trailer 4\' por $25000', '', 0),
(1793, 'Vincent_Henderson', 1, '164.163.207.13', 1534988115, 'Casa criada \'Montgomery Trailer 5\' por $25000', '', 0),
(1794, 'Vincent_Henderson', 1, '164.163.207.13', 1534988139, 'Casa criada \'Montgomery Trailer 6\' por $25000', '', 0),
(1795, 'Vincent_Henderson', 1, '164.163.207.13', 1534988186, 'Casa editada #5 Inside ID para 8', '', 0),
(1796, 'Vincent_Henderson', 1, '164.163.207.13', 1534988211, 'Casa editada #6 preço para $30000', '', 0),
(1797, 'Vincent_Henderson', 1, '164.163.207.13', 1534988226, 'Casa editada #3 preço para $30000', '', 0),
(1798, 'Vincent_Henderson', 1, '164.163.207.13', 1534988229, 'Casa editada #2 Inside ID para 8', '', 0),
(1799, 'Vincent_Henderson', 1, '164.163.207.13', 1534988236, 'Casa editada #1 preço para $30000', '', 0),
(1800, 'Vincent_Henderson', 1, '164.163.207.13', 1534988239, 'Casa editada #0 Inside ID para 8', '', 0),
(1801, 'Vincent_Henderson', 1, '164.163.207.13', 1534988265, 'Casa criada \'Montgomery Trailer 7\' por $25000', '', 0),
(1802, 'Vincent_Henderson', 1, '164.163.207.13', 1534988288, 'Casa criada \'Montgomery Trailer 8\' por $25000', '', 0),
(1803, 'Vincent_Henderson', 1, '164.163.207.13', 1534988332, 'Casa editada #7 Inside ID para 17', '', 0),
(1804, 'Vincent_Henderson', 1, '164.163.207.13', 1534988370, 'Casa editada #6 Inside ID para 17', '', 0),
(1805, 'Vincent_Henderson', 1, '164.163.207.13', 1534988455, 'Casa editada #0 Inside ID para 33', '', 0),
(1806, 'Vincent_Henderson', 1, '164.163.207.13', 1534988495, 'Casa editada #0 Inside ID para 17', '', 0),
(1807, 'Vincent_Henderson', 1, '164.163.207.13', 1534988533, 'Casa criada \'Montgomery Trailer 9\' por $25000', '', 0),
(1808, 'Vincent_Henderson', 1, '164.163.207.13', 1534988550, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1809, 'Vincent_Henderson', 1, '164.163.207.13', 1534988778, 'Login (in-game)', '', 0),
(1810, 'Vincent_Henderson', 1, '164.163.207.13', 1534988801, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1811, 'Vincent_Henderson', 1, '164.163.207.13', 1534988817, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1812, 'Vincent_Henderson', 1, '164.163.207.13', 1534988824, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1813, 'Rowan_Ballard', 4, '186.225.187.250', 1534988883, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1814, 'Vincent_Henderson', 1, '164.163.207.13', 1534988896, 'removido da Helper team', 'Vincent_Henderson', 1),
(1815, 'Rowan_Ballard', 4, '186.225.187.250', 1534989007, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1816, 'Vincent_Henderson', 1, '164.163.207.13', 1534989008, 'Skin definida para 250', 'Vincent_Henderson', 1),
(1817, 'Vincent_Henderson', 1, '164.163.207.13', 1534989068, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(1818, 'Vincent_Henderson', 1, '164.163.207.13', 1534989073, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1819, 'Vincent_Henderson', 1, '164.163.207.13', 1534989348, 'Login (in-game)', '', 0),
(1820, 'Vincent_Henderson', 1, '164.163.207.13', 1534989361, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1821, 'Vincent_Henderson', 1, '164.163.207.13', 1534989426, 'Veiculo spawnado: Sandking (ID 212, Model 495)', '', 0),
(1822, 'Rowan_Ballard', 4, '186.225.187.250', 1534989647, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1823, 'Rowan_Ballard', 4, '186.225.187.250', 1534989779, 'Veiculo spawnado: Sanchez (ID 213, Model 468)', '', 0),
(1824, 'Vincent_Henderson', 1, '164.163.207.13', 1534990124, 'Casa criada \'Montgomery View 1\' por $85000', '', 0),
(1825, 'Vincent_Henderson', 1, '164.163.207.13', 1534990150, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1826, 'Vincent_Henderson', 1, '164.163.207.13', 1534990213, 'Casa criada \'Montgomery View 2\' por $85000', '', 0),
(1827, 'Vincent_Henderson', 1, '164.163.207.13', 1534990291, 'Casa criada \'Montgomery View 3\' por $85000', '', 0),
(1828, 'Vincent_Henderson', 1, '164.163.207.13', 1534990305, 'Casa criada \'Montgomery View 4\' por $85000', '', 0),
(1829, 'Vincent_Henderson', 1, '164.163.207.13', 1534990337, 'Casa criada \'Montgomery View 5\' por $85000', '', 0),
(1830, 'Vincent_Henderson', 1, '164.163.207.13', 1534990359, 'Casa criada \'Montgomery View 6\' por $85000', '', 0),
(1831, 'Vincent_Henderson', 1, '164.163.207.13', 1534990391, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1832, 'Vincent_Henderson', 1, '164.163.207.13', 1534990394, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1833, 'Vincent_Henderson', 1, '164.163.207.13', 1534991030, 'Login (in-game)', '', 0),
(1834, 'Vincent_Henderson', 1, '164.163.207.13', 1534991048, 'Veiculo spawnado: Trashmaster (ID 214, Model 408)', '', 0),
(1835, 'Vincent_Henderson', 1, '164.163.207.13', 1534991052, 'Veiculo destruido: Trashmaster (ID 214)', '', 0),
(1836, 'Vincent_Henderson', 1, '164.163.207.13', 1534991058, 'Veiculo spawnado: Sandking (ID 214, Model 495)', '', 0),
(1837, 'Vincent_Henderson', 1, '164.163.207.13', 1534991206, 'Casa criada \'Riverside Lodge\' por $120000', '', 0),
(1838, 'Vincent_Henderson', 1, '164.163.207.13', 1534991242, 'Casa editada #16 nome para 1 Riverside Lodge', '', 0),
(1839, 'Rowan_Ballard', 4, '186.225.187.250', 1534991346, 'Skin definida para 250', 'Vincent_Henderson', 1),
(1840, 'Rowan_Ballard', 4, '186.225.187.250', 1534991352, 'Skin definida para 250', 'Vincent_Henderson', 1),
(1841, 'Rowan_Ballard', 4, '186.225.187.250', 1534991356, 'Skin definida para 250', 'Rowan_Ballard', 4),
(1842, 'Vincent_Henderson', 1, '164.163.207.13', 1534991484, 'Imediato GMX', '', 0),
(1843, 'Rowan_Ballard', 4, '186.225.187.250', 1534991540, 'Login (in-game)', '', 0),
(1844, 'Vincent_Henderson', 1, '164.163.207.13', 1534991543, 'Login (in-game)', '', 0),
(1845, 'Vincent_Henderson', 1, '164.163.207.13', 1534991554, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(1846, 'Vincent_Henderson', 1, '164.163.207.13', 1534991599, 'Casa editada #15 Inside ID para 37', '', 0),
(1847, 'Vincent_Henderson', 1, '164.163.207.13', 1534991607, 'Casa editada #15 Inside ID para 38', '', 0),
(1848, 'Rowan_Ballard', 4, '186.225.187.250', 1534991645, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1849, 'Vincent_Henderson', 1, '164.163.207.13', 1534991690, 'Casa editada #15 Inside ID para 36', '', 0),
(1850, 'Vincent_Henderson', 1, '164.163.207.13', 1534991762, 'Casa criada \'2 Reverside Lodge\' por $100000', '', 0),
(1851, 'Vincent_Henderson', 1, '164.163.207.13', 1534991775, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1852, 'Vincent_Henderson', 1, '164.163.207.13', 1534991800, 'Casa criada \'3 Reverside Lodge\' por $100000', '', 0),
(1853, 'Vincent_Henderson', 1, '164.163.207.13', 1534991840, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1854, 'Vincent_Henderson', 1, '164.163.207.13', 1534991919, 'Casa criada \'4 Reverside\' por $75000', '', 0),
(1855, 'Vincent_Henderson', 1, '164.163.207.13', 1534991955, 'Casa criada \'5 Reverside\' por $90000', '', 0),
(1856, 'Vincent_Henderson', 1, '164.163.207.13', 1534991961, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1857, 'Vincent_Henderson', 1, '164.163.207.13', 1534992010, 'Veiculo spawnado: Sanchez (ID 212, Model 468)', '', 0),
(1858, 'Vincent_Henderson', 1, '164.163.207.13', 1534992202, 'Casa criada \'5 Hilltop Farm 1\' por $130000', '', 0),
(1859, 'Vincent_Henderson', 1, '164.163.207.13', 1534992212, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1860, 'Vincent_Henderson', 1, '164.163.207.13', 1534992315, 'Casa editada #21 nome para Hilltop Farm 1', '', 0),
(1861, 'Vincent_Henderson', 1, '164.163.207.13', 1534992343, 'Casa criada \'Hilltop Farm 2\' por $50000', '', 0),
(1862, 'Vincent_Henderson', 1, '164.163.207.13', 1534992353, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1863, 'Vincent_Henderson', 1, '164.163.207.13', 1534992429, 'Casa criada \'Hilltop Farm 3\' por $40000', '', 0),
(1864, 'Vincent_Henderson', 1, '164.163.207.13', 1534992435, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1865, 'Vincent_Henderson', 1, '164.163.207.13', 1534992500, 'Casa criada \'Hilltop Farm 4\' por $35000', '', 0),
(1866, 'Vincent_Henderson', 1, '164.163.207.13', 1534992512, 'Casa criada \'Hilltop Farm 5\' por $35000', '', 0),
(1867, 'Vincent_Henderson', 1, '164.163.207.13', 1534992531, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1868, 'Vincent_Henderson', 1, '164.163.207.13', 1534994154, 'Login (in-game)', '', 0),
(1869, 'Vincent_Henderson', 1, '164.163.207.13', 1534994170, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1870, 'Vincent_Henderson', 1, '164.163.207.13', 1534994552, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1871, 'Vincent_Henderson', 1, '164.163.207.13', 1534994557, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1872, 'Vincent_Henderson', 1, '164.163.207.13', 1534994648, 'Give weapon Desert Eagle, ammo=70, reason=Refund', 'Rowan_Ballard', 4),
(1873, 'Vincent_Henderson', 1, '164.163.207.13', 1534994738, 'Casa criada \'Blueberry Trailer 1\' por $35000', '', 0),
(1874, 'Vincent_Henderson', 1, '164.163.207.13', 1534994782, 'Casa criada \'Blueberry Trailer 2\' por $25000', '', 0),
(1875, 'Rowan_Ballard', 4, '186.225.187.250', 1534994789, 'Casa criada \'1 Greenhill Road\' por $80000', '', 0),
(1876, 'Rowan_Ballard', 4, '186.225.187.250', 1534994814, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1877, 'Vincent_Henderson', 1, '164.163.207.13', 1534994819, 'Casa criada \'Blueberry Trailer 3\' por $25000', '', 0),
(1878, 'Vincent_Henderson', 1, '164.163.207.13', 1534994826, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1879, 'Vincent_Henderson', 1, '164.163.207.13', 1534994873, 'Casa criada \'Blueberry Trailer 4\' por $30000', '', 0),
(1880, 'Vincent_Henderson', 1, '164.163.207.13', 1534994905, 'Casa criada \'Blueberry Trailer 5\' por $25000', '', 0),
(1881, 'Rowan_Ballard', 4, '186.225.187.250', 1534994909, 'Casa criada \'2 Greenhill Road\' por $80000', '', 0),
(1882, 'Vincent_Henderson', 1, '164.163.207.13', 1534994914, 'Casa criada \'Blueberry Trailer 6\' por $25000', '', 0),
(1883, 'Vincent_Henderson', 1, '164.163.207.13', 1534994936, 'Casa criada \'Blueberry Trailer 7\' por $25000', '', 0),
(1884, 'Vincent_Henderson', 1, '164.163.207.13', 1534994944, 'Casa criada \'Blueberry Trailer 8\' por $25000', '', 0),
(1885, 'Vincent_Henderson', 1, '164.163.207.13', 1534994964, 'Casa criada \'Blueberry Trailer 9\' por $25000', '', 0),
(1886, 'Rowan_Ballard', 4, '186.225.187.250', 1534995103, 'Casa criada \'3 Greenhill Road\' por $80000', '', 0),
(1887, 'Rowan_Ballard', 4, '186.225.187.250', 1534995120, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1888, 'Vincent_Henderson', 1, '164.163.207.13', 1534995158, 'Casa criada \'Oakridge Apartament 1\' por $20000', '', 0),
(1889, 'Vincent_Henderson', 1, '164.163.207.13', 1534995183, 'Casa criada \'Oakridge Apartament 2\' por $20000', '', 0),
(1890, 'Vincent_Henderson', 1, '164.163.207.13', 1534995208, 'Casa criada \'Oakridge Apartament 3\' por $20000', '', 0),
(1891, 'Rowan_Ballard', 4, '186.225.187.250', 1534995240, 'Casa criada \'4 Greenhill Road\' por $80000', '', 0),
(1892, 'Vincent_Henderson', 1, '164.163.207.13', 1534995243, 'Casa criada \'Oakridge Apartament 4\' por $20000', '', 0),
(1893, 'Vincent_Henderson', 1, '164.163.207.13', 1534995260, 'Casa criada \'Oakridge Apartament 5\' por $20000', '', 0),
(1894, 'Vincent_Henderson', 1, '164.163.207.13', 1534995291, 'Casa criada \'Oakridge Apartament 6\' por $20000', '', 0),
(1895, 'Vincent_Henderson', 1, '164.163.207.13', 1534995341, 'Casa criada \'Oakridge Apartament 7\' por $20000', '', 0),
(1896, 'Vincent_Henderson', 1, '164.163.207.13', 1534995361, 'Casa criada \'Oakridge Apartament 8\' por $20000', '', 0),
(1897, 'Vincent_Henderson', 1, '164.163.207.13', 1534995381, 'Casa criada \'Oakridge Apartament 9\' por $20000', '', 0),
(1898, 'Vincent_Henderson', 1, '164.163.207.13', 1534995395, 'Casa criada \'Oakridge Apartament 10\' por $20000', '', 0),
(1899, 'Vincent_Henderson', 1, '164.163.207.13', 1534995444, 'Casa criada \'Oakridge Apartament 11\' por $20000', '', 0),
(1900, 'Rowan_Ballard', 4, '186.225.187.250', 1534995462, 'Login (in-game)', '', 0),
(1901, 'Vincent_Henderson', 1, '164.163.207.13', 1534995499, 'Casa criada \'Oakridge Apartament 12\' por $20000', '', 0),
(1902, 'Vincent_Henderson', 1, '164.163.207.13', 1534995518, 'Casa criada \'Oakridge Apartament 13\' por $20000', '', 0),
(1903, 'Rowan_Ballard', 4, '186.225.187.250', 1534995526, 'Login (in-game)', '', 0),
(1904, 'Vincent_Henderson', 1, '164.163.207.13', 1534995528, 'Casa criada \'Oakridge Apartament 14\' por $20000', '', 0),
(1905, 'Vincent_Henderson', 1, '164.163.207.13', 1534995555, 'Casa criada \'Oakridge Apartament 15\' por $20000', '', 0),
(1906, 'Rowan_Ballard', 4, '186.225.187.250', 1534995563, 'Teleportado para Dillimore', 'Rowan_Ballard', 4),
(1907, 'Vincent_Henderson', 1, '164.163.207.13', 1534995572, 'Casa criada \'Oakridge Apartament 16\' por $20000', '', 0),
(1908, 'Rowan_Ballard', 4, '186.225.187.250', 1534995655, 'Casa criada \'5 Greenhill Road\' por $80000', '', 0),
(1909, 'Rowan_Ballard', 4, '186.225.187.250', 1534995681, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1910, 'Vincent_Henderson', 1, '164.163.207.13', 1534995693, 'Casa criada \'Oakridge Apartament 17\' por $20000', '', 0),
(1911, 'Vincent_Henderson', 1, '164.163.207.13', 1534995699, 'Casa criada \'Oakridge Apartament 18\' por $20000', '', 0),
(1912, 'Vincent_Henderson', 1, '164.163.207.13', 1534995742, 'Casa criada \'Oakridge Apartament 19\' por $20000', '', 0),
(1913, 'Vincent_Henderson', 1, '164.163.207.13', 1534995756, 'Casa criada \'Oakridge Apartament 20\' por $20000', '', 0),
(1914, 'Vincent_Henderson', 1, '164.163.207.13', 1534995767, 'Casa criada \'Oakridge Apartament 21\' por $20000', '', 0),
(1915, 'Vincent_Henderson', 1, '164.163.207.13', 1534995796, 'Casa criada \'Oakridge Apartament 22\' por $20000', '', 0),
(1916, 'Rowan_Ballard', 4, '186.225.187.250', 1534995803, 'Casa criada \'6 Greenhill Road\' por $80000', '', 0),
(1917, 'Rowan_Ballard', 4, '186.225.187.250', 1534995808, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1918, 'Vincent_Henderson', 1, '164.163.207.13', 1534995826, 'Casa criada \'Oakridge Apartament 23\' por $20000', '', 0),
(1919, 'Vincent_Henderson', 1, '164.163.207.13', 1534995866, 'Casa criada \'Oakridge Apartament 24\' por $20000', '', 0),
(1920, 'Vincent_Henderson', 1, '164.163.207.13', 1534995894, 'Casa criada \'Oakridge Apartament 25\' por $20000', '', 0),
(1921, 'Vincent_Henderson', 1, '164.163.207.13', 1534995912, 'Casa criada \'Oakridge Apartament 26\' por $20000', '', 0),
(1922, 'Vincent_Henderson', 1, '164.163.207.13', 1534995925, 'Casa criada \'Oakridge Apartament 27\' por $20000', '', 0),
(1923, 'Vincent_Henderson', 1, '164.163.207.13', 1534995936, 'Casa criada \'Oakridge Apartament 28\' por $20000', '', 0),
(1924, 'Vincent_Henderson', 1, '164.163.207.13', 1534995943, 'Casa criada \'Oakridge Apartament 29\' por $20000', '', 0),
(1925, 'Vincent_Henderson', 1, '164.163.207.13', 1534995953, 'Casa criada \'Oakridge Apartament 30\' por $20000', '', 0),
(1926, 'Vincent_Henderson', 1, '164.163.207.13', 1534995959, 'Casa criada \'Oakridge Apartament 31\' por $20000', '', 0),
(1927, 'Vincent_Henderson', 1, '164.163.207.13', 1534995968, 'Casa criada \'Oakridge Apartament 32\' por $20000', '', 0),
(1928, 'Vincent_Henderson', 1, '164.163.207.13', 1534995978, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1929, 'Vincent_Henderson', 1, '164.163.207.13', 1534995982, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1930, 'Rowan_Ballard', 4, '186.225.187.250', 1534996005, 'Casa criada \'7 Greenhill Road\' por $80000', '', 0),
(1931, 'Rowan_Ballard', 4, '186.225.187.250', 1534996010, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1932, 'Vincent_Henderson', 1, '164.163.207.13', 1534996030, 'Veiculo spawnado: Sanchez (ID 213, Model 468)', '', 0),
(1933, 'Vincent_Henderson', 1, '164.163.207.13', 1534996320, 'Casa criada \'Jason Street 1\' por $70000', '', 0),
(1934, 'Vincent_Henderson', 1, '164.163.207.13', 1534996330, 'Casa criada \'Jason Street 2\' por $70000', '', 0),
(1935, 'Vincent_Henderson', 1, '164.163.207.13', 1534996374, 'Casa criada \'Jason Street 3\' por $70000', '', 0),
(1936, 'Rowan_Ballard', 4, '186.225.187.250', 1534996390, 'Casa criada \'1 Blueberry Main Street\' por $70000', '', 0),
(1937, 'Vincent_Henderson', 1, '164.163.207.13', 1534996430, 'Casa criada \'Jason Street 4\' por $70000', '', 0),
(1938, 'Vincent_Henderson', 1, '164.163.207.13', 1534996500, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1939, 'Vincent_Henderson', 1, '164.163.207.13', 1534996502, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1940, 'Vincent_Henderson', 1, '164.163.207.13', 1534996511, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1941, 'Rowan_Ballard', 4, '186.225.187.250', 1534996523, 'Casa criada \'2 Blueberry Main Street\' por $70000', '', 0),
(1942, 'Rowan_Ballard', 4, '186.225.187.250', 1534996541, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1943, 'Vincent_Henderson', 1, '164.163.207.13', 1534996578, 'Casa criada \'Blueberry Main Street 3\' por $70000', '', 0),
(1944, 'Vincent_Henderson', 1, '164.163.207.13', 1534996609, 'Casa criada \'Blueberry Main Street 4\' por $70000', '', 0),
(1945, 'Rowan_Ballard', 4, '186.225.187.250', 1534996765, 'Casa criada \'Noth Blueberry Trailers 1\' por $30000', '', 0),
(1946, 'Rowan_Ballard', 4, '186.225.187.250', 1534996831, 'Casa editada #86 nome para North Blueberry Trailers 1', '', 0),
(1947, 'Rowan_Ballard', 4, '186.225.187.250', 1534996851, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1948, 'Vincent_Henderson', 1, '164.163.207.13', 1534996944, 'Casa criada \'Shoreside Villa 1\' por $170000', '', 0),
(1949, 'Vincent_Henderson', 1, '164.163.207.13', 1534996955, 'Casa criada \'Shoreside Villa 2\' por $170000', '', 0),
(1950, 'Rowan_Ballard', 4, '186.225.187.250', 1534996957, 'Casa criada \'North Blueberry Trailers 2\' por $30000', '', 0),
(1951, 'Rowan_Ballard', 4, '186.225.187.250', 1534997030, 'Casa criada \'North Blueberry Trailers 3\' por $30000', '', 0),
(1952, 'Rowan_Ballard', 4, '186.225.187.250', 1534997125, 'Casa criada \'North Blueberry Trailers 4\' por $30000', '', 0),
(1953, 'Rowan_Ballard', 4, '186.225.187.250', 1534997148, 'Casa criada \'North Blueberry Trailers 5\' por $30000', '', 0),
(1954, 'Vincent_Henderson', 1, '164.163.207.13', 1534997157, 'Casa editada #83 Inside ID para 30', '', 0),
(1955, 'Vincent_Henderson', 1, '164.163.207.13', 1534997162, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1956, 'Rowan_Ballard', 4, '186.225.187.250', 1534997174, 'Casa criada \'North Blueberry Trailers 6\' por $30000', '', 0),
(1957, 'Rowan_Ballard', 4, '186.225.187.250', 1534997204, 'Veiculo destruido: Sandking (ID 211)', '', 0),
(1958, 'Rowan_Ballard', 4, '186.225.187.250', 1534997205, 'Veiculo destruido: Sanchez (ID 212)', '', 0),
(1959, 'Rowan_Ballard', 4, '186.225.187.250', 1534997206, 'Veiculo destruido: Sanchez (ID 213)', '', 0),
(1960, 'Rowan_Ballard', 4, '186.225.187.250', 1534997215, 'Veiculo spawnado: Sanchez (ID 211, Model 468)', '', 0),
(1961, 'Vincent_Henderson', 1, '164.163.207.13', 1534997220, 'Veiculo spawnado: Sanchez (ID 212, Model 468)', '', 0),
(1962, 'Rowan_Ballard', 4, '186.225.187.250', 1534997474, 'Casa criada \'1 Hampton Barns\' por $30000', '', 0),
(1963, 'Rowan_Ballard', 4, '186.225.187.250', 1534997520, 'Casa criada \'2 Hampton Barns\' por $30000', '', 0),
(1964, 'Rowan_Ballard', 4, '186.225.187.250', 1534997554, 'Casa criada \'3 Hampton Barns\' por $30000', '', 0),
(1965, 'Vincent_Henderson', 1, '164.163.207.13', 1534997630, 'Objeto temporário spawnado. (19860)', '', 0),
(1966, 'Rowan_Ballard', 4, '186.225.187.250', 1534997643, 'Casa criada \'4 Hampton Barns\' por $30000', '', 0),
(1967, 'Rowan_Ballard', 4, '186.225.187.250', 1534997763, 'Casa criada \'5 Hampton Barns\' por $25000', '', 0),
(1968, 'Rowan_Ballard', 4, '186.225.187.250', 1534997928, 'Casa criada \'6 Hampton Barns\' por $30000', '', 0),
(1969, 'Rowan_Ballard', 4, '186.225.187.250', 1534998025, 'Casa criada \'7 Hampton Barns\' por $30000', '', 0),
(1970, 'Rowan_Ballard', 4, '186.225.187.250', 1534998040, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1971, 'Vincent_Henderson', 1, '164.163.207.13', 1534998178, 'Casa criada \'Clover Court\' por $130000', '', 0),
(1972, 'Vincent_Henderson', 1, '164.163.207.13', 1534998211, 'Casa criada \'Clover Court 2\' por $130000', '', 0),
(1973, 'Vincent_Henderson', 1, '164.163.207.13', 1534998233, 'Casa editada #101 nome para Clover Court 1', '', 0),
(1974, 'Vincent_Henderson', 1, '164.163.207.13', 1534998324, 'Casa criada \'Clover Court 3\' por $120000', '', 0),
(1975, 'Rowan_Ballard', 4, '186.225.187.250', 1534998340, 'Casa criada \'8 Hampton Barns\' por $25000', '', 0),
(1976, 'Rowan_Ballard', 4, '186.225.187.250', 1534998429, 'Casa criada \'9 Hampton Barns\' por $30000', '', 0),
(1977, 'Vincent_Henderson', 1, '164.163.207.13', 1534998474, 'Casa criada \'Clover Court 4\' por $110000', '', 0),
(1978, 'Vincent_Henderson', 1, '164.163.207.13', 1534998494, 'Casa criada \'Clover Court 5\' por $110000', '', 0),
(1979, 'Rowan_Ballard', 4, '186.225.187.250', 1534998506, 'Casa criada \'10 Hampton Barns\' por $30000', '', 0),
(1980, 'Vincent_Henderson', 1, '164.163.207.13', 1534998545, 'Casa criada \'Clover Court 6\' por $110000', '', 0),
(1981, 'Rowan_Ballard', 4, '186.225.187.250', 1534998608, 'Casa criada \'11 Hampton Barns\' por $30000', '', 0),
(1982, 'Rowan_Ballard', 4, '186.225.187.250', 1534998643, 'Casa criada \'12 Hampton Barns\' por $25000', '', 0),
(1983, 'Rowan_Ballard', 4, '186.225.187.250', 1534998682, 'Casa criada \'13 Hampton Barns\' por $25000', '', 0),
(1984, 'Rowan_Ballard', 4, '186.225.187.250', 1534998687, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(1985, 'Rowan_Ballard', 4, '186.225.187.250', 1534998749, 'Casa criada \'14 Hampton Barns\' por $25000', '', 0),
(1986, 'Rowan_Ballard', 4, '186.225.187.250', 1534998837, 'Casa criada \'15 Hampton Barns\' por $30000', '', 0),
(1987, 'Rowan_Ballard', 4, '186.225.187.250', 1534998865, 'Casa criada \'16 Hampton Barns\' por $25000', '', 0),
(1988, 'Vincent_Henderson', 1, '164.163.207.13', 1534999072, 'Casa criada \'Clover Court 7\' por $110000', '', 0),
(1989, 'Vincent_Henderson', 1, '164.163.207.13', 1534999108, 'Jogador teleportado', 'Rowan_Ballard', 4),
(1990, 'Rowan_Ballard', 4, '186.225.187.250', 1534999193, 'Jogador teleportado', 'Vincent_Henderson', 1),
(1991, 'Vincent_Henderson', 1, '164.163.207.13', 1534999194, 'Jogador puxado', 'Rowan_Ballard', 4),
(1992, 'Vincent_Henderson', 1, '164.163.207.13', 1534999236, 'Casa criada \'Clover Court 8\' por $110000', '', 0),
(1993, 'Vincent_Henderson', 1, '164.163.207.13', 1534999269, 'Casa criada \'Clover Court 9\' por $75000', '', 0),
(1994, 'Vincent_Henderson', 1, '164.163.207.13', 1534999280, 'Casa criada \'Clover Court 10\' por $75000', '', 0),
(1995, 'Vincent_Henderson', 1, '164.163.207.13', 1534999327, 'Casa criada \'Clover Court 11\' por $50000', '', 0),
(1996, 'Rowan_Ballard', 4, '186.225.187.250', 1534999360, 'Mudou o tempo para 6', '', 0),
(1997, 'Rowan_Ballard', 4, '186.225.187.250', 1534999436, 'Veiculo destruido: Sanchez (ID 211)', '', 0),
(1998, 'Rowan_Ballard', 4, '186.225.187.250', 1534999437, 'Veiculo destruido: Sanchez (ID 212)', '', 0),
(1999, 'Vincent_Henderson', 1, '164.163.207.13', 1534999443, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(2000, 'Vincent_Henderson', 1, '164.163.207.13', 1534999573, 'Login (in-game)', '', 0),
(2001, 'Vincent_Henderson', 1, '164.163.207.13', 1534999581, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2002, 'Vincent_Henderson', 1, '164.163.207.13', 1534999678, 'Set faction to 10', 'Rowan_Ballard', 4),
(2003, 'Vincent_Henderson', 1, '164.163.207.13', 1534999742, 'Set faction to 10', 'Vincent_Henderson', 1),
(2004, 'Vincent_Henderson', 1, '164.163.207.13', 1534999943, 'Login (in-game)', '', 0),
(2005, 'Vincent_Henderson', 1, '127.0.0.1', 1535120691, 'Login (in-game)', '', 0),
(2006, 'Vincent_Henderson', 1, '127.0.0.1', 1535121040, 'Login (in-game)', '', 0),
(2007, 'Vincent_Henderson', 1, '127.0.0.1', 1535121578, 'Login (in-game)', '', 0),
(2008, 'Vincent_Henderson', 1, '127.0.0.1', 1535126659, 'Login (in-game)', '', 0),
(2009, 'Vincent_Henderson', 1, '127.0.0.1', 1535126677, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(2010, 'Vincent_Henderson', 1, '127.0.0.1', 1535128158, 'Login (in-game)', '', 0),
(2011, 'Vincent_Henderson', 1, '127.0.0.1', 1535134351, 'Login (in-game)', '', 0),
(2012, 'Vincent_Henderson', 1, '127.0.0.1', 1535135121, 'Veiculo spawnado: Sandking (ID 210, Model 495)', '', 0),
(2013, 'Vincent_Henderson', 1, '127.0.0.1', 1535136415, 'Login (in-game)', '', 0),
(2014, 'Vincent_Henderson', 1, '127.0.0.1', 1535137265, 'Login (in-game)', '', 0);
INSERT INTO `adminlog` (`id`, `AdminName`, `AdminSQLID`, `IP`, `Timestamp`, `Action`, `AgainstName`, `AgainstSQLID`) VALUES
(2015, 'Vincent_Henderson', 1, '127.0.0.1', 1535138046, 'Login (in-game)', '', 0),
(2016, 'Vincent_Henderson', 1, '127.0.0.1', 1535138621, 'Login (in-game)', '', 0),
(2017, 'Vincent_Henderson', 1, '164.163.207.9', 1535073695, 'Login (in-game)', '', 0),
(2018, 'Vincent_Henderson', 1, '164.163.207.9', 1535073733, 'Mudou o tempo para 11', '', 0),
(2019, 'Rowan_Ballard', 4, '186.225.187.250', 1535073935, 'Login (in-game)', '', 0),
(2020, 'Rowan_Ballard', 4, '186.225.187.250', 1535073978, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2021, 'Vincent_Henderson', 1, '164.163.207.9', 1535074254, 'Jogador teleportado', 'Maycon_Hommyerd', 21),
(2022, 'Vincent_Henderson', 1, '164.163.207.9', 1535074332, 'Veiculo spawnado: Sandking (ID 212, Model 495)', '', 0),
(2023, 'Rowan_Ballard', 4, '186.225.187.250', 1535074544, 'Spectate', 'Maycon_Hommyerd', 21),
(2024, 'Vincent_Henderson', 1, '164.163.207.9', 1535074642, 'Set faction to 10', 'Maycon_Hommyerd', 21),
(2025, 'Rowan_Ballard', 4, '186.225.187.250', 1535074847, 'Spectate', 'Maycon_Hommyerd', 21),
(2026, 'Rowan_Ballard', 4, '186.225.187.250', 1535074852, 'Spectate', 'Maycon_Hommyerd', 21),
(2027, 'Vincent_Henderson', 1, '164.163.207.9', 1535075381, 'Login (in-game)', '', 0),
(2028, 'Vincent_Henderson', 1, '164.163.207.9', 1535075393, 'Jogador teleportado', 'Maycon_Hommyerd', 21),
(2029, 'Vincent_Henderson', 1, '164.163.207.9', 1535075598, 'Login (in-game)', '', 0),
(2030, 'Vincent_Henderson', 1, '164.163.207.9', 1535075607, 'Jogador teleportado', 'Maycon_Hommyerd', 21),
(2031, 'Vincent_Henderson', 1, '164.163.207.9', 1535075624, 'Mudou o tempo para 11', '', 0),
(2032, 'Vincent_Henderson', 1, '164.163.207.9', 1535075630, 'Mudou o tempo para 11', '', 0),
(2033, 'Vincent_Henderson', 1, '164.163.207.9', 1535076347, 'Jogador teleportado', 'Maycon_Hommyerd', 21),
(2034, 'Vincent_Henderson', 1, '164.163.207.9', 1535076680, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2035, 'Rowan_Ballard', 4, '186.225.187.250', 1535076748, 'Spectate', 'Maycon_Hommyerd', 21),
(2036, 'Rowan_Ballard', 4, '186.225.187.250', 1535076751, 'Spectate', 'Maycon_Hommyerd', 21),
(2037, 'Vincent_Henderson', 1, '164.163.207.9', 1535076841, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2038, 'Vincent_Henderson', 1, '164.163.207.9', 1535076845, 'Jogador teleportado', 'Maycon_Hommyerd', 21),
(2039, 'Vincent_Henderson', 1, '164.163.207.9', 1535076921, 'Spectate', 'Maycon_Hommyerd', 21),
(2040, 'Vincent_Henderson', 1, '164.163.207.9', 1535076932, 'Jogador teleportado', 'Maycon_Hommyerd', 21),
(2041, 'Vincent_Henderson', 1, '164.163.207.9', 1535076973, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2042, 'Rowan_Ballard', 4, '186.225.187.250', 1535077438, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2043, 'Rowan_Ballard', 4, '186.225.187.250', 1535079212, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(2044, 'Rowan_Ballard', 4, '186.225.187.250', 1535079998, 'Teleportado para Dillimore', 'Rowan_Ballard', 4),
(2045, 'Vincent_Henderson', 1, '164.163.207.9', 1535081421, 'Login (in-game)', '', 0),
(2046, 'Rowan_Ballard', 4, '186.225.187.250', 1535081457, 'Login (in-game)', '', 0),
(2047, 'Rowan_Ballard', 4, '186.225.187.250', 1535082120, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2048, 'Rowan_Ballard', 4, '186.225.187.250', 1535082124, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2049, 'Rowan_Ballard', 4, '186.225.187.250', 1535082476, 'Mudou o tempo para 0', '', 0),
(2050, 'Rowan_Ballard', 4, '186.225.187.250', 1535082480, 'Mudou o tempo para 5', '', 0),
(2051, 'Rowan_Ballard', 4, '186.225.187.250', 1535082482, 'Mudou o tempo para 10', '', 0),
(2052, 'Rowan_Ballard', 4, '186.225.187.250', 1535082486, 'Mudou o tempo para 15', '', 0),
(2053, 'Rowan_Ballard', 4, '186.225.187.250', 1535083048, 'Empresa editada #35 nome para SA Trading', '', 0),
(2054, 'Vincent_Henderson', 1, '164.163.207.9', 1535083101, 'Login (in-game)', '', 0),
(2055, 'Rowan_Ballard', 4, '186.225.187.250', 1535083324, 'Login (in-game)', '', 0),
(2056, 'Vincent_Henderson', 1, '164.163.207.9', 1535083433, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(2057, 'Vincent_Henderson', 1, '164.163.207.9', 1535083525, 'Todas as casas da base de dados foram re-carregadas.', '', 0),
(2058, 'Vincent_Henderson', 1, '164.163.207.9', 1535085079, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2059, 'Vincent_Henderson', 1, '164.163.207.9', 1535085128, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2060, 'Vincent_Henderson', 1, '164.163.207.9', 1535085129, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2061, 'Vincent_Henderson', 1, '164.163.207.9', 1535085142, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2062, 'Vincent_Henderson', 1, '164.163.207.9', 1535085152, 'Jogador puxado', 'Vincent_Henderson', 1),
(2063, 'Rowan_Ballard', 4, '186.225.187.250', 1535085153, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2064, 'Rowan_Ballard', 4, '186.225.187.250', 1535085482, 'Login (in-game)', '', 0),
(2065, 'Rowan_Ballard', 4, '186.225.187.250', 1535087566, 'Login (in-game)', '', 0),
(2066, 'Rowan_Ballard', 4, '186.225.187.250', 1535087926, 'Teleportado para Dillimore', 'Rowan_Ballard', 4),
(2067, 'Rowan_Ballard', 4, '186.225.187.250', 1535087941, 'Mudou o tempo para 9', '', 0),
(2068, 'Rowan_Ballard', 4, '186.225.187.250', 1535087943, 'Mudou o tempo para 10', '', 0),
(2069, 'Rowan_Ballard', 4, '186.225.187.250', 1535087947, 'Mudou o tempo para 15', '', 0),
(2070, 'Rowan_Ballard', 4, '186.225.187.250', 1535088076, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(2071, 'Rowan_Ballard', 4, '186.225.187.250', 1535088217, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(2072, 'Rowan_Ballard', 4, '186.225.187.250', 1535088224, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(2073, 'Rowan_Ballard', 4, '186.225.187.250', 1535088465, 'Empresa editada #8 nome para Cafe Palomino', '', 0),
(2074, 'Rowan_Ballard', 4, '186.225.187.250', 1535088498, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(2075, 'Rowan_Ballard', 4, '186.225.187.250', 1535287108, 'Login (in-game)', '', 0),
(2076, 'Rowan_Ballard', 4, '186.225.187.250', 1535287137, 'Teleportado para Dillimore', 'Rowan_Ballard', 4),
(2077, 'Rowan_Ballard', 4, '186.225.187.250', 1535287162, 'Mudou o tempo para 4', '', 0),
(2078, 'Rowan_Ballard', 4, '186.225.187.250', 1535287165, 'Mudou o tempo para 10', '', 0),
(2079, 'Rowan_Ballard', 4, '186.225.187.250', 1535287216, 'Veiculo spawnado: Rancher (ID 211, Model 489)', '', 0),
(2080, 'Rowan_Ballard', 4, '186.225.187.250', 1535287319, 'Veiculo spawnado: Police Maverick (ID 212, Model 497)', '', 0),
(2081, 'Rowan_Ballard', 4, '186.225.187.250', 1535287356, 'Veiculo spawnado: LSPD Cruiser (ID 213, Model 596)', '', 0),
(2082, 'Rowan_Ballard', 4, '186.225.187.250', 1535287427, 'Veiculo spawnado: Police Ranger (ID 214, Model 599)', '', 0),
(2083, 'Vincent_Henderson', 1, '127.0.0.1', 1535311293, 'Login (in-game)', '', 0),
(2084, 'Vincent_Henderson', 1, '127.0.0.1', 1535312665, 'Login (in-game)', '', 0),
(2085, 'Vincent_Henderson', 1, '127.0.0.1', 1535313596, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2086, 'Vincent_Henderson', 1, '127.0.0.1', 1535313650, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2087, 'Vincent_Henderson', 1, '127.0.0.1', 1535314399, 'Login (in-game)', '', 0),
(2088, 'Vincent_Henderson', 1, '127.0.0.1', 1535317106, 'Login (in-game)', '', 0),
(2089, 'Rowan_Ballard', 4, '186.225.187.250', 1535244412, 'Login (in-game)', '', 0),
(2090, 'Rowan_Ballard', 4, '186.225.187.250', 1535244440, 'Mudou o tempo para 5', '', 0),
(2091, 'Rowan_Ballard', 4, '186.225.187.250', 1535244442, 'Mudou o tempo para 10', '', 0),
(2092, 'Rowan_Ballard', 4, '186.225.187.250', 1535247936, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(2093, 'Vincent_Henderson', 1, '164.163.207.6', 1535248028, 'Login (in-game)', '', 0),
(2094, 'Zac_Deutch', 2, '191.253.249.59', 1535248236, 'Login (in-game)', '', 0),
(2095, 'Rowan_Ballard', 4, '186.225.187.250', 1535248243, 'Login (in-game)', '', 0),
(2096, 'Zac_Deutch', 2, '191.253.249.59', 1535248259, 'Desarmado', 'Rowan_Ballard', 4),
(2097, 'Zac_Deutch', 2, '191.253.249.59', 1535248360, 'Defina saúde para 100', 'Zac_Deutch', 2),
(2098, 'Zac_Deutch', 2, '191.253.249.59', 1535248370, 'Skin definida para 20000', 'Zac_Deutch', 2),
(2099, 'Zac_Deutch', 2, '191.253.249.59', 1535248373, 'Skin definida para 20001', 'Zac_Deutch', 2),
(2100, 'Zac_Deutch', 2, '191.253.249.59', 1535248375, 'Skin definida para 20009', 'Zac_Deutch', 2),
(2101, 'Zac_Deutch', 2, '191.253.249.59', 1535248378, 'Skin definida para 20010', 'Zac_Deutch', 2),
(2102, 'Zac_Deutch', 2, '191.253.249.59', 1535248385, 'Skin definida para 20011', 'Zac_Deutch', 2),
(2103, 'Zac_Deutch', 2, '191.253.249.59', 1535248387, 'Skin definida para 20013', 'Zac_Deutch', 2),
(2104, 'Zac_Deutch', 2, '191.253.249.59', 1535248388, 'Skin definida para 20014', 'Zac_Deutch', 2),
(2105, 'Zac_Deutch', 2, '191.253.249.59', 1535248390, 'Skin definida para 20015', 'Zac_Deutch', 2),
(2106, 'Zac_Deutch', 2, '191.253.249.59', 1535248391, 'Skin definida para 20019', 'Zac_Deutch', 2),
(2107, 'Zac_Deutch', 2, '191.253.249.59', 1535248393, 'Skin definida para 20020', 'Zac_Deutch', 2),
(2108, 'Zac_Deutch', 2, '191.253.249.59', 1535248394, 'Skin definida para 20024', 'Zac_Deutch', 2),
(2109, 'Zac_Deutch', 2, '191.253.249.59', 1535248395, 'Skin definida para 20025', 'Zac_Deutch', 2),
(2110, 'Zac_Deutch', 2, '191.253.249.59', 1535248397, 'Skin definida para 20029', 'Zac_Deutch', 2),
(2111, 'Zac_Deutch', 2, '191.253.249.59', 1535248401, 'Skin definida para 20024', 'Zac_Deutch', 2),
(2112, 'Zac_Deutch', 2, '191.253.249.59', 1535248403, 'Skin definida para 20026', 'Zac_Deutch', 2),
(2113, 'Zac_Deutch', 2, '191.253.249.59', 1535248405, 'Skin definida para 20027', 'Zac_Deutch', 2),
(2114, 'Zac_Deutch', 2, '191.253.249.59', 1535248408, 'Skin definida para 20028', 'Zac_Deutch', 2),
(2115, 'Zac_Deutch', 2, '191.253.249.59', 1535248410, 'Skin definida para 20029', 'Zac_Deutch', 2),
(2116, 'Zac_Deutch', 2, '191.253.249.59', 1535248411, 'Skin definida para 20030', 'Zac_Deutch', 2),
(2117, 'Zac_Deutch', 2, '191.253.249.59', 1535248416, 'Skin definida para 1', 'Zac_Deutch', 2),
(2118, 'Zac_Deutch', 2, '191.253.249.59', 1535248444, 'Skin definida para 299', 'Zac_Deutch', 2),
(2119, 'Rowan_Ballard', 4, '186.225.187.250', 1535248606, 'Defina saúde para 100', 'Zac_Deutch', 2),
(2120, 'Rowan_Ballard', 4, '186.225.187.250', 1535248612, 'Defina saúde para 100', 'Rowan_Ballard', 4),
(2121, 'Rowan_Ballard', 4, '186.225.187.250', 1535248630, 'Mudou o tempo para 15', '', 0),
(2122, 'Zac_Deutch', 2, '191.253.249.59', 1535248684, 'Veiculo spawnado: Firetruck (ID 210, Model 407)', '', 0),
(2123, 'Rowan_Ballard', 4, '186.225.187.250', 1535248698, 'Mudou o tempo para 3', '', 0),
(2124, 'Rowan_Ballard', 4, '186.225.187.250', 1535248724, 'Mudou o tempo para 15', '', 0),
(2125, 'Zac_Deutch', 2, '191.253.249.59', 1535248742, 'Admin duty on', '', 0),
(2126, 'Zac_Deutch', 2, '191.253.249.59', 1535248794, 'Veiculo destruido: Firetruck (ID 210)', '', 0),
(2127, 'Zac_Deutch', 2, '191.253.249.59', 1535248935, 'Login (in-game)', '', 0),
(2128, 'Zac_Deutch', 2, '191.253.249.59', 1535248952, 'Mudou o tempo para 15', '', 0),
(2129, 'Rowan_Ballard', 4, '186.225.187.250', 1535248988, 'Login (in-game)', '', 0),
(2130, 'Rowan_Ballard', 4, '186.225.187.250', 1535249041, 'Spectate', 'Zac_Deutch', 2),
(2131, 'Zac_Deutch', 2, '191.253.249.59', 1535249292, 'Teleportado para Admin Jail', 'Zac_Deutch', 2),
(2132, 'Zac_Deutch', 2, '191.253.249.59', 1535249308, 'Teleportado para Northstar Rock', 'Zac_Deutch', 2),
(2133, 'Zac_Deutch', 2, '191.253.249.59', 1535249336, 'Teleportado para Bone County Docks', 'Zac_Deutch', 2),
(2134, 'Zac_Deutch', 2, '191.253.249.59', 1535249410, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2135, 'Vincent_Henderson', 1, '127.0.0.1', 1535383210, 'Login (in-game)', '', 0),
(2136, 'Vincent_Henderson', 1, '127.0.0.1', 1535384267, 'Login (in-game)', '', 0),
(2137, 'Vincent_Henderson', 1, '127.0.0.1', 1535384698, 'Login (in-game)', '', 0),
(2138, 'Vincent_Henderson', 1, '127.0.0.1', 1535384773, 'Set faction to 1', 'Vincent_Henderson', 1),
(2139, 'Vincent_Henderson', 1, '127.0.0.1', 1535384777, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(2140, 'Rowan_Ballard', 4, '186.225.187.250', 1535324049, 'Login (in-game)', '', 0),
(2141, 'Rowan_Ballard', 4, '186.225.187.250', 1535324061, 'Mudou o tempo para 5', '', 0),
(2142, 'Rowan_Ballard', 4, '186.225.187.250', 1535324064, 'Mudou o tempo para 10', '', 0),
(2143, 'Rowan_Ballard', 4, '186.225.187.250', 1535324066, 'Mudou o tempo para 11', '', 0),
(2144, 'Rowan_Ballard', 4, '186.225.187.250', 1535324078, 'Teleportado para Dillimore', 'Rowan_Ballard', 4),
(2145, 'Rowan_Ballard', 4, '186.225.187.250', 1535324247, 'Set faction to 1', 'Rowan_Ballard', 4),
(2146, 'Rowan_Ballard', 4, '186.225.187.250', 1535324410, 'Mudou o tempo para 1', '', 0),
(2147, 'Rowan_Ballard', 4, '186.225.187.250', 1535324800, 'Mudou o tempo para 12', '', 0),
(2148, 'Rowan_Ballard', 4, '186.225.187.250', 1535324998, 'Mudou o tempo para 9', '', 0),
(2149, 'Rowan_Ballard', 4, '186.225.187.250', 1535325001, 'Mudou o tempo para 19', '', 0),
(2150, 'Rowan_Ballard', 4, '186.225.187.250', 1535325006, 'Mudou o tempo para 20', '', 0),
(2151, 'Rowan_Ballard', 4, '186.225.187.250', 1535325012, 'Mudou o tempo para 22', '', 0),
(2152, 'Rowan_Ballard', 4, '186.225.187.250', 1535325015, 'Mudou o tempo para 0', '', 0),
(2153, 'Rowan_Ballard', 4, '186.225.187.250', 1535326356, 'Login (in-game)', '', 0),
(2154, 'Rowan_Ballard', 4, '186.225.187.250', 1535326366, 'Teleportado para Dillimore', 'Rowan_Ballard', 4),
(2155, 'Rowan_Ballard', 4, '186.225.187.250', 1535326838, 'Mudou o tempo para 2', '', 0),
(2156, 'Rowan_Ballard', 4, '186.225.187.250', 1535326843, 'Mudou o tempo para 3', '', 0),
(2157, 'Rowan_Ballard', 4, '186.225.187.250', 1535326844, 'Mudou o tempo para 5', '', 0),
(2158, 'Rowan_Ballard', 4, '186.225.187.250', 1535326846, 'Mudou o tempo para 10', '', 0),
(2159, 'Rowan_Ballard', 4, '186.225.187.250', 1535326849, 'Mudou o tempo para 12', '', 0),
(2160, 'Rowan_Ballard', 4, '186.225.187.250', 1535326857, 'Mudou o tempo para 6', '', 0),
(2161, 'Rowan_Ballard', 4, '186.225.187.250', 1535326860, 'Mudou o tempo para 7', '', 0),
(2162, 'Rowan_Ballard', 4, '186.225.187.250', 1535326864, 'Mudou o tempo para 8', '', 0),
(2163, 'Rowan_Ballard', 4, '186.225.187.250', 1535326867, 'Mudou o tempo para 9', '', 0),
(2164, 'Rowan_Ballard', 4, '186.225.187.250', 1535326873, 'Mudou o tempo para 19', '', 0),
(2165, 'Rowan_Ballard', 4, '186.225.187.250', 1535326875, 'Mudou o tempo para 20', '', 0),
(2166, 'Vincent_Henderson', 1, '127.0.0.1', 1535415247, 'Login (in-game)', '', 0),
(2167, 'Vincent_Henderson', 1, '164.163.207.83', 1535345123, 'Login (in-game)', '', 0),
(2168, 'Scottler_Johnson', 13, '187.74.206.88', 1535345130, 'Login (in-game)', '', 0),
(2169, 'Vincent_Henderson', 1, '164.163.207.83', 1535345145, 'Mudou o tempo para 11', '', 0),
(2170, 'Vincent_Henderson', 1, '164.163.207.83', 1535345150, 'Jogador teleportado', 'Scottler_Johnson', 13),
(2171, 'Scottler_Johnson', 13, '187.74.206.88', 1535345293, 'Login (in-game)', '', 0),
(2172, 'Scottler_Johnson', 13, '187.74.206.88', 1535345301, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2173, 'Vincent_Henderson', 1, '164.163.207.83', 1535345437, 'Defina saúde para 100', 'Vincent_Henderson', 1),
(2174, 'Scottler_Johnson', 13, '187.74.206.88', 1535345464, 'Login (in-game)', '', 0),
(2175, 'Vincent_Henderson', 1, '164.163.207.83', 1535345541, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(2176, 'Vincent_Henderson', 1, '164.163.207.83', 1535345880, 'Login (in-game)', '', 0),
(2177, 'Scottler_Johnson', 13, '187.74.206.88', 1535348205, 'Login (in-game)', '', 0),
(2178, 'Scottler_Johnson', 13, '187.74.206.88', 1535348304, 'Login (in-game)', '', 0),
(2179, 'Vincent_Henderson', 1, '164.163.207.83', 1535348473, 'Login (in-game)', '', 0),
(2180, 'Vincent_Henderson', 1, '164.163.207.83', 1535349144, 'Login (in-game)', '', 0),
(2181, 'Scottler_Johnson', 13, '187.74.206.88', 1535349150, 'Login (in-game)', '', 0),
(2182, 'Scottler_Johnson', 13, '187.74.206.88', 1535349160, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2183, 'Vincent_Henderson', 1, '164.163.207.83', 1535349282, 'Jogador puxado', 'Scottler_Johnson', 13),
(2184, 'Scottler_Johnson', 13, '187.74.206.88', 1535349416, 'Login (in-game)', '', 0),
(2185, 'Vincent_Henderson', 1, '164.163.207.83', 1535349628, 'Login (in-game)', '', 0),
(2186, 'Vincent_Henderson', 1, '164.163.207.83', 1535349649, 'Jogador teleportado', 'Scottler_Johnson', 13),
(2187, 'Vincent_Henderson', 1, '164.163.207.83', 1535349657, 'Defina saúde para 100', 'Scottler_Johnson', 13),
(2188, 'Scottler_Johnson', 13, '187.74.206.88', 1535349690, 'Login (in-game)', '', 0),
(2189, 'Scottler_Johnson', 13, '187.74.206.88', 1535350025, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2190, 'Zac_Deutch', 2, '186.224.164.191', 1535403391, 'Login (in-game)', '', 0),
(2191, 'Rowan_Ballard', 4, '186.225.187.250', 1535403435, 'Login (in-game)', '', 0),
(2192, 'Zac_Deutch', 2, '186.224.164.191', 1535403483, 'Login (in-game)', '', 0),
(2193, 'Zac_Deutch', 2, '186.224.164.191', 1535405279, 'Login (in-game)', '', 0),
(2194, 'Zac_Deutch', 2, '186.224.164.191', 1535405289, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2195, 'Zac_Deutch', 2, '186.224.164.191', 1535405323, 'Skin definida para 20009', 'Zac_Deutch', 2),
(2196, 'Zac_Deutch', 2, '186.224.164.191', 1535405325, 'Skin definida para 20008', 'Zac_Deutch', 2),
(2197, 'Zac_Deutch', 2, '186.224.164.191', 1535405329, 'Skin definida para 20004', 'Zac_Deutch', 2),
(2198, 'Zac_Deutch', 2, '186.224.164.191', 1535405331, 'Skin definida para 20003', 'Zac_Deutch', 2),
(2199, 'Zac_Deutch', 2, '186.224.164.191', 1535405334, 'Skin definida para 20010', 'Zac_Deutch', 2),
(2200, 'Zac_Deutch', 2, '186.224.164.191', 1535405336, 'Skin definida para 20011', 'Zac_Deutch', 2),
(2201, 'Zac_Deutch', 2, '186.224.164.191', 1535405337, 'Skin definida para 20013', 'Zac_Deutch', 2),
(2202, 'Zac_Deutch', 2, '186.224.164.191', 1535405349, 'Skin definida para 20014', 'Zac_Deutch', 2),
(2203, 'Zac_Deutch', 2, '186.224.164.191', 1535405351, 'Skin definida para 20015', 'Zac_Deutch', 2),
(2204, 'Zac_Deutch', 2, '186.224.164.191', 1535405352, 'Skin definida para 20016', 'Zac_Deutch', 2),
(2205, 'Zac_Deutch', 2, '186.224.164.191', 1535405353, 'Skin definida para 20017', 'Zac_Deutch', 2),
(2206, 'Zac_Deutch', 2, '186.224.164.191', 1535405354, 'Skin definida para 20018', 'Zac_Deutch', 2),
(2207, 'Zac_Deutch', 2, '186.224.164.191', 1535405355, 'Skin definida para 20019', 'Zac_Deutch', 2),
(2208, 'Rowan_Ballard', 4, '186.225.187.250', 1535406242, 'Teleportado para Dillimore', 'Rowan_Ballard', 4),
(2209, 'Rowan_Ballard', 4, '186.225.187.250', 1535406266, 'Skin definida para 20000', 'Rowan_Ballard', 4),
(2210, 'Rowan_Ballard', 4, '186.225.187.250', 1535406268, 'Skin definida para 20001', 'Rowan_Ballard', 4),
(2211, 'Rowan_Ballard', 4, '186.225.187.250', 1535406270, 'Skin definida para 20002', 'Rowan_Ballard', 4),
(2212, 'Rowan_Ballard', 4, '186.225.187.250', 1535406271, 'Skin definida para 20009', 'Rowan_Ballard', 4),
(2213, 'Rowan_Ballard', 4, '186.225.187.250', 1535406274, 'Skin definida para 20010', 'Rowan_Ballard', 4),
(2214, 'Rowan_Ballard', 4, '186.225.187.250', 1535406276, 'Skin definida para 20011', 'Rowan_Ballard', 4),
(2215, 'Rowan_Ballard', 4, '186.225.187.250', 1535406278, 'Skin definida para 20012', 'Rowan_Ballard', 4),
(2216, 'Rowan_Ballard', 4, '186.225.187.250', 1535406279, 'Skin definida para 20013', 'Rowan_Ballard', 4),
(2217, 'Rowan_Ballard', 4, '186.225.187.250', 1535406280, 'Skin definida para 20014', 'Rowan_Ballard', 4),
(2218, 'Rowan_Ballard', 4, '186.225.187.250', 1535406281, 'Skin definida para 20015', 'Rowan_Ballard', 4),
(2219, 'Rowan_Ballard', 4, '186.225.187.250', 1535406283, 'Skin definida para 20017', 'Rowan_Ballard', 4),
(2220, 'Rowan_Ballard', 4, '186.225.187.250', 1535406285, 'Skin definida para 20018', 'Rowan_Ballard', 4),
(2221, 'Rowan_Ballard', 4, '186.225.187.250', 1535406288, 'Skin definida para 20019', 'Rowan_Ballard', 4),
(2222, 'Rowan_Ballard', 4, '186.225.187.250', 1535406290, 'Skin definida para 20020', 'Rowan_Ballard', 4),
(2223, 'Rowan_Ballard', 4, '186.225.187.250', 1535406291, 'Skin definida para 20021', 'Rowan_Ballard', 4),
(2224, 'Rowan_Ballard', 4, '186.225.187.250', 1535406293, 'Skin definida para 20022', 'Rowan_Ballard', 4),
(2225, 'Rowan_Ballard', 4, '186.225.187.250', 1535406294, 'Skin definida para 20025', 'Rowan_Ballard', 4),
(2226, 'Rowan_Ballard', 4, '186.225.187.250', 1535406300, 'Skin definida para 20027', 'Rowan_Ballard', 4),
(2227, 'Rowan_Ballard', 4, '186.225.187.250', 1535406303, 'Skin definida para 20028', 'Rowan_Ballard', 4),
(2228, 'Rowan_Ballard', 4, '186.225.187.250', 1535406305, 'Skin definida para 20029', 'Rowan_Ballard', 4),
(2229, 'Rowan_Ballard', 4, '186.225.187.250', 1535406307, 'Skin definida para 20030', 'Rowan_Ballard', 4),
(2230, 'Rowan_Ballard', 4, '186.225.187.250', 1535406810, 'Teleportado para Montgomery', 'Rowan_Ballard', 4),
(2231, 'Rowan_Ballard', 4, '186.225.187.250', 1535406826, 'Skin definida para 250', 'Rowan_Ballard', 4),
(2232, 'Zac_Deutch', 2, '186.224.164.191', 1535407090, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2233, 'Rowan_Ballard', 4, '186.225.187.250', 1535409281, 'Jogador puxado', 'Wesley_Vianna', 18),
(2234, 'Zac_Deutch', 2, '186.224.164.191', 1535409624, 'Jogador puxado', 'Wesley_Vianna', 18),
(2235, 'Rowan_Ballard', 4, '186.225.187.250', 1535409624, 'Jogador puxado', 'Wesley_Vianna', 18),
(2236, 'Rowan_Ballard', 4, '186.225.187.250', 1535411639, 'Skin definida para 20001', 'Wesley_Vianna', 18),
(2237, 'Rowan_Ballard', 4, '186.225.187.250', 1535411646, 'Skin definida para 20002', 'Wesley_Vianna', 18),
(2238, 'Rowan_Ballard', 4, '186.225.187.250', 1535411648, 'Skin definida para 20003', 'Wesley_Vianna', 18),
(2239, 'Rowan_Ballard', 4, '186.225.187.250', 1535411652, 'Skin definida para 20004', 'Wesley_Vianna', 18),
(2240, 'Rowan_Ballard', 4, '186.225.187.250', 1535411656, 'Skin definida para 20005', 'Wesley_Vianna', 18),
(2241, 'Rowan_Ballard', 4, '186.225.187.250', 1535411659, 'Skin definida para 20006', 'Wesley_Vianna', 18),
(2242, 'Rowan_Ballard', 4, '186.225.187.250', 1535411662, 'Skin definida para 20007', 'Wesley_Vianna', 18),
(2243, 'Rowan_Ballard', 4, '186.225.187.250', 1535411664, 'Skin definida para 20008', 'Wesley_Vianna', 18),
(2244, 'Rowan_Ballard', 4, '186.225.187.250', 1535411667, 'Skin definida para 20009', 'Wesley_Vianna', 18),
(2245, 'Rowan_Ballard', 4, '186.225.187.250', 1535411671, 'Skin definida para 20010', 'Wesley_Vianna', 18),
(2246, 'Rowan_Ballard', 4, '186.225.187.250', 1535411675, 'Skin definida para 20011', 'Wesley_Vianna', 18),
(2247, 'Rowan_Ballard', 4, '186.225.187.250', 1535411680, 'Skin definida para 20012', 'Wesley_Vianna', 18),
(2248, 'Rowan_Ballard', 4, '186.225.187.250', 1535411682, 'Skin definida para 20013', 'Wesley_Vianna', 18),
(2249, 'Rowan_Ballard', 4, '186.225.187.250', 1535411685, 'Skin definida para 20014', 'Wesley_Vianna', 18),
(2250, 'Rowan_Ballard', 4, '186.225.187.250', 1535411688, 'Skin definida para 20015', 'Wesley_Vianna', 18),
(2251, 'Rowan_Ballard', 4, '186.225.187.250', 1535411691, 'Skin definida para 20016', 'Wesley_Vianna', 18),
(2252, 'Rowan_Ballard', 4, '186.225.187.250', 1535411693, 'Skin definida para 20017', 'Wesley_Vianna', 18),
(2253, 'Rowan_Ballard', 4, '186.225.187.250', 1535411696, 'Skin definida para 20018', 'Wesley_Vianna', 18),
(2254, 'Rowan_Ballard', 4, '186.225.187.250', 1535411699, 'Skin definida para 20017', 'Wesley_Vianna', 18),
(2255, 'Scottler_Johnson', 13, '187.74.206.88', 1535412969, 'Login (in-game)', '', 0),
(2256, 'Scottler_Johnson', 13, '187.74.206.88', 1535412994, 'Jogador teleportado', 'Zac_Deutch', 2),
(2257, 'Scottler_Johnson', 13, '187.74.206.88', 1535413013, 'Spectate', 'Rowan_Ballard', 4),
(2258, 'Scottler_Johnson', 13, '187.74.206.88', 1535413020, 'Spectate', 'Wesley_Vianna', 18),
(2259, 'Scottler_Johnson', 13, '187.74.206.88', 1535413395, 'Login (in-game)', '', 0),
(2260, 'Scottler_Johnson', 13, '187.74.206.88', 1535413512, 'Spectate', 'Zac_Deutch', 2),
(2261, 'Vincent_Henderson', 1, '164.163.207.37', 1535413562, 'Login (in-game)', '', 0),
(2262, 'Vincent_Henderson', 1, '164.163.207.37', 1535413749, 'Login (in-game)', '', 0),
(2263, 'Scottler_Johnson', 13, '187.74.206.88', 1535413832, 'Login (in-game)', '', 0),
(2264, 'Vincent_Henderson', 1, '164.163.207.37', 1535413834, 'Login (in-game)', '', 0),
(2265, 'Scottler_Johnson', 13, '187.74.206.88', 1535413981, 'Login (in-game)', '', 0),
(2266, 'Vincent_Henderson', 1, '164.163.207.37', 1535413987, 'Login (in-game)', '', 0),
(2267, 'Vincent_Henderson', 1, '164.163.207.37', 1535414013, 'Login (in-game)', '', 0),
(2268, 'Vincent_Henderson', 1, '164.163.207.37', 1535414025, 'Teleportado para SF Tower', 'Vincent_Henderson', 1),
(2269, 'Scottler_Johnson', 13, '187.74.206.88', 1535414075, 'Login (in-game)', '', 0),
(2270, 'Vincent_Henderson', 1, '164.163.207.37', 1535414184, 'Jogador teleportado', 'Scottler_Johnson', 13),
(2271, 'Vincent_Henderson', 1, '164.163.207.37', 1535414227, 'Login (in-game)', '', 0),
(2272, 'Rowan_Ballard', 4, '186.225.187.250', 1535415059, 'Login (in-game)', '', 0),
(2273, 'Rowan_Ballard', 4, '186.225.187.250', 1535415072, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2274, 'Rowan_Ballard', 4, '186.225.187.250', 1535415263, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(2275, 'Rowan_Ballard', 4, '186.225.187.250', 1535415334, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2276, 'Vincent_Henderson', 1, '164.163.207.37', 1535415402, 'Login (in-game)', '', 0),
(2277, 'Scottler_Johnson', 13, '187.74.206.88', 1535415419, 'Login (in-game)', '', 0),
(2278, 'Rowan_Ballard', 4, '186.225.187.250', 1535415541, 'Login (in-game)', '', 0),
(2279, 'Rowan_Ballard', 4, '186.225.187.250', 1535415590, 'Jogador teleportado', 'Rowan_Ballard', 4),
(2280, 'Rowan_Ballard', 4, '186.225.187.250', 1535415593, 'Jogador teleportado', 'Scottler_Johnson', 13),
(2281, 'Rowan_Ballard', 4, '186.225.187.250', 1535415599, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2282, 'Rowan_Ballard', 4, '186.225.187.250', 1535415725, 'Mudou o tempo para 5', '', 0),
(2283, 'Rowan_Ballard', 4, '186.225.187.250', 1535415727, 'Mudou o tempo para 3', '', 0),
(2284, 'Scottler_Johnson', 13, '187.74.206.88', 1535415764, 'Login (in-game)', '', 0),
(2285, 'Rowan_Ballard', 4, '186.225.187.250', 1535415783, 'Veiculo spawnado: Sanchez (ID 210, Model 468)', '', 0),
(2286, 'Rowan_Ballard', 4, '186.225.187.250', 1535415804, 'Veiculo destruido: Sanchez (ID 210)', '', 0),
(2287, 'Vincent_Henderson', 1, '164.163.207.37', 1535416341, 'Login (in-game)', '', 0),
(2288, 'Vincent_Henderson', 1, '164.163.207.37', 1535416489, 'Login (in-game)', '', 0),
(2289, 'Vincent_Henderson', 1, '164.163.207.37', 1535416497, 'Jogador teleportado', 'Scottler_Johnson', 13),
(2290, 'Scottler_Johnson', 13, '187.74.206.88', 1535416608, 'Login (in-game)', '', 0),
(2291, 'Vincent_Henderson', 1, '164.163.207.37', 1535417103, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2292, 'Scottler_Johnson', 13, '187.74.206.88', 1535417132, 'Login (in-game)', '', 0),
(2293, 'Scottler_Johnson', 13, '187.74.206.88', 1535417315, 'Login (in-game)', '', 0),
(2294, 'Vincent_Henderson', 1, '164.163.207.37', 1535417470, 'Login (in-game)', '', 0),
(2295, 'Scottler_Johnson', 13, '187.74.206.88', 1535417523, 'Login (in-game)', '', 0),
(2296, 'Vincent_Henderson', 1, '164.163.207.37', 1535417540, 'Jogador teleportado', 'Scottler_Johnson', 13),
(2297, 'Vincent_Henderson', 1, '164.163.207.37', 1535418841, 'Login (in-game)', '', 0),
(2298, 'Vincent_Henderson', 1, '164.163.207.37', 1535419782, 'Login (in-game)', '', 0),
(2299, 'Scottler_Johnson', 13, '187.74.206.88', 1535420718, 'Login (in-game)', '', 0),
(2300, 'Vincent_Henderson', 1, '164.163.207.37', 1535420723, 'Login (in-game)', '', 0),
(2301, 'Scottler_Johnson', 13, '187.74.206.88', 1535420731, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2302, 'Vincent_Henderson', 1, '164.163.207.37', 1535421148, 'Login (in-game)', '', 0),
(2303, 'Vincent_Henderson', 1, '164.163.207.37', 1535421167, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(2304, 'Vincent_Henderson', 1, '164.163.207.37', 1535421224, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2305, 'Vincent_Henderson', 1, '164.163.207.37', 1535421567, 'Login (in-game)', '', 0),
(2306, 'Vincent_Henderson', 1, '164.163.207.37', 1535432674, 'Login (in-game)', '', 0),
(2307, 'Vincent_Henderson', 1, '164.163.207.37', 1535432842, 'Login (in-game)', '', 0),
(2308, 'Vincent_Henderson', 1, '164.163.207.107', 1535474689, 'Login (in-game)', '', 0),
(2309, 'Vincent_Henderson', 1, '164.163.207.107', 1535474718, 'Login (in-game)', '', 0),
(2310, 'Vincent_Henderson', 1, '127.0.0.1', 1535564580, 'Login (in-game)', '', 0),
(2311, 'Vincent_Henderson', 1, '127.0.0.1', 1535566951, 'Login (in-game)', '', 0),
(2312, 'Vincent_Henderson', 1, '127.0.0.1', 1535567109, 'Login (in-game)', '', 0),
(2313, 'Vincent_Henderson', 1, '127.0.0.1', 1535567235, 'Login (in-game)', '', 0),
(2314, 'Vincent_Henderson', 1, '127.0.0.1', 1535570937, 'Login (in-game)', '', 0),
(2315, 'Vincent_Henderson', 1, '127.0.0.1', 1535573805, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2316, 'Vincent_Henderson', 1, '127.0.0.1', 1535576188, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2317, 'Vincent_Henderson', 1, '164.163.207.107', 1535490043, 'Login (in-game)', '', 0),
(2318, 'Rowan_Ballard', 4, '186.225.187.250', 1535490404, 'Login (in-game)', '', 0),
(2319, 'Vincent_Henderson', 1, '164.163.207.107', 1535490424, 'Login (in-game)', '', 0),
(2320, 'Vincent_Henderson', 1, '164.163.207.107', 1535490465, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2321, 'Rowan_Ballard', 4, '186.225.187.250', 1535490559, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2322, 'Vincent_Henderson', 1, '164.163.207.107', 1535491768, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2323, 'Rowan_Ballard', 4, '186.225.187.250', 1535492942, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2324, 'Vincent_Henderson', 1, '164.163.207.107', 1535494752, 'Jogador teleportado', 'Wesley_Vianna', 18),
(2325, 'Vincent_Henderson', 1, '164.163.207.107', 1535494864, 'Login (in-game)', '', 0),
(2326, 'Wesley_Vianna', 18, '186.225.187.134', 1535495110, 'Confirmed name change to Enzo_Williams', 'Wesley_Vianna', 18),
(2327, 'Rowan_Ballard', 4, '186.225.187.250', 1535495367, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2328, 'Vincent_Henderson', 1, '164.163.207.107', 1535496676, 'Login (in-game)', '', 0),
(2329, 'Vincent_Henderson', 1, '164.163.207.107', 1535497471, 'Refundo Drogas 10 x marijuana', 'Rowan_Ballard', 4),
(2330, 'Vincent_Henderson', 1, '164.163.207.107', 1535497533, 'Mudou o tempo para 21', '', 0),
(2331, 'Vincent_Henderson', 1, '164.163.207.107', 1535498102, 'Mudou o tempo para 11', '', 0),
(2332, 'Vincent_Henderson', 1, '164.163.207.107', 1535498104, 'Mudou o tempo para 21', '', 0),
(2333, 'Vincent_Henderson', 1, '164.163.207.107', 1535498208, 'Veiculo spawnado: Huntley (ID 212, Model 579)', '', 0),
(2334, 'Vincent_Henderson', 1, '164.163.207.107', 1535498263, 'Mudou o tempo para 11', '', 0),
(2335, 'Vincent_Henderson', 1, '164.163.207.107', 1535498424, 'Set faction to 1', 'Morgan_Eisenhower', 22),
(2336, 'Vincent_Henderson', 1, '164.163.207.107', 1535498696, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2337, 'Rowan_Ballard', 4, '186.225.187.250', 1535498808, 'Spectate', 'Morgan_Eisenhower', 22),
(2338, 'Rowan_Ballard', 4, '186.225.187.250', 1535498813, 'Spectate', 'Morgan_Eisenhower', 22),
(2339, 'Zac_Deutch', 2, '186.224.172.46', 1535498861, 'Login (in-game)', '', 0),
(2340, 'Rowan_Ballard', 4, '186.225.187.250', 1535498865, 'Spectate', 'Morgan_Eisenhower', 22),
(2341, 'Zac_Deutch', 2, '186.224.172.46', 1535498955, 'Teleportado para Dillimore', 'Zac_Deutch', 2),
(2342, 'Rowan_Ballard', 4, '186.225.187.250', 1535498970, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(2343, 'Rowan_Ballard', 4, '186.225.187.250', 1535499034, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2344, 'Rowan_Ballard', 4, '186.225.187.250', 1535499072, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2345, 'Rowan_Ballard', 4, '186.225.187.250', 1535499080, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2346, 'Vincent_Henderson', 1, '164.163.207.107', 1535499108, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2347, 'Vincent_Henderson', 1, '164.163.207.107', 1535499110, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2348, 'Vincent_Henderson', 1, '164.163.207.107', 1535499112, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2349, 'Vincent_Henderson', 1, '164.163.207.107', 1535499114, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2350, 'Zac_Deutch', 2, '186.224.172.46', 1535499125, 'Froze player', 'Vincent_Henderson', 1),
(2351, 'Vincent_Henderson', 1, '164.163.207.107', 1535499135, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2352, 'Zac_Deutch', 2, '186.224.172.46', 1535499136, 'Unfroze player', 'Vincent_Henderson', 1),
(2353, 'Vincent_Henderson', 1, '164.163.207.107', 1535499138, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2354, 'Vincent_Henderson', 1, '164.163.207.107', 1535499140, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2355, 'Vincent_Henderson', 1, '164.163.207.107', 1535499141, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2356, 'Vincent_Henderson', 1, '164.163.207.107', 1535499142, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2357, 'Zac_Deutch', 2, '186.224.172.46', 1535499195, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(2358, 'Vincent_Henderson', 1, '164.163.207.107', 1535499198, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2359, 'Vincent_Henderson', 1, '164.163.207.107', 1535499202, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2360, 'Rowan_Ballard', 4, '186.225.187.250', 1535499212, 'Spectate', 'Morgan_Eisenhower', 22),
(2361, 'Vincent_Henderson', 1, '164.163.207.107', 1535499239, 'Veiculo spawnado: Bullet (ID 214, Model 541)', '', 0),
(2362, 'Zac_Deutch', 2, '186.224.172.46', 1535499387, 'Teleportado para Angel Pine', 'Zac_Deutch', 2),
(2363, 'Rowan_Ballard', 4, '186.225.187.250', 1535500048, 'Spectate', 'Morgan_Eisenhower', 22),
(2364, 'Rowan_Ballard', 4, '186.225.187.250', 1535500058, 'Spectate', 'Morgan_Eisenhower', 22),
(2365, 'Rowan_Ballard', 4, '186.225.187.250', 1535500066, 'Spectate', 'Vincent_Henderson', 1),
(2366, 'Vincent_Henderson', 1, '164.163.207.107', 1535500392, 'Jogador puxado', 'Morgan_Eisenhower', 22),
(2367, 'Vincent_Henderson', 1, '164.163.207.107', 1535500519, 'Jogador puxado', 'Morgan_Eisenhower', 22),
(2368, 'Vincent_Henderson', 1, '164.163.207.107', 1535500573, 'Veiculo spawnado: Maverick (ID 212, Model 487)', '', 0),
(2369, 'Vincent_Henderson', 1, '127.0.0.1', 1535611574, 'Login (in-game)', '', 0),
(2370, 'Vincent_Henderson', 1, '127.0.0.1', 1535611589, 'Mudou o tempo para 11', '', 0),
(2371, 'Vincent_Henderson', 1, '127.0.0.1', 1535611706, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2372, 'Vincent_Henderson', 1, '127.0.0.1', 1535612176, 'Login (in-game)', '', 0),
(2373, 'Vincent_Henderson', 1, '127.0.0.1', 1535612367, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2374, 'Vincent_Henderson', 1, '127.0.0.1', 1535613078, 'Login (in-game)', '', 0),
(2375, 'Vincent_Henderson', 1, '127.0.0.1', 1535613779, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(2376, 'Vincent_Henderson', 1, '127.0.0.1', 1535614159, 'Login (in-game)', '', 0),
(2377, 'Vincent_Henderson', 1, '127.0.0.1', 1535615514, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(2378, 'Vincent_Henderson', 1, '127.0.0.1', 1535616234, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2379, 'Vincent_Henderson', 1, '127.0.0.1', 1535616918, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(2380, 'Vincent_Henderson', 1, '127.0.0.1', 1535617914, 'Teleportado para Fort Carson', 'Vincent_Henderson', 1),
(2381, 'Vincent_Henderson', 1, '127.0.0.1', 1535618797, 'Teleportado para Palomino Creek', 'Vincent_Henderson', 1),
(2382, 'Vincent_Henderson', 1, '127.0.0.1', 1535620035, 'Teleportado para Fort Carson', 'Vincent_Henderson', 1),
(2383, 'Vincent_Henderson', 1, '127.0.0.1', 1535620180, 'Criado novo quarto de Motel', '', 0),
(2384, 'Vincent_Henderson', 1, '127.0.0.1', 1535620563, 'Login (in-game)', '', 0),
(2385, 'Vincent_Henderson', 1, '127.0.0.1', 1535620592, 'Criado novo quarto de Motel', '', 0),
(2386, 'Vincent_Henderson', 1, '127.0.0.1', 1535620594, 'Criado novo quarto de Motel', '', 0),
(2387, 'Vincent_Henderson', 1, '127.0.0.1', 1535620594, 'Criado novo quarto de Motel', '', 0),
(2388, 'Vincent_Henderson', 1, '127.0.0.1', 1535620597, 'Criado novo quarto de Motel', '', 0),
(2389, 'Vincent_Henderson', 1, '127.0.0.1', 1535620597, 'Criado novo quarto de Motel', '', 0),
(2390, 'Vincent_Henderson', 1, '127.0.0.1', 1535620598, 'Criado novo quarto de Motel', '', 0),
(2391, 'Vincent_Henderson', 1, '127.0.0.1', 1535620598, 'Criado novo quarto de Motel', '', 0),
(2392, 'Vincent_Henderson', 1, '127.0.0.1', 1535620599, 'Criado novo quarto de Motel', '', 0),
(2393, 'Vincent_Henderson', 1, '127.0.0.1', 1535620600, 'Criado novo quarto de Motel', '', 0),
(2394, 'Vincent_Henderson', 1, '127.0.0.1', 1535620664, 'Criado novo quarto de Motel', '', 0),
(2395, 'Vincent_Henderson', 1, '127.0.0.1', 1535620729, 'Login (in-game)', '', 0),
(2396, 'Vincent_Henderson', 1, '127.0.0.1', 1535621848, 'Login (in-game)', '', 0),
(2397, 'Vincent_Henderson', 1, '127.0.0.1', 1535621905, 'Criado novo quarto de Motel', '', 0),
(2398, 'Vincent_Henderson', 1, '127.0.0.1', 1535621911, 'Criado novo quarto de Motel', '', 0),
(2399, 'Vincent_Henderson', 1, '127.0.0.1', 1535621915, 'Criado novo quarto de Motel', '', 0),
(2400, 'Vincent_Henderson', 1, '127.0.0.1', 1535621920, 'Criado novo quarto de Motel', '', 0),
(2401, 'Vincent_Henderson', 1, '127.0.0.1', 1535621928, 'Criado novo quarto de Motel', '', 0),
(2402, 'Vincent_Henderson', 1, '127.0.0.1', 1535621932, 'Criado novo quarto de Motel', '', 0),
(2403, 'Vincent_Henderson', 1, '127.0.0.1', 1535621936, 'Criado novo quarto de Motel', '', 0),
(2404, 'Vincent_Henderson', 1, '127.0.0.1', 1535621941, 'Criado novo quarto de Motel', '', 0),
(2405, 'Vincent_Henderson', 1, '127.0.0.1', 1535621947, 'Imediato GMX', '', 0),
(2406, 'Vincent_Henderson', 1, '127.0.0.1', 1535621975, 'Login (in-game)', '', 0),
(2407, 'Vincent_Henderson', 1, '127.0.0.1', 1535622203, 'Criado novo quarto de Motel', '', 0),
(2408, 'Vincent_Henderson', 1, '127.0.0.1', 1535622346, 'Criado novo quarto de Motel', '', 0),
(2409, 'Vincent_Henderson', 1, '127.0.0.1', 1535622352, 'Criado novo quarto de Motel', '', 0),
(2410, 'Vincent_Henderson', 1, '127.0.0.1', 1535622355, 'Criado novo quarto de Motel', '', 0),
(2411, 'Vincent_Henderson', 1, '127.0.0.1', 1535622581, 'Criado novo quarto de Motel', '', 0),
(2412, 'Vincent_Henderson', 1, '127.0.0.1', 1535622591, 'Criado novo quarto de Motel', '', 0),
(2413, 'Vincent_Henderson', 1, '127.0.0.1', 1535622597, 'Criado novo quarto de Motel', '', 0),
(2414, 'Vincent_Henderson', 1, '127.0.0.1', 1535622601, 'Criado novo quarto de Motel', '', 0),
(2415, 'Vincent_Henderson', 1, '127.0.0.1', 1535623088, 'Login (in-game)', '', 0),
(2416, 'Vincent_Henderson', 1, '127.0.0.1', 1535623280, 'Criado novo quarto de Motel', '', 0),
(2417, 'Vincent_Henderson', 1, '127.0.0.1', 1535623322, 'Criado novo quarto de Motel', '', 0),
(2418, 'Vincent_Henderson', 1, '127.0.0.1', 1535623329, 'Criado novo quarto de Motel', '', 0),
(2419, 'Vincent_Henderson', 1, '127.0.0.1', 1535623339, 'Criado novo quarto de Motel', '', 0),
(2420, 'Vincent_Henderson', 1, '127.0.0.1', 1535623345, 'Criado novo quarto de Motel', '', 0),
(2421, 'Vincent_Henderson', 1, '127.0.0.1', 1535623351, 'Criado novo quarto de Motel', '', 0),
(2422, 'Vincent_Henderson', 1, '127.0.0.1', 1535623777, 'Criado novo quarto de Motel', '', 0),
(2423, 'Vincent_Henderson', 1, '127.0.0.1', 1535623785, 'Criado novo quarto de Motel', '', 0),
(2424, 'Vincent_Henderson', 1, '127.0.0.1', 1535623792, 'Criado novo quarto de Motel', '', 0),
(2425, 'Vincent_Henderson', 1, '127.0.0.1', 1535623800, 'Criado novo quarto de Motel', '', 0),
(2426, 'Vincent_Henderson', 1, '127.0.0.1', 1535623806, 'Criado novo quarto de Motel', '', 0),
(2427, 'Vincent_Henderson', 1, '127.0.0.1', 1535623812, 'Criado novo quarto de Motel', '', 0),
(2428, 'Vincent_Henderson', 1, '127.0.0.1', 1535624288, 'Login (in-game)', '', 0),
(2429, 'Vincent_Henderson', 1, '127.0.0.1', 1535624424, 'Criado novo quarto de Motel', '', 0),
(2430, 'Vincent_Henderson', 1, '127.0.0.1', 1535624429, 'Criado novo quarto de Motel', '', 0),
(2431, 'Vincent_Henderson', 1, '127.0.0.1', 1535624439, 'Criado novo quarto de Motel', '', 0),
(2432, 'Vincent_Henderson', 1, '127.0.0.1', 1535624444, 'Criado novo quarto de Motel', '', 0),
(2433, 'Vincent_Henderson', 1, '127.0.0.1', 1535624454, 'Criado novo quarto de Motel', '', 0),
(2434, 'Vincent_Henderson', 1, '127.0.0.1', 1535624457, 'Criado novo quarto de Motel', '', 0),
(2435, 'Vincent_Henderson', 1, '127.0.0.1', 1535624473, 'Criado novo quarto de Motel', '', 0),
(2436, 'Vincent_Henderson', 1, '127.0.0.1', 1535624477, 'Criado novo quarto de Motel', '', 0),
(2437, 'Vincent_Henderson', 1, '127.0.0.1', 1535624493, 'Criado novo quarto de Motel', '', 0),
(2438, 'Vincent_Henderson', 1, '127.0.0.1', 1535624505, 'Criado novo quarto de Motel', '', 0),
(2439, 'Vincent_Henderson', 1, '127.0.0.1', 1535624516, 'Criado novo quarto de Motel', '', 0),
(2440, 'Vincent_Henderson', 1, '127.0.0.1', 1535624527, 'Criado novo quarto de Motel', '', 0),
(2441, 'Vincent_Henderson', 1, '127.0.0.1', 1535624538, 'Criado novo quarto de Motel', '', 0),
(2442, 'Vincent_Henderson', 1, '127.0.0.1', 1535624549, 'Criado novo quarto de Motel', '', 0),
(2443, 'Vincent_Henderson', 1, '127.0.0.1', 1535624739, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(2444, 'Vincent_Henderson', 1, '127.0.0.1', 1535625119, 'Criado novo quarto de Motel', '', 0),
(2445, 'Vincent_Henderson', 1, '127.0.0.1', 1535625140, 'Criado novo quarto de Motel', '', 0),
(2446, 'Vincent_Henderson', 1, '127.0.0.1', 1535625146, 'Criado novo quarto de Motel', '', 0),
(2447, 'Vincent_Henderson', 1, '127.0.0.1', 1535625149, 'Criado novo quarto de Motel', '', 0),
(2448, 'Vincent_Henderson', 1, '127.0.0.1', 1535625155, 'Criado novo quarto de Motel', '', 0),
(2449, 'Vincent_Henderson', 1, '127.0.0.1', 1535625160, 'Criado novo quarto de Motel', '', 0),
(2450, 'Vincent_Henderson', 1, '127.0.0.1', 1535625169, 'Criado novo quarto de Motel', '', 0),
(2451, 'Vincent_Henderson', 1, '127.0.0.1', 1535625172, 'Criado novo quarto de Motel', '', 0),
(2452, 'Vincent_Henderson', 1, '127.0.0.1', 1535625177, 'Criado novo quarto de Motel', '', 0),
(2453, 'Vincent_Henderson', 1, '127.0.0.1', 1535625180, 'Criado novo quarto de Motel', '', 0),
(2454, 'Vincent_Henderson', 1, '127.0.0.1', 1535625185, 'Criado novo quarto de Motel', '', 0),
(2455, 'Vincent_Henderson', 1, '127.0.0.1', 1535625188, 'Criado novo quarto de Motel', '', 0),
(2456, 'Vincent_Henderson', 1, '127.0.0.1', 1535625199, 'Criado novo quarto de Motel', '', 0),
(2457, 'Vincent_Henderson', 1, '127.0.0.1', 1535625201, 'Criado novo quarto de Motel', '', 0),
(2458, 'Vincent_Henderson', 1, '127.0.0.1', 1535625206, 'Criado novo quarto de Motel', '', 0),
(2459, 'Vincent_Henderson', 1, '127.0.0.1', 1535625208, 'Criado novo quarto de Motel', '', 0),
(2460, 'Vincent_Henderson', 1, '127.0.0.1', 1535625212, 'Criado novo quarto de Motel', '', 0),
(2461, 'Vincent_Henderson', 1, '127.0.0.1', 1535625215, 'Criado novo quarto de Motel', '', 0),
(2462, 'Vincent_Henderson', 1, '127.0.0.1', 1535625224, 'Criado novo quarto de Motel', '', 0),
(2463, 'Vincent_Henderson', 1, '127.0.0.1', 1535625226, 'Criado novo quarto de Motel', '', 0),
(2464, 'Vincent_Henderson', 1, '127.0.0.1', 1535625231, 'Criado novo quarto de Motel', '', 0),
(2465, 'Vincent_Henderson', 1, '127.0.0.1', 1535625233, 'Criado novo quarto de Motel', '', 0),
(2466, 'Vincent_Henderson', 1, '127.0.0.1', 1535625238, 'Criado novo quarto de Motel', '', 0),
(2467, 'Vincent_Henderson', 1, '127.0.0.1', 1535625241, 'Criado novo quarto de Motel', '', 0),
(2468, 'Vincent_Henderson', 1, '127.0.0.1', 1535625627, 'Criado novo quarto de Motel', '', 0),
(2469, 'Vincent_Henderson', 1, '127.0.0.1', 1535625632, 'Criado novo quarto de Motel', '', 0),
(2470, 'Vincent_Henderson', 1, '127.0.0.1', 1535625643, 'Criado novo quarto de Motel', '', 0),
(2471, 'Vincent_Henderson', 1, '127.0.0.1', 1535625650, 'Criado novo quarto de Motel', '', 0),
(2472, 'Vincent_Henderson', 1, '127.0.0.1', 1535625653, 'Criado novo quarto de Motel', '', 0),
(2473, 'Vincent_Henderson', 1, '127.0.0.1', 1535625659, 'Criado novo quarto de Motel', '', 0),
(2474, 'Vincent_Henderson', 1, '127.0.0.1', 1535625788, 'Criado novo quarto de Motel', '', 0),
(2475, 'Vincent_Henderson', 1, '127.0.0.1', 1535625829, 'Criado novo quarto de Motel', '', 0),
(2476, 'Vincent_Henderson', 1, '127.0.0.1', 1535626026, 'Criado novo quarto de Motel', '', 0),
(2477, 'Vincent_Henderson', 1, '127.0.0.1', 1535626033, 'Criado novo quarto de Motel', '', 0),
(2478, 'Vincent_Henderson', 1, '127.0.0.1', 1535626040, 'Criado novo quarto de Motel', '', 0),
(2479, 'Vincent_Henderson', 1, '127.0.0.1', 1535626045, 'Criado novo quarto de Motel', '', 0),
(2480, 'Vincent_Henderson', 1, '127.0.0.1', 1535626985, 'Login (in-game)', '', 0),
(2481, 'Vincent_Henderson', 1, '127.0.0.1', 1535628749, 'Login (in-game)', '', 0),
(2482, 'Vincent_Henderson', 1, '164.163.207.107', 1535543211, 'Login (in-game)', '', 0),
(2483, 'Vincent_Henderson', 1, '164.163.207.107', 1535543617, 'Skin definida para 23000', 'Vincent_Henderson', 1),
(2484, 'Vincent_Henderson', 1, '164.163.207.107', 1535543626, 'Skin definida para 23001', 'Vincent_Henderson', 1),
(2485, 'Vincent_Henderson', 1, '164.163.207.107', 1535543743, 'Set faction to 1', 'Richard_Schmidt', 23),
(2486, 'Vincent_Henderson', 1, '164.163.207.107', 1535545943, 'Jogador teleportado', 'Richard_Schmidt', 23),
(2487, 'Vincent_Henderson', 1, '164.163.207.107', 1535547376, 'Jogador teleportado', 'Richard_Schmidt', 23),
(2488, 'Vincent_Henderson', 1, '164.163.207.107', 1535547425, 'Spectate', 'Richard_Schmidt', 23),
(2489, 'Vincent_Henderson', 1, '164.163.207.107', 1535547440, 'Spectate', 'Richard_Schmidt', 23),
(2490, 'Vincent_Henderson', 1, '164.163.207.107', 1535547515, 'Jogador teleportado', 'Richard_Schmidt', 23),
(2491, 'Vincent_Henderson', 1, '164.163.207.107', 1535547523, 'Veiculo spawnado: Sandking (ID 212, Model 495)', '', 0),
(2492, 'Vincent_Henderson', 1, '164.163.207.107', 1535547822, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2493, 'Vincent_Henderson', 1, '164.163.207.107', 1535547880, 'Spectate', 'Morgan_Eisenhower', 22),
(2494, 'Vincent_Henderson', 1, '164.163.207.107', 1535547887, 'Jogador puxado', 'Morgan_Eisenhower', 22),
(2495, 'Vincent_Henderson', 1, '164.163.207.107', 1535547997, 'Jogador puxado', 'Morgan_Eisenhower', 22),
(2496, 'Vincent_Henderson', 1, '127.0.0.1', 1535656152, 'Login (in-game)', '', 0),
(2497, 'Vincent_Henderson', 1, '127.0.0.1', 1535656171, 'Skin definida para 250', 'Vincent_Henderson', 1),
(2498, 'Vincent_Henderson', 1, '127.0.0.1', 1535656914, 'Todos facções da base de dados foram recarregadas', '', 0),
(2499, 'Vincent_Henderson', 1, '127.0.0.1', 1535659453, 'Teleportado para Blueberry', 'Vincent_Henderson', 1),
(2500, 'Vincent_Henderson', 1, '127.0.0.1', 1535661828, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2501, 'Vincent_Henderson', 1, '127.0.0.1', 1535687947, 'Login (in-game)', '', 0),
(2502, 'Vincent_Henderson', 1, '127.0.0.1', 1535688540, 'Login (in-game)', '', 0),
(2503, 'Scottler_Johnson', 13, '187.101.184.122', 1535604605, 'Login (in-game)', '', 0),
(2504, 'Vincent_Henderson', 1, '164.163.207.107', 1535604610, 'Login (in-game)', '', 0),
(2505, 'Scottler_Johnson', 13, '187.101.184.122', 1535604627, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2506, 'Scottler_Johnson', 13, '187.101.184.122', 1535604683, 'Spectate', 'Vincent_Henderson', 1),
(2507, 'Scottler_Johnson', 13, '187.101.184.122', 1535604754, 'Spectate', 'Vincent_Henderson', 1),
(2508, 'Scottler_Johnson', 13, '187.101.184.122', 1535605576, 'Login (in-game)', '', 0),
(2509, 'Vincent_Henderson', 1, '164.163.207.107', 1535605605, 'Login (in-game)', '', 0),
(2510, 'Scottler_Johnson', 13, '187.101.184.122', 1535605684, 'Spectate', 'Vincent_Henderson', 1),
(2511, 'Scottler_Johnson', 13, '187.101.184.122', 1535605705, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2512, 'Vincent_Henderson', 1, '164.163.207.107', 1535605884, 'Login (in-game)', '', 0),
(2513, 'Vincent_Henderson', 1, '164.163.207.107', 1535607615, 'Login (in-game)', '', 0),
(2514, 'Scottler_Johnson', 13, '187.101.184.122', 1535607619, 'Login (in-game)', '', 0),
(2515, 'Scottler_Johnson', 13, '187.101.184.122', 1535607641, 'Jogador teleportado', 'Vincent_Henderson', 1),
(2516, 'Vincent_Henderson', 1, '164.163.207.107', 1535608411, 'Login (in-game)', '', 0),
(2517, 'Scottler_Johnson', 13, '187.101.184.122', 1535608453, 'Login (in-game)', '', 0),
(2518, 'Vincent_Henderson', 1, '164.163.207.107', 1535610709, 'Login (in-game)', '', 0),
(2519, 'Vincent_Henderson', 1, '164.163.207.107', 1535631107, 'Login (in-game)', '', 0),
(2520, 'Vincent_Henderson', 1, '164.163.207.107', 1535631158, 'Skin definida para 216', 'Vincent_Henderson', 1),
(2521, 'Vincent_Henderson', 1, '127.0.0.1', 1535720542, 'Login (in-game)', '', 0),
(2522, 'Vincent_Henderson', 1, '127.0.0.1', 1535720559, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(2523, 'Vincent_Henderson', 1, '127.0.0.1', 1535720771, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2524, 'Vincent_Henderson', 1, '127.0.0.1', 1535720956, 'Skin definida para 20000', 'Vincent_Henderson', 1),
(2525, 'Vincent_Henderson', 1, '127.0.0.1', 1535720961, 'Skin definida para 20001', 'Vincent_Henderson', 1),
(2526, 'Vincent_Henderson', 1, '127.0.0.1', 1535720993, 'Skin definida para 20002', 'Vincent_Henderson', 1),
(2527, 'Vincent_Henderson', 1, '127.0.0.1', 1535720998, 'Skin definida para 20004', 'Vincent_Henderson', 1),
(2528, 'Vincent_Henderson', 1, '127.0.0.1', 1535721000, 'Skin definida para 20005', 'Vincent_Henderson', 1),
(2529, 'Vincent_Henderson', 1, '127.0.0.1', 1535721003, 'Skin definida para 20007', 'Vincent_Henderson', 1),
(2530, 'Vincent_Henderson', 1, '127.0.0.1', 1535721039, 'Skin definida para 20008', 'Vincent_Henderson', 1);
INSERT INTO `adminlog` (`id`, `AdminName`, `AdminSQLID`, `IP`, `Timestamp`, `Action`, `AgainstName`, `AgainstSQLID`) VALUES
(2531, 'Vincent_Henderson', 1, '127.0.0.1', 1535721044, 'Skin definida para 20009', 'Vincent_Henderson', 1),
(2532, 'Vincent_Henderson', 1, '127.0.0.1', 1535721066, 'Skin definida para 20010', 'Vincent_Henderson', 1),
(2533, 'Vincent_Henderson', 1, '127.0.0.1', 1535721074, 'Skin definida para 20011', 'Vincent_Henderson', 1),
(2534, 'Vincent_Henderson', 1, '127.0.0.1', 1535721087, 'Skin definida para 20012', 'Vincent_Henderson', 1),
(2535, 'Vincent_Henderson', 1, '127.0.0.1', 1535721098, 'Skin definida para 20013', 'Vincent_Henderson', 1),
(2536, 'Vincent_Henderson', 1, '127.0.0.1', 1535721105, 'Skin definida para 20014', 'Vincent_Henderson', 1),
(2537, 'Vincent_Henderson', 1, '127.0.0.1', 1535721121, 'Skin definida para 20015', 'Vincent_Henderson', 1),
(2538, 'Vincent_Henderson', 1, '127.0.0.1', 1535721125, 'Skin definida para 20016', 'Vincent_Henderson', 1),
(2539, 'Vincent_Henderson', 1, '127.0.0.1', 1535721140, 'Skin definida para 20017', 'Vincent_Henderson', 1),
(2540, 'Vincent_Henderson', 1, '127.0.0.1', 1535721153, 'Skin definida para 20018', 'Vincent_Henderson', 1),
(2541, 'Vincent_Henderson', 1, '127.0.0.1', 1535721157, 'Skin definida para 20019', 'Vincent_Henderson', 1),
(2542, 'Vincent_Henderson', 1, '127.0.0.1', 1535722203, 'Login (in-game)', '', 0),
(2543, 'Vincent_Henderson', 1, '127.0.0.1', 1535722594, 'Objeto temporário spawnado. (-4000)', '', 0),
(2544, 'Vincent_Henderson', 1, '127.0.0.1', 1535727366, 'Login (in-game)', '', 0),
(2545, 'Vincent_Henderson', 1, '127.0.0.1', 1535727799, 'Login (in-game)', '', 0),
(2546, 'Vincent_Henderson', 1, '127.0.0.1', 1535729181, 'Login (in-game)', '', 0),
(2547, 'Vincent_Henderson', 1, '127.0.0.1', 1535729301, 'Login (in-game)', '', 0),
(2548, 'Vincent_Henderson', 1, '127.0.0.1', 1535729400, 'Login (in-game)', '', 0),
(2549, 'Vincent_Henderson', 1, '127.0.0.1', 1535729486, 'Login (in-game)', '', 0),
(2550, 'Vincent_Henderson', 1, '127.0.0.1', 1535729649, 'Login (in-game)', '', 0),
(2551, 'Vincent_Henderson', 1, '127.0.0.1', 1535730103, 'Skin definida para 20000', 'Vincent_Henderson', 1),
(2552, 'Vincent_Henderson', 1, '127.0.0.1', 1535730107, 'Skin definida para 20001', 'Vincent_Henderson', 1),
(2553, 'Vincent_Henderson', 1, '127.0.0.1', 1535730108, 'Skin definida para 20002', 'Vincent_Henderson', 1),
(2554, 'Vincent_Henderson', 1, '127.0.0.1', 1535730110, 'Skin definida para 20003', 'Vincent_Henderson', 1),
(2555, 'Vincent_Henderson', 1, '127.0.0.1', 1535730121, 'Skin definida para 20001', 'Vincent_Henderson', 1),
(2556, 'Vincent_Henderson', 1, '127.0.0.1', 1535730125, 'Skin definida para 20002', 'Vincent_Henderson', 1),
(2557, 'Vincent_Henderson', 1, '127.0.0.1', 1535730126, 'Skin definida para 20003', 'Vincent_Henderson', 1),
(2558, 'Vincent_Henderson', 1, '127.0.0.1', 1535730128, 'Skin definida para 20004', 'Vincent_Henderson', 1),
(2559, 'Vincent_Henderson', 1, '127.0.0.1', 1535730130, 'Skin definida para 20005', 'Vincent_Henderson', 1),
(2560, 'Vincent_Henderson', 1, '127.0.0.1', 1535730132, 'Skin definida para 20006', 'Vincent_Henderson', 1),
(2561, 'Vincent_Henderson', 1, '127.0.0.1', 1535730163, 'Skin definida para 20007', 'Vincent_Henderson', 1),
(2562, 'Vincent_Henderson', 1, '127.0.0.1', 1535730180, 'Skin definida para 20008', 'Vincent_Henderson', 1),
(2563, 'Vincent_Henderson', 1, '127.0.0.1', 1535730184, 'Skin definida para 20009', 'Vincent_Henderson', 1),
(2564, 'Vincent_Henderson', 1, '127.0.0.1', 1535730202, 'Skin definida para 20010', 'Vincent_Henderson', 1),
(2565, 'Vincent_Henderson', 1, '127.0.0.1', 1535730212, 'Skin definida para 20011', 'Vincent_Henderson', 1),
(2566, 'Vincent_Henderson', 1, '127.0.0.1', 1535730230, 'Skin definida para 20012', 'Vincent_Henderson', 1),
(2567, 'Vincent_Henderson', 1, '127.0.0.1', 1535730245, 'Skin definida para 20013', 'Vincent_Henderson', 1),
(2568, 'Vincent_Henderson', 1, '127.0.0.1', 1535730263, 'Skin definida para 20014', 'Vincent_Henderson', 1),
(2569, 'Vincent_Henderson', 1, '127.0.0.1', 1535730265, 'Skin definida para 20015', 'Vincent_Henderson', 1),
(2570, 'Vincent_Henderson', 1, '127.0.0.1', 1535730267, 'Skin definida para 20016', 'Vincent_Henderson', 1),
(2571, 'Vincent_Henderson', 1, '127.0.0.1', 1535730278, 'Skin definida para 20017', 'Vincent_Henderson', 1),
(2572, 'Vincent_Henderson', 1, '127.0.0.1', 1535730280, 'Skin definida para 20018', 'Vincent_Henderson', 1),
(2573, 'Vincent_Henderson', 1, '127.0.0.1', 1535730282, 'Skin definida para 20019', 'Vincent_Henderson', 1),
(2574, 'Vincent_Henderson', 1, '127.0.0.1', 1535731204, 'Login (in-game)', '', 0),
(2575, 'Vincent_Henderson', 1, '127.0.0.1', 1535732959, 'Login (in-game)', '', 0),
(2576, 'Vincent_Henderson', 1, '127.0.0.1', 1535733624, 'Login (in-game)', '', 0),
(2577, 'Vincent_Henderson', 1, '127.0.0.1', 1535734036, 'Imediato GMX', '', 0),
(2578, 'Vincent_Henderson', 1, '127.0.0.1', 1535734059, 'Login (in-game)', '', 0),
(2579, 'Vincent_Henderson', 1, '127.0.0.1', 1535737308, 'Login (in-game)', '', 0),
(2580, 'Vincent_Henderson', 1, '127.0.0.1', 1535738558, 'Login (in-game)', '', 0),
(2581, 'Vincent_Henderson', 1, '127.0.0.1', 1535739762, 'Login (in-game)', '', 0),
(2582, 'Vincent_Henderson', 1, '127.0.0.1', 1535740337, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2583, 'Vincent_Henderson', 1, '127.0.0.1', 1535740338, 'Imediato GMX', '', 0),
(2584, 'Vincent_Henderson', 1, '127.0.0.1', 1535740363, 'Login (in-game)', '', 0),
(2585, 'Zac_Deutch', 2, '189.28.231.70', 1535654529, 'Login (in-game)', '', 0),
(2586, 'Zac_Deutch', 2, '189.28.231.70', 1535654763, 'Admin duty on', '', 0),
(2587, 'Zac_Deutch', 2, '189.28.231.70', 1535654766, 'Teleportado para Palomino Creek', 'Zac_Deutch', 2),
(2588, 'Zac_Deutch', 2, '189.28.231.70', 1535654770, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(2589, 'Zac_Deutch', 2, '189.28.231.70', 1535654840, 'Veiculo spawnado: Infernus (ID 211, Model 411)', '', 0),
(2590, 'Vincent_Henderson', 1, '164.163.207.107', 1535655004, 'Login (in-game)', '', 0),
(2591, 'Vincent_Henderson', 1, '164.163.207.107', 1535655041, 'Jogador teleportado', 'Zac_Deutch', 2),
(2592, 'Vincent_Henderson', 1, '164.163.207.107', 1535655046, 'Jogador teleportado', 'Zac_Deutch', 2),
(2593, 'Vincent_Henderson', 1, '164.163.207.107', 1535655052, 'Spectate', 'Zac_Deutch', 2),
(2594, 'Vincent_Henderson', 1, '164.163.207.107', 1535655084, 'Admin duty on', '', 0),
(2595, 'Vincent_Henderson', 1, '164.163.207.107', 1535655137, 'Spectate', 'Zac_Deutch', 2),
(2596, 'Vincent_Henderson', 1, '164.163.207.107', 1535655139, 'Spectate', 'Zac_Deutch', 2),
(2597, 'Vincent_Henderson', 1, '164.163.207.107', 1535655140, 'Spectate', 'Zac_Deutch', 2),
(2598, 'Vincent_Henderson', 1, '164.163.207.107', 1535655301, 'Login (in-game)', '', 0),
(2599, 'Vincent_Henderson', 1, '164.163.207.107', 1535655322, 'Jogador teleportado', 'Zac_Deutch', 2),
(2600, 'Zac_Deutch', 2, '189.28.231.70', 1535655809, 'Veiculo destruido: Infernus (ID 211)', '', 0),
(2601, 'Zac_Deutch', 2, '189.28.231.70', 1535656477, 'Veiculo spawnado: Sultan (ID 211, Model 560)', '', 0),
(2602, 'Zac_Deutch', 2, '189.28.231.70', 1535656512, 'Login (in-game)', '', 0),
(2603, 'Zac_Deutch', 2, '189.28.231.70', 1535656588, 'Veiculo spawnado: Landstalker (ID 212, Model 400)', '', 0),
(2604, 'Zac_Deutch', 2, '189.28.231.70', 1535656608, 'Veiculo destruido: Landstalker (ID 212)', '', 0),
(2605, 'Zac_Deutch', 2, '189.28.231.70', 1535656614, 'Veiculo spawnado: Buffalo (ID 212, Model 402)', '', 0),
(2606, 'Zac_Deutch', 2, '189.28.231.70', 1535656624, 'Veiculo spawnado: Buffalo (ID 213, Model 402)', '', 0),
(2607, 'Zac_Deutch', 2, '189.28.231.70', 1535656628, 'Veiculo destruido: Buffalo (ID 213)', '', 0),
(2608, 'Zac_Deutch', 2, '189.28.231.70', 1535656638, 'Veiculo destruido: Buffalo (ID 212)', '', 0),
(2609, 'Vincent_Henderson', 1, '164.163.207.107', 1535656649, 'Login (in-game)', '', 0),
(2610, 'Zac_Deutch', 2, '189.28.231.70', 1535656962, 'Jogador puxado', 'Vincent_Henderson', 1),
(2611, 'Zac_Deutch', 2, '189.28.231.70', 1535657140, 'Veiculo spawnado: Sultan (ID 213, Model 560)', '', 0),
(2612, 'Zac_Deutch', 2, '189.28.231.70', 1535657796, 'Teleportado para Dillimore', 'Zac_Deutch', 2),
(2613, 'Zac_Deutch', 2, '189.28.231.70', 1535657802, 'Teleportado para Palomino Creek', 'Zac_Deutch', 2),
(2614, 'Zac_Deutch', 2, '189.28.231.70', 1535657928, 'Veiculo spawnado: Tow Truck (ID 214, Model 525)', '', 0),
(2615, 'Zac_Deutch', 2, '189.28.231.70', 1535657999, 'Teleportado para Blueberry', 'Zac_Deutch', 2),
(2616, 'Zac_Deutch', 2, '189.28.231.70', 1535658119, 'Teleportado para Blueberry', 'Zac_Deutch', 2),
(2617, 'Vincent_Henderson', 1, '127.0.0.1', 1535745097, 'Login (in-game)', '', 0),
(2618, 'Zac_Deutch', 2, '189.28.231.70', 1535659476, 'Teleportado para Montgomery', 'Zac_Deutch', 2),
(2619, 'Vincent_Henderson', 1, '127.0.0.1', 1535746004, 'Set faction to 0', 'Vincent_Henderson', 1),
(2620, 'Vincent_Henderson', 1, '127.0.0.1', 1535746402, 'Reloaded todas as empresas do banco de dados', '', 0),
(2621, 'Vincent_Henderson', 1, '127.0.0.1', 1535746596, 'Reloaded todas as empresas do banco de dados', '', 0),
(2622, 'Vincent_Henderson', 1, '127.0.0.1', 1535748920, 'Reloaded todas as empresas do banco de dados', '', 0),
(2623, 'Vincent_Henderson', 1, '127.0.0.1', 1535748996, 'Reloaded todas as empresas do banco de dados', '', 0),
(2624, 'Vincent_Henderson', 1, '127.0.0.1', 1535749070, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(2625, 'Vincent_Henderson', 1, '127.0.0.1', 1535749094, 'Veiculo spawnado: Sandking (ID 211, Model 495)', '', 0),
(2626, 'Vincent_Henderson', 1, '127.0.0.1', 1535749230, 'Reloaded todas as empresas do banco de dados', '', 0),
(2627, 'Vincent_Henderson', 1, '127.0.0.1', 1535749243, 'Empresa editada #40 preço para $999999', '', 0),
(2628, 'Vincent_Henderson', 1, '127.0.0.1', 1535749255, 'Empresa editada #40 payday agora é $999999', '', 0),
(2629, 'Vincent_Henderson', 1, '127.0.0.1', 1535749321, 'Set faction to 1', 'Vincent_Henderson', 1),
(2630, 'Vincent_Henderson', 1, '127.0.0.1', 1535749420, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(2631, 'Vincent_Henderson', 1, '127.0.0.1', 1535749531, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(2632, 'Vincent_Henderson', 1, '127.0.0.1', 1535749825, 'Teleportado para Fisher\'s Lagoon', 'Vincent_Henderson', 1),
(2633, 'Vincent_Henderson', 1, '164.163.207.107', 1535753051, 'Login (in-game)', '', 0),
(2634, 'Vincent_Henderson', 1, '164.163.207.107', 1535753069, 'Set faction to 0', 'Vincent_Henderson', 1),
(2635, 'Rowan_Ballard', 4, '186.225.187.250', 1535753333, 'Login (in-game)', '', 0),
(2636, 'Vincent_Henderson', 1, '164.163.207.107', 1535753435, 'Login (in-game)', '', 0),
(2637, 'Rowan_Ballard', 4, '186.225.187.250', 1535753525, 'Skin definida para 261', 'Rowan_Ballard', 4),
(2638, 'Vincent_Henderson', 1, '164.163.207.107', 1535753910, 'Login (in-game)', '', 0),
(2639, 'Rowan_Ballard', 4, '186.225.187.250', 1535754005, 'Ativado global OOC', '', 0),
(2640, 'Rowan_Ballard', 4, '186.225.187.250', 1535754030, 'Desativado global OOC', '', 0),
(2641, 'Rowan_Ballard', 4, '186.225.187.250', 1535754113, 'Jogador teleportado', 'Isaiah_Dillimore', 52),
(2642, 'Rowan_Ballard', 4, '186.225.187.250', 1535754116, 'Jogador teleportado', 'Isaiah_Dillimore', 52),
(2643, 'Rowan_Ballard', 4, '186.225.187.250', 1535754123, 'Admin duty on', '', 0),
(2644, 'Enzo_Williams', 18, '186.225.187.134', 1535754523, 'Inicia sessão de assistência', 'Enzo_Avilov', 73),
(2645, 'Vincent_Henderson', 1, '164.163.207.107', 1535754645, 'Login (in-game)', '', 0),
(2646, 'Vincent_Henderson', 1, '164.163.207.107', 1535754668, 'Defina saúde para 100', 'Vincent_Henderson', 1),
(2647, 'Vincent_Henderson', 1, '164.163.207.107', 1535754672, 'Spectate', 'Enzo_Avilov', 73),
(2648, 'Vincent_Henderson', 1, '164.163.207.107', 1535754710, 'Inicia sessão de assistência', 'Isaiah_Dillimore', 52),
(2649, 'Vincent_Henderson', 1, '164.163.207.107', 1535754833, 'Veiculo spawnado: Sandking (ID 220, Model 495)', '', 0),
(2650, 'Vincent_Henderson', 1, '164.163.207.107', 1535754874, 'Admin duty on', '', 0),
(2651, 'Vincent_Henderson', 1, '164.163.207.107', 1535754887, 'Veiculo destruido: Sandking (ID 220)', '', 0),
(2652, 'Vincent_Henderson', 1, '164.163.207.107', 1535754926, 'Inicia sessão de assistência', 'Frank_Spanshaw', 25),
(2653, 'Rowan_Ballard', 4, '186.225.187.250', 1535755037, 'Inicia sessão de assistência', 'Enzo_Avilov', 73),
(2654, 'Rowan_Ballard', 4, '186.225.187.250', 1535755042, 'Spectate', 'Enzo_Avilov', 73),
(2655, 'Rowan_Ballard', 4, '186.225.187.250', 1535755048, 'Spectate', 'Enzo_Avilov', 73),
(2656, 'Vincent_Henderson', 1, '164.163.207.107', 1535755055, 'Inicia sessão de assistência', 'Robert_Harris', 34),
(2657, 'Rowan_Ballard', 4, '186.225.187.250', 1535755101, 'Spectate', 'Norman_Greensdale', 33),
(2658, 'Vincent_Henderson', 1, '164.163.207.107', 1535755141, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2659, 'Rowan_Ballard', 4, '186.225.187.250', 1535755228, 'Spectate', 'Enzo_Avilov', 73),
(2660, 'Rowan_Ballard', 4, '186.225.187.250', 1535755231, 'Spectate', 'Enzo_Avilov', 73),
(2661, 'Vincent_Henderson', 1, '164.163.207.107', 1535755234, 'Inicia sessão de assistência', 'Norman_Greensdale', 33),
(2662, 'Vincent_Henderson', 1, '164.163.207.107', 1535755236, 'Spectate', 'Norman_Greensdale', 33),
(2663, 'Vincent_Henderson', 1, '164.163.207.107', 1535755249, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2664, 'Vincent_Henderson', 1, '164.163.207.107', 1535755257, 'Jogador teleportado', 'Norman_Greensdale', 33),
(2665, 'Vincent_Henderson', 1, '164.163.207.107', 1535755260, 'Jogador teleportado', 'Norman_Greensdale', 33),
(2666, 'Rowan_Ballard', 4, '186.225.187.250', 1535755263, 'Spectate', 'Isaiah_Dillimore', 52),
(2667, 'Vincent_Henderson', 1, '164.163.207.107', 1535755265, 'Jogador teleportado', 'Norman_Greensdale', 33),
(2668, 'Rowan_Ballard', 4, '186.225.187.250', 1535755267, 'Spectate', 'Isaiah_Dillimore', 52),
(2669, 'Enzo_Williams', 18, '186.225.187.134', 1535755279, 'Inicia sessão de assistência', 'Isaiah_Dillimore', 52),
(2670, 'Vincent_Henderson', 1, '164.163.207.107', 1535755300, 'Defina saúde para 100', 'Norman_Greensdale', 33),
(2671, 'Vincent_Henderson', 1, '164.163.207.107', 1535755335, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2672, 'Rowan_Ballard', 4, '186.225.187.250', 1535755360, 'Spectate', 'Enzo_Avilov', 73),
(2673, 'Rowan_Ballard', 4, '186.225.187.250', 1535755369, 'Inicia sessão de assistência', 'Enzo_Avilov', 73),
(2674, 'Rowan_Ballard', 4, '186.225.187.250', 1535755379, 'Spectate', 'Enzo_Avilov', 73),
(2675, 'Vincent_Henderson', 1, '164.163.207.107', 1535755477, 'Jogador teleportado', 'Yvone_Ebersbach', 44),
(2676, 'Rowan_Ballard', 4, '186.225.187.250', 1535755537, 'Mudou o tempo para 1', '', 0),
(2677, 'Rowan_Ballard', 4, '186.225.187.250', 1535755555, 'Mudou o tempo para 10', '', 0),
(2678, 'Rowan_Ballard', 4, '186.225.187.250', 1535755659, 'Spectate', 'Yvone_Ebersbach', 44),
(2679, 'Rowan_Ballard', 4, '186.225.187.250', 1535755662, 'Spectate', 'Yvone_Ebersbach', 44),
(2680, 'Vincent_Henderson', 1, '164.163.207.107', 1535755710, 'Jogador teleportado', 'Edward_Torres', 40),
(2681, 'Vincent_Henderson', 1, '164.163.207.107', 1535755755, 'Jogador puxado', 'Morgan_Eisenhower', 22),
(2682, 'Lennaert_Schuurman', 16, '179.106.74.124', 1535755854, 'Login (in-game)', '', 0),
(2683, 'Rowan_Ballard', 4, '186.225.187.250', 1535755898, 'Login (in-game)', '', 0),
(2684, 'Vincent_Henderson', 1, '164.163.207.107', 1535755982, 'Inicia sessão de assistência', 'Isaiah_Dillimore', 52),
(2685, 'Rowan_Ballard', 4, '186.225.187.250', 1535756106, 'Admin duty on', '', 0),
(2686, 'Rowan_Ballard', 4, '186.225.187.250', 1535756109, 'Spectate', 'Joseph_Deere', 53),
(2687, 'Enzo_Williams', 18, '186.225.187.134', 1535756140, 'Inicia sessão de assistência', 'Robert_Harris', 34),
(2688, 'Vincent_Henderson', 1, '164.163.207.107', 1535756171, 'Jogador teleportado', 'Kirk_Means', 68),
(2689, 'Vincent_Henderson', 1, '164.163.207.107', 1535756188, 'Jogador teleportado', 'Frank_Spanshaw', 25),
(2690, 'Vincent_Henderson', 1, '164.163.207.107', 1535756196, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2691, 'Vincent_Henderson', 1, '164.163.207.107', 1535756220, 'Admin duty off', '', 0),
(2692, 'Rowan_Ballard', 4, '186.225.187.250', 1535756230, 'Spectate', 'Joshua_Sanders', 39),
(2693, 'Enzo_Williams', 18, '186.225.187.134', 1535756483, 'Inicia sessão de assistência', 'Jerry_Catter', 63),
(2694, 'Enzo_Williams', 18, '186.225.187.134', 1535756555, 'Inicia sessão de assistência', 'Frank_Spanshaw', 25),
(2695, 'Rowan_Ballard', 4, '186.225.187.250', 1535756565, 'Admin duty off', '', 0),
(2696, 'Rowan_Ballard', 4, '186.225.187.250', 1535756629, 'Jogador teleportado', 'Angus_Riche', 42),
(2697, 'Rowan_Ballard', 4, '186.225.187.250', 1535756671, 'Spectate', 'Angus_Riche', 42),
(2698, 'Rowan_Ballard', 4, '186.225.187.250', 1535756701, 'Inicia sessão de assistência', 'Angus_Riche', 42),
(2699, 'Rowan_Ballard', 4, '186.225.187.250', 1535756747, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(2700, 'Rowan_Ballard', 4, '186.225.187.250', 1535756892, 'Login (in-game)', '', 0),
(2701, 'Rowan_Ballard', 4, '186.225.187.250', 1535756959, 'Login (in-game)', '', 0),
(2702, 'Rowan_Ballard', 4, '186.225.187.250', 1535757065, 'Login (in-game)', '', 0),
(2703, 'Rowan_Ballard', 4, '186.225.187.250', 1535757344, 'Login (in-game)', '', 0),
(2704, 'Rowan_Ballard', 4, '186.225.187.250', 1535757428, 'Login (in-game)', '', 0),
(2705, 'Rowan_Ballard', 4, '186.225.187.250', 1535757516, 'Admin duty on', '', 0),
(2706, 'Rowan_Ballard', 4, '186.225.187.250', 1535757618, 'Skin definida para 216', 'Rowan_Ballard', 4),
(2707, 'Rowan_Ballard', 4, '186.225.187.250', 1535757630, 'Skin definida para 217', 'Rowan_Ballard', 4),
(2708, 'Rowan_Ballard', 4, '186.225.187.250', 1535757632, 'Skin definida para 218', 'Rowan_Ballard', 4),
(2709, 'Rowan_Ballard', 4, '186.225.187.250', 1535757635, 'Skin definida para 218', 'Rowan_Ballard', 4),
(2710, 'Rowan_Ballard', 4, '186.225.187.250', 1535757637, 'Skin definida para 219', 'Rowan_Ballard', 4),
(2711, 'Rowan_Ballard', 4, '186.225.187.250', 1535757641, 'Skin definida para 116', 'Rowan_Ballard', 4),
(2712, 'Rowan_Ballard', 4, '186.225.187.250', 1535757643, 'Skin definida para 117', 'Rowan_Ballard', 4),
(2713, 'Rowan_Ballard', 4, '186.225.187.250', 1535757648, 'Skin definida para 20002', 'Rowan_Ballard', 4),
(2714, 'Rowan_Ballard', 4, '186.225.187.250', 1535757649, 'Skin definida para 20003', 'Rowan_Ballard', 4),
(2715, 'Rowan_Ballard', 4, '186.225.187.250', 1535757653, 'Skin definida para 20004', 'Rowan_Ballard', 4),
(2716, 'Vincent_Henderson', 1, '164.163.207.107', 1535757655, 'Login (in-game)', '', 0),
(2717, 'Rowan_Ballard', 4, '186.225.187.250', 1535757669, 'Inicia sessão de assistência', 'Angus_Riche', 42),
(2718, 'Rowan_Ballard', 4, '186.225.187.250', 1535757680, 'Spectate', 'Angus_Riche', 42),
(2719, 'Vincent_Henderson', 1, '164.163.207.107', 1535757687, 'Teleportado para Dillimore', 'Vincent_Henderson', 1),
(2720, 'Rowan_Ballard', 4, '186.225.187.250', 1535757825, 'Spectate', 'Morgan_Eisenhower', 22),
(2721, 'Rowan_Ballard', 4, '186.225.187.250', 1535757826, 'Spectate', 'Robert_Harris', 34),
(2722, 'Rowan_Ballard', 4, '186.225.187.250', 1535757831, 'Spectate', 'Robert_Harris', 34),
(2723, 'Rowan_Ballard', 4, '186.225.187.250', 1535757843, 'Inicia sessão de assistência', 'Jerry_Catter', 63),
(2724, 'Rowan_Ballard', 4, '186.225.187.250', 1535757846, 'Spectate', 'Jerry_Catter', 63),
(2725, 'Rowan_Ballard', 4, '186.225.187.250', 1535757873, 'Jogador teleportado', 'Jerry_Catter', 63),
(2726, 'Vincent_Henderson', 1, '164.163.207.107', 1535758364, 'Inicia sessão de assistência', 'Robert_Harris', 34),
(2727, 'Rowan_Ballard', 4, '186.225.187.250', 1535758644, 'Spectate', 'Angus_Riche', 42),
(2728, 'Rowan_Ballard', 4, '186.225.187.250', 1535758657, 'Spectate', 'Dmitri_Scalovisck', 79),
(2729, 'Rowan_Ballard', 4, '186.225.187.250', 1535758691, 'Jogador teleportado', 'Dmitri_Scalovisck', 79),
(2730, 'Rowan_Ballard', 4, '186.225.187.250', 1535758728, 'Spectate', 'Dante_Bellandi', 84),
(2731, 'Rowan_Ballard', 4, '186.225.187.250', 1535758731, 'Spectate', 'Dante_Bellandi', 84),
(2732, 'Rowan_Ballard', 4, '186.225.187.250', 1535758744, 'Inicia sessão de assistência', 'Bruce_Crawford', 36),
(2733, 'Rowan_Ballard', 4, '186.225.187.250', 1535758748, 'Spectate', 'Bruce_Crawford', 36),
(2734, 'Rowan_Ballard', 4, '186.225.187.250', 1535758750, 'Spectate', 'Bruce_Crawford', 36),
(2735, 'Rowan_Ballard', 4, '186.225.187.250', 1535758801, 'Inicia sessão de assistência', 'Dmitri_Scalovisck', 79),
(2736, 'Rowan_Ballard', 4, '186.225.187.250', 1535758803, 'Spectate', 'Dmitri_Scalovisck', 79),
(2737, 'Rowan_Ballard', 4, '186.225.187.250', 1535758933, 'Spectate', 'Haziel_Fagundez', 27),
(2738, 'Rowan_Ballard', 4, '186.225.187.250', 1535758938, 'Spectate', 'Haziel_Fagundez', 27),
(2739, 'Rowan_Ballard', 4, '186.225.187.250', 1535759035, '[/puniroff] Admin jailed por 10 min \'Bug.\'', 'Eric_Lynn', 56),
(2740, 'Rowan_Ballard', 4, '186.225.187.250', 1535759151, 'Spectate', 'Haziel_Fagundez', 27),
(2741, 'Vincent_Henderson', 1, '164.163.207.107', 1535759154, 'Spectate', 'Anthony_Emanuel', 54),
(2742, 'Rowan_Ballard', 4, '186.225.187.250', 1535759405, 'Admin duty off', '', 0),
(2743, 'Rowan_Ballard', 4, '186.225.187.250', 1535759479, 'Spectate', 'Eric_Lynn', 56),
(2744, 'Rowan_Ballard', 4, '186.225.187.250', 1535759481, 'Spectate', 'Eric_Lynn', 56),
(2745, 'Rowan_Ballard', 4, '186.225.187.250', 1535759586, 'Admin duty on', '', 0),
(2746, 'Rowan_Ballard', 4, '186.225.187.250', 1535759761, 'Jogador teleportado', 'Dante_Bellandi', 84),
(2747, 'Rowan_Ballard', 4, '186.225.187.250', 1535760004, 'Spectate', 'Dmitri_Scalovisck', 79),
(2748, 'Rowan_Ballard', 4, '186.225.187.250', 1535760006, 'Spectate', 'Dmitri_Scalovisck', 79),
(2749, 'Rowan_Ballard', 4, '186.225.187.250', 1535760035, 'Spectate', 'Jerry_Catter', 63),
(2750, 'Rowan_Ballard', 4, '186.225.187.250', 1535760251, 'Login (in-game)', '', 0),
(2751, 'Rowan_Ballard', 4, '186.225.187.250', 1535760265, 'Admin duty on', '', 0),
(2752, 'Rowan_Ballard', 4, '186.225.187.250', 1535760747, 'Inicia sessão de assistência', 'Jerry_Catter', 63),
(2753, 'Rowan_Ballard', 4, '186.225.187.250', 1535760755, 'Jogador teleportado', 'Jerry_Catter', 63),
(2754, 'Rowan_Ballard', 4, '186.225.187.250', 1535760773, 'Spectate', 'Jerry_Catter', 63),
(2755, 'Rowan_Ballard', 4, '186.225.187.250', 1535760778, 'Jogador teleportado', 'Jerry_Catter', 63),
(2756, 'Rowan_Ballard', 4, '186.225.187.250', 1535760875, 'Spectate', 'Jerry_Catter', 63),
(2757, 'Rowan_Ballard', 4, '186.225.187.250', 1535761106, 'Jogador teleportado', 'Angus_Riche', 42),
(2758, 'Rowan_Ballard', 4, '186.225.187.250', 1535761191, 'Jogador puxado', 'Angus_Riche', 42),
(2759, 'Rowan_Ballard', 4, '186.225.187.250', 1535761839, 'Unfroze player', 'Angus_Riche', 42),
(2760, 'Rowan_Ballard', 4, '186.225.187.250', 1535762102, 'Spectate', 'Angus_Riche', 42),
(2761, 'Rowan_Ballard', 4, '186.225.187.250', 1535762116, 'Spectate', 'Dante_Bellandi', 84),
(2762, 'Rowan_Ballard', 4, '186.225.187.250', 1535762126, 'Spectate', 'Mathews_Cezatte', 88),
(2763, 'Rowan_Ballard', 4, '186.225.187.250', 1535762128, 'Spectate', 'Mathews_Cezatte', 88),
(2764, 'Rowan_Ballard', 4, '186.225.187.250', 1535762141, 'Spectate', 'Angus_Riche', 42),
(2765, 'Rowan_Ballard', 4, '186.225.187.250', 1535762147, 'Spectate', 'Angus_Riche', 42),
(2766, 'Rowan_Ballard', 4, '186.225.187.250', 1535762153, 'Teleportado para Palomino Creek', 'Rowan_Ballard', 4),
(2767, 'Rowan_Ballard', 4, '186.225.187.250', 1535762381, 'Login (in-game)', '', 0),
(2768, 'Rowan_Ballard', 4, '186.225.187.250', 1535762631, 'Inicia sessão de assistência', 'Angus_Riche', 42),
(2769, 'Rowan_Ballard', 4, '186.225.187.250', 1535762653, 'Admin duty on', '', 0),
(2770, 'Rowan_Ballard', 4, '186.225.187.250', 1535762764, 'Spectate', 'Angus_Riche', 42),
(2771, 'Rowan_Ballard', 4, '186.225.187.250', 1535762773, 'Spectate', 'Angus_Riche', 42),
(2772, 'Rowan_Ballard', 4, '186.225.187.250', 1535762788, 'Spectate', 'Angus_Riche', 42),
(2773, 'Rowan_Ballard', 4, '186.225.187.250', 1535762802, 'Spectate', 'Mathews_Cezatte', 88),
(2774, 'Rowan_Ballard', 4, '186.225.187.250', 1535762804, 'Spectate', 'Mathews_Cezatte', 88),
(2775, 'Rowan_Ballard', 4, '186.225.187.250', 1535762813, 'Spectate', 'Vincent_Wilhelm', 50),
(2776, 'Rowan_Ballard', 4, '186.225.187.250', 1535763403, 'Spectate', 'Kevin_Worley', 81),
(2777, 'Rowan_Ballard', 4, '186.225.187.250', 1535763408, 'Spectate', 'Kevin_Worley', 81),
(2778, 'Rowan_Ballard', 4, '186.225.187.250', 1535763443, 'Teleportado para Dillimore', 'Rowan_Ballard', 4),
(2779, 'Rowan_Ballard', 4, '186.225.187.250', 1535763531, 'Spectate', 'Dylan_Velasquez', 31),
(2780, 'Rowan_Ballard', 4, '186.225.187.250', 1535763542, 'Inicia sessão de assistência', 'Dylan_Velasquez', 31),
(2781, 'Rowan_Ballard', 4, '186.225.187.250', 1535763559, 'Spectate', 'Dylan_Velasquez', 31),
(2782, 'Rowan_Ballard', 4, '186.225.187.250', 1535763574, 'Spectate', 'Dylan_Velasquez', 31),
(2783, 'Rowan_Ballard', 4, '186.225.187.250', 1535763610, 'Spectate', 'Dylan_Velasquez', 31),
(2784, 'Rowan_Ballard', 4, '186.225.187.250', 1535763670, 'Spectate', 'Dylan_Velasquez', 31),
(2785, 'Rowan_Ballard', 4, '186.225.187.250', 1535763718, 'Spectate', 'Dylan_Velasquez', 31),
(2786, 'Rowan_Ballard', 4, '186.225.187.250', 1535763823, 'Inicia sessão de assistência', 'Angus_Riche', 42),
(2787, 'Rowan_Ballard', 4, '186.225.187.250', 1535763877, 'Spectate', 'Angus_Riche', 42),
(2788, 'Rowan_Ballard', 4, '186.225.187.250', 1535764240, 'Spectate', 'Mathews_Cezatte', 88),
(2789, 'Rowan_Ballard', 4, '186.225.187.250', 1535764243, 'Spectate', 'Mathews_Cezatte', 88),
(2790, 'Rowan_Ballard', 4, '186.225.187.250', 1535764303, 'Spectate', 'Vincent_Wilhelm', 50),
(2791, 'Rowan_Ballard', 4, '186.225.187.250', 1535764307, 'Spectate', 'Vincent_Wilhelm', 50),
(2792, 'Rowan_Ballard', 4, '186.225.187.250', 1535764318, 'Spectate', 'Dylan_Velasquez', 31),
(2793, 'Rowan_Ballard', 4, '186.225.187.250', 1535764321, 'Spectate', 'Dylan_Velasquez', 31),
(2794, 'Rowan_Ballard', 4, '186.225.187.250', 1535764328, 'Spectate', 'Bruce_Crawford', 36),
(2795, 'Rowan_Ballard', 4, '186.225.187.250', 1535764331, 'Spectate', 'Bruce_Crawford', 36),
(2796, 'Rowan_Ballard', 4, '186.225.187.250', 1535764340, 'Spectate', 'Angus_Riche', 42),
(2797, 'Rowan_Ballard', 4, '186.225.187.250', 1535764401, 'Spectate', 'Angus_Riche', 42),
(2798, 'Rowan_Ballard', 4, '186.225.187.250', 1535764405, 'Spectate', 'Bruce_Crawford', 36),
(2799, 'Rowan_Ballard', 4, '186.225.187.250', 1535764411, 'Spectate', 'Dylan_Velasquez', 31),
(2800, 'Rowan_Ballard', 4, '186.225.187.250', 1535764412, 'Spectate', 'Dylan_Velasquez', 31),
(2801, 'Vincent_Henderson', 1, '164.163.207.107', 1535764422, 'Login (in-game)', '', 0),
(2802, 'Vincent_Henderson', 1, '164.163.207.107', 1535764447, 'GMX agendado em 5 min', '', 0),
(2803, 'Rowan_Ballard', 4, '186.225.187.250', 1535764488, 'Inicia sessão de assistência', 'Mathews_Cezatte', 88),
(2804, 'Rowan_Ballard', 4, '186.225.187.250', 1535764498, 'Spectate', 'Mathews_Cezatte', 88),
(2805, 'Rowan_Ballard', 4, '186.225.187.250', 1535764533, 'Spectate', 'Mathews_Cezatte', 88),
(2806, 'Vincent_Henderson', 1, '164.163.207.107', 1535758229, 'Login (in-game)', '', 0),
(2807, 'Vincent_Henderson', 1, '164.163.207.107', 1535758322, 'Veiculo spawnado: Sandking (ID 209, Model 495)', '', 0),
(2808, 'Vincent_Henderson', 1, '164.163.207.107', 1535759095, 'Set faction to 1', 'Vincent_Henderson', 1),
(2809, 'Vincent_Henderson', 1, '164.163.207.107', 1535759384, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2810, 'Vincent_Henderson', 1, '164.163.207.107', 1535759396, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2811, 'Vincent_Henderson', 1, '164.163.207.107', 1535760317, 'Imediato GMX', '', 0),
(2812, 'Vincent_Henderson', 1, '164.163.207.107', 1535760339, 'Login (in-game)', '', 0),
(2813, 'Vincent_Henderson', 1, '164.163.207.107', 1535760866, 'Imediato GMX', '', 0),
(2814, 'Vincent_Henderson', 1, '164.163.207.107', 1535760888, 'Login (in-game)', '', 0),
(2815, 'Vincent_Henderson', 1, '164.163.207.107', 1535761049, 'Login (in-game)', '', 0),
(2816, 'Vincent_Henderson', 1, '164.163.207.107', 1535761254, 'Adicionado na Help Team', 'Morgan_Eisenhower', 22),
(2817, 'Morgan_Eisenhower', 22, '191.181.74.7', 1535761356, 'Inicia sessão de assistência', 'Vincent_Henderson', 1),
(2818, 'Vincent_Henderson', 1, '164.163.207.107', 1535761605, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2819, 'Vincent_Henderson', 1, '164.163.207.107', 1535761697, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2820, 'Vincent_Henderson', 1, '164.163.207.107', 1535761777, 'Jogador teleportado', 'Morgan_Eisenhower', 22),
(2821, 'Vincent_Henderson', 1, '164.163.207.107', 1535761799, 'Login (in-game)', '', 0),
(2822, 'Vincent_Henderson', 1, '164.163.207.107', 1535762213, 'Login (in-game)', '', 0),
(2823, 'Vincent_Henderson', 1, '164.163.207.107', 1535764028, 'Login (in-game)', '', 0),
(2824, 'Vincent_Henderson', 1, '164.163.207.107', 1535764476, 'Jogador puxado', 'Morgan_Eisenhower', 22),
(2825, 'Vincent_Henderson', 1, '164.163.207.107', 1535764480, 'Jogador puxado', 'Aleksey_Kuznetsov', 89),
(2826, 'Vincent_Henderson', 1, '164.163.207.107', 1535765489, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(2827, 'Vincent_Henderson', 1, '164.163.207.107', 1535765526, 'Jogador puxado', 'Morgan_Eisenhower', 22),
(2828, 'Vincent_Henderson', 1, '164.163.207.107', 1535767001, 'Login (in-game)', '', 0),
(2829, 'Vincent_Henderson', 1, '164.163.207.107', 1535769055, 'Login (in-game)', '', 0),
(2830, 'Vincent_Henderson', 1, '164.163.207.107', 1535769251, 'Jogador puxado', 'Morgan_Eisenhower', 22),
(2831, 'Vincent_Henderson', 1, '127.0.0.1', 1535857475, 'Login (in-game)', '', 0),
(2832, 'Vincent_Henderson', 1, '127.0.0.1', 1535859644, 'Login (in-game)', '', 0),
(2833, 'Vincent_Henderson', 1, '127.0.0.1', 1535860160, 'Imediato GMX', '', 0),
(2834, 'Vincent_Henderson', 1, '127.0.0.1', 1535860245, 'Login (in-game)', '', 0),
(2835, 'Vincent_Henderson', 1, '127.0.0.1', 1535861674, 'Login (in-game)', '', 0),
(2836, 'Vincent_Henderson', 1, '127.0.0.1', 1535872820, 'Login (in-game)', '', 0),
(2837, 'Vincent_Henderson', 1, '127.0.0.1', 1535873570, 'Login (in-game)', '', 0),
(2838, 'Vincent_Henderson', 1, '127.0.0.1', 1535873595, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2839, 'Vincent_Henderson', 1, '127.0.0.1', 1535873606, 'Teleportado para Dillimore Police Department', 'Vincent_Henderson', 1),
(2840, 'Vincent_Henderson', 1, '127.0.0.1', 1535874997, 'Login (in-game)', '', 0),
(2841, 'Vincent_Henderson', 1, '127.0.0.1', 1535875030, 'Login (in-game)', '', 0),
(2842, 'Vincent_Henderson', 1, '127.0.0.1', 1535875104, 'Login (in-game)', '', 0),
(2843, 'Vincent_Henderson', 1, '127.0.0.1', 1535875247, 'Login (in-game)', '', 0),
(2844, 'Vincent_Henderson', 1, '127.0.0.1', 1535875367, 'Login (in-game)', '', 0),
(2845, 'Vincent_Henderson', 1, '127.0.0.1', 1535883496, 'Login (in-game)', '', 0),
(2846, 'Vincent_Henderson', 1, '127.0.0.1', 1535885333, 'Login (in-game)', '', 0),
(2847, 'Vincent_Henderson', 1, '127.0.0.1', 1535885376, 'Empresa editada #40 nome para Ação', '', 0),
(2848, 'Vincent_Henderson', 1, '127.0.0.1', 1535885408, 'Empresa editada #40 nome para General Store Dillimore', '', 0),
(2849, 'Vincent_Henderson', 1, '127.0.0.1', 1535885632, 'Imediato GMX', '', 0),
(2850, 'Vincent_Henderson', 1, '127.0.0.1', 1535885687, 'Login (in-game)', '', 0),
(2851, 'Vincent_Henderson', 1, '127.0.0.1', 1535885830, 'Login (in-game)', '', 0),
(2852, 'Vincent_Henderson', 1, '127.0.0.1', 1535885836, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2853, 'Vincent_Henderson', 1, '127.0.0.1', 1535886864, 'Login (in-game)', '', 0),
(2854, 'Vincent_Henderson', 1, '127.0.0.1', 1535886942, 'Reloaded todas as empresas do banco de dados', '', 0),
(2855, 'Vincent_Henderson', 1, '127.0.0.1', 1535886946, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2856, 'Vincent_Henderson', 1, '127.0.0.1', 1535887752, 'Reloaded todas as empresas do banco de dados', '', 0),
(2857, 'Vincent_Henderson', 1, '127.0.0.1', 1535888700, 'Login (in-game)', '', 0),
(2858, 'Vincent_Henderson', 1, '127.0.0.1', 1535888710, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2859, 'Vincent_Henderson', 1, '127.0.0.1', 1535889947, 'Login (in-game)', '', 0),
(2860, 'Vincent_Henderson', 1, '127.0.0.1', 1535889966, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2861, 'Vincent_Henderson', 1, '127.0.0.1', 1535890142, 'Login (in-game)', '', 0),
(2862, 'Vincent_Henderson', 1, '127.0.0.1', 1535890163, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2863, 'Vincent_Henderson', 1, '127.0.0.1', 1535890183, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2864, 'Vincent_Henderson', 1, '127.0.0.1', 1535890681, 'Login (in-game)', '', 0),
(2865, 'Vincent_Henderson', 1, '127.0.0.1', 1535890690, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2866, 'Vincent_Henderson', 1, '127.0.0.1', 1535891044, 'Login (in-game)', '', 0),
(2867, 'Vincent_Henderson', 1, '127.0.0.1', 1535891232, 'Login (in-game)', '', 0),
(2868, 'Vincent_Henderson', 1, '127.0.0.1', 1535891638, 'Imediato GMX', '', 0),
(2869, 'Vincent_Henderson', 1, '127.0.0.1', 1535891661, 'Login (in-game)', '', 0),
(2870, 'Vincent_Henderson', 1, '127.0.0.1', 1535891665, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2871, 'Vincent_Henderson', 1, '127.0.0.1', 1535892231, 'Teleportado para Montgomery', 'Vincent_Henderson', 1),
(2872, 'Vincent_Henderson', 1, '127.0.0.1', 1535892529, 'Reloaded todas as empresas do banco de dados', '', 0),
(2873, 'Vincent_Henderson', 1, '127.0.0.1', 1535892870, 'Reloaded todas as empresas do banco de dados', '', 0),
(2874, 'Vincent_Henderson', 1, '127.0.0.1', 1535892932, 'Reloaded todas as empresas do banco de dados', '', 0),
(2875, 'Vincent_Henderson', 1, '127.0.0.1', 1535893872, 'Login (in-game)', '', 0),
(2876, 'Vincent_Henderson', 1, '127.0.0.1', 1536014897, 'Login (in-game)', '', 0),
(2877, 'Vincent_Henderson', 1, '127.0.0.1', 1536158157, 'Login (in-game)', '', 0),
(2878, 'Vincent_Henderson', 1, '127.0.0.1', 1536161215, 'Login (in-game)', '', 0),
(2879, 'Vincent_Henderson', 1, '127.0.0.1', 1536162308, 'Login (in-game)', '', 0),
(2880, 'Vincent_Henderson', 1, '127.0.0.1', 1536167938, 'Login (in-game)', '', 0),
(2881, 'Vincent_Henderson', 1, '127.0.0.1', 1536170192, 'Login (in-game)', '', 0),
(2882, 'Vincent_Henderson', 1, '127.0.0.1', 1536262643, 'Login (in-game)', '', 0),
(2883, 'Vincent_Henderson', 1, '127.0.0.1', 1536263853, 'Login (in-game)', '', 0),
(2884, 'Vincent_Henderson', 1, '127.0.0.1', 1536345571, 'Login (in-game)', '', 0),
(2885, 'Vincent_Henderson', 1, '127.0.0.1', 1536345614, 'Mudou o tempo para 11', '', 0),
(2886, 'Vincent_Henderson', 1, '127.0.0.1', 1536345629, 'Teleportado para Blueberry', 'Vincent_Henderson', 1),
(2887, 'Vincent_Henderson', 1, '127.0.0.1', 1536345646, 'Veiculo spawnado: Boxville (ID 209, Model 498)', '', 0),
(2888, 'Vincent_Henderson', 1, '127.0.0.1', 1536345716, 'Set faction to 13', 'Vincent_Henderson', 1),
(2889, 'Vincent_Henderson', 1, '127.0.0.1', 1536940333, 'Login (in-game)', '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `adminrecord`
--

CREATE TABLE `adminrecord` (
  `id` int(11) NOT NULL,
  `PlayerSQLID` int(6) NOT NULL DEFAULT '0',
  `PlayerMA` int(6) NOT NULL DEFAULT '0',
  `AdminSQLID` int(6) NOT NULL DEFAULT '0',
  `RecordType` int(3) NOT NULL DEFAULT '0',
  `Amount` int(11) NOT NULL DEFAULT '0',
  `Reason` varchar(128) DEFAULT NULL,
  `DateOfAction` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `adminrecord`
--

INSERT INTO `adminrecord` (`id`, `PlayerSQLID`, `PlayerMA`, `AdminSQLID`, `RecordType`, `Amount`, `Reason`, `DateOfAction`) VALUES
(1, 1, 0, 1, 5, 1, '', '19/8/2018'),
(2, 2, 0, 2, 5, 1, '', '19/8/2018'),
(3, 4, 0, 2, 5, 60, '', '19/8/2018'),
(4, 4, 0, 2, 5, 1, '', '20/8/2018'),
(5, 56, 0, 4, 6, 10, 'Bug.', '31/8/2018');

-- --------------------------------------------------------

--
-- Estrutura para tabela `apbs`
--

CREATE TABLE `apbs` (
  `apbBy` int(11) NOT NULL,
  `apbString` varchar(128) NOT NULL,
  `apbTimestamp` int(11) NOT NULL,
  `apbDeleted` int(11) NOT NULL,
  `apbRemovedBy` int(11) NOT NULL,
  `apbRemovedTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `apbs`
--

INSERT INTO `apbs` (`apbBy`, `apbString`, `apbTimestamp`, `apbDeleted`, `apbRemovedBy`, `apbRemovedTime`) VALUES
(23, 'Testando', 1535543853, 1, 0, 1535543858);

-- --------------------------------------------------------

--
-- Estrutura para tabela `apikeys`
--

CREATE TABLE `apikeys` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  `permissionLevel` int(11) NOT NULL,
  `faction` int(11) NOT NULL,
  `requests` int(11) NOT NULL,
  `requestLimit` int(11) NOT NULL,
  `token` varchar(512) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `article_comments`
--

CREATE TABLE `article_comments` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `value` varchar(500) NOT NULL,
  `report` int(11) NOT NULL,
  `ip` varchar(80) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `reported_by` int(11) NOT NULL,
  `deleted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `assists`
--

CREATE TABLE `assists` (
  `id` int(11) NOT NULL,
  `AssistBy` int(11) NOT NULL,
  `AssistedBy` int(11) NOT NULL,
  `RequestedAdmin` int(11) NOT NULL,
  `RAReason` varchar(128) NOT NULL,
  `AssistReason` varchar(128) NOT NULL,
  `AssistLength` int(11) NOT NULL,
  `AssistTimeWaiting` int(11) NOT NULL,
  `AssistEndedBy` int(11) NOT NULL,
  `AssistEndReason` varchar(128) NOT NULL,
  `AssistTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `assists`
--

INSERT INTO `assists` (`id`, `AssistBy`, `AssistedBy`, `RequestedAdmin`, `RAReason`, `AssistReason`, `AssistLength`, `AssistTimeWaiting`, `AssistEndedBy`, `AssistEndReason`, `AssistTimestamp`) VALUES
(1, 2, 1, 0, '', 'Como pego a Jussandra?', 0, 296, 0, ' ', '2018-07-14 04:58:05'),
(2, 3, 15, 0, '', 'alo', 0, 19, 15, 'O jogador foi atendido', '2018-08-19 18:06:03'),
(3, 2, 3, 0, '', 'w sasa', 0, 136, 3, 'Jogador AFK', '2018-08-20 00:29:37'),
(4, 2, 3, 0, '', 'Borboletas', 0, 27, 3, 'O jogador foi atendido', '2018-08-20 01:00:30'),
(5, 3, 2, 0, '', 'alô brasil', 0, 21, 2, 'O jogador foi atendido', '2018-08-20 01:15:06'),
(6, 2, 3, 0, '', 'w asas', 0, 40, 3, 'O jogador foi atendido', '2018-08-20 01:43:12'),
(7, 3, 2, 0, '', 'alo ', 0, 28, 2, 'Falsa assistência', '2018-08-20 01:44:09'),
(8, 1, 2, 0, '', 'teste', 0, 117, 2, 'O jogador foi atendido', '2018-08-20 07:38:12'),
(9, 2, 1, 0, '', 'asas', 0, 10, 1, 'O jogador foi atendido', '2018-08-20 07:39:47'),
(10, 89, 15, 0, '', 'Fire Departament está ativa já?', 98, 56, 15, 'O jogador foi atendido', '2018-08-31 22:31:46'),
(11, 26, 1, 0, '', 'Onde eu posso comprar um veículo?', 112, 44, 1, 'O jogador foi atendido', '2018-08-31 22:35:07'),
(12, 82, 1, 0, '', 'tem dois helicópteros da san news na rua, isso é do mapa msm?', 119, 308, 1, 'O jogador foi atendido', '2018-08-31 22:38:51'),
(13, 89, 2, 0, '', 'Acabei de entrar no teste de DMV o mapa não carregou direito e eu entrei dentro do mapa sem quere tem como me desbugar?', 174, 303, 2, 'O jogador foi atendido', '2018-08-31 22:41:39'),
(14, 30, 1, 0, '', 'Como faço pra ver meu inventario ?', 166, 24, 1, 'O jogador foi atendido', '2018-08-31 22:41:49'),
(15, 28, 1, 0, '', 'Spawni morto, a sem vida', 529, 349, 1, 'O jogador foi atendido', '2018-08-31 22:51:02'),
(16, 26, 15, 0, '', 'Porque não há nenhum veículo para alugar?', 79, 28, 15, 'O jogador foi atendido', '2018-08-31 22:44:03'),
(17, 89, 2, 0, '', 'Algum adminsitrador sabe me informar aonde fica a concessonária do servidor?', 19, 20, 2, 'O jogador foi atendido', '2018-08-31 22:44:31'),
(18, 26, 1, 0, '', 'Aqui é possível mudar o sotaque que nem no RCRP? Ou não dá?', 160, 244, 1, 'O jogador foi atendido', '2018-08-31 22:57:09'),
(19, 30, 15, 0, '', 'O povo reclamando das coisas que está parecido com RPG, vocês vão escutar é mudar essas coisas ?', 314, 110, 15, 'O jogador foi atendido', '2018-08-31 23:02:25'),
(20, 73, 15, 0, '', 'Como vejo minha mochila?', 61, 109, 15, 'O jogador foi atendido', '2018-08-31 23:03:49'),
(21, 82, 15, 0, '', 'quando as vagas para a SACSO forem abertas, vocês vão avisar IG, correto?', 140, 411, 15, 'Jogador não responde', '2018-08-31 23:06:21'),
(22, 94, 2, 0, '', 'Não achei o GPS na 24/7 não...', 11, 92, 2, 'O jogador foi atendido', '2018-08-31 23:06:34'),
(23, 94, 2, 0, '', 'Como solicito taxi?', 113, 656, 2, 'O jogador foi atendido', '2018-08-31 23:24:27'),
(24, 73, 2, 0, '', 'Onde vende bicicleta? Deveria ser no local de biciclestas né?', 0, 1124, 0, ' ', '2018-08-31 23:25:26'),
(25, 30, 1, 0, '', 'Fui upar de nivel, mais pediu 10 pontos pra realizar essa ação, como consigo esses pontos?', 368, 373, 1, 'O jogador foi atendido', '2018-08-31 23:40:24'),
(26, 41, 2, 0, '', 'Fui fazer o teste no DMV e a casa renderizou em cima de mim', 42, 161, 2, 'O jogador foi atendido', '2018-08-31 23:41:10'),
(27, 39, 2, 0, '', 'Onde que eu tiro minha habilitação?', 928, 258, 2, 'O jogador foi atendido', '2018-08-31 23:57:17'),
(28, 73, 2, 0, '', 'Minah moto bugou.', 163, 40, 2, 'O jogador foi atendido', '2018-09-01 00:16:38'),
(29, 94, 2, 0, '', 'Qual o comando para trabalhar de caminhoneiro?', 0, 77, 0, ' ', '2018-09-01 00:45:13'),
(30, 37, 2, 0, '', 'Preciso sabe onde arrumo emprego e tiro a licença de motorista.', 265, 47, 2, 'O jogador foi atendido', '2018-09-01 01:05:01'),
(31, 94, 2, 0, '', 'Como se torna médico?', 631, 35, 2, 'O jogador foi atendido', '2018-09-01 01:15:59'),
(32, 68, 2, 0, '', 'Onde compro celular? Já fui na 24/7', 0, 29, 0, ' ', '2018-09-01 01:16:10'),
(33, 1, 51, 0, '', 'Teste', 0, 95, 51, 'O jogador foi atendido', '2018-09-02 00:25:51');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `ID` int(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Name` varchar(2500) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Sobrenome` varchar(40) NOT NULL,
  `Gender` int(255) NOT NULL,
  `History` varchar(5000) NOT NULL,
  `Origin` varchar(128) NOT NULL,
  `Birthdate` date NOT NULL,
  `Status` int(255) NOT NULL,
  `VezesAvaliado` int(255) NOT NULL,
  `Motivo` varchar(2000) NOT NULL,
  `AdminLevel` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`ID`, `Username`, `Name`, `Nome`, `Sobrenome`, `Gender`, `History`, `Origin`, `Birthdate`, `Status`, `VezesAvaliado`, `Motivo`, `AdminLevel`) VALUES
(1, 'Revolts', 'Vincent_Henderson', '', '', 1, 'Historia.', 'Red County', '0000-00-00', 1, 0, '', 'well'),
(2, 'renew8', 'Zac_Deutch', '', '', 1, ' Zac Deutch nasceu na regiÃ£o rural de Red County, na cidade de Blueberry no dia 02 de dezembro de 1982. Filho Ãºnico de um casal de camponeses que trabalhavam na colheita de Blueberry. Zac concluiu os estudos em uma escola rural da regiÃ£o.\r\n Desde entÃ£o Zac trabalha fazendo bicos em grandes Ã¡reas de San Andreas.', 'Red County', '0000-00-00', 1, 0, '', 'Revolts'),
(3, 'rafanel2', 'Martin_Fernoso', '', '', 1, 'SS', 'FDSEDS', '0000-00-00', 1, 0, '', 'Revolts'),
(4, 'well', 'Rowan_Ballard', '', '', 1, 'Rowan Ballard, nascido em 1981 no Arizona, sempre foi um garoto bem tranquilo, quando crianÃ§a ajudava seu avÃ´ a cuidar de uma Fazenda, seu pai lhe ensinou bons constumes do o interior, desde entÃ£o o menino criou gosto pelos animais. Por viver em uma vida pacata, Rowan tinha poucas expectativas quanto a realizaÃ§Ãµes, aos seus 18 anos de idade, o rapaz comeÃ§ou a viajar com seu pai pelas estradas, fazendo entregas de caminhÃ£o e uma paixÃ£o foi criada por caminhÃµes, tempos depois seu avÃ´ veio a falecer e as terras foram divididas para seus filhos, o pai de Rowan acabou ficando com uma casa e um bar em Red County, entÃ£o a famÃ­lia Ballard agora estaria se mudando para um dos condados de San Andreas, mais precisamente em Montgomery, o rapaz com seus 26 anos, jÃ¡ havia conseguido um emprego de entregas com caminhÃµes, enquanto seu pai cuidava do bar, por nÃ£o aguentar mais, jÃ¡ estava ficando velho. Rowan viaja todo os EUA fazendo entregas, dormindo apenas dez horas por dia, nos finais de semana fazia o possÃ­vel para ajudar seu pai com o bar, o mesmo era bem conhecido na regiÃ£o.', 'Arizona', '0000-00-00', 1, 0, '', 'Revolts'),
(11, 'Revolts', 'Veronica_Alexandra', '', '', 2, 'Historia.', 'Palomino Creek', '1999-02-22', 1, 0, '', 'Greenside'),
(65, 'only1', 'Frank_Spanshaw', 'Frank', 'Spanshaw', 1, 'Frank Spanshaw nasceu no dia treze do mÃªs doze de mil novecentos e noventa e quatro, na cidade de Dillimore. Na sua infÃ¢ncia, na maioria das vezes Frank era acordado por motivo dos barulhos que vinham de alguns eventos que aconteciam no departamento de xerifes em frente a sua casa, o San Andreas County Sheriff Office. Frank era uma crianÃ§a muito imperativa e alegra, ele continua sendo esforÃ§ado em tudo o que faz, praticamente. Ele passou no ensino fundamental e no ensino mÃ©dio, direto. Um tempo depois, Frank frequentou alguns cursos com base em aprender outras linguagens, como o de Espanhol.\r\n\r\nFrank S. sempre admirou o trabalho policial na sua infÃ¢ncia, e continua a admirar. Mais amadurecido, ele comeÃ§ou a ler livros sobre alguns relatos policiais, como funciona e o que Ã© exatamente ser um policial. Ele tambÃ©m assiste algumas sÃ©ries e filmes relacionadas ao ramo policial. Frank ainda habita em Dillimore, com sua irmÃ£ mais nova e seu pai. Sua mÃ£e foi vÃ­tima de um acidente gravÃ­ssimo entre um carro e um caminhÃ£o. Frank e seu pai viajam pelos condados para terem mais conhecimento de San Andreas.', 'Dillimore', '1994-12-13', 1, 4, 'Teste', 'well'),
(50, 'Kaster', 'Jair_Castellari', 'Jair', 'Castellari', 1, 'Jair Silva Costa nascido e criado em Bayside no estado de San Andreas no ano de 1984, no perÃ­odo de infÃ¢ncia foi criado no orfanato Maria Das GraÃ§as onde estudou seu ensino fundamental, no decorrer desse tempo uma famÃ­lia de classe mÃ©dia adotou Jair e o levou para Montgomery, Jair foi adotado pela Jane Castellari que lhe deu seu sobrenome Castellari.\r\nEm 1997 Jane veio a falecer e deixou sua empresa agrÃ­cola em seu nome, em 1999 Jair botou a empresa para frente contratou muitos fÃºncionarios colocaram as coisas andarem, em 2002 Jair colocou o nome de sua empresa Castellari impreteira acricola em homenagem em sua mÃ£e, hoje Jair Ã© um homem classe mÃ©diana e mora Montgomery.\r\n', 'Bayside', '2018-08-29', 1, 0, '', 'well'),
(14, 'Revolts', 'Dwayner_Marquez', 'Dwayner', 'Marquez', 1, 'teste', 'Teste', '1999-02-22', 1, 0, '', 'JohnBlack'),
(15, 'Nick', 'Lennaert_Schuurman', 'Lennaert', 'Schuurman', 1, 'test', 'Houston, USA', '1990-05-24', 1, 0, '', 'Revolts'),
(16, 'Diogooog', 'Aidan_Lodge', 'Aidan', 'Lodge', 1, '.', 'Chicago', '1980-10-25', 1, 0, '', 'Revolts'),
(17, 'Tutin', 'Wesley _Vianna', 'Wesley ', 'Vianna', 1, 'Sou de UbÃ¡, e capino os matos da regiÃ£o eu sou a universal.', 'Los Santos', '1999-03-21', 1, 0, '', 'Revolts'),
(18, 'Vitor', 'Asamoah_Gibson', 'Asamoah', 'Gibson', 1, 'teste', 'Los Santos', '2018-08-19', 1, 0, '', 'Revolts'),
(19, 'caionpcpk', 'Caio_Bjergsen ', 'Caio', 'Bjergsen ', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'San Fierro', '1999-10-01', 1, 0, '', 'Revolts'),
(20, 'XistO', 'Maycon_Hommyerd', 'Maycon', 'Hommyerd', 1, 'Djdkdkdmmdmdkdmxmxxmxmdmfmdmfnfnvnfnfmfnfmfmfmmffmfkkfkfkfkfjfnfnfnfnfnfnfnnfjxjdjdndndndndndndndnfnfnndndjxncnc', 'United States', '1990-08-20', 1, 0, '', 'Revolts'),
(21, 'Oliveira', 'Haziel_Fagundez', 'Haziel', 'Fagundez', 1, 'Haziel Fagundez Ã© um Homem de 23 anos, nasceu em Palomino Creek junto a sua mÃ£e, Gina Lopez e seu pai Alberto Fagundez. Haziel teve uma infÃ¢ncia muito boa, como sempre, era um bom filho e um bom aluno, nunca faltava a escola e sempre respeitava seus pais e cumpria os deveres que eles passavam, como todo menino, Haziel gostava muito de atividades esportivas, mas o esporte em que ele mais se dava bem era o Basket, comparecia todos os dias na quadra de Palomino para jogar uma partida com seus amigos. Haziel terminou os estudos e se formou em uma universidade de EducaÃ§Ã£o fÃ­sica.\r\n\r\nHoje em dia, Haziel Ã© um homem realizado, Ã© estagiÃ¡rio de educaÃ§Ã£o fÃ­sica em uma escola no centro de Dillimore, nÃ£o tem filhos e nem mulher, Haziel prefere nÃ£o ter famÃ­lia \"por enquanto\" ele pretende terminar o estÃ¡gio e dar seguimento a alguma carreira, ou prestar concurso pro governo e ser um Homem \"livre\" para fazer o que quiser e nÃ£o se preocupar mais com os estudos.', 'Palomino Creek', '1995-02-25', 1, 0, '', 'well'),
(22, 'PedroWinchester', 'Richard_Moore', 'Richard', 'Moore', 1, 'Nascido e criado em Red County Richard Ã© filho de Gregory e Britney, Richard Ã© de uma familia bem rigorosa pois eles moravam em um pequeno trailer que era em uma pequena cidade que se chamava Red County com fazendas e tudo....seus familiares gostavam e seguiam o padrÃ£o que era muito rigoroso que qualquer coisa boa que acontecia era um motivo de festa, em um certo dia com seus  vinte e um anos. Richard decidiu ir atrÃ¡s de algum emprego por Las Venturas que Ã© conhecida como a cidade que nÃ£o dorme seus paÃ­s eram trabalhadores e sempre deram o melhor para o futuro de seu filho, Gregory pai de Richard era um caminhoneiro que fazia fretes em empresas para tentar dar o melhor para a famÃ­lia na sua Ã©poca quando Richard tinha treze anos o dinheiro que ele ganhava era pouco pois nÃ£o era tÃ£o valorizado na sua pequena cidade....mais com esse pouco dinheiro foi oque ajudou a manter a famÃ­lia firme e forte. Richard sempre foi aquele garoto brincalhÃ£o,estudioso e organizado nunca se mexeu com pessoas erradas mais ele queria um futuro melhor para sua famÃ­lia sua mÃ£e Britney era desempregada pois na Ã©poca cuidava da casa e do seu filho, quando Richard completou seus dezoito anos seus paÃ­s prepararam uma pequena festa pelo seu bairro eles tinham esta tradiÃ§Ã£o todo ano...Richard com 18 anos conseguiu seu primeiro emprego como caminhoneiro e ele sempre trabalhou antes ajudando seus paÃ­s e foi juntando dinheiro para sua habilitaÃ§Ã£o.... a sua vida e da sua familia estava Ã³tima atÃ© que um dia sua pequena casa foi vÃ­tima de um assalto por gangues de caipiras da regiÃ£o e seu pai nÃ£o queria deixar nada acontecer nem com Richard e nem com sua mÃ£e ele fez oque pode...Richard assustado se escondeu e escutou um disparo e quando foi ver era seu pai..Richard se revoltou e chorou demais pelo acontecido e ele disse que iria pegar os culpados pelo incidente passou um tempo ele completou os 21 anos e conseguiu entrar para a SACSO e ele Ã© bem conhecido e vive uma vida melhor com sua mÃ£e.', 'Red County', '1997-02-10', 1, 1, 'A histÃ³ria estÃ¡ bem fraca, algumas repetiÃ§Ãµes desnecessÃ¡rias do nome Richard e vÃ¡rios erros de portuguÃªs.', 'well'),
(23, 'Meira', 'Brad_McGraff', 'Brad', 'McGraff', 1, 'Brad nasceu no hospital central de Las Venturas, em uma cidade popular, bem conhecida por seus cassinos exorbitantes e atraÃ§Ãµes esbeltas. Ele teve um parto tranquilo. Mal sabia ele, que a partir daquele dia ele herdaria uma das maiores empresas de distribuiÃ§Ã£o de San Andreas, Elite Trucking. Ele comandaria uma das empresas mais destacadas de San Andreas.\r\n\r\nSeu pai, era dono dessa empresa, ele administrara todos os fundos da empresa, atÃ© funcionÃ¡rios. Ele era um homem severo em questÃµes de educaÃ§Ã£o, impunha moral em sua casa. Caso fosse desrespeitado, castigava os mais fracos, que eram subordinados a ele. Sempre quis que seu filho fosse um dos melhores, mas para isso teria que administrar desde da sua infÃ¢ncia.\r\n\r\nBrad era dedicado na escola, e, aos vinte e quatro anos, se formou em administraÃ§Ã£o. ComeÃ§ou a trabalhar na empresa do pai, conquistando o seu salÃ¡rio e conquistando bens. Construiu uma famÃ­lia, que por sinal, muito feliz.\r\n\r\nAo saber da notÃ­cia, que lhe desmotivou bastante, entristeceu. O pai do rapaz, teria morrido, vÃ­tima de um infarto e, infelizmente, nÃ£o resistiu. Brad nÃ£o estava Ã  espera de uma notÃ­cia daquelas, de repente. A sua mulher foi quem lhe apoiou bastante, e seu filho, que nÃ£o tinha noÃ§Ã£o do ocorrido tambÃ©m o apoiava.\r\n\r\nHoje a empresa Ã© comandada pelo bisneto de Darrel, Brad McGraff, que por sua vez, aumentou a economia da empresa e alterou bastante as polÃ­ticas da empresa, tornando-a mais moderna. Brad Ã© formado em administraÃ§Ã£o e consegue tomar conta dos negÃ³cios do bisavÃ´. Brad tem atualmente cinquenta anos e cuida das finanÃ§as da empresa, contando com quase mil funcionÃ¡rios da empresa.', 'Las Venturas - San Andreas', '1966-01-24', 1, 1, 'Favor retirar espaÃ§os no nome do personagem.', 'well'),
(24, 'Xav', 'Harold_Parker', 'Harold', 'Parker', 1, 'Harold Parker nascido em Bone Country, morando com seu pai Hank e sua mÃ£e Adele, em uma casa simples e pequena com seus irmÃ£o mais novos. Harold vivia em uma famÃ­lia simples e humilde. As escolas para Harold nÃ£o era algo bom, ele passava todo seu tempo trabalhando na fazenda.\r\n\r\nCompletando seus vinte e um anos, onde ficou adulto, ele procurou um emprego com a renda mais alta que a fazenda, mas nÃ£o conseguiu por conta de seu mal estudo. Era grande concorrÃªncia, Harold nÃ£o precisava ser sustentado pelos seus pais, atÃ© que decidiu terminar o ensino mÃ©dio e conseguiu depois de tomar quatro reprovaÃ§Ãµes. Com isso as empresas estavam mais vazias e procurando empregados, e Harold foi escolhido. \r\n\r\nApÃ³s seus trinta anos a empresa demitiu ele por merdas que ele ia fazendo na cidade, como uso de bebidas alcoolizadas e entrou no mundo das drogas. Foi um caminho ruim, viciou nas drogas que era dia inteiro no sol quente na fazenda para conseguir comprar mais e mais drogas, atÃ© que entrou no mundo dos roubos, comeÃ§ou roubar frutos de outras fazendas para gerar lucros, e gostou do caminho, conseguiu comprar suas drogas e se manter roubando vÃ¡rias fazendas. \r\n\r\nEm 2018 Harold completou seus trinta e quatros anos, as dores em seu corpo veiam aparecer, por conta das drogas e a idade. Ele era violento, e ficou morando e roubando por todo condados de San Andreas.\r\n', 'San Andreas', '1984-08-07', 1, 1, 'ConfusÃ£o de nomes.', 'well'),
(25, 'brandaoth', 'Dylan_Velasquez', 'Dylan', 'Velasquez', 1, ' Dylan nasceu em El quebrados e viveu por lÃ¡ uns quatro anos atÃ© seus pais decidirem mandar ele para a casa de sua tia que fica em San Fierro para ele poder estudar,Dylan passou um bom tempo morando na casa de sua tia, onde aprendeu a se virar com a cidade grande,sempre foi apaixonado por motos e carros desde de pequeno quando ele olhava seu pai trabalhar,ele era mecÃ¢nico da cidade.\r\n  Hoje em dia ele decidiu voltar para sua antiga cidade jÃ¡ que ficou mais velho e nÃ£o quer dar mais trabalho para sua tia, jÃ¡ que ela que o sustentou por anos,agora ele vai tentar arrumar um emprego para poder se manter, pois ele nÃ£o quer ficar dependo de seus pais.Dylan tinha dois irmÃ£os mais novos que ele uns cinco anos, ele agora vai tentar fazer oque seu pai nÃ£o pode fazer por ele na infÃ¢ncia pois era muito ocupado com trabalho,Dylan vai tentar cuidar de seus irmÃ£os dando a eles tudo oque ele puder.', 'El Quebrados', '1996-05-05', 1, 2, 'Falta mais um pouco de desenvolvimento na histÃ³ria e contÃ©m alguns erros de portuguÃªs.', 'well'),
(26, 'yozzy5', 'Kevin_Langley', 'Kevin', 'Langley', 1, 'Kevin nasceu no hospital de Los Santos, o garoto viveu em Los Santos por dois anos, quando completou seu terceiro ano Kevin e sua famÃ­lia foram para Palomino Creek, a vida em Los Santos estava muito complicada para a famÃ­lia de Kevin se sustentar por la, entÃ£o eles venderam a casa em Los Santos e jÃ¡ se mudaram para Palomino, em Palomino Kevin comeÃ§ou a estudar e conseguiu diversos amigos, Kevin sempre foi muito amigÃ¡vel e gentil com todos, passava grande parte do seu dia brincando com seus amigos no quintal de sua casa, Kevin completou seus 14 anos e jÃ¡ comeÃ§ou a ajudar seu pai no emprego, hoje em dia Kevin com 19 anos foca nos estudos e trabalha em uma loja de conveniÃªncia. ', 'Palomino Creek', '1999-11-21', 1, 0, '', 'well'),
(27, 'RicoDuhAK', 'Norman_Greensdale', 'Norman', 'Greensdale', 1, 'Em uma noite normal como de costume no bairro de Idlewood, a mÃ£e de Norman estava em sua pequena casa fazendo sua tarefas de casa e Norman no quintal brincando, quando chegou um veÃ­culo preto atirando contra alguns negros do bairro, Norman nÃ£o entendeu muito bem o que estava acontecendo apenas ficou parado olhando para os caras atirando para todos os lados, um tiro desses acertou a mÃ£e de Norman assim fez ela cair no chÃ£o jÃ¡ sem vida Norman nÃ£o entendeu muito apenas comeÃ§o a ver a cena os olhos dele atÃ© brilhava.\r\nPassou um tempo Norman fez seus 14 anos, assim jÃ¡ com vÃ¡rias amizades ruins Norman comeÃ§ou a se envolver no crime, vendia droga para conseguir comprar suas roupas tÃªnis tudo do mais cara, no comeÃ§o Norman achava que era tudo uma maravilha atÃ© que quase um dia ele morreu em outra troca de tiro que teve em seu bairro nesse dia ele nunca mais queria voltar para seu bairro mais os negros forÃ§aram ele a voltar ou ia morrer de qualquer forma.\r\nPassou mais alguns anos Norman fez 17 anos, jÃ¡ estava mais ciente sobre o crime, atÃ© hoje Norman trafica drogas e viva uma vida como de outro preto qualquer mais sempre com o tÃªnis roupa de marca. ', 'Los Santos', '2001-02-08', 1, 2, 'Colocou espaÃ§o depois do \"Nome\" do personagem, verifique e reenvie a aplicaÃ§Ã£o.', 'well'),
(28, 'ArthurBastos', 'Sophia _Bellucci', 'Sophia ', 'Bellucci', 2, 'Nascida e criada em Los Santos Sophia Bellucci Ã© filha de Heisenberg Bellucci e Ellie M. Bellucci. Sophia Bellucci Ã© de uma famÃ­lia de classe media alta, Sophia e seus pais moram em uma casa localizada nas imediaÃ§Ãµes de Temple, Sophia desde crianÃ§a sempre se dedicou aos seus estudos para assim quando terminÃ¡-los arrumar um serviÃ§o para poder ajudar seus pais, Assim que Sophia Concluiu seus estudos aos 18 anos, ela concluiu faculdade de arquitetura, logo de depois de seus pais derem dinheiro para tirar suas habilitaÃ§Ãµes, logo apÃ³s afim de ajudar seus pais Sophia saiu por Los Santos entregando currÃ­culos afim de arrumar um serviÃ§o, depois de duas cansativas semanas entregando currÃ­culos Sophia nÃ£o teve sucesso mas ela foi chamada para trabalhar como auxiliar administrativa em uma empresa de Arquitetura de Los Santos, Sophia toda contente aceitou na hora. Chegou em casa toda feliz contou aos seus pais a noticia.\r\n  Dois anos se passaram e Sophia ainda trabalhando na empresa de Arquitetura, Sophia recebe a noticia que seu pai Heisenberg Bellucci, tinha acabado de ser assassinado em uma tentativa de assalto por uma MÃ¡fia que atuava por Jefferson. assim revoltada com a morte de seu querido pai Sophia resolveu se alistar para a LSPD a policia de Los Santos, assim apos de alguns messes passado Sophia completou todos os cursos preparatÃ³rios e Hoje em dia atua na LSPD.\r\n', 'Los Santos', '1996-05-25', 2, 1, 'Favor retirar espaÃ§os no nome do personagem.', 'kauanaqui'),
(29, 'CarlosDasTeam', 'Robert_Harris', 'Robert', 'Harris', 1, 'Robert, Ã© um velho rapaz da zona leste do Texas, nascido Ã© criado por seus pais, teve uma infÃ¢ncia normal como toda crianÃ§a daquela Ã©poca, ajudava seus pais na roÃ§a, Ã© no tempo livre brincava com o quÃª tinha, ao passar do tempo, Robert foi crescendo, amadurecendo. Aos 23 anos Robert foi para o interior de  Houston, lÃ¡ conseguiu um pequeno barraco Ã© tambÃ©m um emprego em uma lanchonete, que ficava alguns quarteirÃµes prÃ³ximo de sua casa, lÃ¡ Robert aprendeu o quÃª realmente era disciplina, Ã© aprendeu o real sentido da vida, Robert estava se dando bem com uma populaÃ§Ã£o exagerada em um minÃºsculo campo de casas, mais conhecida como \'condado\'. Em 1993 as 18:42 Robert recebe uma ligaÃ§Ã£o de Allan, seu pai, informando sobre as condiÃ§Ãµes precÃ¡rias lÃ¡ onde ele Ã© sua mÃ£e Brianna, Robert com poucos messes de trabalho nÃ£o teria renda suficiente para pagar passagem para sua mÃ£e Ã© seu pai atÃ© Houston, entÃ£o a Ãºnica opÃ§Ã£o de Robert era se mudar para Bone County, onde era mais acessÃ­vel para sua famÃ­lia, entÃ£o Robert foi obrigado a se acostumar lÃ¡, voltando a sua rotina na roÃ§a, mais em um anÃºncio de um amigo de Allan, alegrou Robert, um velho amigo de Robert, Brad estaria com planos de abrir uma transportador, Ã© entÃ£o Robert vai atrÃ¡s do paradeiro de Brad, em busca de uma possÃ­vel parceria de emprego. [...]', 'Texas ', '1980-07-30', 1, 0, '', 'well'),
(30, 'shotkillas', 'Calvin_Shoreside', 'Calvin', 'Shoreside', 1, 'Calvin Shoreside Ã© um jovem americano de Ã©tnia caucasiana que mora na regiÃ£o de Montgomery em Red County, mora longe de seus paÃ­s e vive pagando suas dividas que por sÃ­nal sÃ£o muitas, Calvin sempre foi um bom aluno, mesmo estudando em escolas pÃºblicas, tirava boas notas e era um aluno muito responsÃ¡vel, porÃ©m, a vida nÃ£o brilho para ele.\r\nCalvin, quando mais novo, com 19 anos, era como um Motoboy, sÃ³ que diferentemente dos convencionais que levavam comida entre outros, ele acabava transportando drogas, e assim fazia um dinheiro arriscado, ficando nesse trabalho por em torno de um ano, atÃ© que ele esteve perto de ser abordado por um polÃ­cial que requisitou uma revista nele, por sorte ele jÃ¡ havia entregue as drogas e nÃ£o correu perigo, porÃ©m aquela era a primeira vez que acontecia, e caso ele tivesse com a droga o destino dele seria outro, entÃ£o ele parou com o transporte.\r\nAos 20 anos, foi tentar uma vaga em um super-mercado da regiÃ£o, estava duro, era sua Ãºnica chance pra faturar algum dinheiro e custear o Ã¡luguel de sua casa, Calvin ficou trabalhando na rede por um tempo, atÃ© que foi dispensado depois de dois anos, por conta de um corte da empresa.\r\nCalvin cada dia mais se afunda em dividas, sempre corre atrÃ¡s de uma soluÃ§Ã£o, mas a vida em San Andreas nÃ£o parece tÃ£o brilhante.', 'Montgomery - Red County', '1996-06-13', 1, 1, 'ReavaliaÃ§Ã£o.', 'well'),
(31, 'shisa', 'Bruce_Crawford', 'Bruce', 'Crawford', 1, 'Bruce Ã©  um jovem de vinte e dois anos, filho de uma professora e um trabalhador rural. Segundo mais velho entre seus cinco irmÃ£os, Bruce foi obrigado a se desenvolver cedo para ajudar sua famÃ­lia, jÃ¡ que o salÃ¡rio dos seus pais nÃ£o  era tÃ£o alto. Aos dezesseis, ele comeÃ§ou a trabalhar em uma pequena lanchonete em Montgomery, ele ia de carona com o pai, que trabalhava em uma fazenda prÃ³xima da cidade. O local onde Bruce trabalhava era frequentemente visitado por policiais que paravam por ali para fazer um lanche no meio do turno. O garoto passava alguns minutos ouvindo as histÃ³rias de trabalho dos policiais e  ficava admirado, ele queria fazer o mesmo que eles e proteger o condado como eles fazem. Agora, com vinte e dois anos, o garoto continua correndo atrÃ¡s desse sonho enquanto ajuda sua mÃ£e e seu pai a sustentar seus irmÃ£os mais novos.\r\n\r\nBruce Ã© um rapaz de fases. Normalmente costuma ser simpÃ¡tico e paciente, mas pode se tornar sÃ©rio e violento se a situaÃ§Ã£o exige que ele seja.  Possui um certo dom pra comandar, sempre conseguia funÃ§Ãµes de lideranÃ§a nos locais onde participava. Seja em eventos, escola ou locais que jÃ¡ trabalhou. ', 'Blueberry, San Andreas', '1996-04-18', 1, 0, '', 'well'),
(32, 'Thompson', 'Phillipe_Bergman', 'Phillipe', 'Bergman', 1, 'Phillipe Bergman Ã© um ex-funcionÃ¡rio da madeireira de Angel Pine. Phillipe trabalhou durante seis anos lÃ¡, mas devido a um corte de funcionÃ¡rios acabou perdendo o seu emprego e tendo que arrumar outro que nÃ£o pagava nem um quarto do seu antigo salÃ¡rio.\r\n\r\nAtualmente Phillipe trabalha em uma pequena loja de bebidas localizada na cidade de Dillimore, ele nÃ£o gosta nem um pouco do que faz, mas Ã© o Ãºnico emprego que conseguiu arrumar apÃ³s a perca do antigo.\r\n\r\nA personalidade Phillipe Ã© o suficiente para fazer o mesmo viver em uma sociedade, mas nÃ£o se enganem, pisar no calo de Phillipe pode nÃ£o ser uma boa ideia.\r\n\r\nO sujeito tem vÃ¡rias paixÃµes na vida, e uma delas Ã© as motos custom. Phillipe adquiriu essa paixÃ£o por motocicletas atravÃ©s do seu pai, um renomado mecÃ¢nico de motocicletas do condado de Whetstone. ', 'Angel Pine - San Andreas.', '1985-12-11', 1, 0, '', 'well'),
(33, 'YurS', 'Emily_Lawrence', 'Emily', 'Lawrence', 1, 'Emily Lawrence foi nascida e criada em Dillimore, filha Ãºnica de John T.Lawrence e Ashley T. Lawrence, ela nÃ£o desencadeou problemas de saÃºde quando nasceu e seu estado de saÃºde foi dado como Ã³timo. Com trÃªs anos de idade Emily entrou em uma escola local de Dillimore e iniciou seus estudos, ela estudava no perÃ­odo da manhÃ£ e tinha a tarde e noite livre para fazer o que bem entender. Desde pequena Emily Lawrence apresentou indÃ­cios de que era uma menina dramÃ¡tica e carinhosa, ela sempre gostou de coisas simples. Ela sempre preferiu estar perto de pessoas que gostava, como seus amigos e familiares, ela tinha um carinho especial por essas pessoas. Emily Lawrence era um tipo de garota que gostava de dar e receber carinho, ela sempre acreditou em romance e acreditava que nÃ£o deveria ter pressa para esperar seu amor verdadeiro, atÃ© que com os treze anos de idade ela comeÃ§ou a ter interesses em um garoto de sua sala na escola, ela ficava observando o garoto durante muito tempo nas aulas porÃ©m ela tambÃ©m sempre foi muito tÃ­mida e por isso nÃ£o tinha coragem de ir atÃ© o garoto e falar com ele. AtÃ© que um belo dia o garoto percebeu que Emily ficava o encarando durante horas e ele foi atÃ© ela conversar com ela e eles ficaram vÃ¡rios minutos sentados em banco desconfortÃ¡vel conversando sobre besteiras e coisas do dia a dia, o garoto tomou iniciativa e roubou um beijo de Emily. Com sua primeira experiÃªncia nÃ£o tÃ£o horrÃ­vel, Emily continuou ficando com o garoto apenas para se exibir para as colegas de classe que babavam o menino. Um certo dia o garoto chega atÃ© Emily e explica toda a situaÃ§Ã£o, ele diz que nÃ£o quer mais nada com ela e Emily fica um pouco abalada com o seu primeiro toco na vida. Ela decidiu que ia esquecer o garoto e apagar ele de sua mente, entÃ£o Emily comeÃ§ou a focar nos estudos para ter um bom futuro jÃ¡ que seu pai era um mero mecÃ¢nico e nÃ£o tinha muitas condiÃ§Ãµes para sustentar a sua famÃ­lia. A mÃ£e de Emily estava trabalhando como domÃ©stica na Ã©poca e ela decidiu investir na garota, ela pegou seu baixo salÃ¡rio desumano e inscreveu Emily em um concurso de redaÃ§Ã£o, na qual envolvia toda a escola onde Emily estudava. Emily comeÃ§ou a estudar dia e noite para o concurso, ela queria ficar em primeiro lugar e receber o prÃªmio que era de dois mil dÃ³lares, ela se esforÃ§ou muito durante vÃ¡rias semanas atÃ© que chegou o dia do concurso, ela entrou na sala nervosa e iniciou sua prova. Emily passou quatro horas fazendo a redaÃ§Ã£o com muita calma e paciÃªncia, ela se esforÃ§ou e corrigiu cada letra para que nÃ£o houvesse erros de inglÃªs, apÃ³s quatro incansÃ¡veis horas de prova ela saiu da sala e foi para a sua casa, esperou um mÃªs ansiosa para o resultado do concurso de redaÃ§Ã£o. Apesar de todo o esforÃ§o Emily nÃ£o conseguiu o primeiro lugar, ela ficou com o segundo e recebeu o prÃªmio de novecentos dÃ³lares, apesar de nÃ£o ser o que ela queria, ela ajudou bastante seus pais com esse dinheiro. Um belo dia Emily estava indo para e escola um pouco abalada com o resultado e acabou sendo assaltada por falta de atenÃ§Ã£o, um hispÃ¢nico colocou uma pistola semi-automÃ¡tica em sua cabeÃ§a e ameaÃ§ou atirar em sua cabeÃ§a, Emily comeÃ§ou a chorar e tremendo entregou todo o seu dinheiro do lanche, o assaltante achando pouco ficou irritado e comeÃ§ou a arrastar Emily pelos cabelos para um beco prÃ³ximo ao local. Emily foi arrastada pelo assaltante e depois ele comeÃ§ou a tentar a tirar suas roupas, ela estava prestes a ser estuprada quando milagrosamente uma viatura passa pela rua e observa uma movimentaÃ§Ã£o estranha no beco. O policial fez a volta e desceu da viatura, ele caminhou atÃ© o beco e viu o assaltante com uma pistola em mÃ£os e tentando tirar as roupas de Emily. O policial nÃ£o pensou duas vezes e apontou a pistola na cabeÃ§a do assaltante, o bandido percebeu a aÃ§Ã£o e tentou atirar no policial, sendo o assaltante baleado na cabeÃ§a e vindo a Ã³bito em poucos segundos no local. Emily comeÃ§ou a chorar mais do que jÃ¡ estava e correu para os braÃ§os do policial para ter um conforto diante daquela situaÃ§Ã£o horrÃ­vel em que ela estava presente, a garota abraÃ§ou o policial e agradeceu a ele por tudo. Algumas horas passaram e Emily foi para o departamento de policia, seus parentes foram chamados no departamento e eles foram correndo atÃ© lÃ¡, eles encontraram Emily toda bagunÃ§ada sentada em uma cadeira e ainda chorando com tudo aquilo que ela estava passando, Emily foi acompanhada por uma psicÃ³loga durante alguns meses. Nesse tempo ela criou um forte sentimento pela policia e ai veio a sua vontade de se tornar uma policial. ', 'Dillimore', '1994-08-07', 1, 1, 'Pedido do autor', 'well'),
(34, 'Chockyto', 'Joshua_Sanders', 'Joshua', 'Sanders', 1, '         Joshua Sanders, jovem nascido no ano de 1994, desde de pequeno teve um grande influÃªncia de seus pais, seu pai Peter Sanders era mÃ©dico e sua mÃ£e uma dona de casa comum, Joshua tinha o sonho de ajudar os outros como seu pai fazia.\r\n        Quando Joshua completou seus 15 anos era um bom aluno na escola, sempre tirava notas boas e nunca se metia em brigas, um certo dia quando ele tava voltando para casa se deparou com sua mÃ£e caÃ­da no chÃ£o entÃ£o imediatamente ligou para seu pai, no hospital sua mÃ£e foi diagnosticada com cÃ¢ncer dai em diante ele teve que ajudar a mÃ£e nas tarefas de casa.\r\n        Joshua tem o sonho de construir uma famÃ­lia e ajudar as pessoas de alguma maneira, ele tambÃ©m pretende crescer na vida.', 'San Andreas', '1997-03-08', 1, 0, '', 'well'),
(35, 'Eduh', 'Edward_Torres', 'Edward', 'Torres', 1, ' Edward nascido no condado de Red County, na cidade de Palomino Creek vinha de uma famÃ­lia de classe mÃ©dia, quando crianÃ§a os pais costumavam dar tudo para ele, sendo um pouco mimado. Na sua adolescÃªncia isso mudou, pois seus pais o obrigaram a trabalhar e juntar sua prÃ³pria renda. EntÃ£o ele comeÃ§ou a trabalhar e juntar uma grana, pois ele pensava jÃ¡ em ter sua prÃ³pria casa e se mudar. \r\n Na sua vida adulta, Edward decide sair de casa e comprar sua residÃªncia com o dinheiro que ele juntou, entÃ£o ele o faz, gasta todo seu dinheiro comprando uma casa e procura seguir sua vida no condado.', 'Palomino Creek, SA.', '1990-01-18', 1, 0, '', 'well'),
(36, 'Kchorro', 'Richard_Parker', 'Richard', 'Parker', 1, 'Richard Ã© um rapaz jovem que cresceu na parte nÃ£o tÃ£o bem vista do interior do estado de San Andreas. Apesar de interioranos ele presenciava de perto a criminalidade local. Pessoas daquela pequena e pacata cidade nÃ£o tinham muitas opÃ§Ãµes de vida, pois a realidade deles eram apenas trÃªs. VocÃª vira um criminoso e se da bem ou mal, ou vocÃª segue como um trabalhador qualquer com mais uma vida insignificante.\r\nO rapaz nunca gostou daquela pobreza que vivia com sua famÃ­lia, e a sua ambiÃ§Ã£o dava a ele a dedicaÃ§Ã£o necessÃ¡ria para poder atuar na criminalidade de uma forma diferente daquela vivenciada por todos ali. Richard tinha grande interesse no crime organizado e apesar de nÃ£o ser fisicamente nem psicologicamente parecido com os grandes criminosos que ele havia descoberto ele queria ainda sim ser como eles.\r\nDesde entÃ£o o rapaz vem elaborando crimes e aÃ§Ãµes criminosas que o levem a conquistar o que todo ambicioso quer, dinheiro, reconhecimento e respeito.', 'EUA.', '1985-09-30', 1, 0, '', 'well'),
(37, 'RenanTranks', 'Gabriel_Schumacher', 'Gabriel', 'Schumacher', 1, ' Gabriel Schumacher nasceu em 19/02/1994 em Palomino Creek, Gabriel mora com sua mÃ£e numa casa bastante humilde, o nome de sua mÃ£e Ã© Natasha Schumacher e seu pai ele nunca conheceu, Gabriel sofreu muito em sua infÃ¢ncia com a perda de sua avÃ³ que se chamava Nanci Schumacher, atualmente Gabriel trabalha como supervisor na empresa Elite Trucking Corporation, o salario que ganhava era bastante pouco mais Gabriel tem que trabalhar para sustentar sua mÃ£e, tambÃ©m ele tinha bastante sonhos que era comprar o carro de seus sonhos que era um Elegy, tambÃ©m ele gostava bastante de motos e tambÃ©m queria comprar sua prÃ³pria casa em outra cidade, Gabriel nunca desistiu de seus sonhos e sempre foi um homem guerreiro, tambÃ©m ele estuda administraÃ§Ã£o para um dia fazer sua empresa ou abrir um bar.\r\n\r\n No futuro Gabriel quer comprar sua prÃ³pria casa, o carro de seus sonhos e atÃ© um dia comprar um bar ou montar sua empresa, tambÃ©m quer ajudar sua mÃ£e em tudo o que precisar.', 'Palomino Creek', '1994-02-19', 1, 0, '', 'well'),
(38, 'StanNeT', 'Zachary_McKinney', 'Zachary', 'McKinney', 1, 'Zachary Ã© um jovem de dezenove anos que curte viajar, caminhar e andar a cavalo. Ele Ã© inteligente, porÃ©m sentimental.\r\n\r\nZachary completou o ensino mÃ©dio, atualmente estÃ¡ cursando CiÃªncia da ComputaÃ§Ã£o. Fisicamente Ã© um garoto em boa forma. Ele tem uma altura acima da mÃ©dia, cabelos castanhos e olhos azuis.\r\n\r\nEle ainda mora com os pais, sua mÃ£e, Hannah, auxilia seu pai, Anthony, no trabalho, ambos trabalham no mesmo cargo, na mesma empresa, em FleischBerg.\r\nZachary estÃ¡ focado nos estudos, para completar a faculdade, e, conseguir seu primeiro emprego.\r\n\r\nEle tem uma vida sem regalias.\r\n', 'Bone County', '1999-09-03', 1, 1, 'Precisa desenvolver melhor a histÃ³ria, estÃ¡ muito rasa.', 'well'),
(39, 'Gunner', 'Dylan_Bush', 'Dylan', 'Bush', 1, 'Dylan nasceu no ano de 1994 em uma humilde casa no interior de San Andreas, com uma situaÃ§Ã£o financeira degradante, a famÃ­lia de Dylan teve que se virar para viver mantendo a honestidade.\r\nCom isso Dylan teve que comeÃ§ar a trabalhar desde pequeno para ajudar com as despesas da famÃ­lia, ele conseguiu um trabalho em uma fazenda prÃ³xima da casa dele para carregar algumas coisas e auxiliar os outros trabalhadores da fazenda com algumas tarefas de rotina.\r\nQuando Dylan completou 18 anos de idade ele comeÃ§ou a aprender sobre mecÃ¢nica na fazenda, ajudando a consertar as mÃ¡quinas e aprendendo com os outros funcionÃ¡rios, e alÃ©m disso tambÃ©m tirou a sua carteira de motorista, assim fazendo algumas entregas nÃ£o tÃ£o longas com os caminhÃµes da fazenda.\r\nPorÃ©m alguns anos depois a fazenda comeÃ§ou a ir de mal a pior, tendo que demitir funcionÃ¡rios e vender algumas mÃ¡quinas, mas Dylan conseguiu se manter um tempo no trabalho, juntou um dinheiro e ajudou a famÃ­lia, pois nessa Ã©poca ele jÃ¡ ganhava bem melhor do que quando ele comeÃ§ou na fazenda.\r\nSÃ³ que isso tudo nÃ£o durou mais muito tempo, um tempo depois a situaÃ§Ã£o da fazenda apertou ainda mais e Dylan teve de ser demitido, com isso a histÃ³ria de Dylan vai tomar um rumo diferente em que sÃ³ o tempo irÃ¡ definir o que serÃ¡ dele...', 'Estados Unidos, San Andreas, Red County, Montgomery', '1994-01-01', 1, 0, '', 'well'),
(40, 'luk', 'Donald_White', 'Donald', 'White', 1, '  Donald White, nasceu no comeÃ§o dos anos noventa em Willowfield.  Filho de pai minerador, e mÃ£e operaria, Donald cresceu sem regalias financeiras. \r\n  Mesmo na situaÃ§Ã£o que sua famÃ­lia estava, Donald nunca abandonou seus estudos, terminando o ensino bÃ¡sico em primeiro da turma de seu bairro. \r\n Logo nos primeiros anos de sua adolescÃªncia, White se matriculou na faculdade de ciÃªncias da computaÃ§Ã£o, a onde se formou sem nenhuma dificuldade. \r\nHoje, pode-se encontrar Donald a procura de mercado de trabalho para poder utilizar o que aprendeu em seu curso. \r\n', 'Los Santos', '1990-04-17', 1, 0, '', 'well'),
(41, '', 'Darren_Hill', 'Darren', 'Hill', 1, '   Em meados de 1980; a famÃ­lia Hill recepciona um novo membro, e nÃ£o demorou muito tempo para que ele se acostumasse com o fato de morar em uma cidade pequena. O menino cresceu acompanhando o seu pai nas viagens de longas horas, que era o trabalho de caminhoneiro. Gostava bastante da ideia de dirigir por aÃ­ com o seu prÃ³prio caminhÃ£o, tanto que atÃ© aprendeu a dirigir sozinho ao completar treze anos. AlÃ©m do entusiasmo, as estradas eram a Ãºnica escapatÃ³ria que o rapaz tinha da realidade em que vivia. Seu pai, apesar de ser um bom homem, era um alcoÃ³latra compulsivo e usuÃ¡rio de drogas, e, por viajar para vÃ¡rios lugares, tinha um fÃ¡cil acesso para diversos tipos de narcÃ³ticos. NÃ£o demorou muito tempo para a famÃ­lia desabar apÃ³s a repentina mudanÃ§a que a separaÃ§Ã£o havia causado na vida dos pais. O rapaz tenta consolar o caminhoneiro, mas o encontra pendurado pelo pescoÃ§o no banheiro.\r\n\r\n   Muitos anos se passam, o rapaz sente falta das malditas viagens e trabalha temporariamente atÃ© obter a sua primeira conquista, uma velha caminhonete. AtÃ© entÃ£o, o homem dirige por aÃ­ e nÃ£o visa por nenhum rumo. Deixa sempre a rÃ¡dio ligada nas mÃºsicas que costumava compartilhar com o pai drogado e bÃªbado, pensando nos trajetos que sempre tomava. Atualmente, vive em um trailer e tenta se manter como pode.', 'Montgomery, Red County.', '1980-04-20', 1, 1, 'Usuario nÃ£o registrado.', 'well'),
(42, 'Seul', 'Vincent_Wilhelm', 'Vincent', 'Wilhelm', 1, 'Nascido e criado em Cleveland, Vincent sempre foi um jovem paciente e perspicaz, talvez atÃ© compreensivo demais. Desde cedo o jovem sempre viajou muito com seus pais a trabalho, entÃ£o nunca teve um lugar fixo. Estudou a maior parte do tempo em casa com professores particulares, jÃ¡ que era certeza que nÃ£o seria fixo em uma instituiÃ§Ã£o de ensino, e depois de um tempo, fez um supletivo para concluir o colegial.\r\nAos dezoito anos, Vincent recebeu uma oferta de trabalho do estado de San Andreas para ser sua primeira oportunidade de emprego, jÃ¡ que o seu pai tinha grande influÃªncia por causa de seu ofÃ­cio. Depois de conversar com seus pais, o rapaz decidiu que se mudaria para Las Venturas para comeÃ§ar sua nova vida em seu novo emprego.', 'Cleveland, Ohio', '1990-09-11', 1, 0, '', 'well'),
(43, 'zanpi', 'Kallel_Taylor', 'Kallel', 'Taylor', 1, 'Nascido e criado em Ohio, Kallel desde crianÃ§a sempre foi bem atentado e impaciente, se metendo em brigas tanto na escola como nas ruas, porÃ©m ele nunca foi expulso de nenhuma escola, jÃ¡ que sempre teve um domÃ­nio nas matÃ©rias escolares, sendo sempre o aluno com melhor desempenho dentre toda a escola, porÃ©m com o pior comportamento, foi aceito em vÃ¡rias faculdades, sÃ³ que nunca se importou em realizar alguma, pois com sua mente nunca foi problema conseguir trabalho de altos cargos sÃ³ por demonstrar sua aptidÃ£o e flexibilidade em suas tarefas.\r\nTendo em vista conquistado sua cidade, e tendo uma vida financeiramente boa, partiu em novas oportunidades de conhecer coisas novas, viajando para o condado de San Andreas tento em vista, ter uma vida nÃ£o calma, e cheia de adrenalidade e prazeres. ', 'Ohio', '1995-05-03', 1, 0, '', 'well'),
(44, 'Francis', 'Isaiah_Dillimore', 'Isaiah', 'Dillimore', 1, ' Isaiah Dillimore nasceu na pequena cidade chamada Montgomery, no condado de Red County. Isaiah e sua famÃ­lia eram pessoas \"Hippies\" que apoiavam a legalizaÃ§Ã£o das drogas, uma coisa comum passada de geraÃ§Ã£o em geraÃ§Ã£o da famÃ­lia Montgomery. Isaiah foi seguindo a frase mais marcante para ele antes dela morrer \"Lute pelo o que vocÃª quer, se nÃ£o lutar, a batalha vocÃª perderÃ¡\".\r\n Isaiah Dillimore nunca foi para uma escola por causa de sua famÃ­lia, ele apenas aprendeu a ler e a escrever com uma letra feia. A famÃ­lia de Isaiah falava que as escolas apenas ensinavam as crianÃ§as Ã  serem comunistas, apesar de apoiarem a legalizaÃ§Ã£o de drogas eles nÃ£o gostavam do comunismo.\r\n Isaiah Dillimore jÃ¡ tentou vender drogas para cubanos e mexicanos mas quase foi roubado duas vezes seguidas, felizmente ele se sempre se preveniu com uma Shotgun, arma conhecida em Montgomery. Isaiah depois dessas \"quase percas\" de drogas, como Marijuana, Crack e CocaÃ­na.\r\n Hoje Isaiah vive viajando por Red County com sua moto de estrada parando em postos de gasolina para fazer algumas necessidades ou apenas para se alimentar, passa a maioria do tempo em Montgomery, sua cidade natal.', 'Montgomery - Red County', '1965-02-20', 1, 0, '', 'well'),
(45, 'joaoesturti1', 'Anthony_Emanuel', 'Anthony', 'Emanuel', 1, '  Anthony Emanuel desde pequeno tinha um sonho de ser um grande caminhoneiro. Sempre teve paixÃµes em caminhÃµes tomando como referencia seu pai que era um grande caminhoneiro conhecido na regiÃ£o onde morava. Diferente do pai a mÃ£e da Anthony era uma faxineira que batalhava dia a dia para ajudar o garoto a ter seus estudos e consequentemente um bom futuro. Sempre que podia Anthony viajava com seu pai, conhecendo grandes lugares encantadores aos olhos do garoto que se impressionava facilmente. Durante as viagens visitarÃ£o San Andreas, lugar que chamou a atenÃ§Ã£o de Anthony pelas diversas e melhores condiÃ§Ãµes para que eles prosperassem melhor na carreira.\r\n  \r\n  Anthony completou seus estudos e cresceu e claro, San Andreas nÃ£o saia da sua mente. EntÃ£o como um dos objetivo cumprio e mudou-se para Los Santos. Na cidade o rapaz foi se preparando ao poucos, comeÃ§ou do baixo e foi se erguendo a cada luta. Comprou um simples e velho Walton que quebrava o galho para arcar com as despezas do rapaz. E foi questÃ£o de tempo para ele crescer no ramo, comprando uma caminhonete mais moderna. Assim como muitos bastou tempo para que Anthony fosse alcanÃ§ando picos mais e mais altos e entÃ£o o rapaz jÃ¡ mais maduro e melhor estabilizado comprou uma carreta e se juntou a uma empresa de transporte, onde segue sua vida tranquila, trabalhando e claro, formando agora uma famÃ­lia.\r\n', 'Texas EUA  Anthony Emanuel desde pequeno tinha um sonho de ser um grande caminhoneiro. Sempre teve paixÃµes em caminhÃµes tomand', '1999-01-11', 1, 0, '', 'well'),
(46, 'BenCrawford', 'Ben_Crawford', 'Ben', 'Crawford', 1, 'Posso te ajudar e clarear um pouco a sua mente com algumas dicas para que vocÃª possa redigir algo legal. Antes de tudo, vocÃª tem que saber como vai desenvolver e incorporar seu personagem em algum cenÃ¡rio de LS, seja ele civil, criminoso, etc. DÃª inÃ­cio a sua histÃ³ria contando um pouco de seus primeiros anos de vida, lÃ¡ na adolescÃªncia. ExperiÃªncias, comportamentos, influÃªncias, etc. Narre um pouco o ponto de vista que seu personagem tem da sociedade, como ele vai se comportar em meio a ela. Diga um pouco do modo que seu personagem vai ganhar a vida, como ele pensa em fazer dinheiro, se ele tem projetos ou nÃ£o para o futuro, essas coisas bem estruturais/bÃ¡sicas na histÃ³ria de alguÃ©m.\r\nPosso te ajudar e clarear um pouco a sua mente com algumas dicas para que vocÃª possa redigir algo legal. Antes de tudo, vocÃª tem que saber como vai desenvolver e incorporar seu personagem em algum cenÃ¡rio de LS, seja ele civil, criminoso, etc. DÃª inÃ­cio a sua histÃ³ria contando um pouco de seus primeiros anos de vida, lÃ¡ na adolescÃªncia. ExperiÃªncias, comportamentos, influÃªncias, etc. Narre um pouco o ponto de vista que seu personagem tem da sociedade, como ele vai se comportar em meio a ela. Diga um pouco do modo que seu personagem vai ganhar a vida, como ele pensa em fazer dinheiro, se ele tem projetos ou nÃ£o para o futuro, essas coisas bem estruturais/bÃ¡sicas na histÃ³ria de alguÃ©m.\r\nPosso te ajudar e clarear um pouco a sua mente com algumas dicas para que vocÃª possa redigir algo legal. Antes de tudo, vocÃª tem que saber como vai desenvolver e incorporar seu personagem em algum cenÃ¡rio de LS, seja ele civil, criminoso, etc. DÃª inÃ­cio a sua histÃ³ria contando um pouco de seus primeiros anos de vida, lÃ¡ na adolescÃªncia. ExperiÃªncias, comportamentos, influÃªncias, etc. Narre um pouco o ponto de vista que seu personagem tem da sociedade, como ele vai se comportar em meio a ela. Diga um pouco do modo que seu personagem vai ganhar a vida, como ele pensa em fazer dinheiro, se ele tem projetos ou nÃ£o para o futuro, essas coisas bem estruturais/bÃ¡sicas na histÃ³ria de alguÃ©m.\r\nPosso te ajudar e clarear um pouco a sua mente com algumas dicas para que vocÃª possa redigir algo legal. Antes de tudo, vocÃª tem que saber como vai desenvolver e incorporar seu personagem em algum cenÃ¡rio de LS, seja ele civil, criminoso, etc. DÃª inÃ­cio a sua histÃ³ria contando um pouco de seus primeiros anos de vida, lÃ¡ na adolescÃªncia. ExperiÃªncias, comportamentos, influÃªncias, etc. Narre um pouco o ponto de vista que seu personagem tem da sociedade, como ele vai se comportar em meio a ela. Diga um pouco do modo que seu personagem vai ganhar a vida, como ele pensa em fazer dinheiro, se ele tem projetos ou nÃ£o para o futuro, essas coisas bem estruturais/bÃ¡sicas na histÃ³ria de alguÃ©m.\r\nPosso te ajudar e clarear um pouco a sua mente com algumas dicas para que vocÃª possa redigir algo legal. Antes de tudo, vocÃª tem que saber como vai desenvolver e incorporar seu personagem em algum cenÃ¡rio de LS, seja ele civil, criminoso, etc. DÃª inÃ­cio a sua histÃ³ria contando um pouco de seus primeiros anos de vida, lÃ¡ na adolescÃªncia. ExperiÃªncias, comportamentos, influÃªncias, etc. Narre um pouco o ponto de vista que seu personagem tem da sociedade, como ele vai se comportar em meio a ela. Diga um pouco do modo que seu personagem vai ganhar a vida, como ele pensa em fazer dinheiro, se ele tem projetos ou nÃ£o para o futuro, essas coisas bem estruturais/bÃ¡sicas na histÃ³ria de alguÃ©m.\r\nPosso te ajudar e clarear um pouco a sua mente com algumas dicas para que vocÃª possa redigir algo legal. Antes de tudo, vocÃª tem que saber como vai desenvolver e incorporar seu personagem em algum cenÃ¡rio de LS, seja ele civil, criminoso, etc. DÃª inÃ­cio a sua histÃ³ria contando um pouco de seus primeiros anos de vida, lÃ¡ na adolescÃªncia. ExperiÃªncias, comportamentos, influÃªncias, etc. Narre um pouco o ponto de vista que seu personagem tem da sociedade, como ele vai se comportar em meio a ela. Diga um pouco do modo que seu personagem vai ganhar a vida, como ele pensa em fazer dinheiro, se ele tem projetos ou nÃ£o para o futuro, essas coisas bem estruturais/bÃ¡sicas na histÃ³ria de alguÃ©m.\r\nPosso te ajudar e clarear um pouco a sua mente com algumas dicas para que vocÃª possa redigir algo legal. Antes de tudo, vocÃª tem que saber como vai desenvolver e incorporar seu personagem em algum cenÃ¡rio de LS, seja ele civil, criminoso, etc. DÃª inÃ­cio a sua histÃ³ria contando um pouco de seus primeiros anos de vida, lÃ¡ na adolescÃªncia. ExperiÃªncias, comportamentos, influÃªncias, etc. Narre um pouco o ponto de vista que seu personagem tem da sociedade, como ele vai se comportar em meio a ela. Diga um pouco do modo que seu personagem vai ganhar a vida, como ele pensa em fazer dinheiro, se ele tem projetos ou nÃ£o para o futuro, essas coisas bem estruturais/bÃ¡sicas na histÃ³ria de alguÃ©m.\r\nPosso te ajudar e clarear um pouco a sua men', 'EUA', '1990-03-23', 2, 1, 'Crie a histÃ³ria do seu personagem.', 'kauanaqui'),
(47, 'L00k1', 'Kendrick_Hickey', 'Kendrick', 'Hickey', 1, 'Kendrick Hickey nasceu no dia 02/03/1990, morando com seu pai no CanadÃ¡ em um bairro bem humilde, seu pai e sua mÃ£e eram de origem caucasiana entÃ£o Kendrick era um jovem negro e na escola que ele estudava tinha diversos brancos e entÃ£o por isso ele sofria muito preconceito por que ele era um afrodescendente, Kendrick nÃ£o conseguia mais aguentar a desigualdade racial em sua escola entÃ£o resolvei parar com os estudos e procurar um emprego, ele parou com os estudos com 10 anos de idade, Kendrick com 15 anos conseguiu arrumar um emprego de entregador de jornal com isso ele ganhava o seu prÃ³prio dinheiro entÃ£o ele ajudava o seu pai com o seu salÃ¡rio e o resto ele gastava com besteiras, Kendrick quando completou 17 anos de idade foi conhecendo novas pessoas negras e foi se envolvendo com elas, ele nÃ£o sabia que essas pessoas eram envolvidas no crime, como furto, sequestro, trÃ¡fico etc. Kendrick ficava literalmente o dia todo andando com eles e faltando o trabalho atÃ© que ele foi expulso e nÃ£o tinha nenhum tipo de trabalho que se encaixa-se no tipo dele, atÃ© que ele foi comentar isso com os amigos que ele andava e os amigos apresentaram o trabalho deles e foi ai que Kendrick descobriu que eles eram envolvidos no crime, ele ficou meio surpreso por que nunca foi amigo de um criminoso atÃ© que Kendrick foi pra casa muito tarde e meio bÃªbado ele brigou com o seu pai pegou algumas roupas e tambÃ©m o dinheiro de seu pai e saiu de casa Kendrick para nÃ£o ficar prÃ³ximos de seus pais decidiu-se viajar para o interior e hoje em dia Kendrick tem 28 anos de idade e nÃ£o sente nenhuma falta de seus pais por mais que eles eram os Ãºnicos que deram valor a ele.', 'CanadÃ¡', '1990-03-02', 1, 3, 'Troca de caracterÃ­sticas.', 'well'),
(66, 'KinGz', 'Eric_Lynn', 'Eric', 'Lynn', 1, 'Eric Lynn nasceu e cresÃ§eu na linda e bela cidade de Palomino Creek, por volta do ano de 2010 aconteceu uma tragedia na vida de Lynn, seu pai Richard morreu em meio de uma briga de gangs, e sua mÃ£e Kathie era uma pessoa ausente, entÃ£o Lynn foi obrigado a passar mais tempo na rua com amigos e outras pessoas onde comeÃ§ou a se envolver com o crime e o trafico, Lynn aos seus 16 anos foi preso por trafico de drogas onde conheceu um rapaz chamado Norman Greensdale que virou amigo de Lynn logo apÃ³s os dois sairem da prisÃ£o.\r\n\r\nFora da prisÃ£o Norman e Lynn comeÃ§aram a fazer assaltos juntos aonde fortaleceu mais a amizade dos dois, hoje em dia Lynn e seu amigo Norman pensam em fundar uma gang com mais algumas pessoas e viver de roubos,trafico e diversas outras coisas.\r\n\r\n', 'Palominio Creek', '2001-01-10', 1, 0, '', 'well'),
(48, 'igorr', 'Oliver_Austin', 'Oliver', 'Austin', 1, 'Oliver Austin, nascido em Los Santos na data de 23/05/1993, tem uma famÃ­lia de classe media, sua famÃ­lia possuÃ­a duas casas uma em Los santos e outra em Las venturas, o seu pai tinha descoberto uma doenÃ§a grave na fase inicial mas nÃ£o dava muita \'bola\' para mÃ©dicos, entÃ£o continuou sua vida sem ir a algum mÃ©dico mesmo estando com o cÃ¢ncer.\r\n ApÃ³s alguns anos a doenÃ§a grave veio se agravando mais ainda na vida do pai de Austin levando assim a morte de seu pai. Austin na sua infÃ¢ncia sempre teve um grande sonho de entrar para a policia, jÃ¡ que sempre entrava em brigas para defender seus amigos e levando a sua mÃ£e que cuidava dele apÃ³s a morte do seu pai ir sempre na direÃ§Ã£o da escola e Austin continuava levando advertÃªncias na escola.\r\n Dylan jÃ¡ na fase adulta nÃ£o sabia se faria uma faculdade de direito para poder aumentar ainda mais a renda da famÃ­lia ou se seguiria seu sonho, Dylan com suas dÃºvidas decidiu consultar sua mÃ£e sobre a decisÃ£o do rumo que ele levaria Ã  vida dele.\r\n Com a mÃ£e de Dylan boa da saÃºde, vivendo em Los Santos, decidiu esperar a abertura de vagas na SACSO..\r\n', 'Estados Unidos', '1993-05-23', 1, 0, '', 'well');
INSERT INTO `avaliacoes` (`ID`, `Username`, `Name`, `Nome`, `Sobrenome`, `Gender`, `History`, `Origin`, `Birthdate`, `Status`, `VezesAvaliado`, `Motivo`, `AdminLevel`) VALUES
(49, 'Malbec', 'Gregory_Macaluso', 'Gregory', 'Macaluso', 1, 'Nascido em Los Santos, mais precisamente no dia trÃªs de Julho de mil novecentos e noventa, Gregory, filho da pais adotivos, nÃ£o foi uma daqueles crianÃ§as que tinham o direito de reclamar da infÃ¢ncia, afinal, Walsh, filho adotivo e Ãºnico da casa, era filho de James Sullivan e Maria Sullivan, ambos donos de uma tabacaria local, no bairro de East.\r\nGregory foi mais um daqueles garotos mimados pelos pais, afinal, James e Maria sabiam da criminalidade que a cidade Los Santos sofria e que ainda sofre, para sermos realistas, seguindo essa linha de raciocino, os pais de Gregory sempre quiseram que o filho fosse um advogado, talvez um medico, o importante era ter o prÃ³prio dinheiro e ganhar a vida de forma honesta.\r\nO Ãºnico problema nessa historia perfeita, jÃ¡ escrita e planejada pelos seus pais, era a adolescÃªncia de Gregory, afinal, estamos falando da cidade dos Anjos, onde maconha e cocaÃ­na sÃ£o apenas a ponta do iceberg nas famosas casas noturnas que a cidade oferece. Foi em uma dessas casas que Gregory conheceu o tÃ£o hoje conhecido como Gregory, atÃ© aqui, mal se sabia sobre esse tal Gregory, a Ãºnica certeza era que o garoto em seus plenos vinte anos andava com roupas de marcas, cordÃµes de outro, relÃ³gios famosos e claro, um bom carro. NÃ£o demorou muito para que Gregory conquistasse a confianÃ§a de Gregory, afinal, estÃ¡vamos falando do sonho de qualquer jovem americano, dinheiro, carros e mulheres. Por consequÃªncia, o controle que os pais de Gregory tinham sobre o garoto tambÃ©m foi se esgotando, festa apos festa, dia apos dia.\r\nGregory se viu fora da casa de seus pais em pleno vinte e dois anos, a amizade com Gregory que levou  o crescimento do garoto dentro de um grupo criminoso nÃ£o demorou, Gregory se via gastando montantes de dÃ³lares em casas noturnas, alÃ©m de esbanjar um belo sedan para a sua idade. Hoje Gregory jÃ¡ Ã© visto com homens que claramente sÃ£o investigados pela policia local de Los Santos, nÃ£o se sabe muito sobre esses homens, mas nÃ£o importa muito pra Gregory, afinal a grana entra e o seu vÃ­cio na noite consegue ser mantido atravÃ©s disso.', 'Los Santos', '1990-07-03', 1, 0, '', 'well'),
(51, 'Tyrok', 'Christopher_Deaver', 'Christopher', 'Deaver', 1, '  Em meados de 1980; a famÃ­lia Deaver recepciona um novo membro, e nÃ£o demorou muito tempo para que ele se acostumasse com o fato de morar em uma cidade pequena. O menino cresceu acompanhando o seu pai nas viagens de longas horas, que era o trabalho de caminhoneiro. Gostava bastante da ideia de dirigir por aÃ­ com o seu prÃ³prio caminhÃ£o, tanto que atÃ© aprendeu a dirigir sozinho ao completar treze anos. AlÃ©m do entusiasmo, as estradas eram a Ãºnica escapatÃ³ria que o rapaz tinha da realidade em que vivia. Seu pai, apesar de ser um bom homem, era um alcoÃ³latra compulsivo e usuÃ¡rio de drogas, e, por viajar para vÃ¡rios lugares, tinha um fÃ¡cil acesso para diversos tipos de narcÃ³ticos. NÃ£o demorou muito tempo para a famÃ­lia desabar apÃ³s a repentina mudanÃ§a que a separaÃ§Ã£o havia causado na vida dos pais. O rapaz tenta consolar o caminhoneiro, mas o encontra pendurado pelo pescoÃ§o no banheiro.\r\n\r\n   Muitos anos se passam, o rapaz sente falta das malditas viagens e trabalha temporariamente atÃ© obter a sua primeira conquista, uma velha caminhonete. AtÃ© entÃ£o, o homem dirige por aÃ­ e nÃ£o visa por nenhum rumo. Deixa sempre a rÃ¡dio ligada nas mÃºsicas que costumava compartilhar com o pai drogado e bÃªbado, pensando nos trajetos que sempre tomava. Atualmente, vive em um trailer e tenta se manter como pode.', 'Montgomery, Red County.', '1980-04-20', 1, 1, 'Favor retirar espaÃ§os no nome do personagem. Christopher _Deaver, para Christopher_Deaver.', 'well'),
(52, 'locke', 'John _Locke', 'John ', 'Locke', 1, 'Teste', 'Red County', '1998-02-06', 2, 2, 'Teste', 'well'),
(53, 'don', 'Chad_McKagan', 'Chad', 'McKagan', 1, 'Chad McKagan nasceu de sete meses, jÃ¡ veio todo apressado para o mundo. Seu pai sempre trabalhou com caminhÃµes e tinha um pequeno trailer em Flint Country onde vivia com sua famÃ­lia. O local era uma comunidade de white trash que se sustentavam de vÃ¡rias aÃ§Ãµes ilÃ­citas como roubar os condados vizinhos, traficar armas entre sÃ­, comercializar drogas em troca de qualquer coisa, roubo de cargas e tambÃ©m produÃ§Ã£o e contrabando de Moonshine.\r\n\r\nMesmo seu pai ordenando para nÃ£o se envolver nos grupinhos denominados \"clÃ£s\" dentro da comunidade, Chad nÃ£o dava boa e desobedecia toda vez que seu pai ia viajar, ele gostava de se aventurar, desde moleque os mais mais velhos dos clÃ£s ensinavam a crianÃ§ada a mexer em motores dos veÃ­culos roubados com adaptaÃ§Ãµes de pÃ©ssima qualidade que nem sempre davam certo. A grana era uma misÃ©ria mas Chad nÃ£o se importava, queria sempre estar junto com a galera da comunidade.\r\n\r\nO tempo foi passando e Chad teve de arrumar um emprego e deixar de lado a vida que estava aprendendo, junto com seu pai trabalhou na empresa do mesmo carregando e descarregando cargas. Sua vida foi assim por anos atÃ© comprar seu primeiro caminhÃ£o aos trinta anos. O pai de Chad jÃ¡ Ã© velho e falece um tempo depois da aquisiÃ§Ã£o, Chad ainda tem sua mÃ£e velha e precisa manter as despesas da casa de alguma forma.', 'Flint Country', '1985-10-15', 1, 0, '', 'well'),
(54, 'DouglasA', 'Kim_Greene', 'Kim', 'Greene', 2, 'Kim Greene, filha de pais asiÃ¡ticos, passou maior parte da infÃ¢ncia em sua cidade natal, Santa BÃ¡rbara, na CalifÃ³rnia. Seus pais vinheram muito jovem para os Estados Unidos, onde tiveram ela anos depois. A infÃ¢ncia de Kim foi tranquila, sem muitos problemas, uma garota sempre comportada, nÃ£o tÃ£o boa nos estudos. Sempre teve uma personalidade muito forte que por muitas vezes, causavam problemas para ela.\r\n\r\nJÃ¡ em sua adolescÃªncia, a cabeÃ§a de Kim foi mudando com o tempo, foi percebendo que ser do jeito que era, acarretava muitos problemas pra ela. Sendo assim ela decide mudar sua forma de pensar e agir de outra maneira, deixando sua personalidade forte de lado e trazendo uma \"nova\" Kim.', 'Santa BÃ¡rbara, CalifÃ³rnia', '1990-11-15', 1, 0, '', 'well'),
(55, 'Junior', 'Jerry_Catter', 'Jerry', 'Catter', 1, ' Jerry, nascido no dia 01/09/1995 em Nova York, foi criado por sua tia Many. Quando completou 15 anos comeÃ§ou a procurar algum trabalho para ajudar a pagar o tratamento da doenÃ§a que a tia tinha. Aos seus 18 anos, completou seus estudos e como um bom menino foi fazer sua faculdade jÃ¡ que tinha ganhado a bolsa.\r\n Apos 10 anos depois, Jerry se formou em administraÃ§Ã£o e estÃ¡ fazendo engenharia civil, com a perca de sua tia acabou fazendo que ele ficasse muito abalado, mas ergueu a cabeÃ§a e tenta ser um empresÃ¡rio ou algo tipo, para conseguir isso, Jerry tem que batalhar muito. Para tentar abrir uma empresa boa, Jerry se mudou para o interior de San Andreas e vai comeÃ§ar sua nova aventura.', 'Nova York', '1995-09-01', 1, 1, 'Favor retirar espaÃ§os no nome do personagem. Jerry _Catter, para Jerry_Catter', 'well'),
(56, 'Maxuelj', 'Morgan_Eisenhower', 'Morgan', 'Eisenhower', 1, 'Nascido em 5 de Janeiro, de 1979, numa pequena cidade do Estado de Ohio, chamada Grove City, Morgan, filho de Mary Annie Eisenhower com Edwards Martin Jackson, estaria jÃ¡ predestinado a ser um homem de bem, isso na teoria, pois seus pais trabalhavam com o pÃºblico, zelando pelo bem estar dos cidadÃ£os da pequena cidade. Mary, sua mÃ£e, trabalhava em um hospital como enfermeira, jÃ¡ seu pai, atuava na Ã¡rea polÃ­tica.\r\nAos 10 anos, Morgan jÃ¡ demonstrava ser um lÃ­der nato. Na escola, era representante de sala e sempre que acontecia algo que envolvia sua turma, por mais diversificada que fosse, ele queria estar ajudando. Quando chegou aos 12, se tornou inspetor de corredor e tentava nÃ£o sÃ³ abolir as coisas erradas, que contra as regras, mas tambÃ©m ficava sempre atento aos valentÃµes e acabou ficando conhecido por ser gentil e atencioso com seus colegas. \r\nQuando enfim chegou em sua maioridade, Morgan nÃ£o sabia ao certo o que faria da vida, pois gostava de muitas Ã¡reas do meio profissional e era difÃ­cil para ele escolher. Foi entÃ£o, que atrÃ¡s de um convite de um amigo de seu pai, que era Deputy Sheriff, ele foi visitar o departamento policial da cidade e participou do programa de interaÃ§Ã£o com a populaÃ§Ã£o chamado de Ride Along. A experiÃªncia que teve, estar participando dos procedimentos policiais como espectador, acabou chamando a atenÃ§Ã£o de Morgan, fazendo com que anos depois viesse a se tornar um Deputy Sheriff.\r\nAlguns anos depois, apÃ³s conseguir elevar seu cargo dentro da Sheriffâ€™s Departament do condado de Franklin County, chegando ao cargo de supervisÃ£o, por ser um dos responsÃ¡veis pela organizaÃ§Ã£o e elaboraÃ§Ã£o tÃ¡tica de algumas operaÃ§Ãµes e, tambÃ©m por mostrar um trabalho exemplar na Ã¡rea de administraÃ§Ã£o, Morgan decide que gostaria de expandir sua carreira e nÃ£o ficar se limitando apenas a Ã¡rea da sua cidade natal. Foi entÃ£o que ele pede para que seus amigos consigam uma facilitaÃ§Ã£o para estar ingressando na polÃ­cia na regiÃ£o de Red County. ApÃ³s muita burocracia e longas despedidas, devido a vÃ¡rios amigos que havia feito, conseguiu ser transferido para a Ã¡rea Montgomy, posteriormente sendo adicionado a equipe de sheriffs do departamento de Dillimore. Morgan estava apreensivo inicialmente, pois era algo novo, mas devido ao tempo de serviÃ§o em outro departamento, tinha a convicÃ§Ã£o que poderia estar fazendo a diferenÃ§a naquele departamento.\r\nDepois de 2 anos e meio no departamento, veio a conhecer uma mulher no qual lhe despertou muito interesse, nÃ£o sÃ³ por sua beleza fÃ­sica, mas sim por suas qualidades internas. Esta mulher se chama Katherine Bouffert, na Ã©poca com 23 anos de idade, enquanto Morgan com 31. Depois de 1 ano de relacionamento, Morgan fez o pedido de casamento e ela aceitou, mesmo temendo pelo futuro dos dois, devido a carreira e os perigos que ela oferecia. Em 1986, Katharine passou a se chamar entÃ£o Katherine Bouffert Eisenhower. JÃ¡ quanto a carreira, em 1988, Morgan veio a se tornar Sheriff, com uma grande aprovaÃ§Ã£o da populaÃ§Ã£o do condado, enquanto Katherine, que sempre estava ao seu lado, conseguiu conquistar sua vaga na equipe de supervisÃ£o, sendo hoje uma oficial que cuida do treinamento de campo, fazendo com que os novos deputies recÃ©m formados recebessem toda a orientaÃ§Ã£o extra para estar cumprindo o seu papel da melhor forma possÃ­vel.', 'Grove City, Ohio, EUA', '1979-01-05', 1, 0, '', 'Revolts'),
(57, 'IsaqueTyler', 'Isaque_Tyler', 'Isaque', 'Tyler', 1, 'Isaque veio de uma cidade grande conhecida como a segunda capital do paranÃ¡, ele busca uma nova oportunidade de vida fora de seu paÃ­s de origem, junto com seus irmÃ£os da mesma famÃ­lia, ele quer uma chance para crescer profissionalmente, seja em qualquer ramo, ele pensa em evoluir e ser competente em qualquer cargo que exercer, ele pretende crescer junto com seus irmÃ£os em seu mais novo lar, ele Ã© uma pessoa calma, respeita todos, sÃ³ nÃ£o respeita quando Ã© desrespeitado, ele tem um pouco de orgulho em si, mas nada muito grave, ele gosta de ajudar as pessoas, tem um vinculo de humildade muito grande, seu orgulho nÃ£o atrapalha a humildade, o seu orgulho sÃ³ Ã© afetado quando dizem que ele nÃ£o pode fazer alguma coisa, ou quando a pessoa Ã© desumilde com ele ou alguÃ©m.\r\nEle Ã© o mais velho de seus irmÃ£os, na sua escola ele sempre tirava notas baixas, faltava algumas aulas, sempre brincou com as coisas, ao passar do tempo, seus pais morreram em um acidente grave de carro, esta foi a pior fase da vida de Isaque, ele se encontrou em choque, ao passar do tempo foi se recuperando, conseguiu seu primeiro trabalho em um mercado chamado Meinher em sua cidade de natal, com este emprego ele ajudava a sua vÃ³, pois era o Ãºnico lugar pra onde eles poderiam ir, lÃ¡ eles cresceram, se desenvolvera, seus irmÃ£os buscaram um novo emprego, tiveram uma grande vida lÃ¡, neste perÃ­odo, Isaque nÃ£o se conformava mais em morar com sua vÃ³, ele conversou com seus irmÃ£os para eles se mudarem, todos concordaram, e sua vÃ³ jÃ¡ se conformava, Isaque deixou muitos amigos para trÃ¡s em sua cidade natal, sempre que pode ele mantem contato com seus amigos e parentes via internet, Isaque e seus irmÃ£os acabam de chegar em sua mais nova cidade, iniciando suas vidas.', 'Londrina-PR', '2000-08-16', 1, 1, 'HistÃ³ria fraca, dÃª vida ao seu personagem, desenvolva-o. Procure reformular a histÃ³ria do personagem.', 'well'),
(58, 'Blake', 'Kirk_Means', 'Kirk', 'Means', 1, 'Kirk Means, nascido em 1995, na cidade de Blueberry, passou sua infÃ¢ncia com seus pais na cidade, onde era um garoto feliz, brincalhÃ£o, que incomodava os vizinhos com suas traquinagens. Conforme ia crescendo, sua mÃ£e ia lhe educando em casa, e seu pai, quando nÃ£o estava viajando, ajudava ela. Nessas aulas em casa, ele foi aprendendo o bÃ¡sico que toda pessoa deve saber, mas seus pais lhe ensinaram tambÃ©m a respeitar a Deus acima de todas as coisas, lhe ensinaram a sempre respeitar e amar a sua famÃ­lia, assim como seus antepassados, que vieram da Ãustria pouco tempo antes da guerra de secessÃ£o americana comeÃ§ar, e escolheram lutar do lado dos confederados, para defender a famosa \"Dixieland\".', 'Bluebarry', '1995-04-12', 1, 0, '', 'well'),
(59, 'Davyskrr', 'Frank_Gambino', 'Frank', 'Gambino', 1, 'Frank Gambino nasceu e foi criado em Los Santos, mais especificamente em Marina, seus pais eram Italianos que migraram para os Estados Unidos afim de conhecer novos mares, ambos ganhavam dinheiro investindo no mercado de aÃ§Ãµes, criaram James dando tudo do bom e do melhor, jÃ¡ que dinheiro nÃ£o lhes faltava, o menino estudava nas melhores escolas e mesmo assim era taxado pelos colegas como \"riquinho metido\", por isso tinha dificuldades para se socializar e fez poucos amigos, nÃ£o ligava para os estudos, achava que sua vida estava ganha por ter nascido em berÃ§o de ouro.\r\nO tempo passou e ele viu que nÃ£o era bem assim, comeÃ§ou a trabalhar em um restaurante e com pouco tempo virou o gerente, ganhava um bom dinheiro, entretanto os negÃ³cios de seus pais tiveram uma enorme queda, faliram em pouco tempo e a Ãºnica escolha foi voltar para a Italia a procura de algo para fazer, Frank se viu com duas opÃ§Ãµes, poderia ficar em Los Santos e continuar sendo o gerente do restaurante ganhando uma boa grana ou poderia deixar Los Santos e ir para o Condado e ir a procura de outra coisa, o que seria um tiro no escuro. Na dÃºvida, Frank preferiu ir para o condado, deixou seus pais irem para a Italia e continuou seguindo sua vida normalmente, chegou em pelo condado de Bone County e comeÃ§ou Ã¡ trabalhar ne um restaurante onde seria bastante mafiosos.\r\nCom emprego, Frank comprou carros e casas, jÃ¡ que conseguia manter aquilo tudo, passou a morar em uma casa e com todo o dinheiro que obtia era proveniente de roubos e bicos, isso o deixava exausto, com o tempo tentou montar seu prÃ³prio negÃ³cio mas nÃ£o deu certo, hoje ele se encontra rico, lutando para conseguir o quÃª tÃ£o espera, isso tudo o fez mudar de mentalidade, jÃ¡ nÃ£o Ã© mais aquele riquinho metido, muito pelo contrÃ¡rio, agora Ã© um mafioso fodido que vive golpeando pelos condado e negociando com mafiosos.', 'Condado', '1994-12-24', 1, 1, 'Use apenas Nome e Sobrenome, parece que vocÃª colocou Underline.', 'well'),
(60, 'Felipe', 'Franklin_Jonhson', 'Franklin', 'Jonhson', 1, 'Franklin, era o mais velho de trÃªs irmÃ£os, tinha uma famÃ­lia de classe mÃ©dia, entÃ£o ele conseguia algumas coisas sem muita dificuldade. Franklin quando pequeno, gostava muito de caminhÃµes, por questÃ£o de seu pai ser caminhoneiro, Franklin queria ser que nem ele. Quando Franklin completou seus cinco anos, comeÃ§ou a estudar, Franklin era um menino estudioso, gostava de estudar, era calado, nÃ£o gostava muito de conversar. Se passou alguns anos e Franklin comeÃ§ou a mudar um pouco, comeÃ§ou a ficar mais bagunceiro, deixava de fazer suas liÃ§Ãµes de casa, mas no final do ano acabava passando, mas sua famÃ­lia nunca deixou de acreditar em Franklin. Franklin aos seus dez anos, comeÃ§ou a se soltar mais, comeÃ§ou a fazer mais amizades, e assim ia deixando a vergonha de lado, fazendo mais e mais amizades. Aos quinze anos, Franklin foi para o ensino mÃ©dio e depois de alguns meses comeÃ§ou a trabalhar como vendedor, dessa forma ele ficou com pouco tempo para ficar com a famÃ­lia, sair com os amigos e essas coisas, quando chegava em casa, chegava cansado, quando chegava jÃ¡ ia descansar. Aos dezessete anos, Franklin terminou o ensino mÃ©dio, e continuou trabalhando, juntando seu dinheiro para no futuro tentar comprar algo. Aos seus dezenove anos, ele saiu da casa de seus pais e foi para Los Santos, lÃ¡ em busca de uma vida melhor, conseguiu alugar uma casa lÃ¡ e ficou morando lÃ¡ e assim indo progredindo na vida aos poucos.', 'Vice City', '1985-03-07', 1, 0, '', 'well'),
(61, 'MK', 'Richard_Schmidt', 'Richard', 'Schmidt', 1, 'Richard Gallup Shmidt, nascido em Red County em 1981, filho de seu pai Charlles Shmidt advogado reconhecido por grande parte dos moradores dos condados de Red County, e sua mÃ£e Ashley Gallup professora de educaÃ§Ã£o fÃ­sica na escola estadual de Red County, atualmente mora em Palomino Creek em sua casa de mÃ©dio porte, trabalha em no San Andreas County Sheriff Office e atualmente ocupa o rank de Assistant Sheriff, um o terceiro maior rank dentro do departamento de sheriff. Richard se orgulha de tudo o que conquistou atÃ© hoje, conseguiu realizar o que tanto almejava e se sente confortÃ¡vel e estabilizado em sua vida como um todo. Richard quando mais novo, optou por sempre estar estudando e caminhando sempre ao lado do esporte, sempre levou os dois como um modo de vida saudÃ¡vel para que sempre estivesse em forma, enquanto estudava para que um dia entrasse no departamento, sempre arrumava um tempinho para estar praticando esporte juntamente com sua mÃ£e que lhe incentivava e muito a sempre estar apto com a saÃºde em dia, Richard com seu pai advogado e sempre podendo estar presenciando como seu pai era fabuloso no que fazia, sentiu que poderia e queria estar caminhando juntamente a seu pai e com esse pensamento comeÃ§ou a estudar livros e mais livros que seu pai acumulava em seu escritÃ³rio de casa, Richard passava horas com os olhos sob os livros, admirado com palavras difÃ­ceis que sempre tinha que ir perguntar a seu pai o que aquilo significava, e seu pai lhe falava - \"Se vocÃª quer saber o que significa, procure por si sÃ³ e nÃ£o venha atÃ© mim por ser uma escolha mais fÃ¡cil\" - Richard saia em direÃ§Ã£o ao dicionÃ¡rio e caÃ§ava dentre tantas palavras o significado. Em certo momento Charlles, pai de Richard, comeÃ§a a chegar estressado em casa e se trancava dentro do escritÃ³rio, Richard notando isso esperou que seu pai saÃ­sse do escritÃ³rio para que perguntasse a ele o que havia acontecido, e seu pai sendo o mais sincero com Richard respondeu, -\"Filho, tenho um cliente para defender porÃ©m quem esta acusando Ã© um rapaz muito mais muito cruel, perigoso e temido em Red County\" - Richard se espantou com o que seu pai disse e pediu para que ele se cuidasse e abandonasse o cliente, Charlles muito orgulhoso, nÃ£o deu ouvidos ao seu filho, passou dias e mais dias chegando em casa e se trancando em seu escritÃ³rio, atÃ© que um dia chegou em casa gritando que havia ganhado a causa do cliente, Charlles ao mesmo tempo demonstrou um semblante confuso e de desespero, Richard perguntou a seu pai apÃ³s o mesmo cessar a gritaria, o que havia acontecido com o tal rapaz cruel, entÃ£o seu pai ao ouvir a pergunta, fechou a cara, saindo diretamente para o seu escritÃ³rio, trancando-o novamente, Richard sem entender saiu correndo para ver a unidade do San Andreas County Sheriff Office que passava com a sirene ligada e passando pela sua rua em alta velocidade, admirado com a beleza daquilo.\r\nCerto dia, Richard em sua casa decide sair para caminhar, nesse momento seu pai chega em casa e diz para Richard nÃ£o sair de casa, pois aquele seu cliente que havia ganhado a causa, havia sido assassinado, Richard fica assustado e percebe que seu pai tambÃ©m esta, Richard sobe para seu quarto enquanto seu pai diz que precisa resolver algumas coisas no departamento de polÃ­cia ainda, Charlles naquele momento sai em caminho para o departamento e nunca mais volta para casa, seu filho recebe a notÃ­cia que seu pai havia sido morto em uma possÃ­vel tentativa de assalto, Richard apÃ³s lamentar, chorar e gritar muito se lembra que seu pai disse de um tal rapaz perigoso e ao relatar isto ao Sheriff, sai para sua casa caminhando e pensativo o que faria de sua vida, sendo agora somente ele e sua mÃ£e, Richard apÃ³s pensar muito decide tomar um rumo em sua vida em que conseguisse fazer o bem combatendo o mal, principalmente aquele onde destruiria famÃ­lias e entÃ£o da inicio a sua entrada no San Andreas County Sheriff Office e se dedica totalmente ao departamento, que hoje trabalha de forma excepcional e admiradora para muitos. Richard nunca conseguiu encontrar o tal rapaz perigoso mesmo depois dentro do departamento.', 'Red County', '1981-09-18', 1, 0, '', 'Revolts'),
(62, 'Rising', 'Yvone_Ebersbach', 'Yvone', 'Ebersbach', 1, 'Yvone Ebersbach nasceu na cidade de Berlim, Alemanha, no ano de 1992, provindo de uma famÃ­lia com muitos militares, por consequÃªncia, fortemente aderida ao militarismo. Sua mÃ£e, Mia, cuidava da casa, enquanto que seu pai, Klaus, era Sargento do ExÃ©rcito AlemÃ£o. Yvone desde cedo dava prioridade a seus estudos, entretanto nÃ£o visava ingressar no exÃ©rcito, tinha outros planos. Yvone aos 17 anos perde seu pai, morto por um ataque cardÃ­aco oriundo do alto stress em seu trabalho, ele era um homem sÃ©rio; levava as coisas muito a sÃ©rio e isso o comprometeu.\r\n\r\n Alguns anos depois do ocorrido com seu pai, Yvone junto a sua mÃ£e, decidiram se migrar para os Estados Unidos, tentando uma nova vida pelo condado de San Andreas, assim entÃ£o Yvone decidiu se esforÃ§ar bastante no militarismo para dar gosto ao seu pai, e fazer jus ao seu nome na sociedade.', 'Montgomery ', '1992-07-15', 1, 1, 'HistÃ³ria fraca, dÃª vida ao seu personagem, desenvolva-o. Procure reformular a histÃ³ria do personagem.', 'kauanaqui'),
(63, 'TheSouza', 'Michael_Johnson', 'Michael', 'Johnson', 1, '  Michael nasceu em 1992, comeÃ§ou sua vida ali em Montgomery mesmo, numa cidade pacata. Nessa Ã©poca o pai de Johnson jÃ¡ tinha morrido, a mÃ£e de Johnson  morreu no seu parto, minha vÃ´ pegou minha guarda.\r\n  Quando Johnson fez seus 12 anos de idade, umas de suas falas sempre na infÃ¢ncia foram \'Nunca desista dos seus sonhos, nunca desista de sua vida\'; Assim jÃ¡ sabia que sua vida nÃ£o iria ser fÃ¡cil.\r\n  Quando fez seus 18 anos de idade, se formou e entrou em uma faculdade para aprimorar seus conhecimentos, chegou lÃ¡ nÃ£o era enturmado com a galera vamos se dizer \'Recebeu vÃ¡rios trotes\'; Bom assim Johnson seguiu sua vida comeÃ§ou a a trabalhar numa empresa de porte pequeno bom ele achava um lixo, entÃ£o comeÃ§ou a trabalhar em seu prÃ³prio ramo.\r\nE assim segue sua vida.\r\n', 'Montgomery', '1992-01-22', 2, 1, 'HistÃ³ria fraca, dÃª vida ao seu personagem, desenvolva-o. Procure reformular a histÃ³ria do personagem.', 'kauanaqui'),
(64, 'Woozi', 'Daphne_Smith', 'Daphne', 'Smith', 2, '   Daphne Ã© um garota que possui atualmente 18 anos de idade, quando tinha cinco anos de idade morava com seus pai em Palominio, era uma garota que sempre gostou de ficar brincando com alguns colegas nas ruas de seu bairro.\r\n   O tempo foi passando e Daphne foi amadurecendo cada vez mas, aos seus 15 anos de idade conhece um garoto chamado Norman Greensdale, sua familia nÃ£o gostava muito do garoto, e Daphne comeÃ§ava a se envolver cada vez mas com o rapaz. Aos seus 18 anos de idade, sua familia ja nÃ£o era a mesma, seus pais brigavam toda hora, isso tudo por conta de Daphne e Norman ainda estarem juntos.\r\n   Um dia, Daphne recebe um convite de Norman para ir morar em sua casa, a garota sem pensar duas vezes aceita o convite e vai para casa do rapaz mesmo contra a vontade de seus pais. ', 'Palominio', '2000-08-25', 1, 0, '', 'well'),
(67, 'Revolts', 'Victoria_Maria', 'Victoria', 'Maria', 2, 'Teste', 'Teste', '1999-02-22', 1, 0, '', 'Marcelo'),
(68, 'Darkunite', 'Bryan_Walker', 'Bryan', 'Walker', 1, 'Bryan Walker Ã© um jovem adulto negro, nasceu em mil e novecentos e noventa e sete. Ele nasceu e foi criado na califÃ³rnia durante a sua vida toda. Walker Ã© um rapaz forte e saudÃ¡vel fisicamente, porÃ©m nÃ£o tanto psicologicamente, pois em um acidente recente perdeu o grande amor da sua vida sua mulher, onde ele agora passa a maior parte do tempo dedicando a sua vida ao mundo do crime, apÃ³s ter pedido contas do seu antigo emprego de mecÃ¢nico, onde supostamente trabalhava e fazia o seu dinheiro. Bryan tem um temperamento instÃ¡vel e Ã© quase bastante desconfiado o tempo todo.\r\nApÃ³s passado algum tempo Bryan Walker decidiu juntar-se Ã  uma das facÃ§Ãµes criminosas, onde supostamente tinha que servir os cabeÃ§as e crescer na vida.', 'CalifÃ³rnia', '1997-07-11', 1, 1, 'Reformular a histÃ³ria do personagem e corrigir a data de nascimento do personagem, 1997 ou 1993.', 'well'),
(69, 'Jao', 'Enzo_Avilov', 'Enzo', 'Avilov', 1, 'Em 1992, nasceu na cidade de San Fierro Enzo Avilov. O pai, Frank_Avilov, custou a se conformar com o nome, mas de tanto sua esposa Heather Avilov insistir no nome ele acabou concordando. Heather, a mÃ£e de Enzo, nasceu em Las Venturas e foi morar em San Fierro para estudar medicina em uma faculdade.\r\nNa infÃ¢ncia Enzo era muito curioso, e tudo que ele nÃ£o entendia o motivo ele perguntava ao seu pai, que as vezes atÃ© se chateava de tanta perguntas. Enzo tambÃ©m nunca se desgrudava de seu bonÃ© para nada, dormia com ele, e sempre saia com ele. SÃ³ tirava na hora de tomar banho. Sua mÃ£e chingava muito por isso, e sempre quando o garoto ia pra escola, ela escondia o bonÃ© dele, mas ele tinha outro guardado na mochila.\r\n\r\nNa adolescÃªncia Enzo comeÃ§ou a ficar sempre desligado, ele passa o dia inteiro pensando, e ninguem sabe em que, perdeu muitos amigos, pois achavam que o jovem nÃ£o dava atenÃ§Ã£o para os amigos. TembÃ©m tinha dificuldade de namorar pois sempre deixava as mulheres falando sozinhas. \r\nNa escola, o jovem que sÃ³ usa bonÃ© se dava muito bem, era um gÃªnio em calculos e em lÃ³gica apesar de estar sempre distraido. Seu pai tinha uma arma e saia muito para caÃ§ar, Enzo acompanhava o pai, e em um dia pediu para tentar. Ele tomou gosto pela coisa, e comeÃ§ou a ir sempre junto de seu pai.\r\n\r\nEnzo foi para Los Santos a fim de concluir uma faculdade de ciencias, ele queria trabalhar nesse ramo. \r\n\r\nApesar de nÃ£o saber nada de mecÃ¢nica, Enzo arruma um emprego de mecÃ¢nico em Los Santos e comeÃ§a a trabalhar na cidade afim de melhorar de vida e poder formar uma famÃ­lia e se estabelecer financeiramente na cidade, uma vez que o mesmo ainda mora em um conjunto habitacional da cidade de Los Santos.', 'Las Venturas ', '1992-09-23', 1, 1, 'Informe a data de nascimento correta do personagem. 1992 ou 1996.', 'well'),
(70, 'FELIP', 'Felipe_Treikwarz', 'Felipe', 'Treikwarz', 1, 'Felipe Ã© um jovem de 18 anos que nasceu em Los Santos, mora sozinho e quer crescer na vida', 'Los Santos', '2000-04-15', 2, 1, 'HistÃ³ria fraca, dÃª vida ao seu personagem, desenvolva-o. Procure reformular a histÃ³ria do personagem.', 'kauanaqui'),
(71, 'Maic', 'George_Lewinston', 'George', 'Lewinston', 1, 'George Lewinston Ã© um jovem caucasiano filho de um carpinteiro e uma babÃ¡, nascido e criado em Montgomery. Filho Ãºnico da famÃ­lia Lewinston, George seguiu os passos do pai como carpinteiro atÃ© os quinze quando se envolveu com um grupo de delinquentes e passou a deixar o trabalho um pouco de lado. \r\n\r\nLewinston se tornou um prospect em um motoclube de Montgomery em 2015, no qual Ã© afiliado atÃ© hoje. Deixando cada vez mais de lado o seu emprego de carpinteiro, Lewinston se envolvia gradativamente com o motoclube. \r\n\r\nEm 2016 Lewinston foi acusado de ameaÃ§ar a mulher de um carcereiro em troca de benefÃ­cios para membros do clube presos na prisÃ£o estadual. Lewinston foi preso e foi condenado Ã  dois anos. A situaÃ§Ã£o da sua famÃ­lia jÃ¡ nÃ£o era uma das melhores, sua mÃ£e acabou ficando doente neste meio tempo e a famÃ­lia nÃ£o tinha como arcar para o pagamento do tratamento, enquanto isso Lewinston tentava sobreviver na prisÃ£o.\r\n\r\nAtualmente, 2018, Lewinston deixa a prisÃ£o estadual depois de trabalhar ativamente para o motoclube lÃ¡ dentro. Lewinston agora estÃ¡ livre, com sua ficha suja e tenta se reerguer na vida financeira e social, ainda na cidade do inferno; Montgomery.', 'Montgomery', '1997-11-16', 1, 1, 'HistÃ³ria fraca, dÃª vida ao seu personagem, desenvolva-o. Procure reformular a histÃ³ria do personagem.', 'well'),
(72, 'Dadiva', 'Moses_Goddard', 'Moses', 'Goddard', 1, 'Moses Ã© um simples morador da pequena cidade de Blueberry. Moses trabalha como empacotador em um supermercado da cidade, nÃ£o gosta muito do que faz, mas foi o Ãºnico emprego que conseguiu arranjar pelas redondezas.\r\n\r\nÃ‰ dono de uma personalidade calma e amigÃ¡vel, tenta manter um bom relacionamento com todos ao seu redor. A infÃ¢ncia do jovem adulto sempre foi regada de muito amor e carinho dados por seus pais. Moses ainda mora com sua mÃ£e, pois as condiÃ§Ãµes nÃ£o sÃ£o favorÃ¡veis para a mudanÃ§a de vida no momento.\r\n\r\nMoses sonha em fazer parte do departamento de policia local, devora vÃ¡rios livros da biblioteca da cidade e estuda tudo que pode ser cobrado nos exame de qualificaÃ§Ãµes pessoais, alÃ©m de manter um bom condicionamento fÃ­sico que a profissÃ£o exige.  \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'Blueberry', '1995-12-11', 1, 1, 'Pedido do autor', 'well'),
(73, 'Pulaski', 'Ryan_Limonccelo', 'Ryan', 'Limonccelo', 1, 'Nasceu em 1999 no dia em que seu avÃ´ morreu. Seu pai nunca gostou dele, sempre batia nele sem motivo algum. Na infÃ¢ncia ele era maltratado pelo seu pai sua mÃ£e nÃ£o agredia o menino nunca gostou que o pai fazia isso. Ryan na sua adolescÃªncia descobriu que seu pai e seu avÃ´ lideravam a The crime Family Limonccelo. Ã‰ que sÃ©ria herdeiro do trono quando seu pai morresse.\r\nQuando Ryan estava crescendo, ele acumulava muita raiva de seu pai mais nÃ£o demonstrava isso. Ryan foi atÃ© o local dos rivais e reuniu todos ali para matar seu pai, e foi isso que aconteceu Ryan contou o  exato momento em que eles iriam atacar os rivais chegaram e mataram o pai de Ryan, ele comeÃ§ou a liderar a FamÃ­lia e ordenou que matassem os rivais que mataram seu pai.\r\nRyan se tornou oque temia como seu pai, um assasino de sangue frio que nÃ£o tem pena de ninguÃ©m.', 'Texas', '1999-02-09', 1, 1, 'HistÃ³ria fraca, dÃª vida ao seu personagem, desenvolva-o. Procure reformular a histÃ³ria do personagem.', 'kauanaqui'),
(74, 'Molotov', 'Angus_Riche', 'Angus', 'Riche', 1, 'Angus nascido em Dillimore, no condado de Red County, foi criado por uma famÃ­lia negra de classe baixa que dependia de seu pai para sobreviver. Angus era filho Ãºnico, mÃ£e desempregada e pai com dois empregos trabalhando de carteiro e caminhoneiro para poder pagar as contas. Na fase adolescente de Angus, ele jÃ¡ comeÃ§ou a fazer pequenos trabalhos para abrir o seu prÃ³prio negocio e alavancar sua situaÃ§Ã£o financeira. \r\n   Quando chegou na fase adulta, apÃ³s trabalhar e juntar dinheiro por anos ele conseguiu alugar uma casa e foi morar sozinho. Agora Angus coloca a ambiÃ§Ã£o em primeiro lugar, com o pensamento de criar sua prÃ³pria empresa e tirar sua famÃ­lia da misÃ©ria que o governo os colocou. ', 'Dillimore, Red County', '1993-04-14', 1, 0, '', 'kauanaqui'),
(75, 'uGiftz', 'Kevin_McKenzie', 'Kevin', 'McKenzie', 1, 'Kevin McKenzie 24 anos, caucasiano, olhos castanhos e cabelos pretos nasceu no estado de San Andreas, mais precisamente no condado de Los Santos. McKenzie era de famÃ­lia pobre morava no subÃºrbio e cresceu trabalhando como dishwasher em um restaurante prÃ³ximo ao seu bairro, o pai de McKenzie, John McKenzie trabalhava em construÃ§Ãµes e sua mÃ£e Daiana McKenzie era diarista, com dezessete anos de idade McKenzie comeÃ§ou a estudar a industria de filmes de Los Santos investiu em sua carreira e cursou artes cÃªnicas na American academy of dramatic arts. Ao completar dezoito anos McKenzie jÃ¡ tinha se apresentado em varias peÃ§as teatrais da cidade e em uma delas um jÃ¡ velho produtor de cinema o viu e o fez uma proposta para apresentar-se em uma sÃ©rie de televisÃ£o que ele estava escrevendo e preparando, sem pensar duas vezes aceitou e foi contratado pelo velho e promissor diretor, com dois anos de sÃ©rie McKenzie com vinte anos jÃ¡ havia ganhado um bom dinheiro, logo tirou seus pais do subÃºrbio e se estabeleceram em Richman com o passar dos anos McKenzie fez participaÃ§Ãµes e contracenou com vÃ¡rios artistas e em vÃ¡rios filmes e sua fortuna sÃ³ aumentava, com vinte e trÃªs anos McKenzie havia aberto uma empresa de incorporaÃ§Ã£o imobiliÃ¡ria conhecida como McKenzie State criando vÃ¡rios edifÃ­cios pelos Estados unidos e em 2017 uma construÃ§Ã£o errada feita pela McKenzie State desmoronou e causou a morte de dez pessoas os engenheiros foram julgados e presos jÃ¡ McKenzie teve que indenizar cerca de\r\num bilhÃ£o de dÃ³lares para as famÃ­lias das vitimas o que levou a sua falÃªncia. Em 2018 McKenzie vendeu a empresa e com o pouco dinheiro que tinha se mudou para o condado de Red County onde vive atualmente, jÃ¡ sua famÃ­lia conseguiu se manter em Richman e seu pai Ã© hoje um sucedido corretor de imoveis.\r\n', 'Los Santos', '1994-04-03', 1, 0, '', 'kauanaqui'),
(76, 'Thom', 'Seth_Crowther', 'Seth', 'Crowther', 1, 'Filho de agricultores, Seth nasceu na dÃ©cada de sessenta na fazenda de seus pais, ao lado da cidade de Fort Carson, sempre influenciado pelo pai, foi tido como o matuto da famÃ­lia logo cedo, aos dez anos.\r\nNessa idade o menino jÃ¡ era o encarregado por diversos trabalhos braÃ§ais na fazenda, sempre auxiliando o pai, cresceu ao lado de seus cinco irmÃ£os mais velhos, sua famÃ­lia era conhecida por toda a populaÃ§Ã£o da pequena cidade, tinham a fama de pessoas simples, humildes e gentis.\r\nSabendo apenas ler e escrever, Seth ingressou no exÃ©rcito dos Estados Unidos em mil novecentos e oitenta e trÃªs, bem novo, com apenas dezoito anos de idade, passou a morar no alojamento, distante de seus pais, cada um de seus irmÃ£os foi para um canto seguir seu caminho, os pais de Seth ficaram sozinhos na fazenda.\r\nNo mesmo ano, Seth foi convocado para lutar na invasÃ£o de Granada, a primeira grande operaÃ§Ã£o do exÃ©rcito desde a guerra do Vietnam, o homem se lembra muito bem daquele dia, jÃ¡ eram nove horas da manhÃ£, haviam passado quatro horas desde o inÃ­cio da invasÃ£o, que fora as cinco, ele corria por uma curta trincheira, quando pisou em falso numa armadilha feita pelos inimigos, acabou caindo num buraco de aproximadamente um metro, quebrou sua perna esquerda, acabou sendo um dos cento e dezesseis feridos do combate.\r\nSeth foi mandado para trabalhar no alojamento como escrivÃ£o atÃ© se recuperar. O tempo passou e o homem jÃ¡ estava recomposto, entretanto prestou um exÃ­mio serviÃ§o como escrivÃ£o, a ponto de ser mantido no cargo por alguns anos.\r\nRecentemente, jÃ¡ velho, Seth atingiu seu tempo do exÃ©rcito, foi para a reserva, fez suas malas e partiu para Fort Carson, pretende reencontrar seus pais e seus irmÃ£os com quem nÃ£o fala a muito tempo.', 'Fort Carson, San Andreas', '1965-08-13', 1, 0, '', 'kauanaqui'),
(77, 'Duduzinho', 'William_Hufford', 'William', 'Hufford', 1, 'William Hufford Ã© um americano, nascido e criado em Bayside. Seu pai era um agricultor local, fornecia mantimentos para a populaÃ§Ã£o de Bayside. Logo de inÃ­cio, Hufford se mostrou interessado nos afazeres de seu pai, sempre que possÃ­vel estava presente com o velho para desenvolver o seu desejo em seguir esta profissÃ£o.\r\nNa adolescÃªncia, William sempre foi um garoto esperto. Em seu tempo de aluno, William nÃ£o decepcionou os seus pais em questÃµes de notas e desempenho dentro do colÃ©gio. Nos tempos livres, estava lÃ¡ ele e seu pai no campo.\r\nJÃ¡ em sua vida adulta, Hufford se empenhou ao mÃ¡ximo para conseguir entrar em uma universidade publica e seguir o seu sonho de virar um homem especializado, nÃ£o somente em tÃ©cnica mas, e aprofundado quando o assunto for agricultura.\r\nNem tudo sai como planejado, o recÃ©m adulto toma frente dos negÃ³cios de seu pai logo apÃ³s o seu falecimento. Em tempos difÃ­ceis, seu objetivo Ã© tornar o negÃ³cio lucrativo e tentar buscar o seu antigo sonho.', 'Blueberry, San Andreas', '1991-02-20', 1, 0, '', 'kauanaqui'),
(78, 'Mayeski', 'Joseph_Deere', 'Joseph', 'Deere', 1, ' Joseph nascido no condado de Red Country no estado de San Andreas, tinha os pais agricultores rurais, eles possuÃ­am uma fazenda com pouco mais de 700 hectares e mais de 300 vacas de leite, que gerava uma renda boa para a famÃ­lia viver bem.\r\n Desde a infÃ¢ncia Joseph sempre se deu bem nos estudos, reserva seu tempo para ler livros sobre armas e ajudar o pai nas tarefas da fazenda, como ordenhar vacas, e cuidar da roÃ§a.\r\n Na adolescÃªncia de Jhope, como era conhecido, ele tinha como hobby cuidar das espingardas do pai e algumas vezes sair para caÃ§ar com os amigos, mas ainda era focado nas tarefas de casa e nos estudos, ele sonhava em ser um Xerife, pois admirava os mesmos daquele condado.\r\n O tempo foi passando, Joseph termina o ensino mÃ©dio, comeÃ§a a trabalhar manhÃ£ e tarde com seu pai na fazenda, eles cresceram bastante de um tempo para cÃ¡, compraram novas mÃ¡quinas. Mas apesar de Joseph ter uma vida boa no campo, o sonho dele era proteger e cuidar das pessoas.\r\n Joseph completa dezoito anos, Ã© chamado para o exÃ©rcito americano, claro que ele nÃ£o recusaria a oferta, pois era apaixonado por armas e servir as pessoas.\r\n O crescido Jhope, nÃ£o teve muitas dificuldades dentro do exÃ©rcito, muito ao contrÃ¡rio, ele estava se saindo muito bem, que chegou ser promovido, tambÃ©m convidado para as forÃ§as especiais do exercito americano.\r\n TrÃªs anos de forÃ§as especiais se passam, o tempo de trabalho de Joseph termina, ele atÃ© recebe uma nova oportunidade dentro do exÃ©rcito para assinar mais uma ano, ele recusa, pois estaria com saudades do condado e das pessoas que ali viviam.\r\n Com vinte e dois anos de idade, Joseph volta para a fazenda de sua famÃ­lia, e revisa o tempo entre ajudar o pai na fazenda e os estudos, agora ele quer focar em fazer a prova para ser um Xerife.', 'Red Country, San Andreas', '1996-01-07', 1, 0, '', 'kauanaqui'),
(79, 'Phelipe', 'Phelipe_Smith', 'Phelipe', 'Smith', 1, 'Phelipe nasceu na cidade de San Fierro prÃ³ximo da Ã¡rea rural. Desde sua infÃ¢ncia o garoto adquiria os costumes que pessoas da regiÃ£o tinham, inclusive seu pai.                                                                                                                                                                                                                                                                                                                        Fazia diversas atividades para ajudar seu pai, em seu trabalho como agricultor. NÃ£o era nada muito grande, pescavam por diversÃ£o e necessidade, a famÃ­lia produzia o que utilizava em consumo prÃ³prio. Phelipe era um garoto exemplar, estudava e ajudava seus pais no que precisavam. Teve bom desempenho escolar atÃ© se formar. Mudou-se para Los Santos para iniciar ali a sua prÃ³pria vida. Iniciou fazendo bicos atÃ© conseguir dinheiro o suficiente para comprar um veÃ­culo para trabalho. No momento fica no ramo dos transportes como caminhoneiro, nada fixo. Pensa em fazer o teste para entrar na policia. Faz viagens com os amigos a trabalho e usa o fim de semana para saÃ­rem de moto e beberem em bares. Segue a vida buscando manter as amizades, trabalhando e se divertindo juntos.', 'Los Santos', '1990-02-10', 1, 0, '', 'kauanaqui'),
(80, 'DaniloX', 'Roger_Pinney', 'Roger', 'Pinney', 1, '  VerÃ£o de 1992 nasce Roger Pinney no Hospital Carson General em Liberty City, filho de um casal poderoso, Garrett Pinney, um arquiteto famoso e Anne Hagovitch uma diretora financeira, pertencia a uma famÃ­lia Francesa. Viviam em um bairro nobre de Liberty city, Shoreside Vale, uma Ã¡rea residencial cercada de mansÃµes e com Ã¡reas de lazer.\r\n  A famÃ­lia morava numa mansÃ£o com vista para o pedaÃ§o norte de Staunton Island e um pouco de Portland. Perto das montanhas, logo ao lado  fica a represa Cochrane Dam.\r\n  Roger viveu sua infÃ¢ncia super tranquila ao lado de seus pais, estudava na melhor escola da regiÃ£o tendo um Ã³timo ensino e uma Ã³tima influÃªncia. Aos dezoito anos de idade teve Ãªxito em concluir o ensino, porÃ©m estava um pouco indeciso em qual faculdade fazer, ou qual profissÃ£o seguir.\r\n  JÃ¡ aos vinte anos de idade Roger Ã© chamado por seus pais, os mesmos convocam-o para uma conversa explicando a Roger que iriam viajar para o Estado de San Andreas, pois jÃ¡ viveram uma boa parte de suas vidas em Liberty City e queriam viver em um lugar novo. Roger nÃ£o se importou muito e concordou com seus pais. Um mÃªs depois a mudanÃ§a ocorre, todos morariam em um bairro nobre da cidade de Los Santos, prÃ³ximo a Richman. O casal compra um conjunto de casas e ali vivem com Roger.\r\n  Com sua nova vida que ia levando por Los Santos, Roger decide seguir o caminho de seu pai, assim fazendo a faculdade de Arquitetura e urbanismo, na Faculdade Federal de Los Santos.\r\n', 'Los Angeles', '1992-02-10', 1, 1, 'Informe a data de nascimento correta do personagem. 1991 ou 1992.', 'kauanaqui'),
(81, 'Gusmatador', 'David_Worsham', 'David', 'Worsham', 1, ' Nascido no dia doze de marÃ§o de mil novecentos e noventa e seis, no Hospital Central de Palomino Creek. David por possuir uma famÃ­lia muito humilde, nÃ£o recebeu o incentivo do estudo, sendo obrigado por sua famÃ­lia a trabalhar na lavoura prÃ³ximo a sua casa, ele decidiu muito jovem de que seu futuro sÃ³ seria mudado se estudasse assim se inscreveu na High School de Dillimore, onde mais tarde se formaria e seria aprovado na University of San Andreas, no curso de Medicina. Apuseram alguns meses de curso o mesmo teria ficado desmotivado por conta que nÃ£o era apoiado por sua famÃ­lia, mas nunca abriu mÃ£o de seus estudos, pois teria um sonho de infÃ¢ncia de fazer com que as vidas fossem preservadas. \r\n PorÃ©m nÃ£o possuÃ­a familiares ou amigos dentro de qual quer organizaÃ§Ã£o governamental. ApÃ´s meses se preparando fisicamente e mentalmente para que se pode entÃ£o se aplicar para fazer sua historia dentro de um departamento, recebe a noticia que seu pai teria sido assassinado apÃ´s reagir a um assalto vindo para lhe visitar em Los Santos. Mesmo com sede de vingar a morte de seu pai assassinado de forma covarde, porÃ©m nÃ£o desiste de seu sonho de ser uma pessoa que faz a diferenÃ§a, sendo um rapaz correto e mente aberta e uma pessoa de um coraÃ§Ã£o bom, decide que sÃ³ poderÃ¡ fazer sua vinganÃ§a de forma que orgulharia seu pai, salvando mais vidas, para que outras famÃ­lias nÃ£o sofram como ele sofreu. Diante da morte do seu pai, busca fazer a diferenÃ§a em uma sociedade cheia de pessoas que sÃ³ pensa em si mesmo.', 'Palomino Creek', '1996-08-29', 1, 1, 'Informe a data de nascimento correta do personagem. 1992 ou 1996.', 'well'),
(82, '', 'Raphael_Braian', 'Raphael', 'Braian', 1, 'Raphael Braian nasceu nas redondezas de Ohio, onde viveu sua infÃ¢ncia e adolescÃªncia. Durante a infÃ¢ncia, tinha diversos amigos, alguns de seu bairro e colÃ©gio, passava as tardes brincando e se divertindo com seus colegas e irmÃ£os,  morava em uma casa pequena e nÃ£o muito luxuosa, onde dividia quarto com seus dois irmÃ£os Clarice e Thomas, sempre conviveu com um trauma por ter um pai ausente na famÃ­lia, pois nÃ£o pagava pensÃ£o nem visitava as crianÃ§as, devido a esse motivo sua famÃ­lia sempre foi pobre mas prezavam a comida que tinham, sempre se virando do jeito que conseguiam.\r\nEm sua adolescÃªncia, mantinha uma rotina com pouco tempo livre, entre escola e trabalho, pois Raphael e sua irmÃ£ tinham de ajudar com as despesas em casa, logo que seu irmÃ£o Thomas, havia ido embora para os condados de Los Santos, apÃ³s brigar com sua mÃ£e e ir embora de casa. Raphael, resolve entÃ£o, ir atrÃ¡s de seu pai apÃ³s decidir que teria que conhecer o mesmo, apÃ³s dias  de procura, consumindo seu tempo livre para procura-lo, recebe uma noticia de um amigo, que dizia ter visto um sujeito parecido com o que Raphael havia descrito, entrando em uma casa velha e que aparentava estar abandonada, nÃ£o muito longe dali, sendo assim no dia seguinte, Raphael comeÃ§a a andar, indo atÃ© onde seu amigo lhe dissera. Chegando lÃ¡, se depara com a tal casa, que caÃ­a aos pedaÃ§os, logo da algumas batidinhas apressadas na porta escutando algumas latas caindo e passos atÃ© a porta e entÃ£o ela se abre.\r\nA primeira reaÃ§Ã£o de Raphael nÃ£o foi a melhor, ao ver o sujeito que era idÃªntico ao que sua mÃ£e e amigo descrevera sendo assim seu pai , ele estava todo sujo e aparentava nÃ£o tomar um bom banho a dias, entÃ£o o sujeito pergunta quem era aquele rapaz, que havia batido em sua porta Raphael logo se apressa e diz  ser o filho caÃ§ula dele, entÃ£o o homem abre um grande sorriso no rosto e o convida para entrar, desconfiado e meio contra sua prÃ³pria vontade ele entra e se senta em um sofÃ¡ empoeirado. A casa em que vivera desde entÃ£o, era pequena e simples mas se comparava a uma mansÃ£o em relaÃ§Ã£o a casa de seu pai, que havia janelas e mÃ³veis quebrados, pilhas grandes de lixo e roupas sujas espalhadas pela casa, eles comeÃ§am a conversar e seu pai lhe oferece uma bebida, entretanto Raphael recusa dizendo-lhe que logo iria partir, o pai percebendo a decepÃ§Ã£o no rosto do filho nÃ£o insiste, eles se cumprimentam e se despedem. Logo apÃ³s Raphael perceber o estado em que seu pai estava, resolve se focar firmemente em seus estudos completando o ensino mÃ©dio, e com dificuldade ingressando em uma faculdade de direito.\r\nFase adulta: ApÃ³s o tÃ©rmino da faculdade Raphael, se sentira pronto pro mercado de trabalho, porÃ©m a pequena cidade em que vivia nÃ£o lhe dava muitas opÃ§Ãµes, entÃ£o ele comeÃ§ou a conversar com seu irmÃ£o Thomas, que havia mantido contato, e nÃ£o conversa muito desde entÃ£o, ele dizia que havia ido para Palomino Creek, e que estava vivendo a vida como um caminhoneiro, entÃ£o Raphael resolve sair dali e ir para onde seu irmÃ£o estava, se despede de sua mÃ£e e irmÃ£ e pega um voo para Los Santos onde ali estava Thomas esperando no aeroporto, os dois se cumprimentam apÃ³s um longo tempo sem se ver e se dirigem a Palomino. Chegando lÃ¡ Raphael percebe que Palomino nÃ£o era como seu irmÃ£o a descrevera, e Ã© pouco maior que sua antiga cidade, sem ter muitas opÃ§Ãµes entra como estagiÃ¡rio na empresa que seu irmÃ£o trabalha, enquanto fazia uma auto-escola para tirar a habilitaÃ§Ã£o para dirigir caminhÃµes, apÃ³s 6 meses Ã© promovido para caminhoneiro e pega sua carteira, finalmente saÃ­ da casa do irmÃ£o e compra uma casa pequena na mesma regiÃ£o.', 'Ohio', '1994-06-20', 1, 0, '', 'well'),
(83, 'Patolino', 'Kaven_Trout', 'Kaven', 'Trout', 1, 'Kaven Trout, o tÃ­pico jovem americano que nÃ£o recebeu oportunidades, por morar em um bairro pobre e alÃ©m do mais nÃ£o ter o pai ao seu lado.\r\nA senhora mÃ£e de Trout, sempre trabalhou bastante em seu dia-a-dia para nÃ£o ter um filho que envolvesse no trÃ¡fico de drogas, que no caso Ã© uma visÃ£o que vai bem alÃ©m do bairro a onde eles moram, Inglewood th 55.\r\nAlÃ©m de ter passado educaÃ§Ã£o e ter dado estudo para seu filho, ele ainda se envolvia com os \'direitas\' da situaÃ§Ã£o, querendo ter fama entre seus amigos e as garotas.\r\nAssim sendo influenciado pelo trÃ¡fico de drogas entre gangues locais, sem muito o que fazer aos poucos Trout foi ganhando experiÃªncia com isso e parando de vez com seus estudos para tirar um dinheiro no trÃ¡fico e ajudar sua mÃ£e em casa, com suas contas, sÃ³ que com brigas e intrigas na maioria das vezes. \r\nPor sua mÃ£e nÃ£o aceitar isso, ela a maioria das vezes acaba comunicando Ã  vizinhos curiosos que acabam atrapalhando ele e assim influÃªnciando mais ele a viver neste caminho, por nÃ£o dar bola ao que falam e muito menos a \'curiosos\'.\r\n\r\nDepois de um tempo, sumiu de Los Santos, foi para outra cidade.', 'Los Santos', '1994-08-01', 1, 0, '', 'kauanaqui');
INSERT INTO `avaliacoes` (`ID`, `Username`, `Name`, `Nome`, `Sobrenome`, `Gender`, `History`, `Origin`, `Birthdate`, `Status`, `VezesAvaliado`, `Motivo`, `AdminLevel`) VALUES
(84, 'Carlao', 'Nashawn_Pruitt', 'Nashawn', 'Pruitt', 1, 'Nashawn Pruitt, tem seus dezesseis anos criado no sul de Palomino, vem de uma famÃ­lia de um bairro de Palomino tomado por uma gangue, classe baixa, estuda numa escola de acordo com o bairro, blasse baixa, tambÃ©m. Nashawn tem uma rotina padrÃ£o, escola, casa, casa, escola, nunca foi de ficar vacilando, sempre seguiu os conselhos de sua mÃ£e. De uns tempos pra cÃ¡, Nashawn descobre que seu pai bate em sua mÃ£e e guarda isso para sÃ­, depois disso sua rotina muda, Nashawn comeÃ§a a se envolver com supostos membros da gangue que domina o bairro onde ele mora, meses se passam e Nashawn abandona a escola, devido seu envolvimento com a gangue. Nashawn se perde no mundÃ£o, comeÃ§a a usar drogas e traficar , tem sua renda do pior modo, o ilegal.\r\nNashawn um dia chega em casa e vÃª sua mÃ£e chorando, nÃ£o pensou outra coisa, foi direto tirar satisfaÃ§Ã£o com seu pai, pergunta o motivo dele ter batido na sua mÃ£e e um bate boca comeÃ§a, Nashawn tenta ir para cima de seu pai, mas falha e Ã© jogado no chÃ£o, seu pai entÃ£o fala que vai bater nele atÃ© ele aprender e avanÃ§a pra cima dele, nisso Nashawn saca uma .40 da cintura e larga trÃªs tiros na altura do peito de seu pai.\r\nNashawn acaba indo parar no reformatÃ³rio, fica cerca de dois anos lÃ¡ e volta para sua casa, como jÃ¡ era de se esperar, Nashawn volta para as ruas, agora ainda mais respeitado e focado em ficar vadiando com os manos que dominam a Ã¡rea.', 'Palomino', '2000-07-11', 1, 1, 'Corrigir a idade do personagem', 'kauanaqui'),
(85, 'iCore', 'Justin_Goodman', 'Justin', 'Goodman', 1, 'Justin Goodman nasceu no dia 13 de abril as 9:00PM no hospital de Fort Carson, ele nasceu saudÃ¡vel e com olhinhos claros. Seu pai engenheiro aeronÃ¡utico tinha um emprego fixo em uma fabricante de aeronaves porÃ©m seu pai foi posto para fora depois de um grande corte de orÃ§amento dentro da empresa, sem emprego sua famÃ­lia nÃ£o tinha como se sustentar entÃ£o seu pai teve uma grande ideia e reuniu um grupo de investidores Ã© assim fundou a Airmax, seu objetivo principal era construir aviÃµes de pequeno porte para circular em San Andreas. Quando Justin completou vinte e cinco anos o seu pai faleceu Ã© ele tornou-se o CEO da pequena empresa do seu pai, como ele nÃ£o entendia nada de engenharia ele contratou algumas pessoas para trabalhar para ele, assim sÃ³ cuidando da parte financeira da empresa, colocou grande parte da empresa na bolsa de valores assim podendo unir forÃ§as com grandes sÃ³cios. O Justin Ã© uma pessoa muito inteligente, dedicada e esforÃ§ada, aparenta ter amor a famÃ­lia e defende o capitalismo com unhas e dentes.', 'Red County', '1995-04-13', 1, 0, '', 'kauanaqui'),
(86, 'VolgTayler', 'Volg_Tayler', 'Volg', 'Tayler', 1, 'Ao nascer em MilÃ£o, Volg cresceu como uma crianÃ§a comum e feliz, seus eram militares e sua famÃ­lia vivia em armonia. Volg vem de uma familia tradicional e tudo que aprendeu, buscou levar pra sua vida. Aos 17 anos Volg jÃ¡ havia terminado a escola e se preparava para ir a faculdade como planejado, porÃ©m acabaram ocorrendo problemas onde o garoto teve de deixar a escola para se alistar e acabou passando, impedindo que o rapaz seguisse a faculdade. \r\nVolg entÃ£o seguiu firme jÃ¡ que tinha o apoio de todos seus familiares. Ao concluir o TG, Volg retorna para casa e decide ir atÃ© seus pais anunciar que estaria se mudando para San Andreas , onde tentaria seguir carreira Milita lÃ¡, Volg fez, veio para San Andreas aos 20 anos, passou mais sete focando em crescer na cidade e ter sua primeira base para seguir naquilo que tanto almeja, Volg agora tem diversos objetivos para concluir e um deles Ã© concluir seu sonho.', 'Italia, MilÃ£o', '1990-12-07', 1, 1, 'Favor retirar espaÃ§os no nome do personagem. Volg _Tayler, para Volg_Tayler. Dar uma Ãºltima revisada na histÃ³ria do personagem.', 'Revolts'),
(87, 'Axl', 'Dmitri_Scalovisck', 'Dmitri', 'Scalovisck', 1, 'Nascido em Las Venturas em 1995 no Hospital Geral de Las Venturas, Dmitri desde muito pequeno teve seu envolvimento com o crime por causa de sua irmÃ£ adotiva mais nova chamada Atsuki Sakuya, ele sempre faz oque Atsuki pedir mesmo afirmando que nÃ£o obedece Atsuki o seu jeito de agir contraria ele, CEO da empresa Sakuya Building e dono de uma grande mÃ¡fia Dmitri Ã© uma pessoa muito vaidosa e ignorante, seus crimes sempre sÃ£o bem articulados.\r\nNÃ£o se sabe muito sobre a infÃ£ncia de Dmitri pelo fato dele ser uma pessoa muito calada e sombria, jÃ¡ foi preso vÃ¡rias vezes por homÃ­cidios e roubos a grandes empresas, alÃ©m de fazer corrupÃ§Ã£o e lavagem de dinheiro, algumas vezes Dmitri gosta de fazer o mal parar se divertir, gosta muito de ver os outros sofrerem.', 'Las Venturas', '1995-06-30', 1, 0, '', 'kauanaqui'),
(90, 'Edurdo', 'Dante_Bellandi', 'Dante', 'Bellandi', 1, 'Dante nasceu em Bolzano, uma cidade no norte da ItÃ¡lia, na provÃ­ncia de Trentino Alto-Ãdige, atualmente uma regiÃ£o autÃ³noma do Sul do Tirol.\r\nFilho de uma famÃ­lia abastada, seus avÃ³s eram donos de vÃ¡rios hectares de terras que se estendiam nas proximidades dos sopÃ©s dos Alpes onde a famÃ­lia havia subsistido da agricultura, mais precisamente da produÃ§Ã£o vinÃ­cola por vÃ¡rias geraÃ§Ãµes antes de Dante.\r\nSua infÃ¢ncia foi serena, e a adolescÃªncia livre de grandes agitaÃ§Ãµes, numa altura em que a ItÃ¡lia parecia estar ainda a despertar de um longo sono no perÃ­odo pÃ³s-guerra, sono esse que estava jÃ¡ longe da geraÃ§Ã£o de Dante mas que era ainda bem vÃ­vido pela maioria dos italianos, tendo sido testemunhado na primeira pessoa por seus pais e avÃ³s que faziam questÃ£o de o recordar a cada instante da sorte que tinham os rapazes da sua geraÃ§Ã£o e o presenteando com longas histÃ³rias de Nazis e Fascistas, de garotos mais pequenos que ele que tinham sido jogados em campos de concentraÃ§Ã£o para nÃ£o mais voltarem a sair e de bravos americanos que tinham vindo para os salvar.\r\nOs anos passaram rapidamente, frequentando os melhores colÃ©gios na ItÃ¡lia que o dinheiro pudesse pagar, com a atenÃ§Ã£o bipartida entre a dedicaÃ§Ã£o aos estudos e o auxÃ­lio na gestÃ£o das terras da famÃ­lia. Foi em 1974, prÃ³ximo de atingir a maioridade que Dante recebeu uma bolsa de mÃ©rito para ingressar na faculdade de Medicina de Harvard, nos Estados Unidos.\r\nO garoto, jÃ¡ um homem, recebeu seu diploma como Mestre em Medicina em 1980, aos 24 anos e imediatamente comeÃ§ou a trabalhar no Hospital de Brigham and Women em Boston onde apÃ³s dois anos de prÃ¡tica clÃ­nica generalista ingressou no internato de Cirurgia Geral onde viria adquirir o tÃ­tulo de Especialista em 1988, com 31 anos.\r\nContinuou a trabalhar com dedicaÃ§Ã£o e afinco Ã  instituiÃ§Ã£o por mais de uma dÃ©cada atÃ© que em 1999, recebeu uma proposta de trabalha da Columbia University em Nova Iorque para trabalhar no Hospital Nova-Iorquino e dar aulas na faculdade de Cirurgia, sua Ã¡rea de especialidade. A mudanÃ§a para a Grande MaÃ§Ã£ como alguns a apelidavam nÃ£o pareceu incomodÃ¡-lo, afinal de contas Boston era por si sÃ³ uma das maiores cidades dos EUA e capital de estado.\r\nNa dÃ©cada que se passou, com o inÃ­cio do novo milÃ©nio, Dante viajou por todo o Norte da AmÃ©rica, participando em congressos e dando palestras e formaÃ§Ãµes, enriquecendo o seu currÃ­culo profissional e acadÃ©mico e dando pouco espaÃ§o para qualquer Ã­nfima possibilidade, ou atÃ© mesmo a simples ideia, de vir a constituir famÃ­lia. No entanto o trabalho Ã¡rduo viriam a ser recompensandos, tendo recebido aos 54 anos em 2010 o cargo de Head of Surgery (Diretor CirÃºrgico) do Hospital ClÃ­nico de Nova Iorque, cargo esse que ocupou nos sete anos seguintes, dirigindo o serviÃ§o e regendo a cadeira homÃ³loga na Universidade de Columbia.\r\nEm 2017, para surpresa de muitos, apresentou sua carta de resignaÃ§Ã£o, avanÃ§ando com os papÃ©is para uma reforma antecipada. Aquilo que o motivou? Nos Ãºltimos trÃªs anos, ainda que totalmente realizado profissional e academicamente, uma sensaÃ§Ã£o de nostalgia vinha preenchendo-lhe a mente. Sentia falta da sua juventude, dos tempos nas terras da famÃ­lia, alheio Ã  confusÃ£o e Ã  agitaÃ§Ã£o citadinas, queria paz e sossego, era um homem que hÃ¡ muito havia ultrapassado o pico de sua idade... A questÃ£o monetÃ¡ria nÃ£o era um problema para o velho mÃ©dico que rapidamente juntou suas coisas e decidiu mudar-se para um pequeno condado nos arredores de San Andreas.\r\nAtualmente Dante goza de sua reforma do serviÃ§o de saÃºde pÃºblica, realizando ainda pequenas consultas e serviÃ§os mÃ©dicos de apoio Ã  comunidade e dando de tempos em tempos aÃ§Ãµes de formaÃ§Ã£o para instituiÃ§Ãµes de saÃºde ou escolas da regiÃ£o.\r\n', 'Bolzano', '1965-11-16', 1, 0, '', 'Revolts'),
(88, 'LeeoCosta', 'Kevin_Worley', 'Kevin', 'Worley', 1, 'Kevin Worley nasceu em Los Angeles, a maior cidade do estado da CalifÃ³rnia. Era o filho mais velho de um casal de agricultores, seu pai era bem conhecido na regiÃ£o, comeÃ§ou se uma simples horta e colheu uma grande lavoura. Worley nÃ£o gostava muito daquilo, apenas tentava agradar seu pai, diferente de Worley, seu irmÃ£o mais novo sempre gostou da Ã¡rea e ficava constantemente ajudando o seu pai. Worley era um garoto que nÃ£o ligava muito para a vida, pensava muito nele e muitas das vezes era uma pessoa grossa, nunca escolheu uma carreira profissional para si, achava que aquilo era desnecessÃ¡rio e nÃ£o pensava que um dia o seu pai poderia morrer. Seu pai estava crescendo cada vez mais, seu portofÃ³lio sÃ³ aumentava, junto dele o dinheiro tambÃ©m. Em sua infÃ¢ncia era comum notar viaturas do departamento de xerifes passar pela regiÃ£o, Worley gostava muito daquilo, apesar disso nunca se aprofundou sobre a Ã¡rea policial. Quando adolescente Michael foi mandado para San Andreas, foi para o local fazer um pequeno estÃ¡gio em uma empresa local, acabou ficando por lÃ¡ e tambÃ©m se interessou em um curso de pÃ³s-graduaÃ§Ã£o que uma escola de Los Santos tinha. Worley quando chegou em Los Santos conheceu um novo lado da vida, aquilo para ele passou a se tornar algo difÃ­cil e que demorou muito tempo para ele se acostumar. Ele terminou o curso de pÃ³s-graduaÃ§Ã£o, jÃ¡ era formado em engenharia mecÃ¢nica e nÃ£o teve nenhum gasto com os custos, tudo isso foi bancado pelo seu pai. Em Los Santos morava em um apartamento bem prÃ³ximo a universidade, o apartamento Ã© considerado de luxo e foi comprado com a ajuda financeira do seu pai. Michael nÃ£o conseguiu um emprego facilmente, apÃ³s meses desempregado recebe a notÃ­cia que o seu pai morreu vÃ­tima de um infarto. Worley fica muito para baixo, o seu psicolÃ³gico estÃ¡ visivelmente abalado, nÃ£o consegue mais pensar em nada, lembra apenas de seu irmÃ£o e de sua mÃ£e que ficaram em Los Angeles. O que restava para Worley era o apartamento e mais uma pequena quantia em dinheiro que recebeu de sua mÃ£e. Ele sabia que precisaria arrumar um emprego fixo, pensou em outras Ã¡reas tendo em vista que a sua Ã¡rea profissional jÃ¡ nÃ£o tinha vagas, foi entÃ£o que com indicaÃ§Ã£o de um amigo, Michael se aplicou para o departamento de xerifes de San Andreas.  Worley sempre foi bem inteligente, passar naquele exame nÃ£o seria nada difÃ­cil para ele, apÃ³s alguns meses na academia Worley jÃ¡ estava pronto para ir para as ruas. Apesar de nÃ£o ser a sua Ã¡rea preferida, foi aonde conseguiu se estabelecer e manter a sua vida financeira em dia.', 'Los Angeles, CalifÃ³rnia.', '1995-09-15', 1, 0, '', 'kauanaqui'),
(89, 'Sayd', 'Derek_Drummond', 'Derek', 'Drummond', 1, 'Derek Drummond, nascido em Los Santos por volta de 1990, Ã© um Personal Trainer focado em Treinamentos intensos e almeja ter uma Academia prÃ³pria em Los Santos para treinar seu pessoal, ele Ã© um rapaz muito dedicado e esforÃ§ado muito calmo e longe de encrencas, seus pais jÃ¡ sÃ£o falecidos e ele estÃ¡ sozinho nesse momento, procura uma fiÃ©l namorada para ter uma famÃ­lia em breve.\r\nDerek, estÃ¡ de volta na Cidade para abrir sua Academia e fazer novas amizades, depois de uma longa viagem em San Fierro, hoje em dia ele almeja ser campeÃ£o do Arnold Body Building e ser uma estrela fisiculturista reconhecida mundialmente, e trazer o trofÃ©u para sua cidade Los Santos..', 'Los Santos', '1990-12-10', 1, 0, '', 'well'),
(95, 'pblscrim', 'Jack_Risley', 'Jack', 'Risley', 1, 'Jack uma crianÃ§a que teve uma infÃ¢ncia muito conturbada sofria muito bullying na escola por ser muito magro e sua famÃ­lia morava em uma das menores cidades de San Andreas, Dillimore. Sua mÃ£e Joana Risley e seu pai John Risley, passavam por um grande aperto financeiro pois a loja de cosmÃ©ticos deles estavam a beira da falÃªncia, Jack era apenas uma crianÃ§a e nÃ£o sabia o que estava se passando, muitas vezes via sua mÃ£e chorando e seu pai lhe acolhendo.\r\n O tempo foi se passando e hoje Jack ajuda sua famÃ­lia em uma fazenda e nas tarefas domÃ©sticas. Eles estÃ£o prestes a mudar de casa. EstÃ£o pensando em morar em junto com a vÃ³ de Jack, Nilda Risley. Nilda mora em  Vinewood cidade que se localiza em Los Santos e daqui para frente Jack se dedicarÃ¡ aos estudos e irÃ¡ em busca de seu sonho, virar um mÃ©dico.', 'Dillimore', '2000-10-30', 1, 0, '', 'well'),
(96, 'ElToddy', 'Trevor_Lawson', 'Trevor', 'Lawson', 1, ' Trevor Lawson, Ã© um garoto nascido em 1994 no Hospital All Saints General em Los Santos. E entÃ£o cresceu nas ruas de Idlewood, habituando numa Ãºnica casa com seus pais. O pai de Trevor trabalhava em um caixa de um super-mercado, e era bastante apegado ao seu filho... JÃ¡ sua mÃ£e, trabalhava numa lanchonete \'Cluckin Bell\', em East Los Santos. Trevor gostava muito de sua mÃ£e, porÃ©m se comunicava mais com seu pai. Chegou uma Ã©poca em que a famÃ­lia esteve passando por dificuldades por conta de um cÃ¢ncer de mama desenvolvido no peito da mÃ£e de Trevor - eles precisavam de dinheiro, entÃ£o Trevor como era bastante apegado Ã  sua famÃ­lia, nÃ£o ficou por baixo assistindo seu pai trabalhar. Trevor deixou os estudos aos 13 anos para trabalhar lavando carros, motos, desenrolando todo tipo de trabalho que o aparecia. O pai de Trevor e seu filho conseguiram dinheiro para pagar todos os tratamentos em hospitais particulares. Tudo foi sendo feito de forma correta, mas alguns dias depois a mÃ£e de Trevor nÃ£o conseguiu resistir, falecendo em 13/04/2008. Trevor comeÃ§ou a ser outra pessoa dali em diante com seu pai, ele se drogou nas ruas juntamente com seu pai, ambos jÃ¡ nÃ£o se importavam mais com nada, por achar que a vida havia sido injusta com ambos. AtÃ© que...\r\n\r\n San Fierro! Mudava-se pai e filho para a cidade em 21/06/2008. LÃ¡ Trevor e seu pai, habituaram por 10 anos - trabalhando para uma pequena organizaÃ§Ã£o criminosa da cidade, transportando drogas de San Fierro para Las Venturas, e fazendo algumas fitas como roubar alguns carros esportivos, roubando alguns cidadÃ£os, coisas pequenas. EntÃ£o depois desses 10 anos em San Fierro, Trevor decide-se voltar para Los Santos junto com seu pai, porÃ©m... Seu pai nÃ£o queria voltar, disse que talvez em breve apareceria, mantendo contato pelo Livester com seu filho - Trevor. EntÃ£o Trevor pega um vÃ´o para Los Santos, voltando a sua cidade natal. Ele crÃª em retornar para as ruas de Idlewood, conhecendo os novos moradores da Ã¡rea e reconquistando moral pelo bairro.', 'Los Santos', '1994-07-27', 1, 0, '', 'well'),
(92, 'Francis', 'Joshua_Davis', 'Joshua', 'Davis', 1, ' Joshua Davis nasceu no dia 20/02/1996 em Montgomery, uma cidade situada no condado de Red County. Joshua Davis filho de Jayson Davis, um famoso gangster de Montgomery que fazia trabalhos para seu amigo Tony. Seu pai, Jayson Davis criou um grupo chamado GANG, Group Against Narcissist Government, um grupo que efetuava vÃ¡rios roubos Ã  bancos locais e Ã  lojas. Joshua Davis nÃ£o quis seguir o exemplo de seu pai, ele ficou fora da \"GANG\" e apenas quis fazer trabalhos ilegais.\r\n Joshua Davis foi Ã  escola atÃ© a quinta sÃ©rie, nÃ£o quis continuar por causa que nÃ£o se dava muito bem lÃ¡. Joshua depois de sair da escola ele fez pequenos assaltos, mesmo crianÃ§a ele assaltava pessoas por Red County e Bone County. Joshua Davis com quinze anos comeÃ§ou a traficar drogas que roubava de viciados, ele fazia uma grana boa vendendo drogas.\r\n Hoje Joshua Davis vive em Montgomery fazendo trabalhos que as pessoas mandam ele fazer, claro, sempre por dinheiro. Ele nÃ£o se importa se vai matar alguÃ©m ou nÃ£o, ele Ã© sangue frio.', 'Montgomery - Red County', '1996-02-20', 1, 0, '', 'well'),
(93, 'manoEL', 'Keenan_Philips', 'Keenan', 'Philips', 1, 'Keenan nasceu em Red Country. Morou com seu pai e sua mÃ£e por dezoito anos, seu pai era um cara muito conservador, sempre ensinou esses modos ao seu filho, Keenan. Desde entÃ£o, Keenan sempre aprendeu a manusear armas, tanto de pequeno porte quanto de grande porte. Anos se passaram e sua mÃ£e veio a Ã³bito, seu pai entrou em depressÃ£o tempo depois.\r\nKeenan entÃ£o, se mudou para Angel Pine com seu pai, para estudar e ingressar para o departamento de Sheriffes da regiÃ£o, tendo em visa como o Ãºnico emprego que ia dar uma boa sustanÃ§a para cuidar de seu pai depressivo.', 'Red Country', '1988-08-15', 1, 0, '', 'well'),
(97, 'Megan', 'Megan_Boone', 'Megan', 'Boone', 2, 'Megan nasceu em Los santos no bairro de Jefferson, e foi dada para adoÃ§Ã£o nos seus primeiros dias de vida, pois sua mÃ£e e seu pai nÃ£o tinham condiÃ§Ãµes alguma para criar a mesma.\r\nHoje em dia aos seus 18 anos, depois da conclusÃ£o dos seus estudos, Megan procura algum emprego para poder seguir carreira.\r\nMegan nunca foi envolvida com alguma coisa que ligue a mesma para o crime, pois sempre descriminou estes atos.', 'Los Santos', '1999-11-07', 2, 1, 'HistÃ³ria fraca, dÃª vida ao seu personagem, desenvolva-o. Procure reformular a histÃ³ria do personagem.', 'kauanaqui'),
(98, 'Cliffradin', 'Adam_Mitchell', 'Adam', 'Mitchell', 1, 'Adam nasceu no dia 12 de agosto de 1994 no Texas, Estados Unidos. Seu pai Ã© um militar patriota, sua mÃ£e uma domÃ©stica, seu pai Robert serviu aos Sheriff', 'Texas, Estados Unidos.', '1994-08-12', 2, 1, 'HistÃ³ria fraca, dÃª vida ao seu personagem, desenvolva-o. Procure reformular a histÃ³ria do personagem.', 'kauanaqui'),
(99, '', 'Joseph_Miller', 'Joseph', 'Miller', 1, 'Nascido no dia 8 de Novembro de 1998 e registrado apenas com o sobrenome da mÃ£e, Joseph passou a vida inteira em uma pequena cidade da CalifÃ³rnia chamada Napa. Sempre viveram do bÃ¡sico, morando em uma pequena casa aconchegante, onde Janete, mÃ£e de Joseph, sempre tentava dar o melhor que podia ao filho, pois eram uma famÃ­lia pobre, foram sempre muito humildes. Joseph cresceu ouvindo ensinamentos da mÃ£e, que sempre eram os melhores possÃ­veis.\r\n\r\nCom 12 anos Joseph comeÃ§ou a trabalhar em uma oficina mecÃ¢nica graÃ§as a seu amigo de infÃ¢ncia que era filho de um senhor de 50 anos que era dono da oficina. Seu amigo se chamava Josh, os dois trabalhavam na oficina junto com o homem. Os dois sempre aprontavam juntos, sendo roubando produtos de preÃ§o pequeno nas lojas ou atÃ© mesmo aprontando com a vizinhanÃ§a, pois mesmo recebendo conselhos da mÃ£e, Joseph sabia que aquilo era divertido e nÃ£o afetava ninguÃ©m, ele nunca foi o politicamente correto. \r\nJÃ¡ na adolescÃªncia, Josh apresentou a nova namorada para seus familiares e seu amigo, que ficou desapontado. Joseph tinha um amor platÃ´nico pela namorada de Josh, nÃ£o se sentia culpado por isso, jÃ¡ que nÃ£o mandava no coraÃ§Ã£o, mas sabia que alguma hora nÃ£o iria mais conseguir disfarÃ§ar esse sentimento, porÃ©m, Joseph aceitou esse destino e continuou fingindo que nÃ£o era afetado pelo namoro dos dois.\r\n\r\nComo Joseph passou praticamente a vida inteira dentro da oficina trabalhando para o homem que agora jÃ¡ era idoso, o jovem jÃ¡ tinha uma certa experiÃªncia em conserto de veÃ­culos e acabou virando um amante de carros e motos. E como nada sÃ£o flores, alÃ©m de esconder o sentimento que sentia pela namorada de Josh, Joseph teve de enfrentar a perda de sua mÃ£e, pois a mesma havia falecido de Leucemia.\r\n\r\nAtualmente Joseph se mudou para o interior de San Andreas, o motivo foi pelo fato de ter virado amante da namorada de Josh, estavam tendo esse caso hÃ¡ seis meses, e quando Josh descobriu acabou ficando furioso com ambos, e magicamente a paixÃ£o que Joseph tinha pela garota foi sumindo conforme os dois foram ficando. JÃ¡ nÃ£o a achava tÃ£o interessante, mas nÃ£o a culpava. Joseph sabia da merda que havia cometido, e sabia tambÃ©m que enfrentar aquilo nÃ£o o levaria para um caminho bom, pois conhecia Josh e sabia que o mesmo era muito agressivo e imaturo, entÃ£o resolveu fugir.', 'Napa, CA, Estados Unidos', '1998-11-08', 2, 1, 'Reenvia.', 'well'),
(100, 'Lowis', 'Oliver_Miller', 'Oliver', 'Miller', 1, 'Nascido no dia 8 de Novembro de 1998 e registrado apenas com o sobrenome da mÃ£e, Oliver passou a vida inteira em uma pequena cidade da CalifÃ³rnia chamada Napa. Sempre viveram do bÃ¡sico, morando em uma pequena casa aconchegante, onde Janete, mÃ£e de Oliver, sempre tentava dar o melhor que podia ao filho, pois eram uma famÃ­lia pobre, foram sempre muito humildes. Oliver cresceu ouvindo ensinamentos da mÃ£e, que sempre eram os melhores possÃ­veis.\r\n\r\nCom 12 anos ele comeÃ§ou a trabalhar em uma oficina mecÃ¢nica graÃ§as a seu amigo de infÃ¢ncia que era filho de um senhor de 50 anos que era dono da oficina. Seu amigo se chamava Josh, os dois trabalhavam na oficina junto com o homem. Os dois sempre aprontavam juntos, sendo roubando produtos de preÃ§o pequeno nas lojas ou atÃ© mesmo aprontando com a vizinhanÃ§a, pois mesmo recebendo conselhos da mÃ£e, Oliver sabia que aquilo era divertido e nÃ£o afetava ninguÃ©m, ele nunca foi o politicamente correto. \r\nJÃ¡ na adolescÃªncia, Josh apresentou a nova namorada para seus familiares e seu amigo, que ficou desapontado. Oliver tinha um amor platÃ´nico pela namorada de Josh, nÃ£o se sentia culpado por isso, jÃ¡ que nÃ£o mandava no coraÃ§Ã£o, mas sabia que alguma hora nÃ£o iria mais conseguir disfarÃ§ar esse sentimento, porÃ©m, ele aceitou esse destino e continuou fingindo que nÃ£o era afetado pelo namoro dos dois.\r\n\r\nComo Oliver passou praticamente a vida inteira dentro da oficina trabalhando para o homem que agora jÃ¡ era idoso, o jovem jÃ¡ tinha uma certa experiÃªncia em conserto de veÃ­culos e acabou virando um amante de carros e motos. E como nada sÃ£o flores, alÃ©m de esconder o sentimento que sentia pela namorada de Josh, Joseph teve de enfrentar a perda de sua mÃ£e, pois a mesma havia falecido de Leucemia.\r\n\r\nAtualmente Oliver Miller se mudou para o interior de San Andreas, o motivo foi pelo fato de ter virado amante da namorada de Josh, estavam tendo um caso hÃ¡ seis meses, e quando Josh descobriu acabou ficando furioso com ambos, e magicamente a paixÃ£o que Oliver tinha pela garota foi sumindo conforme os dois foram ficando. JÃ¡ nÃ£o a achava tÃ£o interessante, mas nÃ£o a culpava. Oliver sabia da merda que havia cometido, e sabia tambÃ©m que enfrentar aquilo nÃ£o o levaria para um caminho bom, pois conhecia Josh e sabia que o mesmo era muito agressivo e imaturo, entÃ£o resolveu fugir.', 'Napa, CA, Estados Unidos.', '1998-11-08', 1, 0, '', 'well'),
(101, 'Striker', 'Jacob_Dunn', 'Jacob', 'Dunn', 1, 'Jacob, mais conhecido como \"Jay\", Ã© apenas mais um residente do interior de San Andreas. Vindo de uma famÃ­lia pobre, jÃ¡ era de se esperar uma infÃ¢ncia, e atÃ© mesmo a fase da adolescÃªncia, um tanto difÃ­cil: escolas pÃºblicas, hospitais pÃºblico e nada de fartura ou conforto dentro de casa. \r\n\r\nJacob, que nunca foi um gÃªnio nos estudos, nÃ£o tardou muito a abandonar tudo. Bastou uma pequena oportunidade surgir para que o jovem, ainda com seus 16 anos, parasse de frequentar a escola. Ele comeÃ§ou a trabalhar em uma oficina local, aprendendo aos poucos o ofÃ­cio e sendo muito mal pago, obviamente.\r\n\r\nNos dias de hoje Jacob nÃ£o mais recebe ordens, pois faz seus pequenos serviÃ§os por conta prÃ³pria, sem ter de ficar aturando um chefe em seu pÃ©. Navegando entre a legalidade e a ilegalidade, o rapaz faz qualquer coisa que estiver ao alcance de suas mÃ£os para ter o que comer.', 'Palomino Creek', '1995-04-12', 1, 0, '', 'well'),
(102, 'clon', 'Ernest_Bogard', 'Ernest', 'Bogard', 1, 'Ernest nasceu e cresceu no estado de San Andreas, mais especificamente em Dillimore. Desde cedo, Ernest acompanhou o trabalho dos xerifes, jÃ¡ que o departamento era bem prÃ³ximo de sua casa na pacata cidade em que vivia. Criado por seus pais, o rapaz sempre foi educado de forma rÃ­gida, entÃ£o cresceu respeitoso como um homem deveria ser, na visÃ£o de seu pai. ComeÃ§ou a trabalhar cedo para ajudar seus pais com as despesas, jÃ¡ que a renda familiar era pequena.\r\nErnest trabalhava prÃ³ximo ao departamento policial em Dillimore, em um bar pouco movimentado. Foi atendendo um policial e conhecendo sua histÃ³ria que ele decidiu o que realmente queria fazer. Aos 21 anos, o rapaz comeÃ§ou a estudar tudo o que era necessÃ¡rio para se tornar um policial, e era isso que ele faria para sua vida.', 'Dillimore', '1992-12-03', 1, 0, '', 'well'),
(103, 'Struth', 'Aleksey_Kuznetsov', 'Aleksey', 'Kuznetsov', 1, 'auduafd hgjasDOÃ‡kajkÃ§ fa fdsfadasdadaw', 'Russia', '1987-10-15', 1, 0, '', 'Revolts');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `BannedIP` varchar(56) DEFAULT NULL,
  `PlayerName` varchar(24) DEFAULT NULL,
  `BanDate` varchar(64) DEFAULT NULL,
  `BannedBy` varchar(24) DEFAULT NULL,
  `Reason` varchar(150) DEFAULT NULL,
  `PSQLID` int(11) NOT NULL DEFAULT '0',
  `MasterAccount` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bizz`
--

CREATE TABLE `bizz` (
  `id` int(11) NOT NULL,
  `Description` longtext,
  `oPosX` float NOT NULL DEFAULT '0',
  `oPosY` float NOT NULL DEFAULT '0',
  `oPosZ` float NOT NULL DEFAULT '0',
  `Price` int(11) NOT NULL DEFAULT '0',
  `Payout` int(11) NOT NULL DEFAULT '0',
  `OwnerSQLID` int(11) NOT NULL DEFAULT '0',
  `BizzType` int(11) NOT NULL DEFAULT '0',
  `EnterFee` int(11) NOT NULL DEFAULT '0',
  `Locked` int(11) NOT NULL DEFAULT '0',
  `BizzEarnings` int(11) NOT NULL DEFAULT '0',
  `IsSpecial` int(11) NOT NULL DEFAULT '0',
  `iPosX` float NOT NULL DEFAULT '0',
  `iPosY` float NOT NULL DEFAULT '0',
  `iPosZ` float NOT NULL DEFAULT '0',
  `InteriorID` int(11) NOT NULL DEFAULT '0',
  `Stock` int(5) NOT NULL DEFAULT '0',
  `RequestStock` int(3) NOT NULL DEFAULT '0',
  `BizzVW` int(11) NOT NULL,
  `ExitVW` int(12) NOT NULL DEFAULT '0',
  `Actor1` varchar(64) NOT NULL DEFAULT '0,0,0,0,0,0,-1',
  `Actor2` varchar(64) NOT NULL DEFAULT '0,0,0,0,0,0,-1',
  `Actor3` varchar(64) NOT NULL DEFAULT '0,0,0,0,0,0,-1',
  `Actor4` varchar(64) NOT NULL DEFAULT '0,0,0,0,0,0,-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `bizz`
--

INSERT INTO `bizz` (`id`, `Description`, `oPosX`, `oPosY`, `oPosZ`, `Price`, `Payout`, `OwnerSQLID`, `BizzType`, `EnterFee`, `Locked`, `BizzEarnings`, `IsSpecial`, `iPosX`, `iPosY`, `iPosZ`, `InteriorID`, `Stock`, `RequestStock`, `BizzVW`, `ExitVW`, `Actor1`, `Actor2`, `Actor3`, `Actor4`) VALUES
(3, 'Bar Montgomery', 1402.46, 286.107, 19.555, 999999, 999999, 0, 20, 0, 0, 0, 1, 1375.2, 319.178, 648.684, 0, 0, 0, 40003, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(4, 'Pie Street Cafe', 1244.62, 205.011, 19.645, 999999, 999999, 0, 4, 0, 0, 0, 1, -146.836, 2168.53, 35.0268, 1, 0, 0, 40004, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(5, 'Loja Montgomery', 1257.95, 204.308, 19.717, 999999, 999999, 0, 9, 0, 0, 0, 1, 1252.3, 206.627, 2020.64, 2, 0, 0, 40005, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(7, 'Posto de Palomino Creek ', 2277.47, 26.223, 26.515, 999999, 999999, 0, 0, 0, 0, 0, 1, 2509.5, -42.3775, 587.019, 4, 0, 0, 40007, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(9, 'The Well Stacked Pizza', 2333.08, 75.071, 26.621, 999999, 999999, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40009, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(10, 'SAN Network Headquarters', 1222.42, 243.943, 19.547, 999999, 999999, 0, 0, 0, 0, 0, 1, 2584.24, 1249.42, 2944.23, 40010, 0, 0, 40010, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(11, 'Locals Only ', 1261.98, 272.464, 19.555, 999999, 999999, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40011, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(12, 'Montgomery Eletronics Store', 1256.54, 274.938, 19.555, 999999, 999999, 0, 15, 0, 0, 0, 1, 1638.72, 324.297, 1085.89, 100, 0, 0, 40012, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(13, 'Inside Track Betting', 1289.14, 271.016, 19.555, 999999, 999999, 0, 0, 0, 1, 0, 1, -2159.12, 641.518, 1052.38, 1, 0, 0, 40013, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(14, 'Montgomery Pawn Shop', 1276.81, 321.185, 19.555, 999999, 999999, 0, 0, 0, 1, 0, 1, 379.439, 1996.67, 1083.3, 5, 0, 0, 40014, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(15, 'Gift & Souvenir', 1268.11, 224.571, 19.555, 999999, 999999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40015, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(16, 'Marvins Hardware', 1234.49, 224.172, 19.555, 999999, 999999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40016, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(17, 'Montgomery Restaurant', 1294.58, 235.839, 19.555, 999999, 999999, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40017, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(18, 'Montgomery Geral Loja', 1340.4, 216.384, 19.555, 999999, 999999, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40018, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(19, 'Montgomery Ammunation', 1344.93, 214.292, 19.547, 999999, 999999, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 40019, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(20, 'Drug Shop', 207.851, -62.621, 1.633, 999999, 999999, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40020, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(21, 'The Well Stacked Pizza Co.', 1367.15, 248.412, 19.567, 999999, 999999, 0, 5, 0, 0, 0, 1, 1387.25, 228.158, 859.72, 40021, 0, 0, 40021, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(22, 'Ammu-nation Blueberry ', 242.638, -178.358, 1.578, 999999, 999999, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40022, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(23, 'The welll Stacked Pizza Blu.', 203.524, -203.029, 1.578, 999999, 999999, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40023, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(24, 'Cinderblock Bar', 172.308, -201.307, 1.57, 999999, 999999, 0, 13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 40024, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(25, '24/7 Cinderblock', 143.47, -201.407, 1.578, 999999, 999999, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40025, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(26, 'Sunset Eletronics Store', 142.018, -180.942, 1.578, 999999, 999999, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40026, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(27, 'Blue Café', 172.226, -152.444, 1.574, 999999, 999999, 0, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 40027, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(28, 'Blue Local Onlys', 273.199, -158.034, 1.741, 999999, 999999, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40028, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(29, 'Blue Restaurant', 292.312, -195.529, 1.578, 999999, 999999, 0, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 40029, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(30, '24/7 West Way Palomino', 2249.19, 52.64, 26.667, 999999, 1500, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40030, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(31, 'Sexy Shop West Way', 2260.47, 50.635, 26.484, 999999, 700, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40031, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(32, 'Barbearia West Way', 2277.72, 50.817, 26.484, 999999, 800, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40032, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(33, 'P. Ammu-Nation', 2333.75, 61.542, 26.706, 999999, 1000, 0, 12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 40033, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(34, 'Palomino Strip Club', 2335.17, 14.487, 26.483, 999999, 1000, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40034, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(35, 'SA Trading', 1360.05, 206.141, 19.555, 1000000, 10000, 1, 0, 25, 0, 450, 1, 1342.42, 206.803, 1378.19, 100, 0, 0, 40035, 0, '1,20003,1342.056,216.744,1378.2,165.964,1', '1,12,1338.771,213.491,1378.192,183.801,13', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(36, 'Loja de Pesca de Palomino', 2142.5, -97.477, 2.586, 999999, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40036, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(37, 'Cypress Club Montgomery', 1318.56, 225.947, 19.547, 999999, 800, 0, 20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 40037, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(39, 'Outer Store', 2318.77, -88.8578, 26.4844, 55000, 1000, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40039, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(40, 'General Store Dillimore', 691.407, -583.607, 16.328, 999999, 999999, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40040, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1'),
(41, 'SPA Montgomery', 1371.14, 301.613, 19.739, 999999, 999999, 0, 0, 0, 0, 0, 1, -1187.73, -158.289, 1.1486, 40041, 0, 0, 40041, 0, '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1', '0,0,0,0,0,0,-1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bizzmods`
--

CREATE TABLE `bizzmods` (
  `id` int(11) NOT NULL,
  `BizzID` int(12) NOT NULL,
  `ModSQLID` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blacklist`
--

CREATE TABLE `blacklist` (
  `IP` varchar(16) DEFAULT '0.0.0.0',
  `Username` varchar(24) DEFAULT NULL,
  `BannedBy` varchar(24) DEFAULT NULL,
  `Reason` varchar(128) DEFAULT NULL,
  `Date` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `connections`
--

CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `MasterAccount` int(11) NOT NULL,
  `IP` varchar(12) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `Type` tinyint(1) NOT NULL,
  `Serial` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `connections`
--

INSERT INTO `connections` (`id`, `MasterAccount`, `IP`, `Timestamp`, `Type`, `Serial`) VALUES
(1, 1, '164.163.207.', 1530911856, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(2, 1, '164.163.207.', 1530911901, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(3, 1, '164.163.207.', 1530912136, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(4, 1, '127.0.0.1', 1530912220, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(5, 1, '127.0.0.1', 1530912237, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(6, 1, '127.0.0.1', 1530912740, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(7, 1, '127.0.0.1', 1530912770, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(8, 1, '164.163.207.', 1530913060, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(9, 1, '164.163.207.', 1530913413, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(10, 1, '127.0.0.1', 1530913490, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(11, 1, '127.0.0.1', 1530913553, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(12, 1, '164.163.207.', 1530913838, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(13, 1, '164.163.207.', 1530914805, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(14, 1, '127.0.0.1', 1530934999, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(15, 1, '127.0.0.1', 1530936924, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(16, 1, '127.0.0.1', 1530937101, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(17, 1, '127.0.0.1', 1530937143, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(18, 1, '192.168.1.5', 1531014628, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(19, 1, '192.168.1.5', 1531015007, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(20, 1, '192.168.1.5', 1531015108, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(21, 1, '192.168.1.5', 1531015491, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(22, 1, '192.168.1.5', 1531016776, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(23, 1, '192.168.1.5', 1531017227, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(24, 1, '192.168.1.5', 1531017361, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(25, 1, '192.168.1.5', 1531047768, 0, '888CCF95C4D80E9CC4080404D80D94D0E49D88ED'),
(26, 1, '192.168.1.5', 1531047816, 1, '888CCF95C4D80E9CC4080404D80D94D0E49D88ED'),
(27, 1, '192.168.1.4', 1531414759, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(28, 1, '192.168.1.4', 1531414783, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(29, 1, '192.168.1.4', 1531415151, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(30, 1, '192.168.1.4', 1531415180, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(31, 1, '192.168.1.4', 1531415583, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(32, 1, '192.168.1.4', 1531415636, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(33, 1, '192.168.1.4', 1531415705, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(34, 1, '192.168.1.4', 1531415827, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(35, 1, '192.168.1.4', 1531417961, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(36, 1, '192.168.1.4', 1531418011, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(37, 1, '164.163.207.', 1531505119, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(38, 1, '192.168.1.6', 1531506271, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(39, 1, '192.168.1.6', 1531506283, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(40, 1, '192.168.1.6', 1531509828, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(41, 1, '192.168.1.6', 1531509901, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(42, 1, '192.168.1.6', 1531510596, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(43, 1, '192.168.1.6', 1531510613, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(44, 1, '192.168.1.6', 1531512042, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(45, 1, '192.168.1.4', 1531514113, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(46, 1, '192.168.1.4', 1531515566, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(47, 1, '192.168.1.4', 1531515980, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(48, 1, '192.168.1.4', 1531516230, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(49, 1, '164.163.207.', 1531540204, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(50, 1, '164.163.207.', 1531540403, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(51, 2, '186.225.187.', 1531540631, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(52, 1, '164.163.207.', 1531540666, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(53, 1, '164.163.207.', 1531541018, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(54, 1, '164.163.207.', 1531542108, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(55, 1, '164.163.207.', 1531542285, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(56, 1, '164.163.207.', 1531543040, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(57, 2, '186.225.187.', 1531543040, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(58, 1, '164.163.207.', 1531543059, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(59, 2, '186.225.187.', 1531543067, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(60, 1, '164.163.207.', 1531543214, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(61, 2, '186.225.187.', 1531543214, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(62, 1, '164.163.207.', 1531543280, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(63, 2, '186.225.187.', 1531543290, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(64, 1, '164.163.207.', 1531543381, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(65, 2, '186.225.187.', 1531543385, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(66, 1, '164.163.207.', 1531543439, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(67, 2, '186.225.187.', 1531543456, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(68, 1, '164.163.207.', 1531546829, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(69, 1, '164.163.207.', 1531546970, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(70, 1, '164.163.207.', 1531546981, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(71, 1, '164.163.207.', 1531548912, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(72, 1, '164.163.207.', 1531549559, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(73, 2, '186.225.187.', 1531549734, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(74, 2, '186.225.187.', 1531550724, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(75, 2, '186.225.187.', 1531550977, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(76, 1, '164.163.207.', 1531553617, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(77, 1, '164.163.207.', 1531553703, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(78, 1, '164.163.207.', 1531553841, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(79, 1, '164.163.207.', 1531553851, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(80, 1, '164.163.207.', 1531554022, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(81, 1, '164.163.207.', 1531554035, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(82, 1, '164.163.207.', 1531555564, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(83, 1, '164.163.207.', 1531555845, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(84, 1, '164.163.207.', 1531557238, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(85, 2, '186.225.187.', 1531557344, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(86, 1, '164.163.207.', 1531557379, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(87, 2, '186.225.187.', 1531557612, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(88, 1, '164.163.207.', 1531560143, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(89, 1, '164.163.207.', 1531560680, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(90, 1, '164.163.207.', 1531560704, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(91, 2, '186.225.187.', 1531561051, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(92, 1, '192.168.1.5', 1531588917, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(93, 2, '186.225.187.', 1531588944, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(94, 2, '186.225.187.', 1531590138, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(95, 2, '186.225.187.', 1531591369, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(96, 2, '186.225.187.', 1531592108, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(97, 1, '192.168.1.5', 1531593650, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(98, 1, '192.168.1.5', 1531733091, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(99, 1, '192.168.1.5', 1531733238, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(100, 1, '192.168.1.5', 1531734598, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(101, 1, '192.168.1.5', 1531734653, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(102, 1, '192.168.1.5', 1531736971, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(103, 1, '192.168.1.5', 1531737926, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(104, 1, '192.168.1.5', 1531740449, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(105, 1, '192.168.1.5', 1531742926, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(106, 1, '192.168.1.5', 1531743254, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(107, 1, '192.168.1.5', 1531743282, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(108, 1, '192.168.1.5', 1531743342, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(109, 1, '192.168.1.5', 1531743758, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(110, 1, '192.168.1.5', 1531743976, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(111, 1, '192.168.1.5', 1531744004, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(112, 1, '192.168.1.5', 1531745459, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(113, 1, '192.168.1.2', 1531834734, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(114, 1, '192.168.1.2', 1531835159, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(115, 1, '192.168.1.2', 1531835361, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(116, 1, '192.168.1.2', 1531835391, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(117, 1, '192.168.1.2', 1531836701, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(118, 1, '192.168.1.2', 1531836745, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(119, 1, '192.168.1.2', 1531837400, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(120, 1, '192.168.1.2', 1531837567, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(121, 1, '192.168.1.2', 1531837903, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(122, 1, '192.168.1.2', 1531838286, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(123, 1, '192.168.1.2', 1531838696, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(124, 1, '192.168.1.2', 1531838996, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(125, 1, '192.168.1.2', 1531839616, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(126, 1, '192.168.1.2', 1531839911, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(127, 1, '192.168.1.2', 1531839938, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(128, 1, '192.168.1.2', 1531839968, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(129, 1, '192.168.1.2', 1531861124, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(130, 1, '192.168.1.2', 1531861841, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(131, 1, '127.0.0.1', 1532131303, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(132, 1, '127.0.0.1', 1532132198, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(133, 1, '127.0.0.1', 1532132574, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(134, 1, '127.0.0.1', 1532133578, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(135, 1, '127.0.0.1', 1532133664, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(136, 1, '127.0.0.1', 1532133876, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(137, 1, '127.0.0.1', 1532133933, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(138, 1, '192.168.1.4', 1532990898, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(139, 1, '192.168.1.4', 1532990951, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(140, 1, '192.168.1.4', 1532994242, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(141, 1, '192.168.1.4', 1532994328, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(142, 1, '192.168.1.4', 1533042560, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(143, 1, '192.168.1.4', 1533042811, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(144, 1, '192.168.1.4', 1533043301, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(145, 1, '192.168.1.4', 1533043346, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(146, 1, '192.168.1.4', 1533044787, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(147, 1, '192.168.1.4', 1533045752, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(148, 1, '192.168.1.4', 1533045797, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(149, 1, '192.168.1.4', 1533045829, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(150, 1, '192.168.1.4', 1533046192, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(151, 1, '192.168.1.4', 1533046308, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(152, 1, '127.0.0.1', 1533046362, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(153, 1, '127.0.0.1', 1533046860, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(154, 1, '127.0.0.1', 1533050371, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(155, 1, '127.0.0.1', 1533050545, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(156, 1, '127.0.0.1', 1533050567, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(157, 1, '127.0.0.1', 1533050594, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(158, 1, '127.0.0.1', 1533052594, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(159, 1, '127.0.0.1', 1533052705, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(160, 1, '127.0.0.1', 1533052912, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(161, 1, '127.0.0.1', 1533052976, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(162, 1, '127.0.0.1', 1533053373, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(163, 1, '127.0.0.1', 1533054950, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(164, 1, '127.0.0.1', 1533055758, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(165, 1, '127.0.0.1', 1533055804, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(166, 1, '127.0.0.1', 1533060233, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(167, 1, '127.0.0.1', 1533061612, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(168, 1, '127.0.0.1', 1533062068, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(169, 1, '127.0.0.1', 1533062219, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(170, 1, '127.0.0.1', 1533063630, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(171, 1, '127.0.0.1', 1533063707, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(172, 1, '127.0.0.1', 1533068072, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(173, 1, '127.0.0.1', 1533068108, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(174, 1, '127.0.0.1', 1533068165, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(175, 1, '127.0.0.1', 1533068223, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(176, 1, '127.0.0.1', 1533069096, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(177, 1, '127.0.0.1', 1533069802, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(178, 1, '127.0.0.1', 1533069840, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(179, 1, '127.0.0.1', 1533070648, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(180, 1, '127.0.0.1', 1533070695, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(181, 1, '127.0.0.1', 1533070960, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(182, 1, '127.0.0.1', 1533071037, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(183, 1, '127.0.0.1', 1533071338, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(184, 1, '127.0.0.1', 1533071440, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(185, 1, '127.0.0.1', 1533072980, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(186, 1, '127.0.0.1', 1533073003, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(187, 1, '127.0.0.1', 1533073018, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(188, 1, '127.0.0.1', 1533073918, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(189, 1, '127.0.0.1', 1533076027, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(190, 1, '127.0.0.1', 1533082396, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(191, 1, '127.0.0.1', 1533082970, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(192, 1, '127.0.0.1', 1533083227, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(193, 1, '127.0.0.1', 1533083289, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(194, 1, '127.0.0.1', 1533083641, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(195, 1, '192.168.1.5', 1533406431, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(196, 1, '192.168.1.5', 1533406794, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(197, 1, '164.163.207.', 1533413939, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(198, 1, '164.163.207.', 1533414574, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(199, 1, '127.0.0.1', 1533418363, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(200, 1, '192.168.1.5', 1533448921, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(201, 1, '192.168.1.5', 1533448971, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(202, 1, '164.163.207.', 1533511704, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(203, 1, '164.163.207.', 1533511753, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(204, 1, '164.163.207.', 1533512118, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(205, 1, '164.163.207.', 1533512250, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(206, 1, '164.163.207.', 1533512376, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(207, 1, '164.163.207.', 1533512539, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(208, 1, '127.0.0.1', 1533565177, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(209, 1, '127.0.0.1', 1533565447, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(210, 1, '192.168.1.6', 1533654561, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(211, 1, '192.168.1.6', 1533655422, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(212, 1, '192.168.1.6', 1533655535, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(213, 1, '192.168.1.6', 1533658282, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(214, 1, '192.168.1.6', 1533658632, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(215, 1, '192.168.1.6', 1533658699, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(216, 1, '192.168.1.6', 1533658848, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(217, 1, '192.168.1.6', 1533659151, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(218, 1, '192.168.1.6', 1533659383, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(219, 1, '192.168.1.6', 1533659539, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(220, 1, '192.168.1.6', 1533659794, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(221, 1, '192.168.1.6', 1533660013, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(222, 1, '192.168.1.6', 1533660537, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(223, 1, '192.168.1.4', 1533674637, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(224, 1, '192.168.1.4', 1533674911, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(225, 1, '192.168.1.4', 1533674972, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(226, 1, '192.168.1.4', 1533676698, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(227, 1, '192.168.1.4', 1533677017, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(228, 1, '192.168.1.4', 1533681777, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(229, 1, '192.168.1.4', 1533681903, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(230, 1, '192.168.1.4', 1533682571, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(231, 1, '192.168.1.4', 1533683009, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(232, 1, '192.168.1.4', 1533683061, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(233, 1, '192.168.1.4', 1533683875, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(234, 1, '192.168.1.4', 1533683989, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(235, 1, '192.168.1.4', 1533684017, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(236, 1, '192.168.1.4', 1533685836, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(237, 1, '192.168.1.4', 1533685887, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(238, 1, '192.168.1.4', 1533686210, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(239, 1, '192.168.1.4', 1533686412, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(240, 1, '192.168.1.4', 1533686517, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(241, 1, '192.168.1.4', 1533686529, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(242, 1, '192.168.1.4', 1533686855, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(243, 1, '192.168.1.4', 1533686936, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(244, 1, '192.168.1.3', 1533729848, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(245, 1, '192.168.1.3', 1533730060, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(246, 1, '192.168.1.3', 1533730080, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(247, 1, '192.168.1.3', 1533730112, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(248, 1, '192.168.1.3', 1533730549, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(249, 1, '192.168.1.3', 1533730621, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(250, 1, '192.168.1.3', 1533731005, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(251, 1, '192.168.1.3', 1533731211, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(252, 1, '192.168.1.3', 1533732103, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(253, 1, '192.168.1.3', 1533732121, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(254, 1, '192.168.1.3', 1533732141, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(255, 1, '192.168.1.3', 1533735184, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(256, 1, '192.168.1.3', 1533759123, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(257, 1, '192.168.1.3', 1533759218, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(258, 1, '192.168.1.3', 1533759456, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(259, 1, '192.168.1.3', 1533762078, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(260, 1, '192.168.1.3', 1533762311, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(261, 1, '192.168.1.3', 1533762605, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(262, 1, '192.168.1.3', 1533762660, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(263, 11, '177.102.11.1', 1533769707, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(264, 1, '164.163.207.', 1533769710, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(265, 1, '164.163.207.', 1533769986, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(266, 11, '177.102.11.1', 1533769990, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(267, 11, '177.102.11.1', 1533770025, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(268, 1, '164.163.207.', 1533770324, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(269, 11, '177.102.11.1', 1533770325, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(270, 11, '177.102.11.1', 1533770351, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(271, 11, '177.102.11.1', 1533771025, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(272, 1, '164.163.207.', 1533771044, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(273, 11, '177.102.11.1', 1533771176, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(274, 11, '177.102.11.1', 1533771286, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(275, 1, '164.163.207.', 1533771290, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(276, 11, '177.102.11.1', 1533771294, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(277, 1, '164.163.207.', 1533771608, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(278, 11, '177.102.11.1', 1533771746, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(279, 1, '164.163.207.', 1533771878, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(280, 1, '164.163.207.', 1533771897, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(281, 11, '177.102.11.1', 1533772496, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(282, 11, '177.102.11.1', 1533773048, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(283, 1, '164.163.207.', 1533773054, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(284, 11, '177.102.11.1', 1533773109, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(285, 11, '177.102.11.1', 1533773135, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(286, 1, '164.163.207.', 1533773469, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(287, 11, '177.102.11.1', 1533774281, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(288, 11, '177.102.11.1', 1533774287, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(289, 11, '177.102.11.1', 1533775482, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(290, 1, '164.163.207.', 1533776551, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(291, 11, '177.102.11.1', 1533777185, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(292, 1, '164.163.207.', 1533777240, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(293, 1, '164.163.207.', 1533777346, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(294, 11, '177.102.11.1', 1533777506, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(295, 1, '164.163.207.', 1533778043, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(296, 1, '192.168.1.8', 1533832339, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(297, 1, '192.168.1.8', 1533833062, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(298, 1, '192.168.1.8', 1533834679, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(299, 1, '192.168.1.8', 1533835336, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(300, 1, '192.168.1.8', 1533835616, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(301, 1, '192.168.1.8', 1533839901, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(302, 1, '192.168.1.8', 1533841026, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(303, 1, '192.168.1.8', 1533841044, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(304, 1, '192.168.1.8', 1533844396, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(305, 1, '192.168.1.8', 1533844537, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(306, 1, '192.168.1.6', 1533939250, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(307, 1, '192.168.1.6', 1533939337, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(308, 1, '192.168.1.2', 1534010456, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(309, 1, '192.168.1.2', 1534012457, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(310, 1, '192.168.1.2', 1534227367, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(311, 1, '192.168.1.2', 1534227413, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(312, 1, '192.168.1.2', 1534227646, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(313, 1, '192.168.1.2', 1534227903, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(314, 1, '192.168.1.7', 1534297173, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(315, 1, '192.168.1.7', 1534297642, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(316, 1, '192.168.1.7', 1534297700, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(317, 1, '192.168.1.7', 1534297716, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(318, 1, '127.0.0.1', 1534297803, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(319, 1, '127.0.0.1', 1534298307, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(320, 1, '127.0.0.1', 1534300136, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(321, 1, '127.0.0.1', 1534300225, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(322, 1, '127.0.0.1', 1534300255, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(323, 1, '127.0.0.1', 1534304241, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(324, 1, '127.0.0.1', 1534304783, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(325, 1, '127.0.0.1', 1534305005, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(326, 1, '127.0.0.1', 1534305300, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(327, 1, '127.0.0.1', 1534305669, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(328, 1, '127.0.0.1', 1534307013, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(329, 1, '127.0.0.1', 1534307058, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(330, 1, '127.0.0.1', 1534307290, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(331, 1, '127.0.0.1', 1534308288, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(332, 1, '127.0.0.1', 1534308348, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(333, 1, '127.0.0.1', 1534308384, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(334, 1, '127.0.0.1', 1534308531, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(335, 1, '127.0.0.1', 1534308560, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(336, 1, '127.0.0.1', 1534308750, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(337, 1, '127.0.0.1', 1534308769, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(338, 1, '127.0.0.1', 1534308891, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(339, 1, '127.0.0.1', 1534309878, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(340, 1, '127.0.0.1', 1534309901, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(341, 1, '127.0.0.1', 1534310590, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(342, 1, '127.0.0.1', 1534310648, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(343, 1, '127.0.0.1', 1534310673, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(344, 1, '127.0.0.1', 1534311066, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(345, 1, '127.0.0.1', 1534311083, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(346, 1, '127.0.0.1', 1534311302, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(347, 1, '127.0.0.1', 1534311328, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(348, 1, '127.0.0.1', 1534312163, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(349, 1, '127.0.0.1', 1534312633, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(350, 1, '127.0.0.1', 1534312662, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(351, 1, '127.0.0.1', 1534312959, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(352, 1, '127.0.0.1', 1534312987, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(353, 1, '127.0.0.1', 1534313398, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(354, 1, '127.0.0.1', 1534313420, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(355, 1, '127.0.0.1', 1534313955, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(356, 1, '127.0.0.1', 1534313993, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(357, 1, '127.0.0.1', 1534348082, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(358, 1, '127.0.0.1', 1534348567, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(359, 1, '127.0.0.1', 1534348585, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(360, 1, '127.0.0.1', 1534348600, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(361, 1, '127.0.0.1', 1534348686, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(362, 1, '127.0.0.1', 1534349029, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(363, 1, '127.0.0.1', 1534349069, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(364, 1, '127.0.0.1', 1534349179, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(365, 1, '127.0.0.1', 1534349200, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(366, 1, '127.0.0.1', 1534349307, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(367, 1, '127.0.0.1', 1534349407, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(368, 1, '127.0.0.1', 1534349424, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(369, 1, '127.0.0.1', 1534349485, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(370, 1, '127.0.0.1', 1534349607, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(371, 1, '127.0.0.1', 1534350199, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(372, 1, '127.0.0.1', 1534350222, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(373, 1, '127.0.0.1', 1534351122, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(374, 1, '127.0.0.1', 1534351564, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(375, 1, '127.0.0.1', 1534351924, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(376, 1, '192.168.1.8', 1534459820, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(377, 1, '192.168.1.8', 1534459933, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(378, 1, '192.168.1.8', 1534460205, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(379, 1, '192.168.1.8', 1534460564, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(380, 1, '192.168.1.8', 1534460655, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(381, 1, '192.168.1.8', 1534460884, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(382, 1, '192.168.1.8', 1534460900, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(383, 1, '192.168.1.8', 1534462001, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(384, 1, '192.168.1.8', 1534463005, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(385, 1, '192.168.1.8', 1534463022, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(386, 1, '127.0.0.1', 1534465475, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(387, 1, '127.0.0.1', 1534466146, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(388, 1, '127.0.0.1', 1534466166, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(389, 1, '127.0.0.1', 1534466604, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(390, 1, '127.0.0.1', 1534468602, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(391, 1, '127.0.0.1', 1534471677, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(392, 1, '127.0.0.1', 1534471699, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(393, 1, '127.0.0.1', 1534472195, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(394, 1, '127.0.0.1', 1534472300, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(395, 1, '127.0.0.1', 1534472882, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(396, 1, '127.0.0.1', 1534472911, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(397, 1, '127.0.0.1', 1534473496, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(398, 1, '127.0.0.1', 1534474302, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(399, 1, '127.0.0.1', 1534483594, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(400, 1, '127.0.0.1', 1534483669, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(401, 1, '127.0.0.1', 1534485016, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(402, 1, '127.0.0.1', 1534485190, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(403, 1, '127.0.0.1', 1534485268, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(404, 1, '127.0.0.1', 1534485483, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(405, 1, '127.0.0.1', 1534485502, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(406, 1, '127.0.0.1', 1534486425, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(407, 1, '127.0.0.1', 1534486467, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(408, 1, '127.0.0.1', 1534487527, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(409, 1, '127.0.0.1', 1534487545, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(410, 1, '127.0.0.1', 1534488231, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(411, 1, '127.0.0.1', 1534488275, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(412, 1, '127.0.0.1', 1534490545, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(413, 1, '127.0.0.1', 1534491567, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(414, 1, '127.0.0.1', 1534491616, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(415, 1, '127.0.0.1', 1534491921, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(416, 1, '164.163.207.', 1534527690, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(417, 11, '177.188.198.', 1534527796, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(418, 11, '177.188.198.', 1534529380, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(419, 1, '164.163.207.', 1534529540, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(420, 11, '177.188.198.', 1534529560, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(421, 1, '164.163.207.', 1534529863, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(422, 1, '164.163.207.', 1534529997, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(423, 11, '177.188.198.', 1534531260, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(424, 1, '164.163.207.', 1534532656, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(425, 1, '164.163.207.', 1534532707, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(426, 1, '164.163.207.', 1534532713, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(427, 1, '164.163.207.', 1534532719, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(428, 1, '164.163.207.', 1534536822, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(429, 13, '186.192.235.', 1534537164, 0, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(430, 1, '164.163.207.', 1534538386, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(431, 1, '164.163.207.', 1534539512, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(432, 2, '186.225.187.', 1534539535, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(433, 2, '186.225.187.', 1534539588, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(434, 2, '186.225.187.', 1534539636, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(435, 13, '186.192.235.', 1534541139, 1, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(436, 1, '164.163.207.', 1534543807, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(437, 15, '186.225.187.', 1534544282, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(438, 1, '164.163.207.', 1534544449, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(439, 15, '186.225.187.', 1534544474, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(440, 15, '186.225.187.', 1534544680, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(441, 15, '186.225.187.', 1534544876, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(442, 1, '164.163.207.', 1534546328, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(443, 1, '164.163.207.', 1534546679, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(444, 3, '191.253.248.', 1534546725, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(445, 15, '186.225.187.', 1534547064, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(446, 15, '186.225.187.', 1534547381, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(447, 1, '164.163.207.', 1534547709, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(448, 3, '191.253.248.', 1534547861, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(449, 3, '191.253.248.', 1534547886, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(450, 15, '186.225.187.', 1534547996, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(451, 3, '191.253.248.', 1534549317, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(452, 3, '191.253.248.', 1534549393, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(453, 1, '164.163.207.', 1534550053, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(454, 1, '164.163.207.', 1534551278, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(455, 3, '191.253.248.', 1534551388, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(456, 15, '186.225.187.', 1534551415, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(457, 1, '164.163.207.', 1534553161, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(458, 1, '164.163.207.', 1534553630, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(459, 2, '186.225.187.', 1534556898, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(460, 1, '164.163.207.', 1534558334, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(461, 1, '164.163.207.', 1534558391, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(462, 1, '164.163.207.', 1534558551, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(463, 1, '164.163.207.', 1534558824, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(464, 1, '164.163.207.', 1534564471, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(465, 2, '186.225.187.', 1534564566, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(466, 1, '164.163.207.', 1534566823, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(467, 1, '164.163.207.', 1534567022, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(468, 13, '186.192.235.', 1534594662, 0, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(469, 13, '186.192.235.', 1534595236, 1, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(470, 12, '179.106.74.1', 1534608149, 0, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(471, 1, '164.163.207.', 1534610400, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(472, 12, '179.106.74.1', 1534611036, 1, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(473, 12, '179.106.74.1', 1534611095, 0, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(474, 12, '179.106.74.1', 1534611108, 1, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(475, 12, '179.106.74.1', 1534611143, 0, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(476, 12, '179.106.74.1', 1534611155, 1, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(477, 12, '179.106.74.1', 1534611209, 0, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(478, 12, '179.106.74.1', 1534611223, 1, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(479, 15, '186.225.187.', 1534611242, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(480, 12, '179.106.74.1', 1534611251, 0, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(481, 12, '179.106.74.1', 1534611265, 1, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(482, 12, '179.106.74.1', 1534611365, 0, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(483, 12, '179.106.74.1', 1534612766, 1, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(484, 12, '179.106.74.1', 1534612846, 0, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(485, 15, '186.225.187.', 1534613004, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(486, 15, '186.225.187.', 1534613279, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(487, 15, '186.225.187.', 1534613703, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(488, 2, '186.225.187.', 1534614576, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(489, 1, '164.163.207.', 1534614879, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(490, 12, '179.106.74.1', 1534619107, 1, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(491, 2, '186.225.187.', 1534619758, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(492, 1, '164.163.207.', 1534619999, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(493, 1, '164.163.207.', 1534620026, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(494, 2, '186.225.187.', 1534644488, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(495, 1, '164.163.207.', 1534645026, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(496, 18, '201.93.223.1', 1534645129, 0, 'CCF8F594AE48505A4E4C0DC90EFE8CCD8CE44400'),
(497, 3, '186.224.179.', 1534645136, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(498, 18, '201.93.223.1', 1534645868, 1, 'CCF8F594AE48505A4E4C0DC90EFE8CCD8CE44400'),
(499, 1, '164.163.207.', 1534646318, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(500, 3, '186.224.179.', 1534647870, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(501, 2, '186.225.187.', 1534648123, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(502, 2, '186.225.187.', 1534648253, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(503, 2, '186.225.187.', 1534648309, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(504, 2, '186.225.187.', 1534648338, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(505, 3, '186.224.179.', 1534648631, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(506, 3, '186.224.179.', 1534648679, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(507, 3, '186.224.179.', 1534648708, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(508, 3, '186.224.179.', 1534649519, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(509, 3, '186.224.179.', 1534650773, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(510, 3, '186.224.179.', 1534652109, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(511, 2, '186.225.187.', 1534654817, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(512, 1, '164.163.207.', 1534660773, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(513, 1, '164.163.207.', 1534660842, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(514, 1, '164.163.207.', 1534660869, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(515, 2, '186.225.187.', 1534660955, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(516, 2, '186.225.187.', 1534662607, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(517, 2, '186.225.187.', 1534662643, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(518, 1, '164.163.207.', 1534662644, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(519, 1, '164.163.207.', 1534662671, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(520, 2, '186.225.187.', 1534662690, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(521, 2, '186.225.187.', 1534662756, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(522, 1, '164.163.207.', 1534662877, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(523, 1, '164.163.207.', 1534665471, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(524, 2, '186.225.187.', 1534665972, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(525, 3, '191.253.227.', 1534686229, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(526, 3, '191.253.227.', 1534688193, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(527, 1, '192.168.1.3', 1534694673, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(528, 1, '192.168.1.3', 1534694929, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(529, 1, '192.168.1.3', 1534695097, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(530, 1, '192.168.1.3', 1534695126, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(531, 1, '192.168.1.3', 1534695150, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(532, 1, '192.168.1.3', 1534695160, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(533, 1, '192.168.1.3', 1534696746, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(534, 1, '192.168.1.3', 1534696899, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(535, 1, '192.168.1.3', 1534697678, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(536, 1, '192.168.1.3', 1534697966, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(537, 1, '192.168.1.3', 1534698034, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(538, 1, '192.168.1.3', 1534698341, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(539, 1, '164.163.207.', 1534698544, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(540, 3, '191.253.227.', 1534698624, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(541, 15, '186.225.187.', 1534699233, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(542, 1, '164.163.207.', 1534699774, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(543, 1, '164.163.207.', 1534699961, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(544, 1, '164.163.207.', 1534700025, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(545, 1, '164.163.207.', 1534700073, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(546, 1, '164.163.207.', 1534700176, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(547, 1, '192.168.1.3', 1534700246, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(548, 1, '192.168.1.3', 1534700658, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(549, 3, '191.253.227.', 1534700860, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(550, 3, '191.253.227.', 1534700872, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(551, 15, '186.225.187.', 1534700917, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(552, 15, '186.225.187.', 1534701020, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(553, 3, '191.253.227.', 1534701252, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(554, 15, '186.225.187.', 1534701619, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(555, 1, '192.168.1.3', 1534701992, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(556, 1, '192.168.1.3', 1534702311, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(557, 1, '192.168.1.3', 1534702332, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(558, 1, '192.168.1.3', 1534704166, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(559, 3, '191.253.227.', 1534704293, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(560, 15, '186.225.187.', 1534704705, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(561, 1, '192.168.1.3', 1534704751, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(562, 1, '192.168.1.3', 1534704777, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(563, 1, '192.168.1.3', 1534704952, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(564, 1, '192.168.1.3', 1534704970, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(565, 1, '192.168.1.3', 1534705276, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(566, 1, '192.168.1.3', 1534705336, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(567, 1, '192.168.1.3', 1534705384, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(568, 1, '192.168.1.3', 1534705402, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(569, 1, '192.168.1.3', 1534705681, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(570, 1, '192.168.1.3', 1534705699, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(571, 1, '192.168.1.3', 1534707889, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(572, 1, '192.168.1.3', 1534708369, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(573, 1, '192.168.1.3', 1534708389, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(574, 1, '192.168.1.3', 1534709045, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(575, 2, '186.225.187.', 1534709328, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(576, 1, '164.163.207.', 1534709347, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(577, 2, '186.225.187.', 1534709738, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(578, 3, '191.253.227.', 1534709738, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(579, 2, '186.225.187.', 1534709872, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(580, 2, '186.225.187.', 1534709970, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(581, 2, '186.225.187.', 1534710006, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(582, 3, '191.253.227.', 1534710061, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(583, 3, '191.253.227.', 1534710087, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(584, 1, '164.163.207.', 1534710950, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(585, 1, '164.163.207.', 1534710967, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(586, 1, '164.163.207.', 1534711305, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(587, 2, '186.225.187.', 1534711305, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(588, 3, '191.253.227.', 1534711305, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(589, 3, '191.253.227.', 1534711322, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(590, 1, '164.163.207.', 1534711338, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(591, 2, '186.225.187.', 1534711457, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(592, 1, '164.163.207.', 1534711690, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(593, 1, '192.168.1.3', 1534711920, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(594, 1, '192.168.1.3', 1534711934, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(595, 1, '127.0.0.1', 1534711978, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(596, 1, '127.0.0.1', 1534712416, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(597, 3, '191.253.227.', 1534712741, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(598, 1, '164.163.207.', 1534713790, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(599, 3, '191.253.227.', 1534714212, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(600, 3, '191.253.227.', 1534714777, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(601, 3, '191.253.227.', 1534714951, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(602, 15, '186.225.187.', 1534716781, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(603, 15, '186.225.187.', 1534716876, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(604, 1, '164.163.207.', 1534716949, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(605, 3, '191.253.227.', 1534717003, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(606, 3, '191.253.227.', 1534717019, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(607, 15, '186.225.187.', 1534717021, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(608, 3, '191.253.227.', 1534718833, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(609, 15, '186.225.187.', 1534719364, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5');
INSERT INTO `connections` (`id`, `MasterAccount`, `IP`, `Timestamp`, `Type`, `Serial`) VALUES
(610, 2, '186.225.187.', 1534719364, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(611, 3, '191.253.227.', 1534719364, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(612, 1, '164.163.207.', 1534719451, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(613, 2, '186.225.187.', 1534719459, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(614, 3, '191.253.227.', 1534719545, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(615, 1, '164.163.207.', 1534721936, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(616, 1, '127.0.0.1', 1534722481, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(617, 1, '127.0.0.1', 1534723859, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(618, 1, '127.0.0.1', 1534724147, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(619, 1, '127.0.0.1', 1534724210, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(620, 1, '127.0.0.1', 1534725336, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(621, 1, '127.0.0.1', 1534725353, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(622, 1, '127.0.0.1', 1534726039, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(623, 3, '191.253.227.', 1534728152, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(624, 1, '127.0.0.1', 1534728832, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(625, 1, '127.0.0.1', 1534728902, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(626, 1, '127.0.0.1', 1534728941, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(627, 1, '127.0.0.1', 1534729157, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(628, 1, '127.0.0.1', 1534730050, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(629, 1, '127.0.0.1', 1534730084, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(630, 1, '127.0.0.1', 1534730265, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(631, 3, '191.253.227.', 1534730823, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(632, 3, '191.253.227.', 1534730856, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(633, 3, '191.253.227.', 1534730884, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(634, 1, '127.0.0.1', 1534730958, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(635, 1, '127.0.0.1', 1534731582, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(636, 1, '127.0.0.1', 1534731601, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(637, 1, '127.0.0.1', 1534732196, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(638, 1, '127.0.0.1', 1534732201, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(639, 1, '164.163.207.', 1534732752, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(640, 2, '186.225.187.', 1534735950, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(641, 1, '164.163.207.', 1534735999, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(642, 2, '186.225.187.', 1534736018, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(643, 2, '186.225.187.', 1534737757, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(644, 1, '164.163.207.', 1534737868, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(645, 2, '186.225.187.', 1534737913, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(646, 1, '164.163.207.', 1534740973, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(647, 1, '164.163.207.', 1534741097, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(648, 2, '186.225.187.', 1534741159, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(649, 1, '164.163.207.', 1534742222, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(650, 1, '164.163.207.', 1534742244, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(651, 1, '164.163.207.', 1534745649, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(652, 2, '186.225.187.', 1534751008, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(653, 1, '164.163.207.', 1534752240, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(654, 11, '191.17.149.1', 1534792542, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(655, 1, '164.163.207.', 1534792612, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(656, 11, '191.17.149.1', 1534793351, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(657, 11, '191.17.149.1', 1534793584, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(658, 11, '191.17.149.1', 1534793656, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(659, 1, '164.163.207.', 1534793656, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(660, 1, '164.163.207.', 1534793941, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(661, 1, '164.163.207.', 1534794484, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(662, 1, '164.163.207.', 1534795052, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(663, 1, '164.163.207.', 1534795101, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(664, 11, '191.17.149.1', 1534795236, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(665, 11, '191.17.149.1', 1534795421, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(666, 1, '164.163.207.', 1534795744, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(667, 11, '191.17.149.1', 1534795793, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(668, 11, '191.17.149.1', 1534795805, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(669, 1, '164.163.207.', 1534795851, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(670, 11, '191.17.149.1', 1534795929, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(671, 1, '164.163.207.', 1534795947, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(672, 1, '164.163.207.', 1534796811, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(673, 3, '191.253.239.', 1534797070, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(674, 1, '164.163.207.', 1534797105, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(675, 2, '186.225.187.', 1534797305, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(676, 3, '191.253.239.', 1534797809, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(677, 11, '191.17.149.1', 1534798309, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(678, 1, '164.163.207.', 1534798326, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(679, 2, '186.225.187.', 1534798353, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(680, 2, '186.225.187.', 1534798385, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(681, 2, '186.225.187.', 1534798409, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(682, 11, '191.17.149.1', 1534798800, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(683, 1, '164.163.207.', 1534798900, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(684, 1, '164.163.207.', 1534798955, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(685, 11, '191.17.149.1', 1534798967, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(686, 2, '186.225.187.', 1534799016, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(687, 2, '186.225.187.', 1534799045, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(688, 2, '186.225.187.', 1534799250, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(689, 11, '191.17.149.1', 1534799254, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(690, 2, '186.225.187.', 1534799280, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(691, 2, '186.225.187.', 1534799305, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(692, 2, '186.225.187.', 1534799340, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(693, 11, '191.17.149.1', 1534799627, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(694, 1, '164.163.207.', 1534799639, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(695, 2, '186.225.187.', 1534799652, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(696, 11, '191.17.149.1', 1534799773, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(697, 1, '164.163.207.', 1534802342, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(698, 2, '186.225.187.', 1534803812, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(699, 1, '164.163.207.', 1534804553, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(700, 1, '127.0.0.1', 1534811462, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(701, 1, '127.0.0.1', 1534811559, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(702, 1, '127.0.0.1', 1534811678, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(703, 1, '127.0.0.1', 1534812412, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(704, 1, '127.0.0.1', 1534813042, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(705, 2, '186.225.187.', 1534813695, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(706, 1, '127.0.0.1', 1534814034, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(707, 1, '127.0.0.1', 1534814117, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(708, 1, '127.0.0.1', 1534814543, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(709, 11, '191.17.149.1', 1534814636, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(710, 1, '164.163.207.', 1534814643, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(711, 1, '164.163.207.', 1534814705, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(712, 1, '164.163.207.', 1534814719, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(713, 1, '164.163.207.', 1534814802, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(714, 1, '164.163.207.', 1534814832, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(715, 11, '191.17.149.1', 1534815195, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(716, 11, '191.17.149.1', 1534815623, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(717, 1, '164.163.207.', 1534815667, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(718, 11, '191.17.149.1', 1534815830, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(719, 1, '164.163.207.', 1534816482, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(720, 2, '186.225.187.', 1534817555, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(721, 1, '164.163.207.', 1534819023, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(722, 11, '191.17.149.1', 1534820939, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(723, 1, '164.163.207.', 1534820960, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(724, 11, '191.17.149.1', 1534735163, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(725, 1, '164.163.207.', 1534735195, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(726, 11, '191.17.149.1', 1534735544, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(727, 11, '191.17.149.1', 1534735680, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(728, 1, '164.163.207.', 1534735689, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(729, 1, '164.163.207.', 1534735791, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(730, 1, '127.0.0.1', 1534822185, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(731, 1, '127.0.0.1', 1534822241, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(732, 1, '127.0.0.1', 1534822288, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(733, 1, '127.0.0.1', 1534822364, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(734, 1, '164.163.207.', 1534736040, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(735, 11, '191.17.149.1', 1534736592, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(736, 1, '164.163.207.', 1534736756, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(737, 1, '164.163.207.', 1534736831, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(738, 1, '164.163.207.', 1534737043, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(739, 1, '164.163.207.', 1534737576, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(740, 1, '164.163.207.', 1534737676, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(741, 1, '164.163.207.', 1534738854, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(742, 1, '164.163.207.', 1534739656, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(743, 1, '164.163.207.', 1534740266, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(744, 1, '164.163.207.', 1534741293, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(745, 11, '191.17.149.1', 1534741295, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(746, 11, '191.17.149.1', 1534741575, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(747, 1, '164.163.207.', 1534743283, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(748, 1, '164.163.207.', 1534744216, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(749, 1, '127.0.0.1', 1534862871, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(750, 1, '127.0.0.1', 1534868999, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(751, 1, '127.0.0.1', 1534869750, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(752, 1, '127.0.0.1', 1534871095, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(753, 1, '127.0.0.1', 1534871201, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(754, 1, '127.0.0.1', 1534871260, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(755, 1, '127.0.0.1', 1534872746, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(756, 1, '127.0.0.1', 1534872803, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(757, 1, '127.0.0.1', 1534873263, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(758, 1, '127.0.0.1', 1534873314, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(759, 1, '127.0.0.1', 1534873666, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(760, 1, '127.0.0.1', 1534874564, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(761, 1, '127.0.0.1', 1534875010, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(762, 1, '127.0.0.1', 1534877963, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(763, 1, '127.0.0.1', 1534878166, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(764, 1, '127.0.0.1', 1534878222, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(765, 1, '127.0.0.1', 1534878701, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(766, 3, '186.224.152.', 1534792354, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(767, 1, '127.0.0.1', 1534878766, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(768, 1, '127.0.0.1', 1534878979, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(769, 1, '127.0.0.1', 1534879032, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(770, 1, '127.0.0.1', 1534879482, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(771, 3, '186.224.152.', 1534793651, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(772, 3, '186.224.152.', 1534793681, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(773, 1, '127.0.0.1', 1534880077, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(774, 3, '186.224.152.', 1534793729, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(775, 3, '186.224.152.', 1534793742, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(776, 1, '127.0.0.1', 1534881048, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(777, 1, '127.0.0.1', 1534881238, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(778, 1, '127.0.0.1', 1534881290, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(779, 1, '164.163.207.', 1534795084, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(780, 1, '164.163.207.', 1534795209, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(781, 1, '164.163.207.', 1534795237, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(782, 3, '186.224.152.', 1534796288, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(783, 3, '186.224.152.', 1534796323, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(784, 3, '186.224.152.', 1534796350, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(785, 3, '186.224.152.', 1534796373, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(786, 1, '164.163.207.', 1534796657, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(787, 1, '164.163.207.', 1534796678, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(788, 3, '186.224.152.', 1534798434, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(789, 3, '186.224.152.', 1534798447, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(790, 3, '186.224.152.', 1534798975, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(791, 1, '164.163.207.', 1534799059, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(792, 1, '164.163.207.', 1534799074, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(793, 3, '186.224.152.', 1534800441, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(794, 3, '186.224.152.', 1534800474, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(795, 3, '186.224.152.', 1534800499, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(796, 1, '164.163.207.', 1534802315, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(797, 1, '164.163.207.', 1534802557, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(798, 15, '186.225.187.', 1534803200, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(799, 1, '164.163.207.', 1534804102, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(800, 15, '186.225.187.', 1534804448, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(801, 3, '186.224.152.', 1534804790, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(802, 1, '164.163.207.', 1534806016, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(803, 3, '186.224.152.', 1534806032, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(804, 1, '164.163.207.', 1534808171, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(805, 3, '186.224.152.', 1534809866, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(806, 2, '186.225.187.', 1534817888, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(807, 15, '186.225.187.', 1534820063, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(808, 2, '186.225.187.', 1534821354, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(809, 11, '191.17.149.1', 1534834972, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(810, 1, '164.163.207.', 1534834980, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(811, 1, '164.163.207.', 1534835319, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(812, 1, '164.163.207.', 1534836121, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(813, 1, '164.163.207.', 1534836359, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(814, 11, '191.17.149.1', 1534836564, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(815, 1, '164.163.207.', 1534836718, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(816, 11, '191.17.149.1', 1534836725, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(817, 11, '191.17.149.1', 1534836836, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(818, 1, '164.163.207.', 1534836886, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(819, 1, '164.163.207.', 1534836959, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(820, 11, '191.17.149.1', 1534836960, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(821, 1, '164.163.207.', 1534837185, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(822, 1, '164.163.207.', 1534837239, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(823, 1, '164.163.207.', 1534837723, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(824, 11, '191.17.149.1', 1534840667, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(825, 1, '164.163.207.', 1534840987, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(826, 11, '191.17.149.1', 1534840997, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(827, 1, '164.163.207.', 1534841114, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(828, 11, '191.17.149.1', 1534842592, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(829, 1, '164.163.207.', 1534842691, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(830, 1, '127.0.0.1', 1534933101, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(831, 1, '127.0.0.1', 1534933145, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(832, 1, '127.0.0.1', 1534933153, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(833, 1, '127.0.0.1', 1534933193, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(834, 1, '127.0.0.1', 1534933222, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(835, 1, '127.0.0.1', 1534933309, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(836, 1, '127.0.0.1', 1534933327, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(837, 1, '127.0.0.1', 1534933364, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(838, 1, '127.0.0.1', 1534933464, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(839, 1, '127.0.0.1', 1534933579, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(840, 1, '192.168.1.7', 1534983348, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(841, 1, '192.168.1.7', 1534983354, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(842, 1, '192.168.1.7', 1534983397, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(843, 1, '192.168.1.7', 1534984401, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(844, 1, '192.168.1.7', 1534985044, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(845, 1, '192.168.1.7', 1534985201, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(846, 1, '192.168.1.7', 1534985989, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(847, 1, '192.168.1.7', 1534986073, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(848, 1, '192.168.1.7', 1534986112, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(849, 1, '192.168.1.7', 1534986200, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(850, 1, '192.168.1.7', 1534986973, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(851, 1, '192.168.1.7', 1534987545, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(852, 1, '192.168.1.7', 1534988011, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(853, 1, '192.168.1.7', 1534989414, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(854, 1, '127.0.0.1', 1534990537, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(855, 1, '127.0.0.1', 1534994239, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(856, 1, '127.0.0.1', 1535041971, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(857, 1, '127.0.0.1', 1535047937, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(858, 1, '127.0.0.1', 1535062419, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(859, 1, '127.0.0.1', 1535062542, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(860, 2, '186.225.187.', 1534976314, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(861, 1, '164.163.207.', 1534976328, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(862, 1, '164.163.207.', 1534976382, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(863, 1, '164.163.207.', 1534976451, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(864, 1, '164.163.207.', 1534980587, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(865, 1, '164.163.207.', 1534981175, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(866, 1, '164.163.207.', 1534981275, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(867, 1, '192.168.1.3', 1535069666, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(868, 1, '192.168.1.3', 1535070557, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(869, 3, '191.253.235.', 1534984644, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(870, 3, '191.253.235.', 1534985370, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(871, 3, '191.253.235.', 1534985390, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(872, 3, '191.253.235.', 1534986499, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(873, 3, '191.253.235.', 1534986537, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(874, 1, '164.163.207.', 1534987385, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(875, 2, '186.225.187.', 1534987397, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(876, 1, '164.163.207.', 1534987823, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(877, 1, '164.163.207.', 1534987943, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(878, 1, '164.163.207.', 1534988567, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(879, 1, '164.163.207.', 1534988775, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(880, 1, '164.163.207.', 1534989077, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(881, 1, '164.163.207.', 1534989346, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(882, 1, '164.163.207.', 1534990527, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(883, 1, '164.163.207.', 1534991027, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(884, 1, '164.163.207.', 1534991486, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(885, 2, '186.225.187.', 1534991486, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(886, 2, '186.225.187.', 1534991535, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(887, 1, '164.163.207.', 1534991540, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(888, 1, '164.163.207.', 1534992616, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(889, 1, '164.163.207.', 1534994150, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(890, 2, '186.225.187.', 1534995305, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(891, 2, '186.225.187.', 1534995458, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(892, 2, '186.225.187.', 1534995506, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(893, 2, '186.225.187.', 1534995523, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(894, 1, '164.163.207.', 1534999457, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(895, 1, '164.163.207.', 1534999569, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(896, 1, '164.163.207.', 1534999838, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(897, 1, '164.163.207.', 1534999940, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(898, 1, '164.163.207.', 1535000112, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(899, 2, '186.225.187.', 1535000230, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(900, 1, '127.0.0.1', 1535120672, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(901, 1, '127.0.0.1', 1535121011, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(902, 1, '127.0.0.1', 1535121037, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(903, 1, '127.0.0.1', 1535121294, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(904, 1, '127.0.0.1', 1535121573, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(905, 1, '127.0.0.1', 1535124238, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(906, 1, '127.0.0.1', 1535126656, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(907, 1, '127.0.0.1', 1535128128, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(908, 1, '127.0.0.1', 1535128154, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(909, 1, '127.0.0.1', 1535128688, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(910, 1, '127.0.0.1', 1535134346, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(911, 1, '127.0.0.1', 1535136382, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(912, 1, '127.0.0.1', 1535136413, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(913, 1, '127.0.0.1', 1535136466, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(914, 1, '127.0.0.1', 1535137256, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(915, 1, '127.0.0.1', 1535137929, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(916, 1, '127.0.0.1', 1535138043, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(917, 1, '127.0.0.1', 1535138133, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(918, 1, '127.0.0.1', 1535138616, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(919, 1, '127.0.0.1', 1535140173, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(920, 1, '164.163.207.', 1535073690, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(921, 2, '186.225.187.', 1535073931, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(922, 20, '177.55.214.3', 1535074118, 0, 'E0F9DCA40D45EEDCEAF99A9094D4CAC48C985CE9'),
(923, 1, '164.163.207.', 1535075323, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(924, 1, '164.163.207.', 1535075379, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(925, 1, '164.163.207.', 1535075458, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(926, 1, '164.163.207.', 1535075595, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(927, 20, '177.55.214.3', 1535076968, 1, 'E0F9DCA40D45EEDCEAF99A9094D4CAC48C985CE9'),
(928, 1, '164.163.207.', 1535081416, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(929, 2, '186.225.187.', 1535081454, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(930, 2, '186.225.187.', 1535083055, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(931, 1, '164.163.207.', 1535083060, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(932, 1, '164.163.207.', 1535083098, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(933, 2, '186.225.187.', 1535083321, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(934, 1, '164.163.207.', 1535085170, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(935, 2, '186.225.187.', 1535085479, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(936, 2, '186.225.187.', 1535085519, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(937, 2, '186.225.187.', 1535087562, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(938, 2, '186.225.187.', 1535089637, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(939, 2, '186.225.187.', 1535287107, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(940, 2, '186.225.187.', 1535287543, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(941, 1, '127.0.0.1', 1535311289, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(942, 1, '127.0.0.1', 1535312495, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(943, 1, '127.0.0.1', 1535312660, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(944, 1, '127.0.0.1', 1535313701, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(945, 1, '127.0.0.1', 1535314396, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(946, 1, '127.0.0.1', 1535316210, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(947, 1, '127.0.0.1', 1535317102, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(948, 1, '127.0.0.1', 1535318985, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(949, 2, '186.225.187.', 1535244408, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(950, 2, '186.225.187.', 1535247971, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(951, 1, '164.163.207.', 1535248023, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(952, 3, '191.253.249.', 1535248233, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(953, 2, '186.225.187.', 1535248241, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(954, 1, '164.163.207.', 1535248284, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(955, 3, '191.253.249.', 1535248932, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(956, 2, '186.225.187.', 1535248985, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(957, 3, '191.253.249.', 1535249480, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(958, 2, '186.225.187.', 1535253625, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(959, 1, '127.0.0.1', 1535383207, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(960, 1, '127.0.0.1', 1535383387, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(961, 1, '127.0.0.1', 1535384263, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(962, 1, '127.0.0.1', 1535384405, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(963, 1, '127.0.0.1', 1535384693, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(964, 2, '186.225.187.', 1535324045, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(965, 2, '186.225.187.', 1535326016, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(966, 2, '186.225.187.', 1535326354, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(967, 1, '127.0.0.1', 1535413070, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(968, 2, '186.225.187.', 1535327726, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(969, 1, '127.0.0.1', 1535415241, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(970, 1, '127.0.0.1', 1535415248, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(971, 1, '164.163.207.', 1535345120, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(972, 11, '187.74.206.8', 1535345127, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(973, 11, '187.74.206.8', 1535345219, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(974, 11, '187.74.206.8', 1535345290, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(975, 11, '187.74.206.8', 1535345434, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(976, 11, '187.74.206.8', 1535345460, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(977, 11, '187.74.206.8', 1535345685, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(978, 1, '164.163.207.', 1535345878, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(979, 1, '164.163.207.', 1535346185, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(980, 11, '187.74.206.8', 1535348202, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(981, 11, '187.74.206.8', 1535348302, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(982, 11, '187.74.206.8', 1535348315, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(983, 1, '164.163.207.', 1535348471, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(984, 1, '164.163.207.', 1535349083, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(985, 1, '164.163.207.', 1535349142, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(986, 11, '187.74.206.8', 1535349147, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(987, 11, '187.74.206.8', 1535349301, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(988, 1, '164.163.207.', 1535349304, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(989, 11, '187.74.206.8', 1535349413, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(990, 1, '164.163.207.', 1535349625, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(991, 11, '187.74.206.8', 1535349660, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(992, 11, '187.74.206.8', 1535350403, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(993, 1, '164.163.207.', 1535350421, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(994, 3, '186.224.164.', 1535403381, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(995, 2, '186.225.187.', 1535403432, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(996, 3, '186.224.164.', 1535403467, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(997, 3, '186.224.164.', 1535403480, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(998, 3, '186.224.164.', 1535405135, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(999, 3, '186.224.164.', 1535405276, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(1000, 15, '186.225.187.', 1535408275, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(1001, 15, '186.225.187.', 1535409439, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(1002, 15, '186.225.187.', 1535409598, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(1003, 11, '187.74.206.8', 1535412966, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1004, 11, '187.74.206.8', 1535413106, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1005, 11, '187.74.206.8', 1535413392, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1006, 1, '164.163.207.', 1535413560, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1007, 1, '164.163.207.', 1535413702, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1008, 1, '164.163.207.', 1535413747, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1009, 1, '164.163.207.', 1535413810, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1010, 11, '187.74.206.8', 1535413829, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1011, 1, '164.163.207.', 1535413832, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1012, 11, '187.74.206.8', 1535413977, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1013, 1, '164.163.207.', 1535413981, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1014, 1, '164.163.207.', 1535414002, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1015, 11, '187.74.206.8', 1535414006, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1016, 1, '164.163.207.', 1535414011, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1017, 11, '187.74.206.8', 1535414071, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1018, 1, '164.163.207.', 1535414203, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1019, 1, '164.163.207.', 1535414224, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1020, 11, '187.74.206.8', 1535414236, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1021, 2, '186.225.187.', 1535415056, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1022, 1, '164.163.207.', 1535415358, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1023, 2, '186.225.187.', 1535415360, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1024, 1, '164.163.207.', 1535415399, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1025, 11, '187.74.206.8', 1535415416, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1026, 2, '186.225.187.', 1535415538, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1027, 11, '187.74.206.8', 1535415596, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1028, 1, '164.163.207.', 1535415699, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1029, 2, '186.225.187.', 1535415868, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1030, 1, '164.163.207.', 1535416339, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1031, 1, '164.163.207.', 1535416360, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1032, 1, '164.163.207.', 1535416487, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1033, 11, '187.74.206.8', 1535416576, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1034, 11, '187.74.206.8', 1535416605, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1035, 11, '187.74.206.8', 1535417127, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1036, 1, '164.163.207.', 1535417228, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1037, 11, '187.74.206.8', 1535417236, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1038, 11, '187.74.206.8', 1535417313, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1039, 11, '187.74.206.8', 1535417458, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1040, 1, '164.163.207.', 1535417468, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1041, 11, '187.74.206.8', 1535417569, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1042, 1, '164.163.207.', 1535417587, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1043, 1, '164.163.207.', 1535418838, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1044, 1, '164.163.207.', 1535419347, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1045, 1, '164.163.207.', 1535419780, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1046, 1, '164.163.207.', 1535420320, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1047, 11, '187.74.206.8', 1535420715, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1048, 1, '164.163.207.', 1535420720, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1049, 11, '187.74.206.8', 1535421091, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1050, 1, '164.163.207.', 1535421093, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1051, 1, '164.163.207.', 1535421146, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1052, 1, '164.163.207.', 1535421540, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1053, 1, '164.163.207.', 1535421565, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1054, 1, '164.163.207.', 1535422897, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1055, 1, '164.163.207.', 1535432671, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1056, 1, '164.163.207.', 1535432681, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1057, 1, '164.163.207.', 1535432840, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1058, 1, '164.163.207.', 1535433412, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1059, 1, '164.163.207.', 1535474686, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1060, 1, '164.163.207.', 1535474707, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1061, 1, '164.163.207.', 1535474716, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1062, 1, '164.163.207.', 1535478138, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1063, 1, '127.0.0.1', 1535564576, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1064, 1, '127.0.0.1', 1535564606, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1065, 1, '127.0.0.1', 1535566947, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1066, 1, '127.0.0.1', 1535566979, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1067, 1, '127.0.0.1', 1535567105, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1068, 1, '127.0.0.1', 1535567135, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1069, 1, '127.0.0.1', 1535567231, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1070, 1, '127.0.0.1', 1535567260, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1071, 1, '127.0.0.1', 1535570931, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1072, 1, '127.0.0.1', 1535576394, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1073, 1, '164.163.207.', 1535490041, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1074, 1, '164.163.207.', 1535490372, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1075, 2, '186.225.187.', 1535490400, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1076, 1, '164.163.207.', 1535490421, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1077, 15, '186.225.187.', 1535494030, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(1078, 1, '164.163.207.', 1535494838, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1079, 1, '164.163.207.', 1535494862, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1080, 1, '164.163.207.', 1535495815, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1081, 1, '164.163.207.', 1535496673, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1082, 51, '191.181.74.7', 1535497985, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1083, 3, '186.224.172.', 1535498857, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(1084, 15, '186.225.187.', 1535500204, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(1085, 51, '191.181.74.7', 1535501140, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1086, 1, '164.163.207.', 1535501141, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1087, 3, '186.224.172.', 1535501201, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(1088, 2, '186.225.187.', 1535502726, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1089, 1, '127.0.0.1', 1535611570, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1090, 1, '127.0.0.1', 1535612142, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1091, 1, '127.0.0.1', 1535612173, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1092, 1, '127.0.0.1', 1535612482, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1093, 1, '127.0.0.1', 1535613075, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1094, 1, '127.0.0.1', 1535614034, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1095, 1, '127.0.0.1', 1535614156, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1096, 1, '127.0.0.1', 1535620338, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1097, 1, '127.0.0.1', 1535620558, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1098, 1, '127.0.0.1', 1535620672, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1099, 1, '127.0.0.1', 1535620726, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1100, 1, '127.0.0.1', 1535621139, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1101, 1, '127.0.0.1', 1535621811, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1102, 1, '127.0.0.1', 1535621949, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1103, 1, '127.0.0.1', 1535621971, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1104, 1, '127.0.0.1', 1535622807, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1105, 1, '127.0.0.1', 1535623085, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1106, 1, '127.0.0.1', 1535624088, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1107, 1, '127.0.0.1', 1535624285, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1108, 1, '127.0.0.1', 1535626156, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1109, 1, '127.0.0.1', 1535626982, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1110, 1, '127.0.0.1', 1535628238, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1111, 1, '127.0.0.1', 1535628747, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1112, 1, '127.0.0.1', 1535629530, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1113, 1, '164.163.207.', 1535543209, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1114, 48, '177.159.77.1', 1535543616, 0, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1115, 51, '191.181.74.7', 1535547830, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1116, 1, '164.163.207.', 1535548004, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1117, 51, '191.181.74.7', 1535548134, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1118, 48, '177.159.77.1', 1535548147, 1, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1119, 1, '127.0.0.1', 1535656146, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1120, 1, '127.0.0.1', 1535661978, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1121, 1, '127.0.0.1', 1535687940, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1122, 1, '127.0.0.1', 1535688447, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1123, 1, '127.0.0.1', 1535688536, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1124, 1, '127.0.0.1', 1535688834, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1125, 11, '187.101.184.', 1535604601, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1126, 1, '164.163.207.', 1535604607, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1127, 11, '187.101.184.', 1535604767, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1128, 11, '187.101.184.', 1535605573, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1129, 1, '164.163.207.', 1535605602, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1130, 1, '164.163.207.', 1535605807, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1131, 1, '164.163.207.', 1535605882, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1132, 1, '164.163.207.', 1535607613, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1133, 11, '187.101.184.', 1535607615, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1134, 1, '164.163.207.', 1535608189, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1135, 11, '187.101.184.', 1535608252, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1136, 1, '164.163.207.', 1535608409, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1137, 11, '187.101.184.', 1535608450, 0, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1138, 11, '187.101.184.', 1535608510, 1, 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9'),
(1139, 1, '164.163.207.', 1535608997, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1140, 1, '164.163.207.', 1535610700, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1141, 1, '164.163.207.', 1535613132, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1142, 1, '164.163.207.', 1535631105, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1143, 1, '164.163.207.', 1535633580, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1144, 1, '127.0.0.1', 1535720539, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1145, 1, '127.0.0.1', 1535722111, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1146, 1, '127.0.0.1', 1535722200, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1147, 1, '127.0.0.1', 1535724053, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1148, 1, '127.0.0.1', 1535727361, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1149, 1, '127.0.0.1', 1535727418, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1150, 1, '127.0.0.1', 1535727796, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1151, 1, '127.0.0.1', 1535727846, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1152, 1, '127.0.0.1', 1535729168, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1153, 1, '127.0.0.1', 1535729194, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1154, 1, '127.0.0.1', 1535729297, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1155, 1, '127.0.0.1', 1535729378, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1156, 1, '127.0.0.1', 1535729396, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1157, 1, '127.0.0.1', 1535729438, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1158, 1, '127.0.0.1', 1535729483, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1159, 1, '127.0.0.1', 1535729528, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1160, 1, '127.0.0.1', 1535729644, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1161, 1, '127.0.0.1', 1535731139, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1162, 1, '127.0.0.1', 1535731200, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1163, 1, '127.0.0.1', 1535732610, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1164, 1, '127.0.0.1', 1535732955, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1165, 1, '127.0.0.1', 1535733283, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1166, 1, '127.0.0.1', 1535733621, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1167, 1, '127.0.0.1', 1535734038, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1168, 1, '127.0.0.1', 1535734056, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1169, 1, '127.0.0.1', 1535734838, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1170, 1, '127.0.0.1', 1535737305, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1171, 1, '127.0.0.1', 1535737460, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1172, 1, '127.0.0.1', 1535738555, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1173, 1, '127.0.0.1', 1535739003, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1174, 1, '127.0.0.1', 1535739759, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1175, 1, '127.0.0.1', 1535740340, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1176, 1, '127.0.0.1', 1535740360, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1177, 3, '189.28.231.7', 1535654526, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(1178, 1, '127.0.0.1', 1535741348, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1179, 1, '164.163.207.', 1535655000, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1180, 1, '164.163.207.', 1535655276, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1181, 1, '164.163.207.', 1535655298, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1182, 1, '164.163.207.', 1535655544, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1183, 3, '189.28.231.7', 1535656487, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(1184, 3, '189.28.231.7', 1535656509, 0, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(1185, 1, '164.163.207.', 1535656646, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1186, 1, '164.163.207.', 1535658570, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1187, 1, '127.0.0.1', 1535745092, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1188, 3, '189.28.231.7', 1535659594, 1, '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C'),
(1189, 1, '127.0.0.1', 1535750156, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1190, 1, '164.163.207.', 1535753049, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1191, 1, '164.163.207.', 1535753077, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1192, 2, '186.225.187.', 1535753330, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1193, 38, '189.114.134.', 1535753350, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1194, 78, '189.35.82.13', 1535753359, 0, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(1195, 73, '177.208.177.', 1535753365, 0, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1196, 82, '177.130.7.15', 1535753378, 0, '4C88A8E48E49AF9DFE59ED99C098CEE5049FEEEC'),
(1197, 26, '167.249.49.2', 1535753379, 0, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1198, 50, '201.4.56.226', 1535753379, 0, '8089E859ECEE98ED4CF8E599A8AA8DC4CD958808'),
(1199, 15, '186.225.187.', 1535753382, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(1200, 38, '189.114.134.', 1535753406, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1201, 38, '189.114.134.', 1535753427, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1202, 1, '164.163.207.', 1535753433, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1203, 38, '189.114.134.', 1535753453, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1204, 1, '164.163.207.', 1535753460, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1205, 49, '191.5.230.6', 1535753469, 0, 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984'),
(1206, 77, '189.6.23.72', 1535753512, 0, '94AD9E949E8CCC5D45C4D4D404CAAC4959059FF4'),
(1207, 38, '189.114.134.', 1535753566, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1208, 52, '177.181.214.', 1535753573, 0, '9A84AAEE8EF998D95F8AA9ACA494EF8C5F9DDEF9'),
(1209, 38, '189.114.134.', 1535753601, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1210, 53, '170.245.64.2', 1535753638, 0, '48D85D80D94E5DFC0F909FC05C5F485C448E9C8F'),
(1211, 31, '189.51.155.2', 1535753674, 0, '8089E859ECEE98ED4CF8E599A8AA8DC4CD958808'),
(1212, 57, '177.192.250.', 1535753700, 0, 'A4D9D44C850C59D8D9D88C8E8CEFDED99444D48E'),
(1213, 38, '189.114.134.', 1535753707, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C');
INSERT INTO `connections` (`id`, `MasterAccount`, `IP`, `Timestamp`, `Type`, `Serial`) VALUES
(1214, 56, '186.242.233.', 1535753751, 0, '4ACD844AAF9094D494DFC058C84E4E8ED844049E'),
(1215, 38, '189.114.134.', 1535753756, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1216, 87, '93.108.195.1', 1535753756, 0, 'FCD5EA88EEE584EC449994EE9EED4EF9C84EF488'),
(1217, 35, '187.94.211.1', 1535753768, 0, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1218, 38, '189.114.134.', 1535753790, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1219, 77, '189.6.23.72', 1535753790, 1, '94AD9E949E8CCC5D45C4D4D404CAAC4959059FF4'),
(1220, 28, '45.65.212.25', 1535753805, 0, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1221, 38, '189.114.134.', 1535753817, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1222, 89, '177.141.179.', 1535753850, 0, 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80'),
(1223, 30, '177.37.236.1', 1535753851, 0, '5DC90CCDC54D980A9E48AA4484E959E8CF5FE4F8'),
(1224, 52, '177.181.214.', 1535753901, 1, '9A84AAEE8EF998D95F8AA9ACA494EF8C5F9DDEF9'),
(1225, 1, '164.163.207.', 1535753907, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1226, 35, '187.94.211.1', 1535753949, 1, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1227, 38, '189.114.134.', 1535753985, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1228, 51, '191.181.74.7', 1535753994, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1229, 38, '189.114.134.', 1535754010, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1230, 46, '170.79.77.17', 1535754110, 0, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1231, 24, '189.48.204.7', 1535754110, 0, 'ECC940AFC09485ED9D8DCF8845C8E8E894DD995E'),
(1232, 36, '200.229.230.', 1535754131, 0, 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D'),
(1233, 38, '189.114.134.', 1535754168, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1234, 38, '189.114.134.', 1535754195, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1235, 35, '187.94.211.1', 1535754197, 0, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1236, 87, '93.108.195.1', 1535754217, 1, 'FCD5EA88EEE584EC449994EE9EED4EF9C84EF488'),
(1237, 35, '187.94.211.1', 1535754236, 1, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1238, 38, '189.114.134.', 1535754249, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1239, 52, '189.40.84.20', 1535754250, 0, '9A84AAEE8EF998D95F8AA9ACA494EF8C5F9DDEF9'),
(1240, 38, '189.114.134.', 1535754276, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1241, 29, '168.227.228.', 1535754309, 0, 'ACEDC494D84AC4D9F9DC544004ADD8D0405F45EE'),
(1242, 77, '189.6.23.72', 1535754313, 0, '94AD9E949E8CCC5D45C4D4D404CAAC4959059FF4'),
(1243, 73, '177.208.177.', 1535754332, 1, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1244, 38, '189.114.134.', 1535754338, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1245, 1, '164.163.207.', 1535754338, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1246, 35, '187.94.211.1', 1535754351, 0, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1247, 71, '177.23.212.1', 1535754361, 0, '4FED8CC95E945E9C49F045DCCDAAA4D04DECFD0F'),
(1248, 38, '189.114.134.', 1535754362, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1249, 35, '187.94.211.1', 1535754379, 1, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1250, 35, '187.94.211.1', 1535754402, 0, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1251, 38, '189.114.134.', 1535754428, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1252, 73, '177.208.177.', 1535754429, 0, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1253, 36, '200.229.230.', 1535754434, 1, 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D'),
(1254, 35, '187.94.211.1', 1535754446, 1, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1255, 38, '189.114.134.', 1535754455, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1256, 87, '93.108.195.1', 1535754464, 0, 'FCD5EA88EEE584EC449994EE9EED4EF9C84EF488'),
(1257, 35, '187.94.211.1', 1535754465, 0, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1258, 94, '170.231.181.', 1535754480, 0, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1259, 35, '187.94.211.1', 1535754503, 1, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1260, 30, '177.37.236.1', 1535754560, 1, '5DC90CCDC54D980A9E48AA4484E959E8CF5FE4F8'),
(1261, 35, '187.94.211.1', 1535754565, 0, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1262, 51, '191.181.74.7', 1535754578, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1263, 38, '189.114.134.', 1535754600, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1264, 30, '177.37.236.1', 1535754602, 0, '5DC90CCDC54D980A9E48AA4484E959E8CF5FE4F8'),
(1265, 28, '45.65.212.25', 1535754609, 1, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1266, 35, '187.94.211.1', 1535754616, 1, 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C'),
(1267, 38, '189.114.134.', 1535754633, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1268, 1, '164.163.207.', 1535754643, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1269, 36, '200.229.230.', 1535754645, 0, 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D'),
(1270, 28, '45.65.212.25', 1535754675, 0, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1271, 38, '189.114.134.', 1535754678, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1272, 38, '189.114.134.', 1535754711, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1273, 28, '45.65.212.25', 1535754713, 1, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1274, 28, '45.65.212.25', 1535754747, 0, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1275, 51, '191.181.74.7', 1535754819, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1276, 26, '167.249.49.2', 1535754840, 1, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1277, 79, '191.35.150.9', 1535754849, 0, '49EF08C8998DC5E4A9EFEEDCD8F4C094DD8D09DC'),
(1278, 100, '170.79.169.1', 1535754915, 0, 'DD988E9E8FFF58C8049EEE844ED899C89AFAC4C8'),
(1279, 79, '191.35.150.9', 1535754919, 1, '49EF08C8998DC5E4A9EFEEDCD8F4C094DD8D09DC'),
(1280, 87, '93.108.195.1', 1535754929, 1, 'FCD5EA88EEE584EC449994EE9EED4EF9C84EF488'),
(1281, 41, '200.199.167.', 1535754986, 0, '4C5DC0C4C4DD4DFCA8E95CDCA4D0C9D584F8DFD9'),
(1282, 71, '177.23.212.1', 1535754993, 1, '4FED8CC95E945E9C49F045DCCDAAA4D04DECFD0F'),
(1283, 38, '189.114.134.', 1535755012, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1284, 38, '189.114.134.', 1535755039, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1285, 73, '177.208.177.', 1535755146, 1, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1286, 26, '167.249.49.2', 1535755147, 0, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1287, 36, '200.229.230.', 1535755158, 1, 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D'),
(1288, 73, '177.208.177.', 1535755170, 0, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1289, 79, '191.35.150.9', 1535755182, 0, '49EF08C8998DC5E4A9EFEEDCD8F4C094DD8D09DC'),
(1290, 36, '200.229.230.', 1535755237, 0, 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D'),
(1291, 94, '170.231.181.', 1535755243, 1, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1292, 94, '170.231.181.', 1535755291, 0, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1293, 38, '189.114.134.', 1535755291, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1294, 38, '189.114.134.', 1535755331, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1295, 41, '200.199.167.', 1535755374, 1, '4C5DC0C4C4DD4DFCA8E95CDCA4D0C9D584F8DFD9'),
(1296, 74, '201.17.8.148', 1535755392, 0, 'DE445D00998FCD9EC8485DCEA4ED4D9AECDD4D4C'),
(1297, 79, '191.35.150.9', 1535755503, 0, '49EF08C8998DC5E4A9EFEEDCD8F4C094DD8D09DC'),
(1298, 55, '179.180.217.', 1535755584, 0, 'C84EC9449DE89F4ECCF5CC98458EE5AAD8449DFD'),
(1299, 2, '186.225.187.', 1535755685, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1300, 36, '200.229.230.', 1535755724, 1, 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D'),
(1301, 98, '177.84.96.3', 1535755760, 0, '995E5CD8CADCD88FCAE89EDCACA00DADDC4E49C4'),
(1302, 36, '200.229.230.', 1535755814, 0, 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D'),
(1303, 12, '179.106.74.1', 1535755851, 0, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(1304, 2, '186.225.187.', 1535755895, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1305, 46, '170.79.77.17', 1535756026, 1, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1306, 28, '45.65.212.25', 1535756049, 1, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1307, 41, '200.199.167.', 1535756068, 0, '4C5DC0C4C4DD4DFCA8E95CDCA4D0C9D584F8DFD9'),
(1308, 89, '177.141.179.', 1535756079, 1, 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80'),
(1309, 39, '131.161.108.', 1535756087, 0, 'CDCC5F5C9DD8949ED48DEF454EDDF0E09ED88EAE'),
(1310, 102, '189.69.17.17', 1535756110, 0, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(1311, 46, '170.79.77.17', 1535756128, 0, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1312, 41, '200.199.167.', 1535756134, 1, '4C5DC0C4C4DD4DFCA8E95CDCA4D0C9D584F8DFD9'),
(1313, 28, '45.65.212.25', 1535756145, 0, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1314, 89, '177.141.179.', 1535756177, 0, 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80'),
(1315, 74, '201.17.8.148', 1535756233, 1, 'DE445D00998FCD9EC8485DCEA4ED4D9AECDD4D4C'),
(1316, 28, '45.65.212.25', 1535756283, 1, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1317, 102, '189.69.17.17', 1535756382, 1, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(1318, 26, '167.249.49.2', 1535756390, 1, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1319, 1, '164.163.207.', 1535756396, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1320, 41, '200.199.167.', 1535756413, 0, '4C5DC0C4C4DD4DFCA8E95CDCA4D0C9D584F8DFD9'),
(1321, 49, '191.5.230.6', 1535756427, 1, 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984'),
(1322, 49, '191.5.230.6', 1535756477, 0, 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984'),
(1323, 89, '177.141.179.', 1535756503, 1, 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80'),
(1324, 26, '167.249.49.2', 1535756505, 0, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1325, 98, '177.84.96.3', 1535756524, 1, '995E5CD8CADCD88FCAE89EDCACA00DADDC4E49C4'),
(1326, 31, '189.51.155.2', 1535756542, 1, '8089E859ECEE98ED4CF8E599A8AA8DC4CD958808'),
(1327, 89, '177.141.179.', 1535756544, 0, 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80'),
(1328, 75, '45.234.176.2', 1535756588, 0, '4945DECED9CAE99DC5E9449E00898D8DCEAD5CD4'),
(1329, 36, '200.229.230.', 1535756606, 1, 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D'),
(1330, 22, '177.188.140.', 1535756625, 0, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1331, 39, '131.161.108.', 1535756643, 1, 'CDCC5F5C9DD8949ED48DEF454EDDF0E09ED88EAE'),
(1332, 49, '191.5.230.6', 1535756657, 1, 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984'),
(1333, 89, '177.141.179.', 1535756690, 1, 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80'),
(1334, 75, '45.234.176.2', 1535756723, 1, '4945DECED9CAE99DC5E9449E00898D8DCEAD5CD4'),
(1335, 28, '45.65.212.25', 1535756738, 0, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1336, 2, '186.225.187.', 1535756768, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1337, 77, '189.6.23.72', 1535756851, 1, '94AD9E949E8CCC5D45C4D4D404CAAC4959059FF4'),
(1338, 28, '45.65.212.25', 1535756885, 1, 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA'),
(1339, 2, '186.225.187.', 1535756889, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1340, 24, '189.48.204.7', 1535756932, 1, 'ECC940AFC09485ED9D8DCF8845C8E8E894DD995E'),
(1341, 2, '186.225.187.', 1535756935, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1342, 2, '186.225.187.', 1535756955, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1343, 49, '191.5.230.6', 1535756975, 0, 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984'),
(1344, 2, '186.225.187.', 1535757015, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1345, 22, '177.188.140.', 1535757034, 1, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1346, 2, '186.225.187.', 1535757063, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1347, 22, '177.188.140.', 1535757079, 0, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1348, 15, '186.225.187.', 1535757082, 1, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(1349, 2, '186.225.187.', 1535757103, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1350, 12, '179.106.74.1', 1535757122, 1, 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45'),
(1351, 22, '177.188.140.', 1535757122, 1, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1352, 44, '187.16.156.7', 1535757124, 0, 'E8F5545EE85E905DD449899EDD9E40AE4C99E88'),
(1353, 46, '170.79.77.17', 1535757213, 1, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1354, 22, '177.188.140.', 1535757233, 0, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1355, 22, '177.188.140.', 1535757265, 1, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1356, 22, '177.188.140.', 1535757302, 0, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1357, 2, '186.225.187.', 1535757307, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1358, 78, '189.35.82.13', 1535757324, 1, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(1359, 22, '177.188.140.', 1535757330, 1, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1360, 2, '186.225.187.', 1535757342, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1361, 23, '189.24.172.2', 1535757351, 0, '80EFD585C5EED548F4DC448CDF8A5C95899044C0'),
(1362, 22, '177.188.140.', 1535757369, 0, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1363, 52, '189.40.84.20', 1535757384, 1, '9A84AAEE8EF998D95F8AA9ACA494EF8C5F9DDEF9'),
(1364, 2, '186.225.187.', 1535757386, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1365, 89, '177.141.179.', 1535757419, 0, 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80'),
(1366, 2, '186.225.187.', 1535757426, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1367, 22, '177.188.140.', 1535757499, 1, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1368, 89, '177.141.179.', 1535757548, 1, 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80'),
(1369, 22, '177.188.140.', 1535757552, 0, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1370, 49, '191.5.230.6', 1535757565, 1, 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984'),
(1371, 22, '177.188.140.', 1535757598, 1, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1372, 55, '179.180.217.', 1535757625, 1, 'C84EC9449DE89F4ECCF5CC98458EE5AAD8449DFD'),
(1373, 22, '177.188.140.', 1535757633, 0, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1374, 1, '164.163.207.', 1535757653, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1375, 38, '189.114.134.', 1535757675, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1376, 38, '189.114.134.', 1535757776, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1377, 48, '177.159.77.1', 1535757785, 0, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1378, 82, '177.130.7.15', 1535757802, 1, '4C88A8E48E49AF9DFE59ED99C098CEE5049FEEEC'),
(1379, 100, '170.79.169.1', 1535757802, 1, 'DD988E9E8FFF58C8049EEE844ED899C89AFAC4C8'),
(1380, 38, '189.114.134.', 1535757804, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1381, 19, '177.72.15.16', 1535757886, 0, 'CC4CC84449E5D5ECC5D8FAF8C9E5CC8C9D8DCF04'),
(1382, 38, '189.114.134.', 1535757937, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1383, 38, '189.114.134.', 1535757962, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1384, 66, '109.48.182.1', 1535758155, 0, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1385, 19, '177.72.15.16', 1535758225, 1, 'CC4CC84449E5D5ECC5D8FAF8C9E5CC8C9D8DCF04'),
(1386, 73, '177.208.177.', 1535758293, 1, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1387, 94, '170.231.181.', 1535758300, 1, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1388, 94, '170.231.181.', 1535758337, 0, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1389, 73, '177.208.177.', 1535758340, 0, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1390, 48, '177.159.77.1', 1535758406, 1, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1391, 39, '131.161.108.', 1535758413, 0, 'CDCC5F5C9DD8949ED48DEF454EDDF0E09ED88EAE'),
(1392, 29, '168.227.228.', 1535758494, 1, 'ACEDC494D84AC4D9F9DC544004ADD8D0405F45EE'),
(1393, 73, '177.208.177.', 1535758655, 1, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1394, 22, '177.188.140.', 1535758674, 1, 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C'),
(1395, 29, '168.227.228.', 1535758755, 0, 'ACEDC494D84AC4D9F9DC544004ADD8D0405F45EE'),
(1396, 49, '191.5.230.6', 1535758906, 0, 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984'),
(1397, 30, '177.37.236.1', 1535759106, 1, '5DC90CCDC54D980A9E48AA4484E959E8CF5FE4F8'),
(1398, 30, '177.37.236.1', 1535759157, 0, '5DC90CCDC54D980A9E48AA4484E959E8CF5FE4F8'),
(1399, 26, '167.249.49.2', 1535759228, 1, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1400, 27, '181.221.198.', 1535759250, 0, 'D8484D498E9CE4CDD444ECF08C09F49408C08A8A'),
(1401, 82, '177.130.7.15', 1535759271, 0, '4C88A8E48E49AF9DFE59ED99C098CEE5049FEEEC'),
(1402, 49, '191.5.230.6', 1535759321, 1, 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984'),
(1403, 44, '187.16.156.7', 1535759340, 1, 'E8F5545EE85E905DD449899EDD9E40AE4C99E88'),
(1404, 94, '170.231.181.', 1535759368, 1, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1405, 94, '170.231.181.', 1535759405, 0, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1406, 73, '177.208.177.', 1535759414, 0, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1407, 1, '164.163.207.', 1535759428, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1408, 100, '170.79.169.1', 1535759438, 0, 'DD988E9E8FFF58C8049EEE844ED899C89AFAC4C8'),
(1409, 38, '189.114.134.', 1535759466, 0, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1410, 38, '189.114.134.', 1535759495, 1, 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C'),
(1411, 88, '179.96.152.4', 1535759530, 0, '5F95ECC4C4EF90884088A48AE80E40DF0EE9D489'),
(1412, 51, '191.181.74.7', 1535759652, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1413, 15, '186.225.187.', 1535759801, 0, 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5'),
(1414, 88, '179.96.152.4', 1535759874, 1, '5F95ECC4C4EF90884088A48AE80E40DF0EE9D489'),
(1415, 23, '189.24.172.2', 1535759878, 1, '80EFD585C5EED548F4DC448CDF8A5C95899044C0'),
(1416, 88, '179.96.152.4', 1535759905, 0, '5F95ECC4C4EF90884088A48AE80E40DF0EE9D489'),
(1417, 73, '177.208.177.', 1535759913, 1, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1418, 27, '181.221.198.', 1535759920, 1, 'D8484D498E9CE4CDD444ECF08C09F49408C08A8A'),
(1419, 73, '177.208.177.', 1535759962, 0, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1420, 39, '131.161.108.', 1535760047, 1, 'CDCC5F5C9DD8949ED48DEF454EDDF0E09ED88EAE'),
(1421, 78, '189.35.82.13', 1535760048, 0, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(1422, 105, '131.72.203.1', 1535760068, 0, '9D98CAFE8E49FEF8FA8F98DEF494C889844CCA8D'),
(1423, 56, '186.242.233.', 1535760232, 0, '4ACD844AAF9094D494DFC058C84E4E8ED844049E'),
(1424, 57, '177.192.250.', 1535760247, 0, 'A4D9D44C850C59D8D9D88C8E8CEFDED99444D48E'),
(1425, 2, '186.225.187.', 1535760249, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1426, 66, '109.48.182.1', 1535760282, 0, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1427, 73, '177.208.177.', 1535760309, 0, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1428, 88, '179.96.152.4', 1535760419, 0, '5F95ECC4C4EF90884088A48AE80E40DF0EE9D489'),
(1429, 94, '170.231.181.', 1535760468, 0, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1430, 78, '189.35.82.13', 1535760485, 0, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(1431, 50, '201.4.56.226', 1535760624, 0, '8089E859ECEE98ED4CF8E599A8AA8DC4CD958808'),
(1432, 78, '189.35.82.13', 1535760920, 1, '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE'),
(1433, 26, '167.249.49.2', 1535761060, 0, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1434, 73, '177.208.177.', 1535761092, 1, 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF'),
(1435, 50, '201.4.56.226', 1535761119, 1, '8089E859ECEE98ED4CF8E599A8AA8DC4CD958808'),
(1436, 94, '170.231.181.', 1535761177, 0, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1437, 26, '167.249.49.2', 1535761275, 0, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1438, 57, '177.192.250.', 1535761333, 1, 'A4D9D44C850C59D8D9D88C8E8CEFDED99444D48E'),
(1439, 56, '186.242.233.', 1535761352, 1, '4ACD844AAF9094D494DFC058C84E4E8ED844049E'),
(1440, 26, '167.249.49.2', 1535761392, 1, 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489'),
(1441, 68, '179.105.93.8', 1535761458, 0, 'C8C0884F48CE88A9C849EE5F99A449EE8CA88E58'),
(1442, 88, '179.96.152.4', 1535761547, 1, '5F95ECC4C4EF90884088A48AE80E40DF0EE9D489'),
(1443, 29, '168.227.228.', 1535761574, 0, 'ACEDC494D84AC4D9F9DC544004ADD8D0405F45EE'),
(1444, 37, '177.42.244.4', 1535762102, 0, 'C9FFD5F84995E88AE85F8C4898DEF8CEFCDDC40'),
(1445, 2, '186.225.187.', 1535762175, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1446, 61, '187.36.179.2', 1535762245, 0, 'C958C8D585F4C4E5CEE4D89E8F94C4C085FDEE9A'),
(1447, 66, '109.48.182.1', 1535762339, 1, 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE'),
(1448, 2, '186.225.187.', 1535762379, 0, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1449, 61, '187.36.179.2', 1535762426, 1, 'C958C8D585F4C4E5CEE4D89E8F94C4C085FDEE9A'),
(1450, 41, '200.199.167.', 1535762722, 0, '4C5DC0C4C4DD4DFCA8E95CDCA4D0C9D584F8DFD9'),
(1451, 53, '170.245.64.2', 1535762739, 0, '48D85D80D94E5DFC0F909FC05C5F485C448E9C8F'),
(1452, 29, '168.227.228.', 1535762748, 1, 'ACEDC494D84AC4D9F9DC544004ADD8D0405F45EE'),
(1453, 94, '170.231.181.', 1535762820, 1, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1454, 94, '170.231.181.', 1535762900, 0, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1455, 105, '131.72.203.1', 1535762975, 0, '9D98CAFE8E49FEF8FA8F98DEF494C889844CCA8D'),
(1456, 88, '179.96.152.4', 1535763117, 0, '5F95ECC4C4EF90884088A48AE80E40DF0EE9D489'),
(1457, 105, '131.72.203.1', 1535763322, 1, '9D98CAFE8E49FEF8FA8F98DEF494C889844CCA8D'),
(1458, 88, '179.96.152.4', 1535763476, 1, '5F95ECC4C4EF90884088A48AE80E40DF0EE9D489'),
(1459, 56, '186.242.233.', 1535763998, 0, '4ACD844AAF9094D494DFC058C84E4E8ED844049E'),
(1460, 56, '186.242.233.', 1535764376, 1, '4ACD844AAF9094D494DFC058C84E4E8ED844049E'),
(1461, 1, '164.163.207.', 1535764420, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1462, 1, '164.163.207.', 1535764451, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1463, 109, '187.74.187.7', 1535764548, 0, '4945DECED9CAE99DC5E9449E00898D8DCEAD5CD4'),
(1464, 2, '186.225.187.', 1535764555, 1, '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0'),
(1465, 37, '177.42.244.4', 1535764611, 1, 'C9FFD5F84995E88AE85F8C4898DEF8CEFCDDC40'),
(1466, 41, '200.199.167.', 1535764676, 1, '4C5DC0C4C4DD4DFCA8E95CDCA4D0C9D584F8DFD9'),
(1467, 53, '170.245.64.2', 1535764679, 1, '48D85D80D94E5DFC0F909FC05C5F485C448E9C8F'),
(1468, 94, '170.231.181.', 1535764727, 1, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1469, 68, '179.105.93.8', 1535764727, 1, 'C8C0884F48CE88A9C849EE5F99A449EE8CA88E58'),
(1470, 109, '187.74.187.7', 1535764727, 1, '4945DECED9CAE99DC5E9449E00898D8DCEAD5CD4'),
(1471, 68, '179.105.93.8', 1535764782, 0, 'C8C0884F48CE88A9C849EE5F99A449EE8CA88E58'),
(1472, 94, '170.231.181.', 1535764793, 0, 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA'),
(1473, 1, '164.163.207.', 1535758225, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1474, 51, '191.181.74.7', 1535758864, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1475, 51, '191.181.74.7', 1535760319, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1476, 1, '164.163.207.', 1535760319, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1477, 1, '164.163.207.', 1535760337, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1478, 51, '191.181.74.7', 1535760457, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1479, 1, '164.163.207.', 1535760868, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1480, 51, '191.181.74.7', 1535760868, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1481, 1, '164.163.207.', 1535760885, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1482, 1, '164.163.207.', 1535760947, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1483, 1, '164.163.207.', 1535761046, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1484, 51, '191.181.74.7', 1535761190, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1485, 1, '164.163.207.', 1535761795, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1486, 1, '164.163.207.', 1535762088, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1487, 51, '191.181.74.7', 1535762172, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1488, 1, '164.163.207.', 1535762211, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1489, 51, '191.181.74.7', 1535762333, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1490, 1, '164.163.207.', 1535762922, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1491, 117, '45.227.59.24', 1535763647, 0, 'E9988E9495D0DC0D9CC4C4CCD8888AE454DA98DE'),
(1492, 51, '191.181.74.7', 1535763709, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1493, 117, '45.227.59.24', 1535763728, 1, 'E9988E9495D0DC0D9CC4C4CCD8888AE454DA98DE'),
(1494, 1, '164.163.207.', 1535764026, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1495, 51, '191.181.74.7', 1535764060, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1496, 117, '45.227.59.24', 1535764415, 0, 'E9988E9495D0DC0D9CC4C4CCD8888AE454DA98DE'),
(1497, 117, '45.227.59.24', 1535765208, 1, 'E9988E9495D0DC0D9CC4C4CCD8888AE454DA98DE'),
(1498, 51, '191.181.74.7', 1535766670, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1499, 1, '164.163.207.', 1535766674, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1500, 1, '164.163.207.', 1535766998, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1501, 51, '191.181.74.7', 1535768560, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1502, 51, '191.181.74.7', 1535768978, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1503, 1, '164.163.207.', 1535769052, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1504, 51, '191.181.74.7', 1535769162, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1505, 1, '164.163.207.', 1535770757, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1506, 1, '127.0.0.1', 1535857470, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1507, 1, '127.0.0.1', 1535857506, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1508, 51, '191.181.74.7', 1535771150, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1509, 1, '127.0.0.1', 1535859639, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1510, 1, '127.0.0.1', 1535860161, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1511, 1, '127.0.0.1', 1535860179, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1512, 1, '127.0.0.1', 1535860239, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1513, 1, '127.0.0.1', 1535860284, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1514, 1, '127.0.0.1', 1535861669, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1515, 1, '127.0.0.1', 1535861778, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1516, 1, '127.0.0.1', 1535872816, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1517, 1, '127.0.0.1', 1535872879, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1518, 1, '127.0.0.1', 1535873566, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1519, 1, '127.0.0.1', 1535874912, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1520, 1, '127.0.0.1', 1535874993, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1521, 1, '127.0.0.1', 1535875002, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1522, 1, '127.0.0.1', 1535875026, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1523, 1, '127.0.0.1', 1535875039, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1524, 1, '127.0.0.1', 1535875101, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1525, 1, '127.0.0.1', 1535875110, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1526, 1, '127.0.0.1', 1535875244, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1527, 1, '127.0.0.1', 1535875261, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1528, 1, '127.0.0.1', 1535875364, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1529, 1, '127.0.0.1', 1535875611, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1530, 1, '127.0.0.1', 1535883490, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1531, 1, '127.0.0.1', 1535884132, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1532, 1, '127.0.0.1', 1535885326, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1533, 1, '127.0.0.1', 1535885633, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1534, 1, '127.0.0.1', 1535885684, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1535, 1, '127.0.0.1', 1535885706, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1536, 1, '127.0.0.1', 1535885826, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1537, 1, '127.0.0.1', 1535886747, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1538, 1, '127.0.0.1', 1535886860, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1539, 1, '127.0.0.1', 1535888228, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1540, 1, '127.0.0.1', 1535888697, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1541, 1, '127.0.0.1', 1535888752, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1542, 1, '127.0.0.1', 1535889943, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1543, 1, '127.0.0.1', 1535890036, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1544, 1, '127.0.0.1', 1535890139, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1545, 1, '127.0.0.1', 1535890299, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1546, 1, '127.0.0.1', 1535890678, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1547, 1, '127.0.0.1', 1535891019, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1548, 1, '127.0.0.1', 1535891040, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1549, 1, '127.0.0.1', 1535891057, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1550, 1, '127.0.0.1', 1535891228, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1551, 1, '127.0.0.1', 1535891640, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1552, 1, '127.0.0.1', 1535891658, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1553, 1, '127.0.0.1', 1535893074, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1554, 1, '127.0.0.1', 1535893868, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1555, 1, '127.0.0.1', 1535893885, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1556, 1, '127.0.0.1', 1536014890, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1557, 1, '127.0.0.1', 1536014944, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1558, 1, '127.0.0.1', 1536158153, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1559, 1, '127.0.0.1', 1536158224, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1560, 1, '127.0.0.1', 1536161208, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1561, 1, '127.0.0.1', 1536161274, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1562, 1, '127.0.0.1', 1536162305, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1563, 1, '127.0.0.1', 1536162343, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1564, 1, '127.0.0.1', 1536167935, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1565, 1, '127.0.0.1', 1536168065, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1566, 1, '127.0.0.1', 1536170189, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1567, 1, '127.0.0.1', 1536262640, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1568, 1, '127.0.0.1', 1536263365, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1569, 1, '127.0.0.1', 1536263849, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1570, 1, '127.0.0.1', 1536263866, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1571, 1, '127.0.0.1', 1536345567, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1572, 1, '127.0.0.1', 1536346167, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1573, 1, '127.0.0.1', 1536940329, 0, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F'),
(1574, 1, '127.0.0.1', 1536943510, 1, '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `AssignedTo` int(11) NOT NULL DEFAULT '-1',
  `Hit` int(11) NOT NULL DEFAULT '-1',
  `Money` int(11) NOT NULL DEFAULT '0',
  `RequestedBy` int(11) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `drugOwnerType` varchar(16) NOT NULL,
  `drugOwner` int(11) NOT NULL,
  `drugAmount` int(11) NOT NULL,
  `drugVW` int(11) NOT NULL,
  `drugInt` int(11) NOT NULL,
  `drugPosX` float NOT NULL,
  `drugPosY` float NOT NULL,
  `drugPosZ` float NOT NULL,
  `drugEffects` varchar(128) NOT NULL,
  `drugComedown` varchar(128) NOT NULL,
  `drugOverdose` varchar(128) NOT NULL,
  `drugType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `efurniture`
--

CREATE TABLE `efurniture` (
  `id` int(11) NOT NULL,
  `HouseSQLID` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Placed` int(11) NOT NULL,
  `Xpos` float NOT NULL,
  `Ypos` float NOT NULL,
  `Zpos` float NOT NULL,
  `Xrot` float NOT NULL,
  `Yrot` float NOT NULL,
  `Zrot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_tokens`
--

CREATE TABLE `email_tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `used` int(11) NOT NULL,
  `maID` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `factiondoors`
--

CREATE TABLE `factiondoors` (
  `id` int(11) DEFAULT NULL,
  `Ax` float DEFAULT NULL,
  `Ay` float DEFAULT NULL,
  `Az` float DEFAULT NULL,
  `Ar` float DEFAULT NULL,
  `Fx` float DEFAULT NULL,
  `Fy` float DEFAULT NULL,
  `Fz` float DEFAULT NULL,
  `Fr` float DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Model` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `factiondoors`
--

INSERT INTO `factiondoors` (`id`, `Ax`, `Ay`, `Az`, `Ar`, `Fx`, `Fy`, `Fz`, `Fr`, `Status`, `Model`) VALUES
(1, -798.53, -411.525, 1601, 2.7, -798.42, -411.484, 1601, -89.1, 0, 1569),
(2, -802.396, -407.803, 1600.99, 98.3, -802.396, -407.803, 1600.99, -1, 0, 1569),
(3, -794.021, -353.085, 1427.31, 93, -794.021, -353.085, 1427.31, 0.3, 0, 1569),
(4, -727.667, -390.728, 1407.7, 94.4, -727.667, -390.728, 1407.7, -0.5, 0, 1500),
(5, -741.215, -396.738, 1405.01, -90.6, -741.215, -396.738, 1405.01, -0.7, 0, 1500),
(6, -790.374, -353.117, 1427.29, 94.7, -790.334, -353.115, 1427.29, 2, 0, 1569),
(7, -788.029, -357.115, 1427.31, 0, -787.958, -357.058, 1427.28, -91, 0, 1569),
(8, -790.646, -360.605, 1427.31, -90.8, -790.707, -360.674, 1427.31, 0.2, 0, 1569),
(9, 2366.29, 221.359, 2000.82, 0, 2366.28, 221.378, 2000.82, 92.1, 0, 3089),
(10, 589.934, 1695.84, -8.695, -155.7, 589.909, 1695.82, -8.695, 122.5, 0, 3089),
(11, 592.539, 1691.69, -8.795, -146.6, 592.427, 1691.61, -8.795, -60, 0, 3089),
(12, 594.75, 1686.01, -9.955, -58.8, 594.795, 1685.94, -9.955, 32, 0, 1495),
(13, -752.289, -422.998, 1439.07, 179.3, -752.288, -422.968, 1439.07, -90.6, 0, 1495);

-- --------------------------------------------------------

--
-- Estrutura para tabela `factionlog`
--

CREATE TABLE `factionlog` (
  `id` int(11) NOT NULL,
  `memberId` int(11) NOT NULL,
  `executerId` int(11) NOT NULL,
  `faction` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `oldCustom` varchar(16) NOT NULL,
  `newCustom` varchar(16) NOT NULL,
  `oldRank` int(11) NOT NULL,
  `newRank` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `factions`
--

CREATE TABLE `factions` (
  `id` int(11) NOT NULL,
  `FactionName` varchar(37) NOT NULL,
  `FNameShort` varchar(20) NOT NULL,
  `BankBalance` int(11) NOT NULL,
  `RankName1` varchar(32) NOT NULL,
  `RankName2` varchar(32) NOT NULL,
  `RankName3` varchar(32) NOT NULL,
  `RankName4` varchar(32) NOT NULL,
  `RankName5` varchar(32) NOT NULL,
  `RankName6` varchar(32) NOT NULL,
  `RankName7` varchar(32) NOT NULL,
  `RankName8` varchar(32) NOT NULL,
  `RankName9` varchar(32) NOT NULL,
  `RankName10` varchar(32) NOT NULL,
  `RankName11` varchar(32) NOT NULL,
  `RankName12` varchar(32) NOT NULL,
  `RankName13` varchar(32) NOT NULL,
  `RankName14` varchar(32) NOT NULL,
  `RankName15` varchar(32) NOT NULL,
  `LeaderRank` int(11) NOT NULL,
  `UberLeaderRank` int(11) NOT NULL,
  `Leader` varchar(24) NOT NULL,
  `Spawn1X` float NOT NULL,
  `Spawn1Y` float NOT NULL,
  `Spawn1Z` float NOT NULL,
  `Spawn1A` float NOT NULL,
  `Spawn2X` float NOT NULL,
  `Spawn2Y` float NOT NULL,
  `Spawn2Z` float NOT NULL,
  `Spawn2A` float NOT NULL,
  `Spawn3X` float NOT NULL,
  `Spawn3Y` float NOT NULL,
  `Spawn3Z` float NOT NULL,
  `Spawn3A` float NOT NULL,
  `Spawn4X` float NOT NULL,
  `Spawn4Y` float NOT NULL,
  `Spawn4Z` float NOT NULL,
  `Spawn4A` float NOT NULL,
  `Spawn5X` float NOT NULL,
  `Spawn5Y` float NOT NULL,
  `Spawn5Z` float NOT NULL,
  `Spawn5A` float NOT NULL,
  `Spawn1VW` int(11) NOT NULL,
  `Spawn2VW` int(11) NOT NULL,
  `Spawn3VW` int(11) NOT NULL,
  `Spawn4VW` int(11) NOT NULL,
  `Spawn5VW` int(11) NOT NULL,
  `Spawn1Int` int(11) NOT NULL,
  `Spawn2Int` int(11) NOT NULL,
  `Spawn3Int` int(11) NOT NULL,
  `Spawn4Int` int(11) NOT NULL,
  `Spawn5Int` int(11) NOT NULL,
  `IsGang` int(11) NOT NULL,
  `IsActive` int(11) NOT NULL,
  `RadioChannel` int(11) NOT NULL,
  `Spawn1Name` varchar(40) NOT NULL,
  `Spawn2Name` varchar(40) NOT NULL,
  `Spawn3Name` varchar(40) NOT NULL,
  `Spawn4Name` varchar(40) NOT NULL,
  `Spawn5Name` varchar(40) NOT NULL,
  `Rank1Pay` int(11) NOT NULL,
  `Rank2Pay` int(11) NOT NULL,
  `Rank3Pay` int(11) NOT NULL,
  `Rank4Pay` int(11) NOT NULL,
  `Rank5Pay` int(11) NOT NULL,
  `Rank6Pay` int(11) NOT NULL,
  `Rank7Pay` int(11) NOT NULL,
  `Rank8Pay` int(11) NOT NULL,
  `Rank9Pay` int(11) NOT NULL,
  `Rank10Pay` int(11) NOT NULL,
  `Rank11Pay` int(11) NOT NULL,
  `Rank12Pay` int(11) NOT NULL,
  `Rank13Pay` int(11) NOT NULL,
  `Rank14Pay` int(11) NOT NULL,
  `Rank15Pay` int(11) NOT NULL,
  `PayDayTax` int(11) NOT NULL,
  `Skin1` int(11) NOT NULL,
  `Skin2` int(11) NOT NULL,
  `Skin3` int(11) NOT NULL,
  `Skin4` int(11) NOT NULL,
  `Skin5` int(11) NOT NULL,
  `Skin6` int(11) NOT NULL,
  `Skin7` int(11) NOT NULL,
  `Skin8` int(11) NOT NULL,
  `Skin9` int(11) NOT NULL,
  `Skin10` int(11) NOT NULL,
  `Skin11` int(11) NOT NULL,
  `Skin12` int(11) NOT NULL,
  `Skin13` int(11) NOT NULL,
  `Skin14` int(11) NOT NULL,
  `Skin15` int(11) NOT NULL,
  `WeaponTime` int(12) NOT NULL,
  `reload` int(11) NOT NULL,
  `door0` int(11) DEFAULT NULL,
  `door1` int(11) DEFAULT NULL,
  `door2` int(11) DEFAULT NULL,
  `door3` int(11) DEFAULT NULL,
  `door4` int(11) DEFAULT NULL,
  `door5` int(11) DEFAULT NULL,
  `door6` int(11) DEFAULT NULL,
  `door7` int(11) DEFAULT NULL,
  `door8` int(11) DEFAULT NULL,
  `door9` int(11) DEFAULT NULL,
  `door10` int(11) DEFAULT NULL,
  `door11` int(11) DEFAULT NULL,
  `door12` int(11) DEFAULT NULL,
  `door13` int(11) DEFAULT NULL,
  `door14` int(11) DEFAULT NULL,
  `door15` int(11) DEFAULT NULL,
  `door16` int(11) DEFAULT NULL,
  `door17` int(11) DEFAULT NULL,
  `door18` int(11) DEFAULT NULL,
  `door19` int(11) DEFAULT NULL,
  `door20` int(11) DEFAULT NULL,
  `door21` int(11) DEFAULT NULL,
  `door22` int(11) DEFAULT NULL,
  `door23` int(11) DEFAULT NULL,
  `door24` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `factions`
--

INSERT INTO `factions` (`id`, `FactionName`, `FNameShort`, `BankBalance`, `RankName1`, `RankName2`, `RankName3`, `RankName4`, `RankName5`, `RankName6`, `RankName7`, `RankName8`, `RankName9`, `RankName10`, `RankName11`, `RankName12`, `RankName13`, `RankName14`, `RankName15`, `LeaderRank`, `UberLeaderRank`, `Leader`, `Spawn1X`, `Spawn1Y`, `Spawn1Z`, `Spawn1A`, `Spawn2X`, `Spawn2Y`, `Spawn2Z`, `Spawn2A`, `Spawn3X`, `Spawn3Y`, `Spawn3Z`, `Spawn3A`, `Spawn4X`, `Spawn4Y`, `Spawn4Z`, `Spawn4A`, `Spawn5X`, `Spawn5Y`, `Spawn5Z`, `Spawn5A`, `Spawn1VW`, `Spawn2VW`, `Spawn3VW`, `Spawn4VW`, `Spawn5VW`, `Spawn1Int`, `Spawn2Int`, `Spawn3Int`, `Spawn4Int`, `Spawn5Int`, `IsGang`, `IsActive`, `RadioChannel`, `Spawn1Name`, `Spawn2Name`, `Spawn3Name`, `Spawn4Name`, `Spawn5Name`, `Rank1Pay`, `Rank2Pay`, `Rank3Pay`, `Rank4Pay`, `Rank5Pay`, `Rank6Pay`, `Rank7Pay`, `Rank8Pay`, `Rank9Pay`, `Rank10Pay`, `Rank11Pay`, `Rank12Pay`, `Rank13Pay`, `Rank14Pay`, `Rank15Pay`, `PayDayTax`, `Skin1`, `Skin2`, `Skin3`, `Skin4`, `Skin5`, `Skin6`, `Skin7`, `Skin8`, `Skin9`, `Skin10`, `Skin11`, `Skin12`, `Skin13`, `Skin14`, `Skin15`, `WeaponTime`, `reload`, `door0`, `door1`, `door2`, `door3`, `door4`, `door5`, `door6`, `door7`, `door8`, `door9`, `door10`, `door11`, `door12`, `door13`, `door14`, `door15`, `door16`, `door17`, `door18`, `door19`, `door20`, `door21`, `door22`, `door23`, `door24`) VALUES
(1, 'San Andreas County Sheriff\'s Office.', 'SACSO', 102452, 'Deputy Sheriff Trainee', 'Deputy Sheriff Trainee', 'Deputy Sheriff', 'Deputy Sheriff (Bonus I)', 'Deputy Sheriff (Bonus II)', 'Deputy Sheriff Senior', 'Sergeant', 'Lieutenant\r\n', 'Captain', 'Area Commander', 'Division Chief', 'Assistant Sheriff', 'Undersheriff', '', 'Sheriff', 15, 0, '1', 618.125, -596.782, 16.414, 271.349, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 9112, 'SACSO HQ', '-', '-', '-', '-', 750, 850, 950, 1150, 1250, 1350, 1950, 2000, 2200, 2350, 2650, 2750, 2950, 3050, 3100, 0, 20049, 20050, 20051, 20052, 20053, 20054, 20055, 20056, 20057, 20058, 20059, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'San Andreas News Network', 'San Network', 104777, 'Intern', 'Journalist', 'Editor', 'Photographer', 'Supervisor Basic', 'Reporter', '', '\r\n', '', '', '\r\n', 'Director', 'Presenter', 'Supervisor', 'Chief Executive Officer', 15, 0, '2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '-', '-', '-', '-', '-', 1500, 1500, 1500, 1500, 1500, 1500, 1500, 2000, 2000, 2000, 2000, 2500, 2500, 3000, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 282, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Red County Fire Department', 'FD', 101965, 'Cadete', 'Probationary Trooper', 'Trooper', 'Trooper First Class', 'Senior Trooper', 'Master Trooper', 'Corporal', 'Corporal SiT\r\n', 'Sergeant', 'Staff Sergeant', 'Master Sergeant\r\n', 'Lieutenant', 'Captain', 'Commander', 'Chief of Police', 15, 0, '2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, '-', '-', '-', '-', '-', 1500, 1500, 1500, 1500, 1500, 1500, 1500, 2000, 2000, 2000, 2000, 2500, 2500, 3000, 3000, 0, 20020, 20021, 20022, 20023, 20024, 20025, 20026, 20027, 20028, 0, 0, 0, 0, 0, 282, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Elite Trucking', 'ELTRUCK', 100763, 'Trainee(s)', 'Probationary(ies)', 'Junior Trucker(s)', 'Trucker(s)', 'Senior Trucker(s)', 'Elite Trucker(s)', 'Foreman(s)', 'Supervisor(s)\r\n', '', '', '\r\n', '', 'Manager(s)', 'Vice President', 'President', 15, 0, '2', 646.465, 1673.46, 7.198, 39.194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'HQ Elite Trucking', '-', '-', '-', '-', 1500, 1500, 1500, 1500, 1500, 1500, 1500, 2000, 2000, 2000, 2000, 2500, 2500, 3000, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 282, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Gang Teste', 'GT', 100221, 'G1', 'G2', 'G3', 'G4', 'G5', 'G6', 'G7', 'G8\r\n', '', '', '\r\n', '', 'G9', 'G10', 'G11', 15, 0, '', 646.465, 1673.46, 7.198, 39.194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 'HQ Elite Trucking', '-', '-', '-', '-', 1500, 1500, 1500, 1500, 1500, 1500, 1500, 2000, 2000, 2000, 2000, 2500, 2500, 3000, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 282, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20020, 20021, 20022, 20023, 20024, 20025, 20026, 20027, 20028, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fishcrates`
--

CREATE TABLE `fishcrates` (
  `FishWeight` int(12) NOT NULL,
  `CrateOwner` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fmotd`
--

CREATE TABLE `fmotd` (
  `fid` int(11) NOT NULL,
  `fmotd` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fuel`
--

CREATE TABLE `fuel` (
  `id` int(11) NOT NULL,
  `Petrol` int(11) NOT NULL,
  `Diesel` int(11) NOT NULL,
  `PetrolMax` int(11) NOT NULL,
  `DieselMax` int(11) NOT NULL,
  `Description` varchar(40) NOT NULL,
  `SignX` float NOT NULL,
  `SignY` float NOT NULL,
  `SignZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `fuel`
--

INSERT INTO `fuel` (`id`, `Petrol`, `Diesel`, `PetrolMax`, `DieselMax`, `Description`, `SignX`, `SignY`, `SignZ`) VALUES
(1, 0, 0, 5000, 1500, 'Posto de Palomino Creek', 2272.67, 31.2143, 26.6429),
(2, 0, 0, 4000, 2500, 'Posto de Montgomery', 1387.83, 457.006, 20.0196),
(3, 0, 0, 1500, 1000, 'Posto de Dillimore', 652.373, -565.619, 16.3359),
(4, 0, 0, 1500, 1000, 'Posto de Fort Carson', -259.352, 1208.9, 19.7422),
(5, 0, 0, 5000, 5000, 'Posto Bone County East', 617.181, 1704.7, 6.9922),
(6, 0, 0, 2000, 0, 'Posto Aviation', 364.989, 2486.19, 16.4844),
(7, 0, 0, 500, 300, 'Posto de El Quebrados', -1316.79, 2697.77, 50.0625),
(8, 0, 0, 1000, 0, 'Posto de Bayside Mariana', -2207.74, 2399, 4.9599),
(9, 0, 0, 200, 200, 'Posto de Angel Pine', -2254.12, -2564.32, 31.9155),
(10, 0, 0, 2500, 5000, 'Estação de serviço e Posto Angel Pine', -1612.11, -2727.38, 48.5821),
(11, 0, 0, 500, 500, 'Posto East Flint County', -102.63, -1163.84, 2.6666);

-- --------------------------------------------------------

--
-- Estrutura para tabela `furniture`
--

CREATE TABLE `furniture` (
  `id` int(10) UNSIGNED NOT NULL,
  `Model` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Category` int(12) NOT NULL,
  `SubCategory` int(12) NOT NULL,
  `AllowOutdoors` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `furniture`
--

INSERT INTO `furniture` (`id`, `Model`, `Name`, `Price`, `Category`, `SubCategory`, `AllowOutdoors`) VALUES
(1, 1726, 'Sofá preto', 1000, 0, 0, NULL),
(2, 1703, 'Sofá de couro preto', 900, 0, 0, NULL),
(3, 1768, 'Sofá azul', 500, 0, 0, NULL),
(4, 1713, 'Sofá azul 2', 500, 0, 0, NULL),
(5, 11717, 'Sofá vermelho brilhante', 500, 0, 0, NULL),
(6, 1712, 'Sofá marrom', 350, 0, 0, NULL),
(7, 1702, 'Sofá de couro de Brown', 900, 0, 0, NULL),
(8, 1757, 'Sofá modelado marrom', 550, 0, 0, NULL),
(9, 1707, 'Sofá de carro', 850, 0, 0, NULL),
(10, 2290, 'Sofá marrom escuro', 1500, 0, 0, NULL),
(11, 1766, 'Sofá cinzento', 750, 0, 0, NULL),
(12, 1710, 'Sofá marrom longo', 500, 0, 0, NULL),
(13, 2639, 'Sofá vermelho longo', 2000, 0, 0, NULL),
(14, 11689, 'Sofá longo, angulada', 3000, 0, 0, NULL),
(15, 1709, 'Sofá marrom longo, angular', 1000, 0, 0, NULL),
(16, 1761, 'Sofá cinzento mais longo', 450, 0, 0, NULL),
(17, 1728, 'Sofá marrom médio', 200, 0, 0, NULL),
(18, 1706, 'Sofá roxo', 500, 0, 0, NULL),
(19, 2748, 'Cabine vermelha', 1500, 0, 0, NULL),
(20, 1763, 'Sofá vermelho do teste padrão da flor', 0, 0, 0, NULL),
(21, 1760, 'Sofá tradicional', 659, 0, 0, NULL),
(22, 1764, 'Sofá amarelo do tartan', 20, 0, 0, NULL),
(23, 2295, 'Assento de bolsa de feijão', 100, 0, 1, NULL),
(24, 1704, 'Assento de couro preta', 350, 0, 1, NULL),
(25, 1724, 'Assento de couro preto', 350, 0, 1, NULL),
(26, 1727, 'Assento preto', 450, 0, 1, NULL),
(27, 1708, 'Assento azul', 250, 0, 1, NULL),
(28, 1645, 'Sunbed listrado azul', 100, 0, 1, NULL),
(29, 1729, 'Assento de sofá marrom', 100, 0, 1, NULL),
(30, 1705, 'Assento de couro marrom', 350, 0, 1, NULL),
(31, 1711, 'Assento marrom', 100, 0, 1, NULL),
(32, 1769, 'Assento', 350, 0, 1, NULL),
(33, 2291, 'Assento de sofá', 500, 0, 1, NULL),
(34, 2293, 'Pé de sofá resto', 250, 0, 1, NULL),
(35, 2292, 'Assento de canto de couro escuro', 500, 0, 1, NULL),
(36, 1754, 'Assento de couro escuro', 500, 0, 1, NULL),
(37, 1647, 'Achate Sunbed listrado azul', 100, 0, 1, NULL),
(38, 1646, 'Green Striped Sunbed', 100, 0, 1, NULL),
(39, 1762, 'Assento cinzento', 300, 0, 1, NULL),
(40, 1767, 'Assento cinzento 2', 300, 0, 1, NULL),
(41, 1759, 'Assento de padrão de flor vermelho', 0, 0, 1, NULL),
(42, 1755, 'Assento de sofá tradicional', 0, 0, 1, NULL),
(43, 1758, 'Assento vermelho tradicional', 1, 0, 1, NULL),
(44, 1765, 'Assento de sofá atapetada', 0, 0, 1, NULL),
(45, 1735, 'Assento de padrão de flor branco', 0, 0, 1, NULL),
(46, 1255, 'Sunbed de madeira', 100, 0, 1, NULL),
(47, 1716, 'Banquinho preto', 100, 0, 2, NULL),
(48, 2723, 'Banquinho do metal', 100, 0, 2, NULL),
(49, 2125, 'Banquinho vermelho de metal', 200, 0, 2, NULL),
(50, 1805, 'Banquinho vermelho', 200, 0, 2, NULL),
(51, 2350, 'Banquinho vermelho 2', 100, 0, 2, NULL),
(52, 2343, 'Cadeira de barbeiro', 500, 0, 3, NULL),
(53, 2079, 'Cadeira curvada escura de tabua', 200, 0, 3, NULL),
(54, 1810, 'Cadeira de dobra', 50, 0, 3, NULL),
(55, 2636, 'Cadeira curvada clara de tabua', 250, 0, 3, NULL),
(56, 19994, 'Cadeira de madeira clara', 100, 0, 3, NULL),
(57, 2724, 'Cadeira de couro preta agradável', 200, 0, 3, NULL),
(58, 2776, 'Cadeira de couro preta agradável 2', 150, 0, 3, NULL),
(59, 2121, 'Cadeira de dobramento vermelha', 50, 0, 3, NULL),
(60, 2788, 'Cadeira vermelha tartan', 150, 0, 3, NULL),
(61, 2124, 'Cadeira de madeira vermelha de tabua', 300, 0, 3, NULL),
(62, 2096, 'Cadeira de balanço', 150, 0, 3, NULL),
(63, 11734, 'Cadeira de balanço 2', 200, 0, 3, NULL),
(64, 1721, 'Cadeira de aço', 150, 0, 3, NULL),
(65, 1739, 'Cadeira de mesa alta', 400, 0, 3, NULL),
(66, 1720, 'Cadeira de madeira', 150, 0, 3, NULL),
(67, 2120, 'Cadeira de madeira da tabela de couro', 300, 0, 3, NULL),
(68, 2235, 'Mesa de centro chinesa', 250, 0, 4, NULL),
(69, 2081, 'Mesa de centro curvada', 350, 0, 4, NULL),
(70, 1821, 'Mesa de centro escura', 500, 0, 4, NULL),
(71, 1823, 'Mesa de café escura 2', 500, 0, 4, NULL),
(72, 2236, 'Mesa de café escura 3', 250, 0, 4, NULL),
(73, 2370, 'Mesa de café escura 4', 500, 0, 4, NULL),
(74, 2082, 'Mesa de café escura 5', 350, 0, 4, NULL),
(75, 2083, 'Mesa de café escura 6', 250, 0, 4, NULL),
(76, 2084, 'Mesa de café escura 7', 250, 0, 4, NULL),
(77, 1817, 'Mesa de centro de vidro', 500, 0, 4, NULL),
(78, 2024, 'Mesa de café 2 de vidro', 150, 0, 4, NULL),
(79, 2126, 'Mesa de café de vidro 3', 750, 0, 4, NULL),
(80, 1814, 'Luz mesa de café', 550, 0, 4, NULL),
(81, 2311, 'Mesa de centro preta longa', 350, 0, 4, NULL),
(82, 2315, 'Mesa de centro marrom longa', 500, 0, 4, NULL),
(83, 2319, 'Mesa de centro chinesa longa', 500, 0, 4, NULL),
(84, 2234, 'Mesa de café longa', 450, 0, 4, NULL),
(85, 2314, 'Mesa de centro marrom clara longa', 500, 0, 4, NULL),
(86, 2321, 'Mesa de centro arquivada longa', 0, 0, 4, NULL),
(87, 1819, 'Mesa de centro redonda', 450, 0, 4, NULL),
(88, 1820, 'Mesa de café redonda 2', 3, 0, 4, NULL),
(89, 1822, 'Tabela de vidro pequena', 500, 0, 4, NULL),
(90, 1815, 'Mesa redonda pequena', 500, 0, 4, NULL),
(91, 1818, 'Mesa de centro quadrada', 50, 0, 4, NULL),
(92, 1816, 'Mesa de centro empilhada', 1, 0, 4, NULL),
(93, 2313, 'Carrinho da tevê', 1000, 0, 4, NULL),
(94, 2346, 'Stand de TV 2', 500, 0, 4, NULL),
(95, 11691, 'Mesa maior', 1500, 0, 5, NULL),
(96, 643, 'Jogo preto da Mesa', 500, 0, 5, NULL),
(97, 1594, 'Jogo checkered azul de Mesa', 450, 0, 5, NULL),
(98, 1679, 'Jogo checkered azul de Mesa 2', 750, 0, 5, NULL),
(99, 2117, 'Mesa de Brown', 500, 0, 5, NULL),
(100, 2112, 'Mesa de madeira de Brown', 500, 0, 5, NULL),
(101, 2111, 'Mesa circular escura', 500, 0, 5, NULL),
(102, 2080, 'Mesa circular escura 2', 650, 0, 5, NULL),
(103, 2119, 'Mesa de madeira curvada escura', 500, 0, 5, NULL),
(104, 2032, 'Mesa oval escura', 700, 0, 5, NULL),
(105, 1433, 'Mesa quadrada escura', 500, 0, 5, NULL),
(106, 2110, 'Mesa escura', 350, 0, 5, NULL),
(107, 1737, 'Mesa de madeira escura', 500, 0, 5, NULL),
(108, 19997, 'Mesa 2 de madeira escura', 350, 0, 5, NULL),
(109, 2086, 'Mesa de vidro', 900, 0, 5, NULL),
(110, 2333, 'Mesa de cozinha', 500, 0, 5, NULL),
(111, 2109, 'Luz Mesa circular', 400, 0, 5, NULL),
(112, 2116, 'Mesa de madeira clara', 350, 0, 5, NULL),
(113, 2029, 'Mesa de madeira leve 2', 5, 0, 5, NULL),
(114, 19922, 'Mesa de madeira preta longa', 0, 0, 5, NULL),
(115, 2208, 'Mesa arredondada escura longa', 0, 0, 5, NULL),
(116, 2357, 'Mesa de madeira escura longa', 0, 0, 5, NULL),
(117, 15037, 'Mesa oval longa com tevê', 0, 0, 5, NULL),
(118, 2762, 'Mesa vermelha longa do retângulo', 0, 0, 5, NULL),
(119, 2118, 'Mesa oval', 350, 0, 5, NULL),
(120, 1516, 'Mesa de madeira pálida', 1250, 0, 5, NULL),
(121, 2747, 'Mesa esboçada madeira do retângulo', 500, 0, 5, NULL),
(122, 2763, 'Mesa quadrada vermelha', 0, 0, 5, NULL),
(123, 2764, 'Mesa quadrada vermelha (com toalha de mesa)', 500, 0, 5, NULL),
(124, 2030, 'Mesa cinzenta redonda', 500, 0, 5, NULL),
(125, 2644, 'Mesa de madeira pequena', 1000, 0, 5, NULL),
(126, 2635, 'Mesa esboçada madeira quadrada', 500, 0, 5, NULL),
(127, 11690, 'Mesa', 500, 0, 5, NULL),
(128, 2799, 'Mesa ajustada com cadeiras de couro', 500, 0, 5, NULL),
(129, 2802, 'Mesa ajustada com cadeiras de couro 2', 200, 0, 5, NULL),
(130, 2725, 'Mesa redonda muito pequena', 500, 0, 5, NULL),
(131, 1770, 'Mesa de dobramento branca', 400, 0, 5, NULL),
(132, 1432, 'Jogo branco da Mesa', 400, 0, 5, NULL),
(133, 2115, 'Mesa de madeira da cozinha', 350, 0, 5, NULL),
(134, 1825, 'Mesa de madeira', 1000, 0, 5, NULL),
(135, 2833, 'Tapete extravagante', 200, 0, 6, NULL),
(136, 2834, 'Tapete extravagante 2', 200, 0, 6, NULL),
(137, 2817, 'Tapete verde', 150, 0, 6, NULL),
(138, 2836, 'Tapete cinzento', 200, 0, 6, NULL),
(139, 2818, 'Tapete checkered alaranjado', 150, 0, 6, NULL),
(140, 2815, 'Tapete modelado roxo', 150, 0, 6, NULL),
(141, 2842, 'Tapete vermelho', 200, 0, 6, NULL),
(142, 2841, 'Tapete azul redondo', 200, 0, 6, NULL),
(143, 2835, 'Tapete redondo', 150, 0, 6, NULL),
(144, 2847, 'Tapete padrão tigre', 150, 0, 6, NULL),
(145, 1828, 'Tapete do tigre', 2000, 0, 6, NULL),
(146, 1742, 'Prateleira do livro', 500, 0, 7, NULL),
(147, 14867, 'Armários', 5000, 0, 7, NULL),
(148, 2078, 'Prateleira grande', 750, 0, 7, NULL),
(149, 2296, 'Grande conjunto de televisão', 500, 0, 7, NULL),
(150, 2046, 'Armário velho', 500, 0, 7, NULL),
(151, 2093, 'Prateleira TV Combo', 350, 0, 7, NULL),
(152, 1417, 'Armário pequeno', 350, 0, 7, NULL),
(153, 1744, 'Prateleira pequena', 250, 0, 7, NULL),
(154, 2297, 'Jogo de televisão pequeno', 1000, 0, 7, NULL),
(155, 2091, 'Combo TV guarda-roupa', 750, 0, 7, NULL),
(156, 1495, 'Porta', 750, 8, 2, NULL),
(157, 19882, 'Bife', 10, 1, 3, NULL),
(158, 19577, 'Tomate vermelho', 10, 1, 3, NULL),
(159, 19574, 'Laranja', 10, 1, 3, NULL),
(160, 19575, 'Maçã', 10, 1, 3, NULL),
(161, 19576, 'Maçã-verde', 10, 1, 3, NULL),
(162, 11742, 'Bolo de chocolate', 15, 1, 3, NULL),
(163, 2703, 'Hambúrguer', 15, 1, 3, NULL),
(164, 2880, 'Hamburgão', 20, 1, 3, NULL),
(165, 19883, 'Pão-de-forma', 10, 1, 3, NULL),
(166, 2768, 'Caixa de hambúrguer', 15, 1, 3, NULL),
(167, 19353, 'Parede Branca e Rosa', 1000, 8, 0, NULL),
(168, 19835, 'Café', 30, 1, 3, NULL),
(169, 19354, 'Parede de diamante e couro', 800, 8, 0, NULL),
(170, 2881, 'Taco', 20, 1, 3, NULL),
(171, 19355, 'Parede de Cimento', 500, 8, 0, NULL),
(172, 2702, 'Fatia-de-pizza', 20, 1, 3, NULL),
(173, 19356, 'Parede de Madeira', 500, 8, 0, NULL),
(174, 19569, 'Caixa de leite', 50, 1, 3, NULL),
(176, 2769, 'Cachorro-quente', 20, 1, 3, NULL),
(177, 19358, 'Parede de algodão cinza e preto', 500, 8, 0, NULL),
(178, 19359, 'Parede Tan Clara', 500, 8, 0, NULL),
(179, 19360, 'Parede de Madeira Leve', 500, 8, 0, NULL),
(180, 19361, 'Parede Tan e Vermelha', 500, 8, 0, NULL),
(181, 19362, 'Parede com textura de estrada', 500, 8, 0, NULL),
(182, 19811, 'Caixa-de-fritas', 20, 1, 3, NULL),
(183, 19582, 'Carne vermelha', 40, 1, 3, NULL),
(184, 19578, 'Banana', 10, 1, 3, NULL),
(185, 19563, 'Suco de laranja', 50, 1, 3, NULL),
(186, 19564, 'Suco de limão', 50, 1, 3, NULL),
(187, 11722, 'Ketchup', 10, 1, 3, NULL),
(188, 19363, 'Parede pastel escuro liso', 800, 8, 0, NULL),
(189, 19364, 'Parede tijolo e cimento', 800, 8, 0, NULL),
(190, 19365, 'Parede Azul claro liso', 800, 8, 0, NULL),
(191, 19366, 'Parede de Madeira grossa', 800, 8, 0, NULL),
(192, 19367, 'Parede Azul temático', 800, 8, 0, NULL),
(193, 19368, 'Parede rosa Primavera temático', 800, 8, 0, NULL),
(194, 19369, 'Parede amarelo Primavera temático', 800, 8, 0, NULL),
(195, 19370, 'Parede Madeira brilhante', 800, 8, 0, NULL),
(196, 19371, 'Parede Cimento liso', 800, 8, 0, NULL),
(197, 19372, 'Parede Parede da areia', 800, 8, 0, NULL),
(198, 19373, 'Parede Parede da grama', 800, 8, 0, NULL),
(199, 19375, 'Parede Ondulado de madeira', 800, 8, 0, NULL),
(200, 19376, 'Parede Vermelho de madeira', 800, 8, 0, NULL),
(201, 19377, 'Parede tapete texturizado', 800, 8, 0, NULL),
(202, 19378, 'Parede Madeira escura', 800, 8, 0, NULL),
(203, 19379, 'Parede Madeira clara básica', 800, 8, 0, NULL),
(204, 19380, 'Parede Areia escura', 800, 8, 0, NULL),
(205, 19381, 'Parede Grama escura', 800, 8, 0, NULL),
(206, 1493, 'Porta de malha vermelha', 45, 8, 2, NULL),
(208, 1496, 'Porta cinzenta', 45, 8, 2, NULL),
(209, 1497, 'Porta de celeiro de madeira', 45, 8, 2, NULL),
(210, 1498, 'Porta branca de madeira', 45, 8, 2, NULL),
(211, 1500, 'Porta de malha de metal', 45, 8, 2, NULL),
(212, 1501, 'Porta de Malha de Madeira', 45, 8, 2, NULL),
(213, 1502, 'Porta de madeira', 45, 8, 2, NULL),
(214, 1504, 'Porta vermelha', 45, 8, 2, NULL),
(215, 1505, 'Porta azul', 45, 8, 2, NULL),
(216, 1506, 'Porta branca', 45, 8, 2, NULL),
(217, 1507, 'Porta amarela', 45, 8, 2, NULL),
(218, 1536, 'Porta de vidro escuro', 45, 8, 2, NULL),
(219, 1557, 'Porta de vidro fantasia', 45, 8, 2, NULL),
(220, 1567, 'Porta de madeira branca', 45, 8, 2, NULL),
(221, 1569, 'Porta com janela', 45, 8, 2, NULL),
(222, 19383, 'Parede Ice cream Parlor (Entrada)', 150, 8, 1, NULL),
(223, 19384, 'Parede Diamante de couro (Entrada)', 150, 8, 1, NULL),
(224, 19391, 'Parede think Brick (Entrada)', 150, 8, 1, NULL),
(225, 19386, 'Parede de madeira (Entrada)', 150, 8, 1, NULL),
(226, 19387, 'Parede de Cement (Entrada)', 150, 8, 1, NULL),
(227, 19388, 'Parede de Algodão Cinza e Preto (Entrada)', 150, 8, 1, NULL),
(228, 19389, 'Plain Tan (Entrada)', 150, 8, 1, NULL),
(229, 19390, 'Parede tan e Vermelho (Entrada)', 150, 8, 1, NULL),
(230, 19385, 'Parede Road (Entrada)', 150, 8, 1, NULL),
(231, 19392, 'Parede Rosa escuro liso (Entrada)', 150, 8, 1, NULL),
(232, 19393, 'Parede tijolo de cimento (Entrada)', 150, 8, 1, NULL),
(233, 19394, 'Parede Azul Claro (Entrada)', 150, 8, 1, NULL),
(234, 19395, 'Parede Azul temática da primavera (Entrada)', 150, 8, 1, NULL),
(235, 19396, 'Parede Rosa Primavera (Entrada)', 150, 8, 1, NULL),
(236, 19397, 'Parede Amarelo temático primavera(Entrada)', 150, 8, 1, NULL),
(237, 19398, 'Parede Plain Cement (Entrada)', 150, 8, 1, NULL),
(238, 19400, 'Parede diamante de couro (Janela aberta)', 145, 8, 3, NULL),
(239, 19401, 'Parede de Cimento (Janela aberta)', 300, 8, 3, NULL),
(240, 19402, 'Parede de Madeira (Janela aberta)', 300, 8, 3, NULL),
(241, 19403, 'Parede de Cimento 1 (Janela aberta)', 300, 8, 3, NULL),
(242, 19404, 'Parede de Algodão Cinza e Preto (Janela aberta)', 300, 8, 3, NULL),
(243, 19405, 'Parede Tanino Liso (Janela aberta)', 300, 8, 3, NULL),
(244, 19407, 'Parede Tan e Vermelho (Janela aberta)', 300, 8, 3, NULL),
(245, 19408, 'Parede Estrada texturizada (Janela aberta)', 300, 8, 3, NULL),
(246, 19409, 'Parede Rosa escuro liso (Janela aberta)', 300, 8, 3, NULL),
(247, 19410, 'Parede Tijolo e cimento (Janela aberta)', 300, 8, 3, NULL),
(248, 19411, 'Parede Azul Claro Claro (Janela aberta)', 300, 8, 3, NULL),
(249, 19412, 'Parede Madeira grossa (Janela aberta)', 300, 8, 3, NULL),
(250, 19413, 'Parede temática azul claro (Janela aberta)', 300, 8, 3, NULL),
(251, 19414, 'Parede temática rosa claro (Janela aberta)', 300, 8, 3, NULL),
(252, 19415, 'Parede temática amarelo claro (Janela aberta)', 300, 8, 3, NULL),
(253, 19416, 'Parede de Madeira clara básica (Janela aberta)', 300, 8, 3, NULL),
(254, 19417, 'Parede de Cimento Simples (Janela aberta)', 300, 8, 3, NULL),
(255, 11723, 'Maionese', 10, 1, 2, NULL),
(256, 11739, 'Bolo de coco', 60, 1, 2, NULL),
(257, 11740, 'Bolo de cenoura', 60, 1, 2, NULL),
(259, 19579, 'Pão integral', 50, 1, 2, NULL),
(260, 2683, 'Garrafa coqueteleira', 60, 1, 2, NULL),
(261, 19570, 'Garrafa de leite', 30, 1, 3, NULL),
(262, 2647, 'Copo Burger Shot', 10, 1, 3, NULL),
(263, 19567, 'Sorvete de baunilha', 50, 1, 3, NULL),
(264, 19568, 'Sorvete de coco', 50, 1, 3, NULL),
(265, 2856, 'Leite não pasteurizado', 30, 1, 3, NULL),
(266, 19561, 'Cereal de flocos', 50, 1, 3, NULL),
(267, 19562, 'Cereal matinal', 50, 1, 3, NULL),
(268, 19565, 'Caixa de sorvete', 50, 1, 3, NULL),
(269, 19566, 'Empanado de peixe', 75, 1, 3, NULL),
(270, 19571, 'Caixa de pizza', 35, 1, 3, NULL),
(271, 19580, 'Pizza pronta', 30, 1, 3, NULL),
(272, 19847, 'Coxa de frango', 20, 1, 3, NULL),
(273, 19572, 'Caixa de cerveja', 65, 1, 3, NULL),
(274, 2663, 'China in box', 45, 1, 3, NULL),
(275, 2342, 'Bandejas e café', 15, 1, 3, NULL),
(276, 19573, 'Carvão', 30, 1, 3, NULL),
(277, 2821, 'Cereal aberto', 10, 1, 3, NULL),
(278, 19525, 'Bolo de casamento', 150, 1, 3, NULL),
(279, 1598, 'Bola de praia', 50, 6, 8, NULL),
(280, 1604, 'Peixe azul e amarelo', 30, 6, 11, NULL),
(281, 1599, 'Peixe amarelo', 25, 6, 11, NULL),
(282, 1600, 'Peixe azul', 40, 6, 11, NULL),
(283, 2694, 'Caixa Prolaps', 30, 6, 12, NULL),
(284, 2481, 'Caixa de brinquedo', 20, 6, 11, NULL),
(285, 2465, 'Caixa de brinquedo2', 20, 6, 11, NULL),
(286, 2466, 'Caixa de brinquedo3', 20, 6, 11, NULL),
(287, 2480, 'Caixa de brinquedo4', 20, 6, 11, NULL),
(288, 1640, 'Toalha listrada', 40, 3, 3, NULL),
(289, 1641, 'Toalha rockstar', 70, 3, 3, NULL),
(290, 2654, 'Três caixas', 70, 6, 12, NULL),
(291, 1642, 'Toalha vermelha', 50, 3, 3, NULL),
(292, 1643, 'Toalha amarela', 50, 3, 3, NULL),
(293, 1601, 'Conjunto de peixes', 120, 6, 11, NULL),
(294, 2404, 'Prancha de Surf R', 80, 7, 7, NULL),
(295, 2405, 'Prancha de Surf Redpurple', 80, 7, 7, NULL),
(296, 2410, 'Prancha de Surf simples', 50, 7, 7, NULL),
(297, 11719, 'Panela', 40, 1, 2, NULL),
(298, 2406, 'Prancha de Surf Paradise', 100, 7, 7, NULL),
(299, 19586, 'Espátula', 40, 1, 2, NULL),
(300, 11715, 'Garfo de cozinha', 20, 1, 2, NULL),
(301, 11716, 'Faca de cozinha', 20, 1, 2, NULL),
(303, 2830, 'Prato sujo', 20, 1, 2, NULL),
(305, 2820, 'Prato sujo2', 20, 1, 2, NULL),
(306, 2831, 'Louça suja2', 40, 1, 2, NULL),
(307, 19585, 'Panela Inox', 50, 1, 2, NULL),
(308, 19584, 'Panela Inox2', 50, 1, 2, NULL),
(309, 2822, 'Louça-limpa', 40, 1, 2, NULL),
(310, 2829, 'Louça-limpa2', 40, 1, 2, NULL),
(311, 19581, 'Frigideira', 50, 1, 2, NULL),
(312, 2812, 'Louça suja3', 40, 1, 2, NULL),
(313, 2865, 'Louça-limpa3', 40, 1, 2, NULL),
(314, 2862, 'Louça-limpa4', 40, 1, 2, NULL),
(315, 2850, 'Louça suja4', 40, 1, 2, NULL),
(316, 19830, 'Liquidificador', 60, 1, 2, NULL),
(317, 11746, 'Chave', 30, 6, 11, NULL),
(318, 2864, 'Tigelas', 50, 1, 2, NULL),
(319, 2613, 'Copo', 20, 1, 2, NULL),
(320, 11744, 'Prato', 20, 1, 2, NULL),
(321, 19809, 'Bandeja de metal', 60, 1, 2, NULL),
(322, 11743, 'Cafeteira Elétrica', 60, 1, 2, NULL),
(323, 2149, 'Microondas', 160, 1, 2, NULL),
(324, 11747, 'Band-Aid', 10, 6, 11, NULL),
(325, 19920, 'Controle remoto preto', 50, 5, 4, NULL),
(326, 2344, 'Controle remoto branco', 50, 5, 4, NULL),
(327, 1778, 'Balde com esfregão', 100, 1, 2, NULL),
(328, 19874, 'Sabonete', 20, 3, 4, NULL),
(329, 11748, 'Caixa de curativos', 30, 6, 11, NULL),
(330, 1808, 'Bebedouro', 150, 1, 2, NULL),
(331, 19873, 'Papel higiênico', 25, 3, 4, NULL),
(332, 2421, 'Microondas2', 150, 1, 2, NULL),
(333, 2713, 'Balde sem esfregão', 50, 1, 2, NULL),
(334, 2002, 'Bebedouro2', 125, 1, 2, NULL),
(335, 19993, 'Tijela grande', 50, 1, 2, NULL),
(336, 2521, 'Vaso Sanitário', 120, 3, 0, NULL),
(337, 2525, 'Vaso Sanitário2', 160, 3, 0, NULL),
(338, 2528, 'Vaso Sanitário3', 250, 3, 0, NULL),
(339, 2738, 'Vaso Sanitário4', 300, 3, 0, NULL),
(340, 2514, 'Vaso Sanitário5', 325, 3, 0, NULL),
(341, 19827, 'Interruptor branco', 10, 5, 4, NULL),
(342, 2739, 'Pia banheiro', 100, 3, 0, NULL),
(343, 2524, 'Pia banheiro2', 150, 3, 0, NULL),
(344, 2523, 'Pia banheiro3', 150, 3, 0, NULL),
(345, 19828, 'Interruptor de ventilador', 10, 5, 4, NULL),
(347, 19829, 'Interruptor ligado', 15, 5, 4, NULL),
(348, 19172, 'Quadro beachls', 400, 6, 1, NULL),
(349, 19174, 'Quadro City', 400, 6, 1, NULL),
(350, 19175, 'Quadro City2', 400, 6, 1, NULL),
(351, 1771, 'Cama com colchão', 100, 2, 0, NULL),
(352, 2302, 'Cama Pequena', 120, 2, 0, NULL),
(353, 1745, 'Cama de casal', 150, 2, 0, NULL),
(354, 1701, 'Cama de casal2', 175, 2, 0, NULL),
(355, 1794, 'Cama de casal3', 200, 2, 0, NULL),
(356, 1700, 'Cama de casal4', 250, 2, 0, NULL),
(357, 2090, 'Cama de casal5', 275, 2, 0, NULL),
(358, 1798, 'Cama luxuosa', 300, 2, 0, NULL),
(359, 2144, 'Fogão', 350, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fveh`
--

CREATE TABLE `fveh` (
  `id` int(11) NOT NULL,
  `Model` int(11) NOT NULL DEFAULT '0',
  `Col1` int(11) NOT NULL DEFAULT '0',
  `Col2` int(11) NOT NULL DEFAULT '0',
  `Faction` int(11) NOT NULL DEFAULT '0',
  `Locked` tinyint(1) DEFAULT '0',
  `Creator` int(12) NOT NULL,
  `RegPlate` varchar(16) NOT NULL,
  `HasSiren` int(12) NOT NULL DEFAULT '0',
  `MinRank` int(11) NOT NULL DEFAULT '0',
  `LocationX` float NOT NULL DEFAULT '0',
  `LocationY` float NOT NULL DEFAULT '0',
  `LocationZ` float NOT NULL DEFAULT '0',
  `LocationR` float NOT NULL DEFAULT '0',
  `Interior` int(11) NOT NULL DEFAULT '0',
  `VWorld` int(11) NOT NULL DEFAULT '0',
  `RandNum` int(11) NOT NULL DEFAULT '0',
  `TrunkArmour` int(11) NOT NULL DEFAULT '0',
  `TrunkCash` int(11) NOT NULL DEFAULT '0',
  `TrunkWeed` int(11) NOT NULL DEFAULT '0',
  `TrunkCocaine` int(11) NOT NULL DEFAULT '0',
  `TrunkMoonShine` int(11) NOT NULL DEFAULT '0',
  `TrunkLock` int(11) NOT NULL DEFAULT '0',
  `TrunkPhone` int(12) NOT NULL,
  `FVModNos` int(1) NOT NULL DEFAULT '0',
  `FVModHyd` int(1) NOT NULL DEFAULT '0',
  `Impounded` int(11) NOT NULL,
  `ImpoundedBy` int(11) NOT NULL,
  `ImpoundTime` int(11) NOT NULL,
  `ImpoundFee` int(11) NOT NULL,
  `ImpoundReason` varchar(32) NOT NULL,
  `FGunRackW` int(11) NOT NULL,
  `FGunRackA` int(11) NOT NULL,
  `GarageRepairID` int(4) NOT NULL,
  `GarageCollectTime` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `fveh`
--

INSERT INTO `fveh` (`id`, `Model`, `Col1`, `Col2`, `Faction`, `Locked`, `Creator`, `RegPlate`, `HasSiren`, `MinRank`, `LocationX`, `LocationY`, `LocationZ`, `LocationR`, `Interior`, `VWorld`, `RandNum`, `TrunkArmour`, `TrunkCash`, `TrunkWeed`, `TrunkCocaine`, `TrunkMoonShine`, `TrunkLock`, `TrunkPhone`, `FVModNos`, `FVModHyd`, `Impounded`, `ImpoundedBy`, `ImpoundTime`, `ImpoundFee`, `ImpoundReason`, `FGunRackW`, `FGunRackA`, `GarageRepairID`, `GarageCollectTime`) VALUES
(1, 415, 159, 159, 1, 0, 2, 'SW92K3A', 1, 1, 2315.8, 2500.08, 3.0357, 91.1836, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(2, 411, 159, 159, 1, 0, 2, 'SW92K3E', 1, 1, 2315.6, 2490.18, 2.9697, 91.1932, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(3, 598, 159, 1, 1, 0, 2, 'SW92K3C', 1, 1, 2314.74, 2485.02, 3.055, 90.513, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(4, 598, 159, 1, 1, 0, 2, 'SW92K3D', 1, 1, 2314.99, 2480.53, 2.9895, 92.3258, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(5, 598, 159, 1, 1, 0, 2, 'SW92K3E', 1, 1, 22315, 2475.16, 3.0546, 90.3709, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(6, 598, 159, 1, 1, 0, 2, 'SW92K3F', 1, 1, 2315, 2475.19, 3.0616, 90.8547, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(7, 598, 159, 1, 1, 0, 2, 'SW92K3G', 1, 1, 2314.87, 2470.33, 3.0184, 89.6376, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(8, 598, 159, 1, 1, 0, 2, 'SW92K3H', 1, 1, 2314.69, 2460.22, 2.9615, 88.7255, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(9, 598, 159, 1, 1, 0, 2, 'SW92K3Y', 1, 1, 2315.12, 2455.31, 2.9633, 88.9568, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(10, 490, 159, 1, 1, 0, 2, 'SW92K3J', 1, 1, 2316.83, 2430.56, 3.3539, 0.904, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(11, 490, 159, 1, 1, 0, 2, 'SW92K3C', 1, 1, 2312.17, 2430.75, 3.3544, 359.967, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(12, 490, 159, 1, 1, 0, 2, 'SW92K3L', 1, 1, 2307.76, 2430.41, 3.3534, 0.7218, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(13, 490, 159, 1, 1, 0, 2, 'SW92K3M', 1, 1, 2303.05, 2430.67, 3.3874, 358.948, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(14, 490, 159, 1, 1, 0, 2, 'SW92K3N', 1, 1, 2298.86, 2430.63, 3.3542, 359.844, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(15, 490, 159, 1, 1, 0, 2, 'SW92K3O', 1, 1, 2294.6, 2430.71, 3.3552, 358.461, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(16, 490, 159, 1, 1, 0, 2, 'SW92K3P', 1, 1, 2290.12, 2430.86, 3.3542, 359.403, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(17, 490, 159, 1, 1, 0, 2, 'SW92K3Q', 1, 1, 2285.94, 2430.86, 3.3539, 359.499, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(18, 490, 159, 1, 1, 0, 2, 'SW92K3R', 1, 1, 2272.51, 2430.78, 3.3547, 358.91, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(19, 490, 159, 1, 1, 0, 2, 'SW92K3S', 1, 1, 2268.32, 2430.78, 3.354, 359.81, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(20, 490, 159, 1, 1, 0, 2, 'SW92K3T', 1, 1, 2263.94, 2430.53, 3.3539, 0.4715, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(21, 490, 159, 1, 1, 0, 2, 'SW92K3U', 1, 1, 2259.75, 2430.59, 3.3909, 359.129, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(22, 597, 0, 1, 1, 0, 2, 'SW92K3V', 1, 1, 2241.04, 2437.49, 3.0503, 269.143, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(23, 597, 159, 1, 1, 0, 2, 'SW92K3W', 1, 1, 2240.85, 2442.31, 3.0591, 270.202, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(24, 597, 159, 1, 1, 0, 2, 'SW92K3X', 1, 1, 2240.42, 2452.22, 3.0274, 271.35, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(25, 597, 159, 1, 1, 0, 2, 'SW92K3Y', 1, 1, 2240.07, 2461.71, 3.0503, 271.304, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(26, 597, 159, 1, 1, 0, 2, 'AW92K3Z', 1, 1, 2239.96, 2466.66, 3.055, 269.747, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(27, 597, 159, 1, 1, 0, 2, 'BW92K3E', 1, 1, 2240.09, 2471.07, 3.0503, 270.948, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(28, 597, 159, 1, 1, 1, 2, 'CW92K3E', 1, 1, 2239.86, 2476.27, 3.032, 271.386, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(29, 596, 159, 1, 1, 0, 2, 'DW92K3E', 1, 1, 2276.52, 2473.81, 2.969, 2.3143, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(30, 471, 1, 159, 1, 0, 2, 'EW92K3E', 1, 1, 2257.86, 2464.24, 3.0118, 89.2579, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(31, 471, 1, 159, 1, 0, 2, 'FW92K3E', 1, 1, 2257.99, 2461.85, 3.0127, 93.0671, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(32, 471, 1, 159, 1, 0, 2, 'GW92K3E', 1, 1, 2258.05, 2459.7, 3.0143, 85.9645, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(33, 471, 1, 159, 1, 0, 2, 'HW92K3E', 1, 1, 2258.19, 2457.83, 3.0213, 92.4662, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(34, 523, 223, 223, 1, 0, 2, 'YW92K3E', 1, 1, 2276.13, 2447.34, 3.1023, 179.954, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(35, 523, 223, 223, 1, 0, 2, 'JW92K3E', 1, 1, 2278.2, 2447.42, 3.1036, 179.433, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(36, 523, 159, 1, 1, 0, 2, 'KW92K3E', 1, 1, 2280.22, 2447.49, 3.1036, 185.331, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(37, 468, 159, 1, 1, 0, 2, 'LW92K3E', 1, 1, 2282.37, 2448.07, 3.1992, 179.848, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(38, 521, 159, 1, 1, 0, 2, 'MW92K3E', 1, 1, 22288.5, 2447.28, 3.0993, 179.552, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(39, 599, 159, 1, 1, 0, 2, 'NW92K3E', 1, 1, 2298.38, 2455.59, 3.512, 269.239, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(40, 560, 0, 0, 1, 0, 2, 'OW92K3E', 1, 1, 2314.66, 2485.12, -7.7283, 91.9958, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(41, 560, 0, 0, 1, 0, 2, 'PW92K3E', 1, 1, 2314.47, 2480.13, -7.737, 89.3703, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(42, 490, 0, 0, 1, 0, 2, 'QW92K3E', 1, 1, 2314.55, 2475.38, -7.3716, 90.6014, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(43, 490, 0, 0, 1, 0, 2, 'RW92K3E', 1, 1, 2314.55, 2470.15, -7.3695, 89.8463, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(44, 560, 0, 0, 1, 0, 2, 'SW92K3E', 1, 1, 2314.43, 2465.16, -7.842, 90.0771, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(45, 426, 0, 0, 1, 0, 2, 'VW92K3E', 1, 1, 2314.33, 2460.18, -7.7213, 90.6171, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(46, 598, 159, 1, 1, 0, 2, 'WW92K3E', 1, 1, 2315.24, 2455.62, -7.6713, 88.2679, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(47, 601, 0, 0, 1, 0, 2, 'XW92K3E', 1, 1, 2315.08, 2448.74, -7.7584, 44.924, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(48, 601, 0, 0, 1, 0, 2, 'YW92K3E', 1, 1, 2313.43, 2442.83, -7.7584, 37.066, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(49, 528, 0, 0, 1, 0, 2, 'ZW92K3E', 1, 1, 2310.5, 2434.47, -7.5192, 40.8397, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(50, 525, 6, 53, 1, 0, 2, 'SA92K3E', 1, 1, 2272.78, 2431.23, -7.546, 359.459, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(51, 541, 159, 1, 1, 0, 2, 'SB92K3E', 1, 1, 2254.29, 2455.16, -7.814, 0.7201, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(52, 521, 159, 1, 1, 0, 2, 'SC92K3E', 1, 1, 2254.49, 2462.72, -7.5791, 359.878, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(53, 598, 159, 1, 1, 0, 2, 'SD92K3E', 1, 1, 2221.36, 2462.59, -7.6675, 272.917, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(54, 596, 105, 1, 1, 0, 2, 'SE92K3E', 1, 1, 2221.65, 2458.84, -7.7375, 270.454, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(55, 596, 105, 1, 1, 0, 2, 'SF92K3E', 1, 1, 2221.63, 2454.84, -7.7483, 271.024, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(56, 598, 159, 1, 1, 0, 2, 'SG92K3E', 1, 1, 2221.68, 2451.51, -7.6671, 271.007, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(57, 596, 159, 1, 1, 0, 2, 'SH92K3E', 1, 1, 2228.56, 2450.62, -7.6622, 269.822, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(58, 596, 159, 1, 1, 0, 2, 'SI92K3E', 1, 1, 2233.51, 2455.14, -7.7423, 269.905, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(59, 598, 1, 1, 1, 0, 2, 'SJ92K3E', 1, 1, 2228.25, 2459.02, -7.5775, 269.981, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(60, 598, 159, 1, 1, 0, 2, 'SK92K3E', 1, 1, 2228.56, 2450.62, -7.6622, 269.822, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(61, 560, 159, 1, 1, 0, 2, 'SL92K3E', 1, 1, 2233.51, 2455.14, -7.7423, 269.905, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(62, 579, 159, 1, 1, 0, 2, 'SM92K3E', 1, 1, 2228.25, 2459.02, -7.5775, 269.981, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(63, 596, 159, 1, 1, 0, 2, 'SN2K3E', 1, 1, 2268.31, 2474.07, -7.7574, 0.3561, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(64, 598, 159, 1, 1, 0, 2, 'SO92K3E', 1, 1, 2272.47, 2474.32, -7.6697, 0.4218, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(65, 596, 159, 1, 1, 0, 2, 'SP92K3E', 1, 1, 2277.02, 2474.33, -7.7242, 0.8223, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(66, 596, 159, 1, 1, 0, 2, 'SQ92K3E', 1, 1, 2281.49, 2474.18, -7.7239, 1.2493, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(67, 596, 159, 1, 1, 0, 2, 'SR92K3E', 1, 1, 2285.47, 2474.44, -7.7374, 0.745, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(68, 596, 159, 159, 1, 0, 2, 'SS92K3E', 1, 1, 2297.33, 2460.31, -7.7484, 270.969, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(69, 515, 223, 1, 13, 0, 2, 'XD44O9D', 0, 1, 548.978, 1671.99, 8.012, 236.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(80, 515, 223, 1, 13, 0, 2, 'XE98C1I', 0, 1, 552.497, 1674.57, 8.015, 236.452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(81, 515, 223, 1, 13, 0, 2, 'SG92Z1C', 0, 1, 555.996, 1677.08, 8.012, 237.232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(82, 514, 223, 1, 13, 0, 2, 'CM22N8E', 0, 1, 563.678, 1682.02, 7.578, 235.866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(83, 514, 223, 1, 13, 0, 2, 'AQ29M1P', 0, 1, 567.732, 1684.16, 7.58, 235.524, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(84, 514, 223, 1, 13, 0, 2, 'CZ96A3Z', 0, 1, 571.385, 1686.41, 7.577, 237.555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(85, 403, 223, 1, 13, 0, 2, 'VI27I3V', 0, 1, 586.033, 1696.24, 7.598, 238.636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(86, 403, 223, 1, 13, 0, 2, 'PB81J1U', 0, 1, 578.905, 1691.29, 7.598, 235.797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(87, 403, 223, 1, 13, 0, 2, 'ZL37F6W', 0, 1, 582.828, 1693.6, 7.598, 236.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(88, 455, 223, 1, 13, 0, 2, 'MV92H8L', 0, 1, 597.786, 1702.52, 7.429, 183.635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(89, 431, 1, 223, 13, 0, 2, 'DL16S3Q', 0, 1, 602.086, 1705.03, 7.09, 181.318, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(90, 554, 223, 1, 13, 0, 2, 'WQ41J2C', 0, 1, 610.666, 1713.97, 7.081, 301.891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(91, 554, 223, 1, 13, 0, 2, 'DS54J5F', 0, 1, 625.371, 1692.71, 7.078, 303.549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(92, 525, 1, 223, 13, 0, 2, 'PS52B1Y', 0, 1, 623.259, 1695.32, 6.863, 303.842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(93, 560, 223, 1, 13, 0, 2, 'OD65P8U', 0, 1, 637.747, 1671.82, 6.707, 39.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(94, 426, 223, 1, 13, 0, 2, 'IM97A7G', 0, 1, 654.834, 1696.49, 6.735, 131.178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(95, 405, 223, 1, 13, 0, 2, 'XI23Y5M', 0, 1, 655.218, 1686.41, 6.871, 219.576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(96, 579, 223, 1, 13, 0, 2, 'IW12D7P', 0, 1, 650.138, 1682.26, 6.94, 218.953, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(97, 579, 223, 1, 13, 0, 2, 'JU55Z8O', 0, 1, 652.631, 1684.27, 6.933, 218.691, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(98, 514, 223, 1, 13, 0, 2, 'FJ36B8D', 0, 1, 658.357, 1750.7, 6.072, 126.177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(99, 455, 223, 1, 13, 0, 2, 'VJ89K9Y', 0, 1, 693.587, 1838.77, 5.86, 79.406, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(100, 552, 223, 1, 13, 0, 2, 'VH33F8K', 0, 1, 680.157, 1828.38, 4.948, 349.893, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(101, 525, 1, 223, 13, 0, 2, 'YM75Y6W', 0, 1, 671.403, 1837.92, 5.044, 352.601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(102, 413, 223, 1, 13, 0, 2, 'CD94D7U', 0, 1, 668.057, 1838.61, 5.226, 350.103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(103, 428, 223, 1, 13, 0, 2, 'LH58Q2Q', 0, 1, 564.222, 1646.69, 7.117, 328.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(104, 428, 223, 1, 13, 0, 2, 'JF51A9Y', 0, 1, 561.467, 1650.43, 7.117, 323.895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(105, 456, 223, 1, 13, 0, 2, 'VY81Q3F', 0, 1, 570.443, 1640.05, 7.166, 328.417, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(106, 456, 223, 1, 13, 0, 2, 'WY48Y9X', 0, 1, 572.923, 1636.09, 7.167, 328.319, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(107, 457, 7, 7, 13, 0, 2, 'XD73C3I', 0, 1, 638.503, 1656.83, 6.086, 33.93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(108, 490, 159, 1, 1, 0, 1, 'NG17A4P', 1, 1, 1249.49, 250.053, 19.683, 336.245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(109, 525, 159, 159, 1, 0, 1, 'VJ61J9I', 1, 1, 1256.16, 246.34, 19.441, 334.363, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(110, 468, 159, 159, 1, 0, 1, 'JN43A7R', 1, 1, 1258.39, 250.43, 19.224, 355.26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(111, 427, 3, 1, 10, 1, 1, 'MM18H3G', 1, 1, 2367.5, 261.314, 26.615, 90.123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(112, 544, 3, 1, 10, 0, 1, 'YP25G3D', 1, 1, 2368.02, 255.965, 26.716, 89.139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(113, 407, 3, 1, 10, 0, 1, 'OG36M2W', 1, 1, 2368.32, 250.843, 26.72, 89.574, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(114, 416, 3, 1, 10, 0, 1, 'LY33F6F', 1, 1, 2367.04, 245.721, 26.633, 88.694, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(115, 416, 3, 1, 10, 0, 1, 'TK82V7Z', 1, 1, 2367.06, 240.519, 26.632, 88.952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(116, 416, 3, 1, 10, 0, 1, 'NW98Z3Q', 1, 1, 2366.92, 235.302, 26.632, 90.991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(117, 416, 3, 1, 10, 0, 1, 'XM24V1R', 1, 1, 2376.33, 235.227, 26.63, 90.13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(118, 416, 3, 1, 10, 0, 1, 'VW37I7I', 1, 1, 2376.66, 240.536, 26.634, 89.752, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(119, 416, 3, 1, 10, 0, 1, 'AT58Z7F', 1, 1, 2376.64, 245.624, 26.633, 88.361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(120, 407, 3, 1, 10, 0, 1, 'MN57K3F', 1, 1, 2378.27, 250.835, 26.719, 89.935, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(121, 554, 1, 3, 10, 0, 1, 'UL99Z5G', 1, 1, 2377.32, 261.244, 26.57, 90.513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(122, 471, 1, 3, 10, 0, 1, 'QO92H3F', 1, 1, 2385.35, 265.075, 25.967, 182.98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(123, 471, 1, 3, 10, 0, 1, 'EC64B7T', 1, 1, 2387.34, 265.047, 25.966, 177.564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(124, 471, 1, 3, 10, 0, 1, 'XW63V3F', 1, 1, 2389.25, 264.936, 25.939, 182.972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(125, 525, 1, 3, 10, 0, 1, 'FU19L1T', 1, 1, 2397.62, 263.724, 26.358, 268.415, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(126, 416, 3, 1, 10, 0, 1, 'PD76I9F', 1, 1, 2397.93, 252.639, 26.626, 270.181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(127, 482, 3, 1, 10, 0, 1, 'ON96V5Q', 1, 1, 2397.8, 249.157, 26.602, 91.111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(128, 560, 3, 1, 10, 0, 1, 'PH36M9T', 1, 1, 2397.94, 245.838, 26.181, 89.659, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(129, 497, 3, 1, 10, 0, 1, 'WL14R9Q', 1, 1, 2400.89, 221.097, 28.172, 90.534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(130, 437, 3, 1, 10, 0, 1, 'OI63P7A', 1, 1, 2316.01, 246.564, 26.637, 269.349, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(131, 490, 3, 1, 10, 0, 1, 'KV72J7M', 1, 1, 2377.59, 255.962, 26.613, 90.446, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(132, 490, 3, 1, 10, 0, 1, 'MY14V5F', 1, 1, 2397.46, 256.076, 26.605, 270.239, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(133, 599, 3, 1, 10, 0, 1, 'ZV22D5V', 1, 1, 2397.7, 259.404, 26.666, 269.533, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(134, 468, 3, 1, 10, 0, 1, 'FY33V6T', 1, 1, 2397.99, 242.081, 26.146, 92.479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(135, 468, 3, 1, 10, 0, 1, 'RA25C3B', 1, 1, 2397.98, 238.933, 26.146, 90.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(136, 468, 3, 1, 10, 0, 1, 'CO57C4P', 1, 1, 2398.19, 235.353, 26.146, 90.684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(137, 468, 3, 1, 10, 0, 1, 'CC11Q6B', 1, 1, 2390.92, 264.996, 26.154, 182.401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(138, 468, 3, 1, 10, 0, 1, 'VD59K2J', 1, 1, 2392.07, 264.972, 26.154, 184.633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(141, 582, 166, 1, 6, 0, 1, 'TR83T6P', 0, 1, 1117.04, 217.135, 845.327, 359.667, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(142, 582, 166, 1, 6, 0, 1, 'GO38T9X', 0, 1, 1121.07, 217.365, 845.322, 359.665, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(143, 582, 166, 1, 6, 0, 1, 'VH36A5T', 0, 1, 1160.21, 226.584, 845.26, 90.845, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(144, 582, 166, 1, 6, 0, 1, 'VS56Z8B', 0, 1, 1160.27, 222.778, 845.356, 89.16, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(145, 582, 166, 1, 6, 0, 1, 'OT56S9Z', 0, 1, 1160.1, 218.315, 845.264, 89.754, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(146, 582, 166, 1, 6, 0, 1, 'OS18G8W', 0, 1, 1160.09, 214.387, 845.353, 89.809, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(147, 582, 166, 1, 6, 0, 1, 'HH19Q8Z', 0, 1, 1160.19, 206.488, 845.325, 88.67, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(148, 582, 166, 1, 6, 0, 1, 'NY12D6X', 0, 1, 1159.86, 202.422, 845.327, 89.159, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(149, 582, 166, 1, 6, 0, 1, 'NT52N9T', 0, 1, 1159.92, 198.205, 845.327, 88.928, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(150, 582, 166, 1, 6, 0, 1, 'GX77E4O', 0, 1, 1160.11, 194.385, 845.331, 91.076, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(151, 582, 166, 1, 6, 0, 1, 'JC53Y9W', 0, 1, 1160.12, 189.802, 845.328, 86.723, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(152, 582, 166, 1, 6, 0, 1, 'MO31X7K', 0, 1, 1160.25, 210.566, 845.34, 89.836, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(153, 580, 166, 1, 6, 0, 1, 'GT99V9V', 0, 1, 1137.08, 177.195, 845.067, 179.465, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(154, 580, 166, 1, 6, 0, 1, 'WA13G7X', 0, 1, 1133.02, 177.402, 845.067, 179.49, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(155, 580, 166, 1, 6, 0, 1, 'PC11N9B', 0, 1, 1129.01, 177.619, 845.067, 179.936, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(156, 507, 166, 1, 6, 0, 1, 'NP29X7G', 0, 1, 1124.95, 177.501, 845.097, 180.389, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(157, 507, 166, 1, 6, 0, 1, 'NF36D9I', 0, 1, 1120.77, 177.605, 845.097, 179.147, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(158, 507, 166, 1, 6, 0, 1, 'QA19F7K', 0, 1, 1116.54, 177.573, 845.097, 178.693, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(159, 426, 166, 1, 6, 0, 1, 'XN14X1O', 0, 1, 1112.41, 177.581, 845.015, 179.113, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(160, 426, 166, 1, 6, 0, 1, 'SP18I8F', 0, 1, 1108.31, 177.546, 845.015, 180.485, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(161, 426, 166, 1, 6, 0, 1, 'FL76D2P', 0, 1, 1104.44, 177.294, 845.015, 180.756, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(162, 579, 166, 1, 6, 0, 1, 'OL56D7T', 0, 1, 1100.44, 177.537, 845.202, 180.393, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(163, 579, 166, 1, 6, 0, 1, 'ZK71S9K', 0, 1, 1093.87, 170.171, 845.133, 268.899, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(164, 579, 166, 1, 6, 0, 1, 'OL29X5G', 0, 1, 1093.78, 166.489, 845.206, 268.939, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(165, 579, 166, 1, 6, 0, 1, 'CQ75R1T', 0, 1, 1093.93, 161.944, 845.204, 272.73, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(166, 437, 166, 1, 6, 0, 1, 'OD87O8T', 0, 1, 1095.02, 133.9, 845.411, 270.525, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(167, 471, 166, 1, 6, 0, 1, 'OZ93Y6S', 0, 1, 1093.38, 137.904, 844.756, 268.336, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(168, 471, 166, 1, 6, 0, 1, 'LD32N4I', 0, 1, 1093.4, 141.6, 844.753, 268.657, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(169, 471, 166, 1, 6, 0, 1, 'UE28X2P', 0, 1, 1093.29, 145.723, 844.745, 269.576, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(170, 468, 166, 1, 6, 0, 1, 'JD72Z3A', 0, 1, 1093.35, 150.012, 844.939, 268.856, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(171, 468, 166, 1, 6, 0, 1, 'FT96N9S', 0, 1, 1093.47, 154.312, 844.94, 270.618, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(172, 468, 166, 1, 6, 0, 1, 'MJ77V8V', 0, 1, 1093.39, 157.905, 844.941, 272.951, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(173, 510, 166, 1, 6, 0, 1, 'DV12T5W', 0, 1, 1111.84, 142.363, 844.853, 92.846, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(174, 510, 166, 1, 6, 0, 1, 'IZ45D7M', 0, 1, 1108.24, 142.06, 844.864, 95.467, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(175, 510, 166, 1, 6, 0, 1, 'TZ83U2Z', 0, 1, 1108.25, 143.531, 844.834, 85.057, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(176, 510, 166, 1, 6, 0, 1, 'HS98U5V', 0, 1, 1108.11, 145.693, 844.847, 91.182, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(177, 510, 166, 1, 6, 0, 1, 'TW39W8W', 0, 1, 1112.05, 145.869, 844.861, 87.78, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(178, 510, 166, 1, 6, 0, 1, 'MY39X8D', 0, 1, 1111.81, 143.722, 844.83, 73.459, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(179, 405, 166, 1, 6, 0, 1, 'KK53H7V', 0, 1, 1137.04, 160.498, 845.146, 0.301, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(180, 405, 166, 1, 6, 0, 1, 'IM71A1M', 0, 1, 1133.03, 160.568, 845.147, 359.823, 6, 558822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `garages`
--

CREATE TABLE `garages` (
  `id` int(11) NOT NULL,
  `HouseSQLID` int(11) NOT NULL,
  `GarageType` int(11) NOT NULL,
  `Locked` int(12) NOT NULL,
  `OutsideX` float NOT NULL,
  `OutsideY` float NOT NULL,
  `OutsideZ` float NOT NULL,
  `InsideX` float NOT NULL,
  `InsideY` float NOT NULL,
  `InsideZ` float NOT NULL,
  `OutsideAngle` float NOT NULL,
  `InsideAngle` float NOT NULL,
  `OutsideVAngle` float NOT NULL,
  `InsideVAngle` float NOT NULL,
  `InsideVW` int(11) NOT NULL,
  `OutsideVW` int(11) NOT NULL,
  `InsideInt` int(11) NOT NULL DEFAULT '0',
  `UseHouse` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `hfurniture`
--

CREATE TABLE `hfurniture` (
  `id` int(11) NOT NULL,
  `Model` int(11) NOT NULL DEFAULT '0',
  `Placed` int(1) NOT NULL DEFAULT '0',
  `Xpos` decimal(17,7) NOT NULL DEFAULT '0.0000000',
  `Ypos` decimal(17,7) NOT NULL DEFAULT '0.0000000',
  `Zpos` decimal(17,7) NOT NULL DEFAULT '0.0000000',
  `Xrot` decimal(17,7) NOT NULL DEFAULT '0.0000000',
  `Yrot` decimal(17,7) NOT NULL DEFAULT '0.0000000',
  `Zrot` decimal(17,7) NOT NULL DEFAULT '0.0000000',
  `HouseSQLID` int(11) NOT NULL DEFAULT '0',
  `Locked` tinyint(1) NOT NULL DEFAULT '0',
  `insideid` int(12) NOT NULL,
  `Material1Used` int(12) NOT NULL,
  `Material1Index` int(12) NOT NULL DEFAULT '-1',
  `Material1Object` int(12) NOT NULL,
  `Material1Txd` varchar(128) NOT NULL,
  `Material1Texture` varchar(128) NOT NULL,
  `Material1Color` int(11) NOT NULL DEFAULT '0',
  `Material2Used` int(12) NOT NULL,
  `Material2Index` int(12) NOT NULL DEFAULT '-1',
  `Material2Object` int(12) NOT NULL,
  `Material2Txd` varchar(128) NOT NULL,
  `Material2Texture` varchar(128) NOT NULL,
  `Material2Color` int(11) NOT NULL DEFAULT '0',
  `Material3Used` int(12) NOT NULL,
  `Material3Index` int(12) NOT NULL DEFAULT '-1',
  `Material3Object` int(12) NOT NULL,
  `Material3Txd` varchar(128) NOT NULL,
  `Material3Texture` varchar(128) NOT NULL,
  `Material3Color` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `hfurniture`
--

INSERT INTO `hfurniture` (`id`, `Model`, `Placed`, `Xpos`, `Ypos`, `Zpos`, `Xrot`, `Yrot`, `Zrot`, `HouseSQLID`, `Locked`, `insideid`, `Material1Used`, `Material1Index`, `Material1Object`, `Material1Txd`, `Material1Texture`, `Material1Color`, `Material2Used`, `Material2Index`, `Material2Object`, `Material2Txd`, `Material2Texture`, `Material2Color`, `Material3Used`, `Material3Index`, `Material3Object`, `Material3Txd`, `Material3Texture`, `Material3Color`) VALUES
(1, 2127, 0, '0.0000000', '0.0000000', '0.0000000', '0.0000000', '0.0000000', '0.0000000', 101, 0, 0, 0, -1, 0, 'none', 'none', 0, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0),
(2, 1504, 0, '0.0000000', '0.0000000', '0.0000000', '0.0000000', '0.0000000', '0.0000000', 101, 1, 0, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0),
(3, 19392, 0, '0.0000000', '0.0000000', '0.0000000', '0.0000000', '0.0000000', '0.0000000', 101, 0, 0, 1, 1, 8839, 'vgsecarshow', 'lightpurple2_32', 0, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0),
(4, 19358, 1, '2364.6680000', '-1125.3700000', '1052.1860000', '0.0000000', '0.0000000', '90.0000000', 101, 0, 0, 1, 0, 1515, 'dsfs', 'CJ_WOOD6', -16776961, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0),
(5, 19358, 1, '2367.8520000', '-1125.3700000', '1054.2370000', '0.0000000', '0.0000000', '90.0000000', 101, 0, 0, 1, 0, 1515, 'dsfs', 'CJ_WOOD6', 0, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0),
(6, 19358, 1, '2364.6680000', '-1125.3700000', '1048.7140000', '0.0000000', '0.0000000', '90.0000000', 101, 0, 0, 1, 0, 1515, 'dsfs', 'CJ_WOOD6', 0, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0),
(7, 2144, 0, '0.0000000', '0.0000000', '0.0000000', '0.0000000', '0.0000000', '0.0000000', 101, 0, 0, 0, -1, -1, 'none', 'none', 0, 0, -1, -1, 'none', 'none', 0, 0, -1, -1, 'none', 'none', 0),
(8, 2144, 1, '2362.1830000', '-1121.8450000', '1049.8050000', '0.0000000', '0.0000000', '70.5740000', 101, 0, 0, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0, 0, -1, 0, '', '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `hostbans`
--

CREATE TABLE `hostbans` (
  `BannedHost` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `oPosX` varchar(16) NOT NULL DEFAULT '0',
  `oPosY` varchar(16) NOT NULL DEFAULT '0',
  `oPosZ` varchar(16) NOT NULL DEFAULT '0',
  `intPosX` float NOT NULL DEFAULT '0',
  `intPosY` float NOT NULL DEFAULT '0',
  `intPosZ` float NOT NULL DEFAULT '0',
  `HouseInterior` int(11) NOT NULL DEFAULT '0',
  `ExtVW` int(11) NOT NULL DEFAULT '0',
  `Price` int(11) NOT NULL DEFAULT '0',
  `OwnerSQLID` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  `HouseLocked` int(11) NOT NULL DEFAULT '0',
  `InsideID` int(11) NOT NULL DEFAULT '0',
  `StoredCash` int(11) NOT NULL DEFAULT '0',
  `StoredWeed` int(11) NOT NULL DEFAULT '0',
  `StoredCocaine` int(11) NOT NULL DEFAULT '0',
  `StoredMoonShine` int(11) NOT NULL DEFAULT '0',
  `StoredPhone` int(12) NOT NULL,
  `DoorNote` varchar(128) NOT NULL DEFAULT '-',
  `DoorContactInfo` varchar(50) NOT NULL DEFAULT '-',
  `HouseVW` int(11) NOT NULL,
  `ExteriorStreamDistance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `houses`
--

INSERT INTO `houses` (`id`, `oPosX`, `oPosY`, `oPosZ`, `intPosX`, `intPosY`, `intPosZ`, `HouseInterior`, `ExtVW`, `Price`, `OwnerSQLID`, `Description`, `HouseLocked`, `InsideID`, `StoredCash`, `StoredWeed`, `StoredCocaine`, `StoredMoonShine`, `StoredPhone`, `DoorNote`, `DoorContactInfo`, `HouseVW`, `ExteriorStreamDistance`) VALUES
(1, '1284.219', '158.743', '20.793', 0, 0, 0, 0, 0, 30000, 0, 'Montgomery Trailer 1', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20001, NULL),
(2, '1293.88', '157.343', '20.461', 0, 0, 0, 0, 0, 25000, 0, 'Montgomery Trailer 2', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20002, NULL),
(3, '1295.13', '174.61', '20.911', 0, 0, 0, 0, 0, 30000, 0, 'Montgomery Trailer 3', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20003, NULL),
(4, '1299.219', '141.062', '20.407', 0, 0, 0, 0, 0, 25000, 0, 'Montgomery Trailer 4', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20004, NULL),
(5, '1306.335', '148.613', '20.347', 0, 0, 0, 0, 0, 25000, 0, 'Montgomery Trailer 5', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20005, NULL),
(6, '1312.013', '169.96', '20.461', 0, 0, 0, 0, 0, 30000, 0, 'Montgomery Trailer 6', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20006, NULL),
(7, '1316.022', '180.053', '20.461', 0, 0, 0, 0, 0, 25000, 0, 'Montgomery Trailer 7', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20007, NULL),
(8, '1303.448', '186.401', '20.461', 0, 0, 0, 0, 0, 25000, 0, 'Montgomery Trailer 8', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20008, NULL),
(9, '1296.55', '190.709', '20.461', 0, 0, 0, 0, 0, 25000, 0, 'Montgomery Trailer 9', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20009, NULL),
(10, '1434.332', '62.515', '32.975', 0, 0, 0, 0, 0, 85000, 0, 'Montgomery View 1', 0, 2, 0, 0, 0, 0, 0, '-', '-', 20010, NULL),
(11, '1415.203', '49.668', '33.462', 0, 0, 0, 0, 0, 85000, 0, 'Montgomery View 2', 0, 2, 0, 0, 0, 0, 0, '-', '-', 20011, NULL),
(12, '1396.114', '35.896', '34.15', 0, 0, 0, 0, 0, 85000, 0, 'Montgomery View 3', 0, 3, 0, 0, 0, 0, 0, '-', '-', 20012, NULL),
(13, '1377.125', '19.673', '34.943', 0, 0, 0, 0, 0, 85000, 0, 'Montgomery View 4', 0, 3, 0, 0, 0, 0, 0, '-', '-', 20013, NULL),
(14, '1358.849', '0.162', '35.631', 0, 0, 0, 0, 0, 85000, 0, 'Montgomery View 5', 0, 3, 0, 0, 0, 0, 0, '-', '-', 20014, NULL),
(15, '1340.858', '-20.036', '36.358', 0, 0, 0, 0, 0, 85000, 0, 'Montgomery View 6', 0, 3, 0, 0, 0, 0, 0, '-', '-', 20015, NULL),
(16, '1138.36', '-168.734', '42.162', 0, 0, 0, 0, 0, 120000, 0, '1 Riverside Lodge', 0, 36, 0, 0, 0, 0, 0, '-', '-', 20016, NULL),
(17, '1159.83', '-164.042', '41.118', 0, 0, 0, 0, 0, 100000, 0, '2 Reverside Lodge', 0, 37, 0, 0, 0, 0, 0, '-', '-', 20017, NULL),
(18, '1187.406', '-147.139', '40.955', 0, 0, 0, 0, 0, 100000, 0, '3 Reverside Lodge', 0, 37, 0, 0, 0, 0, 0, '-', '-', 20018, NULL),
(19, '1230.779', '-108.377', '39.262', 0, 0, 0, 0, 0, 75000, 0, '4 Reverside', 0, 12, 0, 0, 0, 0, 0, '-', '-', 20019, NULL),
(20, '1205.333', '-83.688', '38.634', 0, 0, 0, 0, 0, 90000, 0, '5 Reverside', 0, 25, 0, 0, 0, 0, 0, '-', '-', 20020, NULL),
(21, '1073.156', '-345.39', '73.992', 0, 0, 0, 0, 0, 130000, 0, 'Hilltop Farm 1', 0, 38, 0, 0, 0, 0, 0, '-', '-', 20021, NULL),
(22, '1105.886', '-299.702', '74.539', 0, 0, 0, 0, 0, 50000, 0, 'Hilltop Farm 2', 0, 19, 0, 0, 0, 0, 0, '-', '-', 20022, NULL),
(23, '1107.603', '-315.93', '74.742', 0, 0, 0, 0, 0, 40000, 0, 'Hilltop Farm 3', 0, 33, 0, 0, 0, 0, 0, '-', '-', 20023, NULL),
(24, '1112.161', '-354.68', '73.985', 0, 0, 0, 0, 0, 35000, 0, 'Hilltop Farm 4', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20024, NULL),
(25, '1105.105', '-358.79', '73.992', 0, 0, 0, 0, 0, 35000, 0, 'Hilltop Farm 5', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20025, NULL),
(26, '226.407', '-303.223', '1.926', 0, 0, 0, 0, 0, 35000, 0, 'Blueberry Trailer 1', 0, 6, 0, 0, 0, 0, 0, '-', '-', 20026, NULL),
(28, '235.106', '-308.887', '1.584', 0, 0, 0, 0, 0, 25000, 0, 'Blueberry Trailer 2', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20028, NULL),
(29, '818.263', '-509.648', '18.013', 0, 0, 0, 0, 0, 80000, 0, '1 Greenhill Road', 0, 21, 0, 0, 0, 0, 0, '-', '-', 20029, NULL),
(30, '242.071', '-297.687', '1.578', 0, 0, 0, 0, 0, 25000, 0, 'Blueberry Trailer 3', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20030, NULL),
(31, '260.312', '-302.759', '1.918', 0, 0, 0, 0, 0, 30000, 0, 'Blueberry Trailer 4', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20031, NULL),
(32, '252.73', '-289.993', '1.578', 0, 0, 0, 0, 0, 25000, 0, 'Blueberry Trailer 5', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20032, NULL),
(33, '795.254', '-506.539', '18.013', 0, 0, 0, 0, 0, 80000, 0, '2 Greenhill Road', 0, 23, 0, 0, 0, 0, 0, '-', '-', 20033, NULL),
(34, '263.68', '-283.895', '1.578', 0, 0, 0, 0, 0, 25000, 0, 'Blueberry Trailer 6', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20034, NULL),
(35, '256.338', '-278.215', '1.578', 0, 0, 0, 0, 0, 25000, 0, 'Blueberry Trailer 7', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20035, NULL),
(36, '261.145', '-270.753', '1.578', 0, 0, 0, 0, 0, 25000, 0, 'Blueberry Trailer 8', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20036, NULL),
(37, '241.057', '-282.006', '1.584', 0, 0, 0, 0, 0, 25000, 0, 'Blueberry Trailer 9', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20037, NULL),
(38, '776.712', '-503.882', '18.013', 0, 0, 0, 0, 0, 80000, 0, '3 Greenhill Road', 0, 29, 0, 0, 0, 0, 0, '-', '-', 20038, NULL),
(39, '264.008', '-246.011', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 1', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20039, NULL),
(40, '271.456', '-246.079', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 2', 0, 5, 0, 0, 0, 0, 0, '-', '-', 20040, NULL),
(41, '273.322', '-246.082', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 3', 0, 6, 0, 0, 0, 0, 0, '-', '-', 20041, NULL),
(42, '743.207', '-509.528', '18.013', 0, 0, 0, 0, 0, 80000, 0, '4 Greenhill Road', 0, 30, 0, 0, 0, 0, 0, '-', '-', 20042, NULL),
(43, '280.707', '-246.266', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 4', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20043, NULL),
(44, '282.597', '-246.464', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 5', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20044, NULL),
(45, '290.127', '-246.174', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 6', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20045, NULL),
(47, '291.914', '-246.093', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 7', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20047, NULL),
(48, '299.283', '-246.138', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 8', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20048, NULL),
(49, '299.416', '-245.822', '4.629', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 9', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20049, NULL),
(50, '292.004', '-245.606', '4.629', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 10', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20050, NULL),
(51, '290.005', '-245.769', '4.629', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 11', 0, 6, 0, 0, 0, 0, 0, '-', '-', 20051, NULL),
(52, '282.557', '-246.592', '4.629', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 12', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20052, NULL),
(53, '280.691', '-246.593', '4.629', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 13', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20053, NULL),
(54, '273.322', '-246.593', '4.629', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 14', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20054, NULL),
(55, '271.391', '-246.593', '4.629', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 15', 0, 6, 0, 0, 0, 0, 0, '-', '-', 20055, NULL),
(56, '263.935', '-246.593', '4.629', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 16', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20056, NULL),
(57, '745.08', '-556.545', '18.013', 0, 0, 0, 0, 0, 80000, 0, '5 Greenhill Road', 0, 34, 0, 0, 0, 0, 0, '-', '-', 20057, NULL),
(58, '281.67', '-231.637', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 17', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20058, NULL),
(59, '274.304', '-231.638', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 18', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20059, NULL),
(60, '272.35', '-231.64', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 19', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20060, NULL),
(61, '264.945', '-231.638', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 20', 0, 5, 0, 0, 0, 0, 0, '-', '-', 20061, NULL),
(62, '263.066', '-231.637', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 21', 0, 6, 0, 0, 0, 0, 0, '-', '-', 20062, NULL),
(64, '255.594', '-231.638', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 22', 0, 5, 0, 0, 0, 0, 0, '-', '-', 20064, NULL),
(65, '766.575', '-556.39', '18.013', 0, 0, 0, 0, 0, 80000, 0, '6 Greenhill Road', 0, 20, 0, 0, 0, 0, 0, '-', '-', 20065, NULL),
(66, '253.719', '-231.637', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 23', 0, 13, 0, 0, 0, 0, 0, '-', '-', 20066, NULL),
(67, '246.217', '-231.637', '1.384', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 24', 0, 13, 0, 0, 0, 0, 0, '-', '-', 20067, NULL),
(68, '246.322', '-231.637', '4.669', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 25', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20068, NULL),
(69, '253.738', '-231.637', '4.669', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 26', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20069, NULL),
(70, '255.618', '-231.637', '4.669', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 27', 0, 5, 0, 0, 0, 0, 0, '-', '-', 20070, NULL),
(71, '263.062', '-231.637', '4.669', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 28', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20071, NULL),
(72, '264.949', '-231.637', '4.669', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 29', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20072, NULL),
(73, '272.38', '-231.638', '4.669', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 30', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20073, NULL),
(74, '274.228', '-231.637', '4.669', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 31', 0, 5, 0, 0, 0, 0, 0, '-', '-', 20074, NULL),
(75, '281.675', '-231.639', '4.669', 0, 0, 0, 0, 0, 20000, 0, 'Oakridge Apartament 32', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20075, NULL),
(77, '745.321', '-591.144', '18.013', 0, 0, 0, 0, 0, 80000, 0, '7 Greenhill Road', 0, 14, 0, 0, 0, 0, 0, '-', '-', 20077, NULL),
(78, '312.724', '-121.184', '3.535', 0, 0, 0, 0, 0, 70000, 0, 'Jason Street 1', 0, 20, 0, 0, 0, 0, 0, '-', '-', 20078, NULL),
(79, '312.722', '-92.401', '3.535', 0, 0, 0, 0, 0, 70000, 0, 'Jason Street 2', 0, 20, 0, 0, 0, 0, 0, '-', '-', 20079, NULL),
(80, '295.097', '-54.543', '2.777', 0, 0, 0, 0, 0, 70000, 0, 'Jason Street 3', 0, 22, 0, 0, 0, 0, 0, '-', '-', 20080, NULL),
(81, '252.296', '-121.293', '3.535', 0, 0, 0, 0, 0, 70000, 0, '1 Blueberry Main Street', 0, 2, 0, 0, 0, 0, 0, '-', '-', 20081, NULL),
(82, '267.783', '-54.543', '2.777', 0, 0, 0, 0, 0, 70000, 0, 'Jason Street 4', 0, 12, 0, 0, 0, 0, 0, '-', '-', 20082, NULL),
(83, '252.635', '-92.404', '3.535', 0, 0, 0, 0, 0, 70000, 0, '2 Blueberry Main Street', 0, 12, 0, 0, 0, 0, 0, '-', '-', 20083, NULL),
(84, '248.712', '-33.188', '1.578', 0, 0, 0, 0, 0, 70000, 0, 'Blueberry Main Street 3', 0, 3, 0, 0, 0, 0, 0, '-', '-', 20084, NULL),
(85, '253.331', '-22.276', '1.634', 0, 0, 0, 0, 0, 70000, 0, 'Blueberry Main Street 4', 0, 13, 0, 0, 0, 0, 0, '-', '-', 20085, NULL),
(86, '285.917', '41.621', '2.532', 0, 0, 0, 0, 0, 30000, 0, 'North Blueberry Trailers 1', 0, 5, 0, 0, 0, 0, 0, '-', '-', 20086, NULL),
(87, '16.653', '162.065', '2.451', 0, 0, 0, 0, 0, 170000, 0, 'Shoreside Villa 1', 0, 23, 0, 0, 0, 0, 0, '-', '-', 20087, NULL),
(88, '40.181', '147.307', '2.449', 0, 0, 0, 0, 0, 170000, 0, 'Shoreside Villa 2', 0, 30, 0, 0, 0, 0, 0, '-', '-', 20088, NULL),
(89, '309.332', '44.101', '3.088', 0, 0, 0, 0, 0, 30000, 0, 'North Blueberry Trailers 2', 0, 6, 0, 0, 0, 0, 0, '-', '-', 20089, NULL),
(90, '317.334', '54.844', '3.375', 0, 0, 0, 0, 0, 30000, 0, 'North Blueberry Trailers 3', 0, 13, 0, 0, 0, 0, 0, '-', '-', 20090, NULL),
(91, '342.407', '62.542', '3.854', 0, 0, 0, 0, 0, 30000, 0, 'North Blueberry Trailers 4', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20091, NULL),
(92, '340.229', '33.779', '6.41', 0, 0, 0, 0, 0, 30000, 0, 'North Blueberry Trailers 5', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20092, NULL),
(93, '316.61', '17.917', '4.516', 0, 0, 0, 0, 0, 30000, 0, 'North Blueberry Trailers 6', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20093, NULL),
(94, '705.47', '291.51', '20.422', 0, 0, 0, 0, 0, 30000, 0, '1 Hampton Barns', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20094, NULL),
(95, '723.691', '269.097', '22.453', 0, 0, 0, 0, 0, 30000, 0, '2 Hampton Barns', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20095, NULL),
(96, '747.54', '278.336', '27.22', 0, 0, 0, 0, 0, 30000, 0, '3 Hampton Barns', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20096, NULL),
(97, '748.106', '257.333', '27.086', 0, 0, 0, 0, 0, 30000, 0, '4 Hampton Barns', 0, 13, 0, 0, 0, 0, 0, '-', '-', 20097, NULL),
(98, '759.097', '294.66', '20.518', 0, 0, 0, 0, 0, 25000, 0, '5 Hampton Barns', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20098, NULL),
(99, '746.434', '305.038', '20.234', 0, 0, 0, 0, 0, 30000, 0, '6 Hampton Barns', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20099, NULL),
(100, '718.829', '300.594', '20.234', 0, 0, 0, 0, 0, 30000, 0, '7 Hampton Barns', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20100, NULL),
(101, '1423.658', '288.544', '19.597', 0, 0, 0, 0, 0, 130000, 1, 'Clover Court 1', 0, 3, 0, 0, 0, 0, 0, '-', '-', 20101, NULL),
(102, '1433.675', '309.016', '19.579', 0, 0, 0, 0, 0, 130000, 0, 'Clover Court 2', 0, 4, 0, 0, 0, 0, 0, '-', '-', 20102, NULL),
(103, '1410.41', '309.623', '19.442', 0, 0, 0, 0, 0, 120000, 0, 'Clover Court 3', 0, 14, 0, 0, 0, 0, 0, '-', '-', 20103, NULL),
(104, '748.558', '350.669', '20.437', 0, 0, 0, 0, 0, 25000, 0, '8 Hampton Barns', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20104, NULL),
(105, '772.733', '348.218', '20.153', 0, 0, 0, 0, 0, 30000, 0, '9 Hampton Barns', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20105, NULL),
(106, '1415.845', '324.658', '18.844', 0, 0, 0, 0, 0, 110000, 0, 'Clover Court 4', 0, 20, 0, 0, 0, 0, 0, '-', '-', 20106, NULL),
(107, '1403.184', '333.921', '18.906', 0, 0, 0, 0, 0, 110000, 0, 'Clover Court 5', 0, 21, 0, 0, 0, 0, 0, '-', '-', 20107, NULL),
(108, '783.843', '352.97', '19.594', 0, 0, 0, 0, 0, 30000, 0, '10 Hampton Barns', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20108, NULL),
(110, '1373.531', '341.42', '19.375', 0, 0, 0, 0, 0, 110000, 0, 'Clover Court 6', 0, 2, 0, 0, 0, 0, 0, '-', '-', 20110, NULL),
(111, '805.402', '358.835', '19.762', 0, 0, 0, 0, 0, 30000, 0, '11 Hampton Barns', 0, 13, 0, 0, 0, 0, 0, '-', '-', 20111, NULL),
(112, '813.511', '361.013', '19.505', 0, 0, 0, 0, 0, 25000, 0, '12 Hampton Barns', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20112, NULL),
(113, '807.97', '372.332', '19.453', 0, 0, 0, 0, 0, 25000, 0, '13 Hampton Barns', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20113, NULL),
(114, '783.2', '377.744', '21.208', 0, 0, 0, 0, 0, 25000, 0, '14 Hampton Barns', 0, 17, 0, 0, 0, 0, 0, '-', '-', 20114, NULL),
(115, '758.641', '375.03', '23.196', 0, 0, 0, 0, 0, 30000, 0, '15 Hampton Barns', 0, 6, 0, 0, 0, 0, 0, '-', '-', 20115, NULL),
(116, '751.807', '375.283', '23.375', 0, 0, 0, 0, 0, 25000, 0, '16 Hampton Barns', 0, 18, 0, 0, 0, 0, 0, '-', '-', 20116, NULL),
(117, '1380.833', '361.137', '20.205', 0, 0, 0, 0, 0, 110000, 0, 'Clover Court 7', 0, 2, 0, 0, 0, 0, 0, '-', '-', 20117, NULL),
(120, '1409.377', '346.51', '19.252', 0, 0, 0, 0, 0, 110000, 0, 'Clover Court 8', 0, 1, 0, 0, 0, 0, 0, '-', '-', 20120, NULL),
(121, '1434.922', '334.851', '18.947', 0, 0, 0, 0, 0, 75000, 0, 'Clover Court 9', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20121, NULL),
(122, '1461.18', '342.384', '18.953', 0, 0, 0, 0, 0, 75000, 0, 'Clover Court 10', 0, 8, 0, 0, 0, 0, 0, '-', '-', 20122, NULL),
(123, '1469.655', '351.494', '18.926', 0, 0, 0, 0, 0, 50000, 0, 'Clover Court 11', 0, 6, 0, 0, 0, 0, 0, '-', '-', 20123, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ignore`
--

CREATE TABLE `ignore` (
  `PlayerSQLID` int(11) NOT NULL,
  `IgnoringSQLID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `ingOwnerType` varchar(16) NOT NULL,
  `ingOwner` int(11) NOT NULL,
  `ingAmount` int(11) NOT NULL,
  `ingVW` int(11) NOT NULL,
  `ingPosX` float NOT NULL,
  `ingPosY` float NOT NULL,
  `ingPosZ` float NOT NULL,
  `ingType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `ingredients`
--

INSERT INTO `ingredients` (`id`, `ingOwnerType`, `ingOwner`, `ingAmount`, `ingVW`, `ingPosX`, `ingPosY`, `ingPosZ`, `ingType`) VALUES
(1, 'P', 1, 20, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `interiors`
--

CREATE TABLE `interiors` (
  `id` int(12) NOT NULL,
  `OutsideX` float NOT NULL,
  `OutsideY` float NOT NULL,
  `OutsideZ` float NOT NULL,
  `InsideX` float NOT NULL,
  `InsideY` float NOT NULL,
  `InsideZ` float NOT NULL,
  `InsideAngle` float NOT NULL,
  `OutsideAngle` float NOT NULL,
  `InsideINT` int(12) NOT NULL,
  `OutsideINT` int(12) NOT NULL,
  `InsideVW` int(12) NOT NULL,
  `OutsideVW` int(12) NOT NULL,
  `InteriorName` varchar(128) NOT NULL,
  `ShowGPS` int(12) NOT NULL DEFAULT '0',
  `Faction` int(12) NOT NULL DEFAULT '0',
  `Rank` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `interiors`
--

INSERT INTO `interiors` (`id`, `OutsideX`, `OutsideY`, `OutsideZ`, `InsideX`, `InsideY`, `InsideZ`, `InsideAngle`, `OutsideAngle`, `InsideINT`, `OutsideINT`, `InsideVW`, `OutsideVW`, `InteriorName`, `ShowGPS`, `Faction`, `Rank`) VALUES
(1, 1252.93, 138.102, 19.9108, 734.923, 3114.36, 2084.62, 87.3018, 244.549, 3, 0, 1, 0, 'Department of Motor Vehicles', 0, 0, 0),
(2, 1227.91, 181.634, 20.3978, 1234.58, 189.24, 2091.37, 182.872, 155, 2, 0, 1, 0, 'Montgomery Information Center', 1, 0, 0),
(3, 648.115, 1674.72, 7.1972, 599.581, 1689.7, -8.9251, 0, 310.612, 400, 0, 1, 0, 'Elite Truck', 0, 0, 0),
(4, 627.094, -567.113, 17.8515, -801.59, -420.028, 1602.01, 0, 0, 4, 0, 1, 0, 'SASP', 0, 0, 0),
(5, -801.662, -405.641, 1602, -801.505, -407.144, 1401.99, 0, 2.2463, 5, 4, 2, 1, 'Dillimore Police Departament', 0, 0, 0),
(6, -795.468, -403.389, 1401.99, -793.635, -403.046, 1802.03, 269.797, 271.143, 6, 5, 3, 2, 'Vestiario', 0, 0, 0),
(7, 2269.7, -74.9483, 26.7724, 2269.36, -73.3827, 1000.94, 359.96, 359.4, 109, 0, 8, 0, 'Prefeitura - Palomino Creek', 0, 0, 0),
(8, -795.417, -396.975, 1401.99, -794.157, -396.414, 1802.03, 269.527, 269.876, 6, 5, 3, 2, 'Academia e Chuveiros', 0, 0, 0),
(9, -787.568, -408.861, 1405.52, -788.141, -410.748, 1605.82, 176.647, 181.122, 7, 5, 4, 2, 'Cerimonial', 0, 0, 0),
(10, -814.861, -407.488, 1405.52, -814.854, -308.906, 1605.52, 181.323, 180.389, 8, 5, 5, 2, 'Sala de Reuniao', 0, 0, 0),
(11, -811.968, -394.043, 1405.53, -692.631, -400.42, 1406.45, 86.9203, 93.3394, 6, 5, 6, 2, 'Salas', 0, 0, 0),
(12, -805.17, -392.216, 1405.53, -647.187, -427.134, 1407.35, 356.389, 357.446, 7, 5, 7, 2, 'PWS', 0, 0, 0),
(13, -791.936, -399.854, 1405.53, -790.543, -399.933, 1805.52, 269.661, 271.825, 11, 5, 8, 2, 'ESU - PEU', 0, 0, 0),
(14, -808.311, -396.866, 1401.99, -725.246, -393.299, 1408.72, 85.7232, 90.1143, 12, 5, 9, 2, 'JAIL', 0, 0, 0),
(15, -793.159, -391.951, 1405.53, -793.05, -359.517, 1428.32, 322.236, 359.837, 13, 5, 10, 2, 'Alto cargos', 0, 0, 0),
(16, -802.505, -380.335, 1409.01, -748.952, -420.351, 1440.1, 87.2337, 356.181, 14, 5, 11, 2, 'Arsenal', 0, 0, 0),
(17, 619.139, -591.992, 17.0882, -742.248, -391.595, 1408.8, 89.2059, 0.9941, 12, 0, 9, 0, 'Entrada trazeira', 0, 0, 0),
(18, 1273.4, 238.416, 19.6796, 322.198, 302.498, 999.148, 0, 66.3951, 5, 0, 100, 0, '', 0, 0, 0),
(19, 2249.09, 32.0757, 26.4844, 2250.29, 32.9213, 138.337, 165.009, 181.564, 300, 0, 100, 0, 'Palomino Recicle', 0, 0, 0),
(20, -207.14, 1119.29, 20.4297, 769.23, -32.3512, 1008.7, 87.7054, 95.5023, 110, 0, 3, 0, 'Prefeitura - Fort Carson', 0, 0, 0),
(21, -2177.51, -2307.53, 30.625, 887.327, 2259.46, 238.23, 354.352, 138.322, 111, 0, 3, 0, 'Prefeitura - Angel Pine', 0, 0, 0),
(26, 1281.4, 281.202, 19.5547, 1172.52, -439.417, 1128.28, 0, 0, 304, 0, 304, 0, 'Montgomery Block 1', 0, 0, 0),
(27, 1279.8, 284.048, 19.5547, 1172.68, -239.241, 1128.29, 0, 0, 305, 0, 305, 0, 'Montgomery Block 2', 0, 0, 0),
(28, 1288.92, 304.358, 19.5547, 1172.52, -439.417, 1128.28, 0, 0, 306, 0, 306, 0, 'Montgomery Block 3', 0, 0, 0),
(29, 1292.4, 311.85, 19.5547, 1172.68, -239.241, 1128.29, 0, 0, 307, 0, 307, 0, 'Montgomery Block 4', 0, 0, 0),
(30, 1281.29, 305.315, 19.5547, 1172.52, -439.417, 1128.28, 0, 0, 308, 0, 308, 0, 'Montgomery Block 5', 0, 0, 0),
(31, 1272.1, 309.295, 19.5547, 1172.68, -239.241, 1128.29, 0, 0, 309, 0, 309, 0, 'Montgomery Block 6', 0, 0, 0),
(35, 1309.5, 381.616, 19.5625, 1401.23, -17.6291, 1000.9, 0, 0, 313, 0, 313, 0, 'Montgomery Block 7', 0, 0, 0),
(36, 1323.62, 375.249, 19.5625, 1401.23, -17.6291, 1000.9, 0, 0, 314, 0, 314, 0, 'Montgomery Block 8', 0, 0, 0),
(43, 2302.81, -64.427, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 321, 0, 321, 0, 'Palomino Block 1', 0, 0, 0),
(44, 2302.61, -53.9595, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 322, 0, 322, 0, 'Palomino Block 2', 0, 0, 0),
(45, 2303.23, -42.3335, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 323, 0, 323, 0, 'Palomino Block 3', 0, 0, 0),
(46, 2284.67, 71.9273, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 324, 0, 324, 0, 'Palomino Block 4', 0, 0, 0),
(47, 2281.88, 61.4594, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 325, 0, 325, 0, 'Palomino Block 5', 0, 0, 0),
(48, 2275.54, 65.7604, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 326, 0, 326, 0, 'Palomino Block 6', 0, 0, 0),
(49, 2264.06, 59.8077, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 327, 0, 327, 0, 'Palomino Block 7', 0, 0, 0),
(50, 2259.63, 63.2738, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 328, 0, 328, 0, 'Palomino Block 8', 0, 0, 0),
(51, 2258.04, 79.447, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 329, 0, 329, 0, 'Palomino Block 9', 0, 0, 0),
(52, 2238.23, 67.3198, 26.4844, 1172.68, -239.241, 1128.29, 0, 0, 330, 0, 330, 0, 'Palomino Block 10', 0, 0, 0),
(53, 660.14, -521.095, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 331, 0, 331, 0, 'Dillimore Block 1', 0, 0, 0),
(54, 658.974, -626.32, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 332, 0, 332, 0, 'Dillimore Block 2', 0, 0, 0),
(55, 659.045, -634.606, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 333, 0, 333, 0, 'Dillimore Block 3', 0, 0, 0),
(56, 659.157, -649.098, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 334, 0, 334, 0, 'Dillimore Block 4', 0, 0, 0),
(57, 672.736, -632.164, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 335, 0, 335, 0, 'Dillimore Block 5', 0, 0, 0),
(58, 661.581, -651.58, 16.4339, 1172.68, -239.241, 1128.29, 0, 0, 336, 0, 336, 0, 'Dillimore Block 6', 0, 0, 0),
(59, 691.147, -636.245, 16.3243, 1172.68, -239.241, 1128.29, 0, 0, 337, 0, 337, 0, 'Dillimore Block 7', 0, 0, 0),
(60, 690.381, -625.663, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 338, 0, 338, 0, 'Dillimore Block 8', 0, 0, 0),
(61, 701.781, -609.44, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 339, 0, 339, 0, 'Dillimore Block 9', 0, 0, 0),
(62, 704.61, -611.517, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 340, 0, 340, 0, 'Dillimore Block 10', 0, 0, 0),
(63, 704.341, -633.648, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 341, 0, 341, 0, 'Dillimore Block 11', 0, 0, 0),
(64, 704.358, -642.135, 16.3359, 1172.68, -239.241, 1128.29, 0, 0, 341, 0, 341, 0, 'Dillimore Block 13', 0, 0, 0),
(65, 123.287, 1057.1, 13.6159, 129.072, 1059.72, 2991.16, 0, 0, 800, 0, 341, 0, 'Shopping Fort Carson', 0, 0, 0),
(66, 1242.38, 211.379, 19.5547, -768.212, 441.562, 16.4497, 2.5021, 247.296, 100, 0, 100, 0, 'Esgoto de Montgomery', 0, 0, 0),
(67, -810.541, 442.285, 8.5281, 117.55, 348.015, 101.939, 0, 176.956, 101, 100, 101, 100, 'Montgomery Esgoto', 0, 0, 0),
(68, 2356.27, 221.413, 27.5807, 2357.64, 227.136, 2000.66, 0, 0, 21, 0, 1, 0, 'Red County Fire Departament', 0, 0, 0),
(69, 2372.93, 229.964, 26.4887, 2378.36, 235.745, 2000.66, 0, 0, 21, 0, 1, 0, 'Red County Fire Departament', 0, 0, 0),
(70, 2302.81, -16.1975, 26.4844, 2306.32, -15.9074, 26.7496, 0, 0, 0, 0, 1, 0, 'Banco Palomino Creek', 0, 0, 0),
(71, -2482.2, 2406.57, 17.1094, -2027.94, 1019.2, 1417.92, 0, 0, 312, 0, 131, 0, 'Igreja de Bayside', 0, 0, 0),
(72, 2256.67, -44.0031, 26.6834, -2027.94, 1019.2, 1417.92, 0, 0, 313, 0, 132, 0, 'Igreja de Palomino Creek', 0, 0, 0),
(73, 1311.24, 329.38, 19.914, 1109.26, 1052.3, -19.9389, 0, 0, 303, 0, 303, 0, 'Banco de Montgomery', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `masters`
--

CREATE TABLE `masters` (
  `id` int(11) NOT NULL,
  `Username` varchar(22) NOT NULL,
  `Password` varchar(150) NOT NULL,
  `IP` varchar(20) NOT NULL,
  `codesenha` varchar(150) NOT NULL,
  `RecentIP` varchar(20) NOT NULL,
  `RecentSerial` varchar(128) NOT NULL,
  `RegTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RegisterDate` varchar(36) DEFAULT NULL,
  `LoginDate` varchar(36) DEFAULT NULL,
  `LastLog` int(11) NOT NULL,
  `EMail` varchar(100) NOT NULL,
  `State` int(2) NOT NULL,
  `GeoDetails` varchar(4) NOT NULL,
  `Flag` varchar(12) NOT NULL,
  `AssistCount` int(11) NOT NULL,
  `DutyTime` int(11) NOT NULL,
  `AdminScore` int(11) NOT NULL,
  `IncognitoTime` int(12) DEFAULT '0',
  `BugCount` int(11) NOT NULL,
  `BugComments` int(12) NOT NULL DEFAULT '0',
  `ASayMute` int(11) NOT NULL,
  `MaxVisibleObjects` int(12) NOT NULL DEFAULT '750',
  `VOIgnore` tinyint(1) NOT NULL DEFAULT '0',
  `AFKDutyTime` int(11) NOT NULL,
  `HasRCON` int(11) NOT NULL,
  `BMXBanned` int(12) NOT NULL DEFAULT '0',
  `TagBanned` int(11) NOT NULL,
  `CompletedTutorial` int(12) NOT NULL,
  `appHandler` int(11) NOT NULL DEFAULT '0',
  `Helper` int(11) NOT NULL,
  `AdminLevel` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quiz_at` datetime NOT NULL,
  `quizReminder` int(11) NOT NULL,
  `Tester` int(11) NOT NULL,
  `masterscol` varchar(45) NOT NULL,
  `Developer` int(11) NOT NULL,
  `HoF` int(11) NOT NULL,
  `UCPAccessCount` int(11) NOT NULL,
  `pushover_status` int(11) NOT NULL DEFAULT '0',
  `pushover_id` varchar(256) NOT NULL,
  `notificationsCreated` int(11) NOT NULL,
  `additionalRoles` varchar(256) NOT NULL,
  `serverDeveloper` int(11) NOT NULL,
  `ucpDeveloper` int(11) NOT NULL,
  `timezone` varchar(200) NOT NULL,
  `accept_friends` int(11) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `authy` varchar(200) DEFAULT NULL,
  `emailConfirmed` int(11) NOT NULL DEFAULT '0',
  `lastActivity` datetime NOT NULL,
  `hideActivity` int(12) NOT NULL,
  `maAppCount` int(12) NOT NULL,
  `snow` int(11) NOT NULL DEFAULT '1',
  `maAdminTicketCount` int(11) NOT NULL DEFAULT '0',
  `staffTopic` varchar(512) NOT NULL,
  `UserNote` varchar(150) NOT NULL,
  `uJorn` int(11) NOT NULL,
  `uPerguntaSecreta` varchar(126) NOT NULL,
  `uAtivo` int(11) NOT NULL,
  `uResposta` varchar(126) NOT NULL,
  `uDica` varchar(126) NOT NULL,
  `resp_1` text NOT NULL,
  `resp_2` text NOT NULL,
  `resp_3` text NOT NULL,
  `resp_4` text NOT NULL,
  `resp_5` text NOT NULL,
  `resp_6` text NOT NULL,
  `corrigir_appnegada` text NOT NULL,
  `avaliada_por` varchar(32) NOT NULL,
  `perfilforum` varchar(126) NOT NULL,
  `tickets` varchar(126) NOT NULL,
  `ReApplyTime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Estrutura para tabela `mdc`
--

CREATE TABLE `mdc` (
  `id` int(11) NOT NULL,
  `SuspectSQLID` int(6) NOT NULL,
  `OfficerSQLID` int(6) NOT NULL,
  `RecordType` int(3) NOT NULL,
  `Reason` varchar(200) NOT NULL,
  `Amount` int(11) NOT NULL,
  `OfficerRank` varchar(32) NOT NULL,
  `OfficerName` varchar(28) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `cleared` int(11) NOT NULL,
  `removed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `mdc`
--

INSERT INTO `mdc` (`id`, `SuspectSQLID`, `OfficerSQLID`, `RecordType`, `Reason`, `Amount`, `OfficerRank`, `OfficerName`, `timestamp`, `cleared`, `removed`) VALUES
(1, 1, 1, 1, '', 60, 'Cadete', 'Vincent Henderson', 1534470931, 0, 0),
(2, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534471743, 0, 0),
(3, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534472262, 0, 0),
(4, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534472290, 0, 0),
(5, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534472297, 0, 0),
(6, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534473910, 0, 0),
(7, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534483653, 0, 0),
(8, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534483661, 0, 0),
(9, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534485910, 0, 0),
(10, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534485914, 0, 0),
(11, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534486632, 0, 0),
(12, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534486634, 0, 0),
(13, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534486635, 0, 0),
(14, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534486637, 0, 0),
(15, 1, 1, 1, '', 1, 'Cadete', 'Vincent Henderson', 1534486639, 0, 0),
(16, 2, 1, 1, '', 1, 'Chief of Police', 'Vincent Henderson', 1534803016, 0, 0),
(17, 2, 1, 1, '', 1, 'Chief of Police', 'Vincent Henderson', 1534803106, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdcassociatedcasefiles`
--

CREATE TABLE `mdcassociatedcasefiles` (
  `id` int(11) NOT NULL,
  `casefileid` int(11) NOT NULL,
  `AssociatedSQLID` int(11) NOT NULL,
  `OfficerSQLID` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdccasefileevidence`
--

CREATE TABLE `mdccasefileevidence` (
  `id` int(11) NOT NULL,
  `EvidenceName` varchar(64) NOT NULL,
  `CasefileID` int(11) NOT NULL,
  `ChargeID` int(11) NOT NULL,
  `Image` varchar(128) NOT NULL,
  `Notes` varchar(512) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdccasefiles`
--

CREATE TABLE `mdccasefiles` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `submittedby` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdccasefilescharges`
--

CREATE TABLE `mdccasefilescharges` (
  `id` int(11) NOT NULL,
  `ChargeName` varchar(64) NOT NULL,
  `SuspectSQLID` int(11) NOT NULL,
  `OfficerSQLID` int(11) NOT NULL,
  `EvidenceID` int(11) NOT NULL,
  `CasefileID` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdcnavbar`
--

CREATE TABLE `mdcnavbar` (
  `id` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `RouteName` varchar(64) NOT NULL,
  `Status` int(11) NOT NULL,
  `MinimumRank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdcpersonsdb`
--

CREATE TABLE `mdcpersonsdb` (
  `id` int(11) NOT NULL,
  `playerId` int(11) NOT NULL,
  `dcnumber` varchar(32) NOT NULL,
  `gender` int(11) NOT NULL,
  `race` int(11) NOT NULL,
  `skin` int(11) NOT NULL,
  `hair` int(11) NOT NULL,
  `eye` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `firstAgency` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdcpersonslog`
--

CREATE TABLE `mdcpersonslog` (
  `id` int(11) NOT NULL,
  `playerId` int(11) NOT NULL,
  `changerId` int(11) NOT NULL,
  `changerRank` varchar(64) NOT NULL,
  `changerName` varchar(64) NOT NULL,
  `changerFaction` int(11) NOT NULL,
  `changerMa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdcpersonslogchanges`
--

CREATE TABLE `mdcpersonslogchanges` (
  `id` int(11) NOT NULL,
  `personsLogId` int(11) NOT NULL,
  `changedValue` int(11) NOT NULL,
  `newStringValue` varchar(128) DEFAULT NULL,
  `oldStringValue` varchar(128) DEFAULT NULL,
  `newIntValue` int(11) DEFAULT NULL,
  `oldIntValue` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdcsettings`
--

CREATE TABLE `mdcsettings` (
  `id` int(11) NOT NULL,
  `motd` int(11) NOT NULL,
  `mTitle` varchar(64) NOT NULL,
  `mMessage` varchar(512) NOT NULL,
  `mAuthor` int(11) NOT NULL,
  `mDateTime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `motd`
--

CREATE TABLE `motd` (
  `motdid` int(12) NOT NULL,
  `message` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `motel`
--

CREATE TABLE `motel` (
  `id` int(11) NOT NULL,
  `MotelID` int(11) NOT NULL DEFAULT '0',
  `OwnerSQLID` int(11) NOT NULL DEFAULT '0',
  `OutsideX` float NOT NULL DEFAULT '0',
  `OutsideY` float NOT NULL DEFAULT '0',
  `OutsideZ` float NOT NULL DEFAULT '0',
  `RoomLocked` int(11) NOT NULL DEFAULT '0',
  `RoomDaysLeft` int(11) NOT NULL DEFAULT '0',
  `Weapon` int(11) NOT NULL DEFAULT '0',
  `WeaponAmmo` int(11) NOT NULL DEFAULT '0',
  `Materials` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `motel`
--

INSERT INTO `motel` (`id`, `MotelID`, `OwnerSQLID`, `OutsideX`, `OutsideY`, `OutsideZ`, `RoomLocked`, `RoomDaysLeft`, `Weapon`, `WeaponAmmo`, `Materials`) VALUES
(1, 2, 0, -90.743, 1229.74, 19.742, 0, 0, 0, 0, 0),
(2, 2, 0, -89.016, 1229.74, 19.742, 0, 0, 0, 0, 0),
(3, 2, 0, -68.075, 1223.56, 19.65, 0, 0, 0, 0, 0),
(4, 2, 0, -68.073, 1221.8, 19.661, 0, 0, 0, 0, 0),
(5, 2, 0, -68.074, 1221.78, 22.44, 0, 0, 0, 0, 0),
(6, 2, 0, -68.074, 1223.61, 22.44, 0, 0, 0, 0, 0),
(7, 2, 0, -89, 1229.74, 22.44, 0, 0, 0, 0, 0),
(8, 2, 0, -90.787, 1229.74, 22.44, 0, 0, 0, 0, 0),
(9, 3, 0, -101.609, 1234.46, 19.742, 0, 0, 0, 0, 0),
(10, 3, 0, -78.165, 1234.55, 19.742, 0, 0, 0, 0, 0),
(11, 3, 0, -63.355, 1234.39, 22.44, 0, 0, 0, 0, 0),
(12, 3, 0, -63.213, 1210.95, 22.437, 0, 0, 0, 0, 0),
(13, 3, 0, -78.169, 1234.54, 22.44, 0, 0, 0, 0, 0),
(14, 3, 0, -101.608, 1234.46, 22.44, 0, 0, 0, 0, 0),
(15, 3, 0, -789.479, 2747.72, 45.855, 0, 0, 0, 0, 0),
(16, 3, 0, -789.704, 2749.25, 45.855, 0, 0, 0, 0, 0),
(17, 3, 0, -789.704, 2755.72, 45.855, 0, 0, 0, 0, 0),
(18, 3, 0, -789.704, 2757.23, 45.855, 0, 0, 0, 0, 0),
(19, 3, 0, -789.704, 2763.76, 45.855, 0, 0, 0, 0, 0),
(20, 3, 0, -789.704, 2765.2, 45.855, 0, 0, 0, 0, 0),
(21, 4, 0, -789.704, 2765.25, 48.256, 0, 0, 0, 0, 0),
(22, 4, 0, -789.704, 2763.69, 48.256, 0, 0, 0, 0, 0),
(23, 4, 0, -789.704, 2757.19, 48.256, 0, 0, 0, 0, 0),
(24, 4, 0, -789.704, 2755.73, 48.256, 0, 0, 0, 0, 0),
(25, 4, 0, -789.704, 2749.19, 48.256, 0, 0, 0, 0, 0),
(26, 4, 0, -789.704, 2747.74, 48.256, 0, 0, 0, 0, 0),
(27, 4, 0, -776.659, 2765.4, 45.856, 0, 0, 0, 0, 0),
(28, 4, 0, -775.073, 2765.4, 45.856, 0, 0, 0, 0, 0),
(29, 4, 0, -768.707, 2765.4, 45.856, 0, 0, 0, 0, 0),
(30, 4, 0, -767.092, 2765.4, 45.856, 0, 0, 0, 0, 0),
(31, 4, 0, -760.624, 2765.4, 45.856, 0, 0, 0, 0, 0),
(32, 4, 0, -759.03, 2765.4, 45.856, 0, 0, 0, 0, 0),
(33, 4, 0, -759.162, 2765.4, 48.256, 0, 0, 0, 0, 0),
(34, 4, 0, -760.541, 2765.4, 48.256, 0, 0, 0, 0, 0),
(35, 5, 0, -789.479, 2747.72, 45.8546, 0, 0, 0, 0, 0),
(36, 5, 0, -789.704, 2749.26, 45.8546, 0, 0, 0, 0, 0),
(37, 5, 0, -789.704, 2755.72, 45.8546, 0, 0, 0, 0, 0),
(38, 5, 0, -789.704, 2757.23, 45.8546, 0, 0, 0, 0, 0),
(39, 5, 0, -2193.32, -2254.07, 30.703, 0, 0, 0, 0, 0),
(40, 5, 0, -2192, -2255.11, 30.696, 0, 0, 0, 0, 0),
(41, 5, 0, -2180.52, -2258.16, 33.32, 0, 0, 0, 0, 0),
(42, 5, 0, -2191.94, -2255.16, 33.32, 0, 0, 0, 0, 0),
(43, 5, 0, -2193.46, -2253.95, 33.32, 0, 0, 0, 0, 0),
(44, 5, 0, -2198.94, -2243.65, 33.32, 0, 0, 0, 0, 0),
(45, 5, 0, -1623.97, -2693.88, 48.743, 0, 0, 0, 0, 0),
(46, 5, 0, -1624.39, -2694.17, 48.539, 0, 0, 0, 0, 0),
(47, 5, 0, -815.683, -1894.39, 11.285, 0, 0, 0, 0, 0),
(48, 5, 0, -806.443, -1886.54, 11.685, 0, 0, 0, 0, 0),
(49, 5, 0, -798.149, -1879.56, 11.775, 0, 0, 0, 0, 0),
(50, 5, 0, -790.071, -1872.88, 11.725, 0, 0, 0, 0, 0),
(51, 5, 0, -760.624, 2765.4, 45.8556, 0, 0, 0, 0, 0),
(52, 5, 0, -759.03, 2765.4, 45.8556, 0, 0, 0, 0, 0),
(53, 5, 0, -759.162, 2765.4, 48.2556, 0, 0, 0, 0, 0),
(54, 5, 0, -760.541, 2765.4, 48.2556, 0, 0, 0, 0, 0),
(55, 5, 0, -767.161, 2765.4, 48.2556, 0, 0, 0, 0, 0),
(56, 5, 0, -768.571, 2765.4, 48.2556, 0, 0, 0, 0, 0),
(57, 5, 0, -775.233, 2765.4, 48.2556, 0, 0, 0, 0, 0),
(58, 5, 0, -776.705, 2765.4, 48.2556, 0, 0, 0, 0, 0),
(59, 6, 0, -2193.32, -2254.07, 30.7035, 0, 0, 0, 0, 0),
(60, 6, 0, -2191.94, -2255.16, 30.6953, 0, 0, 0, 0, 0),
(61, 6, 0, -2180.52, -2258.15, 33.3203, 0, 0, 0, 0, 0),
(62, 6, 0, -2191.94, -2255.16, 33.3203, 0, 0, 0, 0, 0),
(63, 6, 0, -2193.46, -2253.95, 33.3203, 0, 0, 0, 0, 0),
(64, 6, 0, -2198.94, -2243.65, 33.3203, 0, 0, 0, 0, 0),
(65, 7, 0, -1618.09, -2691.81, 48.7427, 0, 0, 0, 0, 0),
(66, 7, 0, -1620.2, -2690.39, 48.7427, 0, 0, 0, 0, 0),
(67, 8, 0, -815.683, -1894.39, 11.2847, 0, 0, 0, 0, 0),
(68, 8, 0, -806.443, -1886.54, 11.6847, 0, 0, 0, 0, 0),
(69, 8, 0, -798.149, -1879.56, 11.7747, 0, 0, 0, 0, 0),
(70, 8, 0, -790.071, -1872.88, 11.7247, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `namechanges`
--

CREATE TABLE `namechanges` (
  `id` int(11) NOT NULL,
  `SQLID` int(11) NOT NULL,
  `OldName` varchar(24) NOT NULL,
  `NewName` varchar(24) NOT NULL,
  `Reason` varchar(100) NOT NULL,
  `ChangeTime` int(12) NOT NULL,
  `Type` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `namechanges`
--

INSERT INTO `namechanges` (`id`, `SQLID`, `OldName`, `NewName`, `Reason`, `ChangeTime`, `Type`) VALUES
(1, 18, 'Wesley_Vianna', 'Enzo_Williams', 'Estou de vida nova, novos direitos e deveres.', 1535495110, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `gateway` varchar(30) NOT NULL,
  `produto` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `playerid` varchar(100) NOT NULL,
  `personagem` varchar(100) NOT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `entrega` varchar(30) NOT NULL,
  `dataentrega` text NOT NULL,
  `ip` varchar(130) NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `orders`
--

INSERT INTO `orders` (`id`, `gateway`, `produto`, `playerid`, `personagem`, `status`, `entrega`, `dataentrega`, `ip`, `date`) VALUES
(1, 'pagseguro', '1', '4', '10', '7', '0', '', '179.54.97.71', '2018-07-26 11:52:41'),
(2, 'pagseguro', '3', '4', '3', '0', '0', '', '179.54.97.71', '2018-07-26 12:06:42'),
(3, 'pagseguro', '1', '4', '3', '7', '0', '', '179.54.97.71', '2018-07-27 00:48:04'),
(4, 'pagseguro', '1', '4', '3', '0', '0', '', '179.54.97.71', '2018-07-27 00:51:53'),
(5, 'pagseguro', '1', '4', '3', '3', '1', '2018-07-27 10:00:55', '179.54.97.71', '2018-07-27 00:58:09'),
(6, 'pagseguro', '1', '4', '3', '3', '1', '2018-07-27 09:33:22', '179.54.97.71', '2018-07-27 11:21:19'),
(7, 'pagseguro', '3', '4', '', '7', '0', '', '179.54.97.71', '2018-07-27 14:08:49'),
(8, 'pagseguro', '3', '4', '', '7', '0', '', '179.54.97.71', '2018-07-27 14:10:44'),
(9, 'pagseguro', '1', '', '', '0', '0', '', '179.54.97.71', '2018-07-27 14:17:02'),
(10, 'pagseguro', '3', '4', '', '1', '0', '', '179.54.97.71', '2018-07-27 14:18:27'),
(11, 'pagseguro', '1', '4', '', '0', '0', '', '179.54.97.71', '2018-07-27 14:23:02'),
(12, 'pagseguro', '3', '4', '', '1', '0', '', '179.54.97.71', '2018-07-27 17:10:53'),
(13, 'pagseguro', '1', '4', '', '1', '0', '', '179.54.97.71', '2018-07-27 17:46:51'),
(14, 'pagseguro', '3', '4', '10', '1', '0', '', '179.54.97.71', '2018-07-27 18:28:41'),
(15, 'pagseguro', '3', '4', '10', '7', '0', '', '179.54.97.71', '2018-08-04 18:08:25'),
(16, 'pagseguro', '3', '1', '1', '7', '0', '', '164.163.207.101', '2018-08-16 13:48:40'),
(17, 'pagseguro', '3', '4', '3', '1', '0', '', '179.35.96.120', '2018-08-22 22:15:46'),
(18, 'pagseguro', '3', '4', '3', '0', '0', '', '179.35.96.120', '2018-08-22 22:24:18'),
(19, 'pagseguro', '4', '4', '3', '1', '0', '', '179.35.96.120', '2018-08-22 22:27:00'),
(20, 'pagseguro', '4', '4', '3', '0', '0', '', '179.35.96.120', '2018-08-22 23:38:17'),
(21, 'pagseguro', '4', '4', '3', '0', '0', '', '179.35.96.120', '2018-08-22 23:42:55'),
(22, 'pagseguro', '4', '4', '3', '6', '0', '', '179.35.96.120', '2018-08-22 23:45:19'),
(23, 'pagseguro', '4', '4', '3', '0', '0', '', '179.35.96.120', '2018-08-23 00:04:27'),
(24, 'pagseguro', '4', '4', '3', '0', '0', '', '179.35.96.120', '2018-08-23 00:06:24'),
(25, 'pagseguro', '4', '4', '3', '6', '1', '2018-08-23 00:09:18', '179.35.96.120', '2018-08-23 00:08:08'),
(26, 'pagseguro', '4', '4', '3', '7', '0', '', '179.35.96.120', '2018-08-23 00:25:31'),
(27, 'pagseguro', '4', '4', '3', '7', '0', '', '179.35.96.120', '2018-08-23 00:28:31'),
(28, 'pagseguro', '4', '1', '1', '7', '0', '', '164.163.207.13', '2018-08-23 00:29:35'),
(29, 'pagseguro', '4', '4', '3', '7', '0', '', '179.35.96.120', '2018-08-23 00:31:05'),
(30, 'pagseguro', '4', '4', '3', '7', '0', '', '179.35.96.120', '2018-08-23 00:35:27'),
(31, 'pagseguro', '4', '1', '1', '7', '0', '', '164.163.207.13', '2018-08-23 00:39:01'),
(32, 'pagseguro', '4', '4', '3', '6', '1', '2018-08-23 00:48:49', '179.35.96.120', '2018-08-23 00:47:26'),
(33, 'pagseguro', '4', '4', '3', '6', '1', '2018-08-23 00:55:55', '179.35.96.120', '2018-08-23 00:54:39'),
(34, 'pagseguro', '4', '1', '1', '7', '0', '', '164.163.207.45', '2018-08-27 13:13:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reminders`
--

CREATE TABLE `password_reminders` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `phonecontacts`
--

CREATE TABLE `phonecontacts` (
  `id` int(11) NOT NULL,
  `PhoneNumber` int(9) NOT NULL,
  `ContactNumber` int(9) NOT NULL,
  `ContactName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `phonecontacts`
--

INSERT INTO `phonecontacts` (`id`, `PhoneNumber`, `ContactNumber`, `ContactName`) VALUES
(2, 2651999, 7713412, 'Vincent '),
(3, 7713412, 2651999, 'Rowan Ballard');

-- --------------------------------------------------------

--
-- Estrutura para tabela `phones`
--

CREATE TABLE `phones` (
  `id` int(12) NOT NULL,
  `OwnerSQLID` int(12) NOT NULL,
  `PhonePossessor` int(12) NOT NULL,
  `PhoneNumber` int(7) NOT NULL,
  `PhonePower` int(12) NOT NULL,
  `Battery` int(12) NOT NULL,
  `PhoneCredit` int(12) NOT NULL,
  `ShowPhonebook` int(12) NOT NULL,
  `OwnerName` varchar(24) NOT NULL,
  `PhonePossession` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `phones`
--

INSERT INTO `phones` (`id`, `OwnerSQLID`, `PhonePossessor`, `PhoneNumber`, `PhonePower`, `Battery`, `PhoneCredit`, `ShowPhonebook`, `OwnerName`, `PhonePossession`) VALUES
(1, 11, 11, 4508007, 1, 82, 10, 0, 'Veronica_Alexandra', 1),
(2, 4, 4, 2651999, 1, 73, 41, 0, 'Rowan_Ballard', 1),
(3, 1, 1, 7713412, 1, 55, 348, 0, 'Vincent_Henderson', 1),
(4, 17, 17, 712754, 1, 100, 10, 0, 'Aidan_Lodge', 1),
(5, 16, 16, 2834530, 1, 99, 10, 0, 'Lennaert_Schuurman', 1),
(6, 2, 2, 4145983, 1, 79, 10, 1, 'Zac_Deutch', 1),
(7, 34, 34, 1428701, 1, 96, 10, 0, 'Robert_Harris', 1),
(8, 53, 53, 2669622, 1, 100, 10, 0, 'Joseph_Deere', 1),
(9, 62, 62, 7746953, 1, 100, 10, 0, 'Kim_Greene', 1),
(10, 40, 40, 2357908, 1, 100, 10, 0, 'Edward_Torres', 1),
(11, 43, 43, 765684, 1, 99, 10, 0, 'Gabriel_Schumacher', 1),
(12, 32, 32, 8853532, 1, 99, 10, 0, 'Kevin_Langley', 1),
(13, 33, 33, 2062856, 1, 100, 10, 0, 'Norman_Greensdale', 1),
(14, 25, 25, 7501703, 1, 100, 10, 0, 'Frank_Spanshaw', 1),
(15, 76, 76, 7825815, 1, 100, 10, 0, 'Justin_Goodman', 1),
(16, 50, 50, 8237705, 1, 98, 10, 0, 'Vincent_Wilhelm', 1),
(17, 44, 44, 8582640, 1, 100, 10, 0, 'Yvone_Ebersbach', 1),
(18, 63, 63, 1707915, 1, 99, 10, 0, 'Jerry_Catter', 1),
(19, 28, 28, 9067266, 1, 100, 10, 0, 'Richard_Moore', 1),
(20, 54, 54, 5717627, 1, 99, 10, 0, 'Anthony_Emanuel', 1),
(21, 55, 55, 6255970, 1, 99, 10, 0, 'Kendrick_Hickey', 1),
(22, 69, 69, 7540788, 1, 100, 10, 0, 'Franklin_Jonhson', 1),
(23, 42, 42, 6256962, 1, 94, 10, 0, 'Angus_Riche', 1),
(24, 48, 48, 6235391, 1, 100, 10, 0, 'Donald_White', 1),
(25, 27, 27, 6002179, 1, 100, 10, 0, 'Haziel_Fagundez', 1),
(26, 79, 79, 902636, 1, 100, 10, 0, 'Dmitri_Scalovisck', 1),
(27, 84, 84, 622324, 1, 98, 10, 0, 'Dante_Bellandi', 1),
(28, 36, 36, 2890037, 1, 100, 10, 0, 'Bruce_Crawford', 1),
(29, 31, 31, 8581894, 1, 100, 10, 1, 'Dylan_Velasquez', 1),
(30, 81, 81, 4632802, 1, 100, 10, 0, 'Kevin_Worley', 1),
(31, 88, 88, 1048991, 1, 100, 10, 0, 'Mathews_Cezatte', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pickups`
--

CREATE TABLE `pickups` (
  `id` int(12) NOT NULL,
  `posX` varchar(16) NOT NULL DEFAULT '0',
  `posY` varchar(16) NOT NULL DEFAULT '0',
  `posZ` varchar(16) NOT NULL DEFAULT '0',
  `Model` int(11) NOT NULL DEFAULT '0',
  `vWorld` int(11) NOT NULL DEFAULT '-1',
  `PickupText` longtext,
  `Type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `pickups`
--

INSERT INTO `pickups` (`id`, `posX`, `posY`, `posZ`, `Model`, `vWorld`, `PickupText`, `Type`) VALUES
(1, '-2482.2009', '2406.5698', '17.1094', 1239, 0, '~b~Igreja de Bayside~N~~W~Use /entrar', 1),
(2, '2256.6692', '-44.0031', '26.6834', 1239, 0, '~b~Igreja de Palomino Creek~N~~W~Use /entrar', 1),
(3, '1241.8046', '326.6990', '19.7548', 1239, 0, '~R~Montgomery Hospital~N~~W~Use /entrar', 1),
(4, '2302.9685', '-16.2898', '26.4844', 1239, 0, '~B~Banco de Palomino Creek~N~~W~Use /entrar', 1),
(5, '2249.1526', '32.7346', '26.4844', 1239, 0, '~B~Palomino Creek Reciclagem~N~~W~Use /entrar', 1),
(6, '627.0937', '-567.1129', '17.8515', 1239, 0, '~B~San Andreas County Sheriff\'s Office~N~~W~Use /entrar', 1),
(7, '1273.6328', '238.3892', '19.5547', 1239, 0, '~B~Montgomery Police Departament~N~~W~Use /entrar', 1),
(8, '-99.1759', '1083.6353', '19.7422', 1239, 0, '~B~HI K69~N~~W~Use /entrar', 1),
(9, '-82.5712', '1117.8280', '19.7422', 1239, 0, '~B~Repair Garagem~N~~W~/reparar~N~~W~/pegarveiculo~N~~W~/mod', 1),
(10, '1104.2457', '1051.6860', '-19.9389', 1239, 303, '~B~Ajuda banco~N~~W~/banco /depositarcheque /comprartaloes(25$)~N~~b~Faction Bank~N~~W~/fsaldo /fdepositar /fsacar', 1),
(13, '1311.2433', '329.3798', '19.9140', 1239, 0, '~g~Banco de Montgomery~N~~W~Use /entrar', 1),
(14, '-750.8323', '-420.3136', '1440.1000', 1239, 11, '~B~Mensagem aqui~N~~W~/equipar', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `Name` varchar(24) CHARACTER SET latin1 NOT NULL,
  `Password` varchar(150) CHARACTER SET latin1 NOT NULL,
  `Username` varchar(24) CHARACTER SET latin1 DEFAULT NULL,
  `IP` varchar(16) CHARACTER SET latin1 NOT NULL,
  `RecentIP` varchar(16) CHARACTER SET latin1 NOT NULL,
  `RecentSerial` varchar(128) NOT NULL,
  `Host` varchar(128) CHARACTER SET latin1 NOT NULL,
  `AccountDisabled` int(4) NOT NULL DEFAULT '0',
  `Comment` text CHARACTER SET latin1 NOT NULL,
  `RegisterDate` varchar(100) NOT NULL,
  `FilledForm` int(11) NOT NULL,
  `Created` int(4) DEFAULT '0',
  `LastLogin` int(11) NOT NULL,
  `Online` int(4) NOT NULL,
  `BirthDate` varchar(100) NOT NULL,
  `BirthMonth` int(5) NOT NULL,
  `BirthYear` int(5) NOT NULL,
  `Cash` int(11) NOT NULL DEFAULT '10000',
  `Bank` int(11) NOT NULL DEFAULT '5000',
  `totalEco` int(11) NOT NULL,
  `Skin` int(11) NOT NULL DEFAULT '1',
  `PlayerLevel` int(11) NOT NULL DEFAULT '1',
  `PlayerXP` int(11) NOT NULL,
  `NoobSpawnID` int(11) NOT NULL,
  `MySpawnID` int(11) NOT NULL DEFAULT '1',
  `SpawnAtHouse` int(12) NOT NULL DEFAULT '0',
  `BizzSpawn` int(12) NOT NULL DEFAULT '0',
  `DrugLevel` int(11) NOT NULL DEFAULT '0',
  `GuestHouseID` int(12) NOT NULL,
  `GuestFurnish` int(11) NOT NULL DEFAULT '-1',
  `Faction` int(11) NOT NULL,
  `FactionRank` int(11) NOT NULL,
  `FactionCustomRank` varchar(16) CHARACTER SET latin1 NOT NULL,
  `Job` int(5) NOT NULL,
  `JobSpamTime` int(5) NOT NULL,
  `TotalTimePlayed` int(11) NOT NULL,
  `ConnectedTime` int(11) NOT NULL,
  `SweepStat` int(11) NOT NULL,
  `SweepLevel` int(11) NOT NULL DEFAULT '1',
  `SweepSpamTime` int(11) NOT NULL,
  `TruckingStat` int(11) NOT NULL,
  `TruckingLevel` int(11) NOT NULL DEFAULT '1',
  `TruckingSpamTime` int(11) NOT NULL,
  `DeliverStat` int(11) NOT NULL,
  `DeliverLevel` int(11) NOT NULL DEFAULT '1',
  `DeliverSpamTime` int(11) NOT NULL,
  `FishingPermit` int(11) NOT NULL,
  `FishingRod` int(11) NOT NULL,
  `FishingRodHealth` int(11) NOT NULL DEFAULT '100',
  `FishingBait` int(11) NOT NULL,
  `BiggestFish` int(11) NOT NULL,
  `Fish1Weight` int(11) NOT NULL DEFAULT '-1',
  `Fish1Name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `Fish2Weight` int(11) NOT NULL DEFAULT '-1',
  `Fish2Name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `Fish3Weight` int(11) NOT NULL DEFAULT '-1',
  `Fish3Name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `Fish4Weight` int(11) NOT NULL DEFAULT '-1',
  `Fish4Name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `Fish5Weight` int(11) NOT NULL DEFAULT '-1',
  `Fish5Name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `HasPhonebook` int(11) NOT NULL,
  `HasLogs` int(11) NOT NULL DEFAULT '0',
  `HasDice` int(11) NOT NULL,
  `HasBlindfold` int(12) NOT NULL,
  `WeaponSkill` int(11) NOT NULL DEFAULT '1',
  `LicenseBike` int(11) NOT NULL,
  `LicenseBoat` int(11) NOT NULL,
  `LicenseHelicopter` int(11) NOT NULL,
  `LicensePlane` int(11) NOT NULL,
  `LicenseLargeVehicle` int(11) NOT NULL,
  `LicenseCar` int(11) NOT NULL,
  `LicenseEVOC` int(1) NOT NULL,
  `LicenseTVOC` int(1) NOT NULL,
  `HasRadio` int(3) NOT NULL,
  `RadioFrequency` int(7) NOT NULL,
  `RadioSlot1` int(12) NOT NULL DEFAULT '1000',
  `RadioSlot2` int(12) NOT NULL DEFAULT '1000',
  `RadioSlot3` int(12) NOT NULL DEFAULT '1000',
  `RadioSlotInUse` int(12) NOT NULL DEFAULT '1',
  `HasMask` int(3) NOT NULL,
  `HasFuelCan` int(3) NOT NULL,
  `HasFuelCanType` int(11) NOT NULL,
  `HasWatch` int(3) NOT NULL,
  `CompletedTutorial` int(5) NOT NULL,
  `HasFags` int(5) NOT NULL,
  `HasLighter` int(5) NOT NULL,
  `HasCrisps` int(5) NOT NULL,
  `JailTime` int(11) NOT NULL,
  `HasGPS` int(5) NOT NULL,
  `SavedWaypointX` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `SavedWaypointY` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `SavedWaypointZ` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `Weed` int(5) NOT NULL,
  `MoonShine` int(5) NOT NULL,
  `Cocaine` int(5) NOT NULL,
  `FightStyle` int(5) NOT NULL,
  `AmmoBoxPistol` int(5) NOT NULL,
  `AmmoBoxShotgun` int(5) NOT NULL,
  `AmmoBoxSMG` int(5) NOT NULL,
  `AmmoBoxRifle` int(5) NOT NULL,
  `AmmoBoxAssaultR` int(5) NOT NULL,
  `AmmoBoxRocket` int(5) NOT NULL,
  `Armour` int(5) NOT NULL,
  `RestrictedVest` tinyint(1) NOT NULL DEFAULT '0',
  `IsDonator` int(3) NOT NULL,
  `DonationCash` int(11) NOT NULL,
  `DonationWLevel` int(11) NOT NULL,
  `DonationPLevel` int(11) NOT NULL,
  `DonationDLevel` int(11) NOT NULL,
  `DonationCarModel` int(11) NOT NULL,
  `DonationChannel` int(11) NOT NULL DEFAULT '0',
  `AdminJailTime` int(11) NOT NULL,
  `SkinSet1` int(5) NOT NULL,
  `SkinSet2` int(5) NOT NULL,
  `SkinSet3` int(5) NOT NULL,
  `SkinSet4` int(5) NOT NULL,
  `SkinSet5` int(5) NOT NULL,
  `HasRope` int(5) NOT NULL,
  `Kills` int(11) NOT NULL,
  `Deaths` int(11) NOT NULL,
  `SubFactionSpawn` int(11) NOT NULL,
  `CoalmineStat` int(11) NOT NULL,
  `CoalmineSpamTime` int(11) NOT NULL,
  `CoalmineLevel` int(11) NOT NULL DEFAULT '1',
  `TrashStat` int(11) NOT NULL,
  `TrashSpamTime` int(11) NOT NULL,
  `TrashLevel` int(11) NOT NULL DEFAULT '1',
  `HasNotepad` int(3) NOT NULL,
  `Notepad1` varchar(80) CHARACTER SET latin1 NOT NULL,
  `Notepad2` varchar(80) CHARACTER SET latin1 NOT NULL,
  `Notepad3` varchar(80) CHARACTER SET latin1 NOT NULL,
  `Notepad4` varchar(80) CHARACTER SET latin1 NOT NULL,
  `Notepad5` varchar(80) CHARACTER SET latin1 NOT NULL,
  `TutorialIndex` int(11) NOT NULL,
  `LogToAvoidDeath` int(4) NOT NULL DEFAULT '0',
  `Refunds` int(11) NOT NULL,
  `SpeedoFormat` int(4) NOT NULL,
  `Accent` varchar(20) CHARACTER SET latin1 NOT NULL,
  `RadioPower` int(4) NOT NULL DEFAULT '0',
  `HasPen` int(4) NOT NULL,
  `HasPaper` int(4) NOT NULL,
  `HasCarAdapter` int(11) NOT NULL,
  `LooksLike` varchar(128) CHARACTER SET latin1 NOT NULL,
  `BorrowKey` int(11) NOT NULL DEFAULT '0',
  `BorrowKeyTime` int(11) NOT NULL,
  `Muted` int(11) NOT NULL,
  `DOOCMuted` int(11) NOT NULL DEFAULT '0',
  `NoobMuted` int(11) NOT NULL,
  `Litters` int(11) NOT NULL,
  `WeaponLicense` int(4) NOT NULL,
  `Achievements` varchar(500) CHARACTER SET latin1 NOT NULL,
  `ShoutAnimToggle` int(4) NOT NULL,
  `TalkAnimToggle` int(12) NOT NULL,
  `Checks` int(11) NOT NULL,
  `Check1` int(11) NOT NULL,
  `Check2` int(11) NOT NULL,
  `Check3` int(11) NOT NULL,
  `RollingPaper` int(5) NOT NULL,
  `Bong` int(5) NOT NULL,
  `Morphine` int(5) NOT NULL,
  `HasBriefcase` int(11) NOT NULL,
  `BriefcaseWeapon` int(11) NOT NULL,
  `BriefcaseWeaponAmmo` int(11) NOT NULL,
  `BriefcaseCash` int(11) NOT NULL,
  `BriefcaseCode` int(11) NOT NULL,
  `BriefcaseLocked` int(11) NOT NULL,
  `BriefcaseCocaine` int(11) NOT NULL,
  `BriefcaseWeed` int(11) NOT NULL,
  `HasCalculator` int(3) NOT NULL,
  `HasMedKit` int(3) NOT NULL,
  `LicenseSuspendTime_Car` int(11) NOT NULL,
  `LicenseSuspendTime_LargeVehicle` int(11) NOT NULL,
  `LicenseSuspendTime_Bike` int(11) NOT NULL,
  `LicenseSuspendTime_Boat` int(11) NOT NULL,
  `LicenseSuspendTime_Helicopter` int(11) NOT NULL,
  `LicenseSuspendTime_Plane` int(11) NOT NULL,
  `HasToolbox` int(11) NOT NULL,
  `HasEngineOil` int(11) NOT NULL,
  `PoliceFine` int(11) NOT NULL,
  `PoliceFineSQLID` int(11) NOT NULL,
  `DeleteRef` varchar(60) CHARACTER SET latin1 NOT NULL,
  `FareRate` int(3) NOT NULL DEFAULT '4',
  `GPSMount` int(5) NOT NULL,
  `RefundXP` int(11) NOT NULL,
  `LastLogout` int(11) NOT NULL,
  `HasWeedSeed` int(11) NOT NULL,
  `PrisonTime` int(11) NOT NULL,
  `IsolationTime` int(12) NOT NULL DEFAULT '0',
  `PrisonCell` int(11) NOT NULL,
  `HasWater` int(11) NOT NULL,
  `PingKickExemption` int(1) NOT NULL,
  `Boombox` int(1) NOT NULL DEFAULT '0',
  `BoomBanned` int(1) NOT NULL DEFAULT '0',
  `Health` float NOT NULL DEFAULT '100',
  `RelogSpawnX` float NOT NULL,
  `RelogSpawnY` float NOT NULL,
  `RelogSpawnZ` float NOT NULL,
  `SpawnSaved` int(11) NOT NULL,
  `RelogSpawnINT` int(11) NOT NULL,
  `RelogSpawnVW` int(11) NOT NULL,
  `offlineBan` int(11) NOT NULL,
  `Story` text CHARACTER SET latin1 NOT NULL,
  `delete` int(11) NOT NULL,
  `deleteId` int(11) NOT NULL,
  `privacy` int(11) NOT NULL DEFAULT '1',
  `allow_comments` int(11) NOT NULL DEFAULT '1',
  `amountDonated` int(11) NOT NULL,
  `allow_skin` int(11) NOT NULL DEFAULT '1',
  `FightStyleLearnedKungFu` tinyint(1) NOT NULL,
  `FightStyleLearnedBoxing` tinyint(1) NOT NULL,
  `registrado` int(11) NOT NULL,
  `EMail` int(11) NOT NULL,
  `Origin` varchar(24) NOT NULL,
  `Gender` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `corrigir_appnegada` text NOT NULL,
  `avaliada_por` varchar(32) NOT NULL,
  `Admin` int(11) NOT NULL,
  `pHealthMax` float NOT NULL,
  `pNomeOOC` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `players`
--

INSERT INTO `players` (`id`, `Name`, `Password`, `Username`, `IP`, `RecentIP`, `RecentSerial`, `Host`, `AccountDisabled`, `Comment`, `RegisterDate`, `FilledForm`, `Created`, `LastLogin`, `Online`, `BirthDate`, `BirthMonth`, `BirthYear`, `Cash`, `Bank`, `totalEco`, `Skin`, `PlayerLevel`, `PlayerXP`, `NoobSpawnID`, `MySpawnID`, `SpawnAtHouse`, `BizzSpawn`, `DrugLevel`, `GuestHouseID`, `GuestFurnish`, `Faction`, `FactionRank`, `FactionCustomRank`, `Job`, `JobSpamTime`, `TotalTimePlayed`, `ConnectedTime`, `SweepStat`, `SweepLevel`, `SweepSpamTime`, `TruckingStat`, `TruckingLevel`, `TruckingSpamTime`, `DeliverStat`, `DeliverLevel`, `DeliverSpamTime`, `FishingPermit`, `FishingRod`, `FishingRodHealth`, `FishingBait`, `BiggestFish`, `Fish1Weight`, `Fish1Name`, `Fish2Weight`, `Fish2Name`, `Fish3Weight`, `Fish3Name`, `Fish4Weight`, `Fish4Name`, `Fish5Weight`, `Fish5Name`, `HasPhonebook`, `HasLogs`, `HasDice`, `HasBlindfold`, `WeaponSkill`, `LicenseBike`, `LicenseBoat`, `LicenseHelicopter`, `LicensePlane`, `LicenseLargeVehicle`, `LicenseCar`, `LicenseEVOC`, `LicenseTVOC`, `HasRadio`, `RadioFrequency`, `RadioSlot1`, `RadioSlot2`, `RadioSlot3`, `RadioSlotInUse`, `HasMask`, `HasFuelCan`, `HasFuelCanType`, `HasWatch`, `CompletedTutorial`, `HasFags`, `HasLighter`, `HasCrisps`, `JailTime`, `HasGPS`, `SavedWaypointX`, `SavedWaypointY`, `SavedWaypointZ`, `Weed`, `MoonShine`, `Cocaine`, `FightStyle`, `AmmoBoxPistol`, `AmmoBoxShotgun`, `AmmoBoxSMG`, `AmmoBoxRifle`, `AmmoBoxAssaultR`, `AmmoBoxRocket`, `Armour`, `RestrictedVest`, `IsDonator`, `DonationCash`, `DonationWLevel`, `DonationPLevel`, `DonationDLevel`, `DonationCarModel`, `DonationChannel`, `AdminJailTime`, `SkinSet1`, `SkinSet2`, `SkinSet3`, `SkinSet4`, `SkinSet5`, `HasRope`, `Kills`, `Deaths`, `SubFactionSpawn`, `CoalmineStat`, `CoalmineSpamTime`, `CoalmineLevel`, `TrashStat`, `TrashSpamTime`, `TrashLevel`, `HasNotepad`, `Notepad1`, `Notepad2`, `Notepad3`, `Notepad4`, `Notepad5`, `TutorialIndex`, `LogToAvoidDeath`, `Refunds`, `SpeedoFormat`, `Accent`, `RadioPower`, `HasPen`, `HasPaper`, `HasCarAdapter`, `LooksLike`, `BorrowKey`, `BorrowKeyTime`, `Muted`, `DOOCMuted`, `NoobMuted`, `Litters`, `WeaponLicense`, `Achievements`, `ShoutAnimToggle`, `TalkAnimToggle`, `Checks`, `Check1`, `Check2`, `Check3`, `RollingPaper`, `Bong`, `Morphine`, `HasBriefcase`, `BriefcaseWeapon`, `BriefcaseWeaponAmmo`, `BriefcaseCash`, `BriefcaseCode`, `BriefcaseLocked`, `BriefcaseCocaine`, `BriefcaseWeed`, `HasCalculator`, `HasMedKit`, `LicenseSuspendTime_Car`, `LicenseSuspendTime_LargeVehicle`, `LicenseSuspendTime_Bike`, `LicenseSuspendTime_Boat`, `LicenseSuspendTime_Helicopter`, `LicenseSuspendTime_Plane`, `HasToolbox`, `HasEngineOil`, `PoliceFine`, `PoliceFineSQLID`, `DeleteRef`, `FareRate`, `GPSMount`, `RefundXP`, `LastLogout`, `HasWeedSeed`, `PrisonTime`, `IsolationTime`, `PrisonCell`, `HasWater`, `PingKickExemption`, `Boombox`, `BoomBanned`, `Health`, `RelogSpawnX`, `RelogSpawnY`, `RelogSpawnZ`, `SpawnSaved`, `RelogSpawnINT`, `RelogSpawnVW`, `offlineBan`, `Story`, `delete`, `deleteId`, `privacy`, `allow_comments`, `amountDonated`, `allow_skin`, `FightStyleLearnedKungFu`, `FightStyleLearnedBoxing`, `registrado`, `EMail`, `Origin`, `Gender`, `Age`, `corrigir_appnegada`, `avaliada_por`, `Admin`, `pHealthMax`, `pNomeOOC`) VALUES
(1, 'Vincent_Henderson', '', 'Revolts', '', '127.0.0.1', '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F', '', 0, '', '', 0, 1, 1536940332, 0, '22', 2, 1999, 200, 500, 0, 20001, 2, 0, 3, 1, 0, 0, 0, 0, -1, 13, 1, '', 3, 0, 3140, 540, 0, 1, 0, 0, 1, 0, 2, 1, 0, 1, 1, 99, 24, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 9111, 9111, 1000, 1000, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 299, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 250010, 20001, 20054, 20055, 20058, 0, 7, 44, 1, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 1, 98, 8, 1, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,1,1,1,1,0,1,1,1,1,1,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, '', 4, 0, 0, 1536943510, 0, 0, 0, 0, 0, 0, 2, 0, 100, -401.533, 2227.54, 1801.09, 1, 0, 0, 0, '', 0, 0, 1, 1, 4, 1, 0, 0, 0, 0, 'Red County', 1, 0, '', '', 0, 0, ''),
(2, 'Zac_Deutch', '', 'kauanaqui', '', '', '8E44CF4FA95DE594CD009CAA9944EFAF804E4A5C', '', 0, '', '', 0, 1, 1535656511, 0, '16', 4, 1985, 500, 500, 0, 20019, 2, 8, 0, 1, 0, 0, 0, 0, -1, 10, 1, '', 4, 0, 613, 48, 2, 1, 0, 1, 1, 0, 1, 1, 11, 1, 1, 85, 35, 32, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1000, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 1, 0, 1, 1, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,1,0,1,1,0,0,1,1,1,1,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, '', 4, 0, 0, 1535659594, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1256.54, 274.938, 19.555, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Red County', 1, 0, '', '', 0, 0, ''),
(3, 'Martin_Fernoso', '', 'rafanel2', '', '', '', '', 0, '', '', 0, 1, 0, 0, '0000-00-00', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'FDSEDS', 1, 0, '', '', 0, 0, ''),
(4, 'Rowan_Ballard', '', 'well', '', '186.225.187.250', '8EAEDE5CEA48DE09AFE90EAC99E44C8DC889ECC0', '', 0, '', '', 0, 1, 1535762381, 0, '26', 6, 1987, 500, 500, 0, 20004, 3, 13, 0, 1, 0, 0, 0, 0, 101, 0, 0, '', 4, 0, 1841, 183, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1000, 1000, 1000, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20001, 0, 0, 0, 0, 0, 6, 0, 1, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 1, 0, 0, 1, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,1,1,0,0,0,1,1,1,1,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 360, 0, '', 4, 0, 0, 1535764555, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1638.72, 323.011, 1086.68, 1, 100, 40012, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Arizona', 1, 0, '', '', 0, 0, ''),
(13, 'Scottler_Johnson', '', 'JohnBlack', '', '187.101.184.122', 'DF4D99DEC5D5D9CFF8D4ED9E054F59A8E8D9E8C9', '', 0, '', '', 0, 1, 1535608452, 0, '22', 2, 1999, 500, 500, 0, 20056, 1, 0, 4, 1, 0, 0, 0, 0, 101, 0, 0, '', 0, 0, 673, 673, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1000, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20056, 0, 10, 8, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 1, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,1,1,1,0,0,0,1,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535608510, 0, 0, 0, 0, 0, 0, 0, 0, 15, 50, 50, 4.187, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Red County', 1, 0, '', '', 0, 0, ''),
(16, 'Lennaert_Schuurman', '', 'Nick', '', '179.106.74.124', 'AED9F04AE8E9E894A488D8D9CDAE0DD0F9498D45', '', 0, '', '', 1, 1, 1535755854, 0, '1', 5, 1990, 500, 500, 0, 20007, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 124, 124, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1000, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20011, 20007, 20008, 20007, 20055, 0, 1, 4, 0, 0, 0, 1, 0, 0, 1, 1, '', '', '', '', '', 0, 0, 0, 0, '', 1, 100, 0, 1, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,1,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535757122, 0, 0, 0, 0, 6, 0, 1, 0, 100, -28.313, -89.957, 1003.55, 1, 18, 40018, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Houston, USA', 1, 0, '', '', 0, 0, ''),
(17, 'Aidan_Lodge', '', 'Diogooog', '', '186.192.235.173', '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE', '', 0, '', '', 1, 1, 1534594663, 0, '25', 10, 1980, 500, 500, 0, 1, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 34, 34, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20054, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 1, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1534595236, 0, 0, 0, 0, 0, 0, 0, 0, 100, -1036.82, 823.825, -0.647, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Chicago', 1, 0, '', '', 0, 0, ''),
(18, 'Enzo_Williams', '', 'Tutin', '', '186.225.187.134', 'F8CF9F4E9DECC554C89CDD05E4FA9C4D48FD08C5', '', 0, '', '', 1, 1, 1535759802, 0, '21', 3, 1999, 500, 500, 0, 20017, 1, 3, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 272, 154, 0, 1, 0, 0, 1, 0, 2, 1, 25, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 176, 168, 176, 0, 0, 0, 0, 3, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,1,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535757082, 0, 0, 0, 0, 0, 0, 0, 0, 100, 644.545, -544.701, 16.187, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(19, 'Asamoah_Gibson', '', 'Vitor', '', '201.93.223.167', 'CCF8F594AE48505A4E4C0DC90EFE8CCD8CE44400', '', 0, '', '', 1, 1, 1534645129, 0, '9', 3, 1995, 500, 500, 0, 20052, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 8, 8, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20052, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1534645868, 0, 0, 0, 0, 0, 0, 0, 0, 100, -794.798, -415.509, 1606.78, 1, 7, 4, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(20, 'Caio_Bjergsen', '', 'caionpcpk', '', '177.72.15.162', 'CC4CC84449E5D5ECC5D8FAF8C9E5CC8C9D8DCF04', '', 0, '', '', 1, 1, 1535757887, 0, '1', 10, 1999, 500, 500, 0, 1, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 3, 3, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535758225, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1330.68, 272.47, 18.864, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'San Fierro', 1, 0, '', '', 0, 0, ''),
(21, 'Maycon_Hommyerd', '', 'XistO', '', '177.55.214.35', 'E0F9DCA40D45EEDCEAF99A9094D4CAC48C985CE9', '', 0, '', '', 1, 1, 1535074122, 0, '2', 2, 1990, 500, 500, 0, 20024, 1, 0, 3, 1, 0, 0, 0, 0, -1, 10, 1, '', 0, 0, 19, 19, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20024, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535076968, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1252.56, 120.184, 20.235, 1, 0, 100, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'United States', 1, 0, '', '', 0, 0, ''),
(22, 'Morgan_Eisenhower', '', 'Maxuelj', '', '191.181.74.7', '8D4C58ECD9FC9DD8CA09D8D9999F4999FA8CD88F', '', 0, '', '', 1, 1, 1535769164, 0, '5', 10, 1990, 500, 500, 0, 20049, 1, 0, 3, 1, 0, 0, 0, 0, -1, 1, 15, '', 0, 0, 185, 185, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 9111, 9111, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20049, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 1, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535771150, 0, 0, 0, 0, 0, 0, 0, 0, 100, -803.195, -400.465, 1402, 1, 5, 2, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Grove City, Ohio, EUA', 1, 0, '', '', 0, 0, ''),
(23, 'Richard_Schmidt', '', 'MkT', '', '177.159.77.167', 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE', '', 0, '', '', 1, 1, 1535757787, 0, '18', 9, 1981, 500, 500, 0, 124, 1, 0, 3, 1, 0, 0, 0, 0, -1, 1, 12, '', 0, 0, 42, 42, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535758406, 0, 0, 0, 0, 0, 0, 0, 0, 100, 323.168, 304.802, 999.148, 1, 5, 100, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Red County', 1, 0, '', '', 0, 0, ''),
(25, 'Frank_Spanshaw', '', 'only1', '', '177.130.7.159', '4C88A8E48E49AF9DFE59ED99C098CEE5049FEEEC', '', 0, '', '', 1, 1, 1535759273, 0, '13', 12, 1994, 500, 500, 0, 124, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 84, 84, 0, 1, 0, 0, 1, 0, 1, 1, 15, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535757802, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1159.59, -277.679, 61.394, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Dillimore', 1, 0, '', '', 0, 0, ''),
(26, 'Jair_Castellari', '', 'Kaster', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Bayside', 1, 0, '', '', 0, 0, ''),
(27, 'Haziel_Fagundez', '', 'Oliveira', '', '189.24.172.2', '80EFD585C5EED548F4DC448CDF8A5C95899044C0', '', 0, '', '', 1, 1, 1535757353, 0, '25', 2, 1995, 500, 500, 0, 97, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 40, 40, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535759878, 0, 0, 0, 0, 0, 0, 0, 0, 100, -187.258, 281.984, 12.172, 1, 0, 105, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palomino Creek', 1, 0, '', '', 0, 0, ''),
(28, 'Richard_Moore', '', 'PedroWinchester', '', '189.48.204.7', 'ECC940AFC09485ED9D8DCF8845C8E8E894DD995E', '', 0, '', '', 1, 1, 1535754115, 0, '24', 2, 1997, 500, 500, 0, 20047, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 44, 44, 0, 1, 0, 0, 1, 0, 1, 1, 50, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 1, 0, 0, 1, 0, 0, 100, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20002, 20047, 20008, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, '', '', '', '', '', 0, 0, 0, 0, '', 0, 100, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756932, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1251.02, 134.651, 19.97, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Red County', 1, 0, '', '', 0, 0, ''),
(29, 'Brad_McGraff', '', 'Meira', '', '181.221.198.224', 'D8484D498E9CE4CDD444ECF08C09F49408C08A8A', '', 0, '', '', 1, 1, 1535759253, 0, '24', 1, 1963, 500, 500, 0, 113, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 10, 10, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535759920, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1251.02, 134.651, 19.97, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Las Venturas - San Andre', 1, 0, '', '', 0, 0, ''),
(30, 'Harold_Parker', '', 'Xav', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 158, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'San Andreas', 1, 0, '', '', 0, 0, ''),
(31, 'Dylan_Velasquez', '', 'brandaoth', '', '177.42.244.45', 'C9FFD5F84995E88AE85F8C4898DEF8CEFCDDC40', '', 0, '', '', 1, 1, 1535762105, 0, '5', 5, 1996, 500, 500, 0, 20047, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 38, 38, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20047, 20038, 20044, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535764611, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1263.19, 173.712, 19.555, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'El Quebrados', 1, 0, '', '', 0, 0, ''),
(32, 'Kevin_Langley', '', 'yozzy5', '', '200.229.230.246', 'CDF4AF44D8A4998ED9E084CCE4DE4CCFE595F45D', '', 0, '', '', 1, 1, 1535755818, 0, '29', 5, 1990, 500, 500, 0, 128, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 31, 31, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 10, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756606, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1190.14, 70.925, 30.928, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palomino Creek', 1, 0, '', '', 0, 0, ''),
(33, 'Norman_Greensdale', '', 'RicoDuhAK', '', '45.65.212.25', 'CDC508C5945C80E8C8DCEFF59D8C09F88E8809AA', '', 0, '', '', 1, 1, 1535756741, 0, '8', 2, 2002, 500, 500, 0, 7, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 37, 37, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756885, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1949.8, 45.332, 33.223, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(34, 'Robert_Harris', '', 'CarlosDasTeam', '', '177.37.236.119', '5DC90CCDC54D980A9E48AA4484E959E8CF5FE4F8', '', 0, '', '', 1, 1, 1535759160, 0, '30', 7, 1970, 500, 500, 0, 72, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 96, 96, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 39, 99, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535759106, 0, 0, 0, 0, 0, 0, 0, 0, 100, 2340.51, -57.024, 26.435, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Texas ', 1, 0, '', '', 0, 0, ''),
(35, 'Calvin_Shoreside', '', 'shotkillas', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 124, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Montgomery - Red County', 1, 0, '', '', 0, 0, ''),
(36, 'Bruce_Crawford', '', 'shisa', '', '200.199.167.249', '4C5DC0C4C4DD4DFCA8E95CDCA4D0C9D584F8DFD9', '', 0, '', '', 1, 1, 1535762724, 0, '26', 4, 1995, 500, 500, 0, 60, 1, 3, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 94, 1, 0, 1, 0, 0, 1, 0, 0, 1, 56, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535764676, 0, 0, 0, 0, 0, 0, 0, 0, 100, 2260.56, -61.313, 1004.65, 1, 109, 8, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Blueberry, San Andreas', 1, 0, '', '', 0, 0, ''),
(37, 'Phillipe_Bergman', '', 'Thompson', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Angel Pine - San Andreas', 1, 0, '', '', 0, 0, ''),
(38, 'Emily_Lawrence', '', 'YurS', '', '187.94.211.17', 'CDC4C4D9948C40504ACEF944CCCEC9EA0F440F8C', '', 0, '', '', 1, 1, 1535754566, 0, '24', 7, 1994, 500, 500, 0, 93, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535754616, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Dillimore', 1, 0, '', '', 0, 0, ''),
(39, 'Joshua_Sanders', '', 'Chockyto', '', '170.79.77.173', 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE', '', 0, '', '', 1, 1, 1535756130, 0, '11', 3, 1994, 500, 500, 0, 60, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 47, 47, 0, 1, 0, 0, 1, 0, 0, 1, 41, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535757213, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1249.87, 158.016, 19.517, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'San Andreas', 1, 0, '', '', 0, 0, ''),
(40, 'Edward_Torres', '', 'Eduh', '', '201.4.56.226', '8089E859ECEE98ED4CF8E599A8AA8DC4CD958808', '', 0, '', '', 1, 1, 1535760627, 0, '16', 1, 1990, 500, 500, 0, 1, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 113, 113, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 100, 5, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535761119, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1305.31, 310.355, 19.555, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palomino Creek, SA.', 1, 0, '', '', 0, 0, ''),
(41, 'Richard_Parker', '', 'Kchorro', '', '189.40.84.20', '9A84AAEE8EF998D95F8AA9ACA494EF8C5F9DDEF9', '', 0, '', '', 1, 1, 1535754253, 0, '11', 9, 1989, 500, 500, 0, 1, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 54, 54, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 20, 100, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, '', '', '', '', '', 0, 0, 0, 0, '', 0, 100, 10, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535757384, 0, 0, 0, 0, 6, 0, 0, 0, 100, 1339.16, 312.54, 19.761, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'EUA.', 1, 0, '', '', 0, 0, ''),
(42, 'Angus_Riche', '', 'Molotov', '', '170.231.181.156', 'AC04A9EC0C58E05084CEFC9F40C49CA49D8CACCA', '', 0, '', '', 1, 1, 1535764795, 0, '14', 4, 1993, 500, 500, 0, 270, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 147, 147, 1, 1, 50, 1, 1, 44, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 293, 270, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535764727, 0, 0, 0, 0, 0, 0, 0, 0, 94, -179.208, 1209.08, 20.893, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Dillimore, Red County', 1, 0, '', '', 0, 0, ''),
(43, 'Gabriel_Schumacher', '', 'RenanTranks', '', '191.5.230.6', 'CFD9ED8FCFDC44094C0994DDE5CEE8E9F490A984', '', 0, '', '', 1, 1, 1535758908, 0, '2', 2, 1994, 500, 500, 0, 20150, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 63, 63, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535759321, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1501.66, -11.779, 24.015, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palomino Creek', 1, 0, '', '', 0, 0, ''),
(44, 'Yvone_Ebersbach', '', 'Rising', '', '191.35.150.93', '49EF08C8998DC5E4A9EFEEDCD8F4C094DD8D09DC', '', 0, '', '', 1, 1, 1535755506, 0, '15', 7, 1992, 500, 500, 0, 93, 1, 0, 3, 1, 0, 0, 0, 0, -1, 1, 7, '', 0, 0, 79, 79, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535755503, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1257.58, 193.908, 19.555, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Montgomery ', 1, 0, '', '', 0, 0, ''),
(45, 'Zachary_McKinney', '', 'StanNeT', '', '177.188.140.184', 'D8E00DDEDAECD48C5E95FE49C5558948CDDDED8C', '', 0, '', '', 1, 1, 1535757635, 0, '12', 11, 1999, 500, 500, 0, 240, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 23, 23, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535758674, 0, 0, 0, 0, 0, 0, 0, 0, 100, 222.442, -363.698, 6.207, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Bone County', 1, 0, '', '', 0, 0, ''),
(46, 'Ryan_Limonccelo', '', 'Pulaski', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Texas', 1, 0, '', '', 0, 0, ''),
(47, 'Dylan_Bush', '', 'Gunner', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 119, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Estados Unidos, San Andr', 1, 0, '', '', 0, 0, ''),
(48, 'Donald_White', '', 'luk', '', '179.180.217.36', 'C84EC9449DE89F4ECCF5CC98458EE5AAD8449DFD', '', 0, '', '', 1, 1, 1535755587, 0, '17', 4, 1990, 500, 500, 0, 120, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 29, 29, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535757625, 0, 0, 0, 0, 0, 0, 0, 0, 88.947, 77.281, -261.29, 2.596, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(49, 'Darren_Hill', '', '', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Montgomery, Red County.', 1, 0, '', '', 0, 0, ''),
(50, 'Vincent_Wilhelm', '', 'Seul', '', '170.245.64.225', '48D85D80D94E5DFC0F909FC05C5F485C448E9C8F', '', 0, '', '', 1, 1, 1535762741, 0, '9', 9, 1990, 500, 500, 0, 250, 1, 4, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 130, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535764679, 0, 0, 0, 0, 0, 0, 0, 0, 88.842, 2268.77, -68.477, 1000.94, 1, 109, 8, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Cleveland, Ohio', 1, 0, '', '', 0, 0, ''),
(51, 'Kallel_Taylor', '', 'zanpi', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Ohio', 1, 0, '', '', 0, 0, ''),
(52, 'Isaiah_Dillimore', '', 'Francis', '', '167.249.49.20', 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489', '', 0, '', '', 1, 1, 1535756507, 0, '12', 2, 1965, 500, 500, 0, 73, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 79, 79, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535759228, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1250.51, -94.954, 37.275, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Montgomery - Red County', 1, 0, '', '', 0, 0, ''),
(53, 'Joseph_Deere', '', 'Mayeski', '', '189.35.82.13', '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE', '', 0, '', '', 1, 1, 1535760488, 0, '7', 1, 1996, 500, 500, 0, 179, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 66, 66, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535760920, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1312.93, 319.978, 19.396, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Red Country, San Andreas', 1, 0, '', '', 0, 0, ''),
(54, 'Anthony_Emanuel', '', 'joaoesturti1', '', '186.242.233.28', '4ACD844AAF9094D494DFC058C84E4E8ED844049E', '', 0, '', '', 1, 1, 1535764000, 0, '11', 2, 1998, 500, 500, 0, 1, 1, 2, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 125, 51, 0, 1, 0, 1, 1, 27, 0, 1, 31, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 54, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 1, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535764376, 0, 0, 0, 0, 0, 0, 0, 0, 100, 60.382, -222.013, 2.6, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Texas EUA  Anthony Emanu', 1, 0, '', '', 0, 0, ''),
(55, 'Kendrick_Hickey', '', 'L00k1', '', '177.192.250.230', 'A4D9D44C850C59D8D9D88C8E8CEFDED99444D48E', '', 0, '', '', 1, 1, 1535760249, 0, '3', 2, 1990, 500, 500, 0, 73, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 119, 119, 0, 1, 0, 1, 1, 33, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 60, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535761333, 0, 0, 0, 0, 0, 0, 0, 0, 100, 594.347, 1222.27, 12.264, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'CanadÃ¡', 1, 0, '', '', 0, 0, ''),
(56, 'Eric_Lynn', '', 'KinGz', '', '189.114.134.83', 'D4504ECF9EED80DACDE4F5D0054C484F8A8DD9C', '', 0, '', '', 2, 1, 1535759470, 0, '', 0, 0, 500, 500, 0, 271, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535759495, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palominio Creek', 1, 0, '', '', 0, 0, ''),
(57, 'Oliver_Austin', '', 'igorr', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Estados Unidos', 1, 0, '', '', 0, 0, ''),
(58, 'Gregory_Macaluso', '', 'Malbec', '', '187.36.179.206', 'C958C8D585F4C4E5CEE4D89E8F94C4C085FDEE9A', '', 0, '', '', 1, 1, 1535762248, 0, '21', 7, 1996, 500, 500, 0, 1, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535762426, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1357.94, 256.495, 19.555, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(59, 'Kevin_McKenzie', '', 'uGiftz', '', '168.227.228.79', 'ACEDC494D84AC4D9F9DC544004ADD8D0405F45EE', '', 0, '', '', 1, 1, 1535761576, 0, '3', 4, 1994, 500, 500, 0, 170, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 106, 106, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,0,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535762748, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1250.73, 176.819, 19.564, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, '');
INSERT INTO `players` (`id`, `Name`, `Password`, `Username`, `IP`, `RecentIP`, `RecentSerial`, `Host`, `AccountDisabled`, `Comment`, `RegisterDate`, `FilledForm`, `Created`, `LastLogin`, `Online`, `BirthDate`, `BirthMonth`, `BirthYear`, `Cash`, `Bank`, `totalEco`, `Skin`, `PlayerLevel`, `PlayerXP`, `NoobSpawnID`, `MySpawnID`, `SpawnAtHouse`, `BizzSpawn`, `DrugLevel`, `GuestHouseID`, `GuestFurnish`, `Faction`, `FactionRank`, `FactionCustomRank`, `Job`, `JobSpamTime`, `TotalTimePlayed`, `ConnectedTime`, `SweepStat`, `SweepLevel`, `SweepSpamTime`, `TruckingStat`, `TruckingLevel`, `TruckingSpamTime`, `DeliverStat`, `DeliverLevel`, `DeliverSpamTime`, `FishingPermit`, `FishingRod`, `FishingRodHealth`, `FishingBait`, `BiggestFish`, `Fish1Weight`, `Fish1Name`, `Fish2Weight`, `Fish2Name`, `Fish3Weight`, `Fish3Name`, `Fish4Weight`, `Fish4Name`, `Fish5Weight`, `Fish5Name`, `HasPhonebook`, `HasLogs`, `HasDice`, `HasBlindfold`, `WeaponSkill`, `LicenseBike`, `LicenseBoat`, `LicenseHelicopter`, `LicensePlane`, `LicenseLargeVehicle`, `LicenseCar`, `LicenseEVOC`, `LicenseTVOC`, `HasRadio`, `RadioFrequency`, `RadioSlot1`, `RadioSlot2`, `RadioSlot3`, `RadioSlotInUse`, `HasMask`, `HasFuelCan`, `HasFuelCanType`, `HasWatch`, `CompletedTutorial`, `HasFags`, `HasLighter`, `HasCrisps`, `JailTime`, `HasGPS`, `SavedWaypointX`, `SavedWaypointY`, `SavedWaypointZ`, `Weed`, `MoonShine`, `Cocaine`, `FightStyle`, `AmmoBoxPistol`, `AmmoBoxShotgun`, `AmmoBoxSMG`, `AmmoBoxRifle`, `AmmoBoxAssaultR`, `AmmoBoxRocket`, `Armour`, `RestrictedVest`, `IsDonator`, `DonationCash`, `DonationWLevel`, `DonationPLevel`, `DonationDLevel`, `DonationCarModel`, `DonationChannel`, `AdminJailTime`, `SkinSet1`, `SkinSet2`, `SkinSet3`, `SkinSet4`, `SkinSet5`, `HasRope`, `Kills`, `Deaths`, `SubFactionSpawn`, `CoalmineStat`, `CoalmineSpamTime`, `CoalmineLevel`, `TrashStat`, `TrashSpamTime`, `TrashLevel`, `HasNotepad`, `Notepad1`, `Notepad2`, `Notepad3`, `Notepad4`, `Notepad5`, `TutorialIndex`, `LogToAvoidDeath`, `Refunds`, `SpeedoFormat`, `Accent`, `RadioPower`, `HasPen`, `HasPaper`, `HasCarAdapter`, `LooksLike`, `BorrowKey`, `BorrowKeyTime`, `Muted`, `DOOCMuted`, `NoobMuted`, `Litters`, `WeaponLicense`, `Achievements`, `ShoutAnimToggle`, `TalkAnimToggle`, `Checks`, `Check1`, `Check2`, `Check3`, `RollingPaper`, `Bong`, `Morphine`, `HasBriefcase`, `BriefcaseWeapon`, `BriefcaseWeaponAmmo`, `BriefcaseCash`, `BriefcaseCode`, `BriefcaseLocked`, `BriefcaseCocaine`, `BriefcaseWeed`, `HasCalculator`, `HasMedKit`, `LicenseSuspendTime_Car`, `LicenseSuspendTime_LargeVehicle`, `LicenseSuspendTime_Bike`, `LicenseSuspendTime_Boat`, `LicenseSuspendTime_Helicopter`, `LicenseSuspendTime_Plane`, `HasToolbox`, `HasEngineOil`, `PoliceFine`, `PoliceFineSQLID`, `DeleteRef`, `FareRate`, `GPSMount`, `RefundXP`, `LastLogout`, `HasWeedSeed`, `PrisonTime`, `IsolationTime`, `PrisonCell`, `HasWater`, `PingKickExemption`, `Boombox`, `BoomBanned`, `Health`, `RelogSpawnX`, `RelogSpawnY`, `RelogSpawnZ`, `SpawnSaved`, `RelogSpawnINT`, `RelogSpawnVW`, `offlineBan`, `Story`, `delete`, `deleteId`, `privacy`, `allow_comments`, `amountDonated`, `allow_skin`, `FightStyleLearnedKungFu`, `FightStyleLearnedBoxing`, `registrado`, `EMail`, `Origin`, `Gender`, `Age`, `corrigir_appnegada`, `avaliada_por`, `Admin`, `pHealthMax`, `pNomeOOC`) VALUES
(60, 'Christopher_Deaver', '', 'Tyrok', '', '187.16.156.70', 'E8F5545EE85E905DD449899EDD9E40AE4C99E88', '', 0, '', '', 1, 1, 1535757127, 0, '20', 4, 1980, 500, 500, 0, 202, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 32, 32, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 20, 100, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, '', '', '', '', '', 0, 0, 0, 0, '', 0, 100, 5, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535759340, 0, 0, 0, 0, 6, 0, 0, 0, 100, 1283.54, 373.909, 19.555, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Montgomery, Red County.', 1, 0, '', '', 0, 0, ''),
(61, 'Chad_McKagan', '', 'don', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Flint Country', 1, 0, '', '', 0, 0, ''),
(62, 'Kim_Greene', '', 'DouglasA', '', '177.23.212.191', '4FED8CC95E945E9C49F045DCCDAAA4D04DECFD0F', '', 0, '', '', 1, 1, 1535754364, 0, '15', 11, 1990, 500, 500, 0, 193, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 8, 8, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535754993, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1248.72, 142.774, 19.593, 1, 0, 125, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Santa BÃ¡rbara, CalifÃ³r', 2, 0, '', '', 0, 0, ''),
(63, 'Jerry_Catter', '', 'Junior', '', '177.208.177.174', 'C4DF408ECE9C5EE44804E5E4FCAE94DD0958C5EF', '', 0, '', '', 1, 1, 1535760310, 0, '7', 8, 1995, 500, 500, 0, 119, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 102, 102, 0, 1, 0, 0, 1, 0, 0, 1, 23, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535761092, 0, 0, 0, 0, 0, 0, 0, 0, 100, 723.785, 3107.73, 2084.62, 1, 3, 1, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Nova York', 1, 0, '', '', 0, 0, ''),
(64, 'Isaque_Tyler', '', 'IsaqueTyler', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 176, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Londrina-PR', 1, 0, '', '', 0, 0, ''),
(65, 'Phelipe_Smith', '', 'Phelipe', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 120, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(66, 'Frank_Gambino', '', 'Davyskrr', '', '45.234.176.2', '4945DECED9CAE99DC5E9449E00898D8DCEAD5CD4', '', 0, '', '', 1, 1, 1535756591, 0, '24', 12, 1994, 500, 500, 0, 117, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756723, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Condado', 1, 0, '', '', 0, 0, ''),
(67, 'William_Hufford', '', 'Duduzinho', '', '189.51.155.237', '8089E859ECEE98ED4CF8E599A8AA8DC4CD958808', '', 0, '', '', 1, 1, 1535753678, 0, '20', 2, 1991, 500, 500, 0, 73, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 44, 44, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,0,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756542, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1252.12, 138.062, 19.905, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Blueberry, San Andreas', 1, 0, '', '', 0, 0, ''),
(68, 'Kirk_Means', '', 'Blake', '', '201.17.8.148', 'DE445D00998FCD9EC8485DCEA4ED4D9AECDD4D4C', '', 0, '', '', 1, 1, 1535755399, 0, '3', 4, 1995, 500, 500, 0, 184, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 13, 13, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756233, 0, 0, 0, 0, 0, 0, 0, 0, 100, 132.174, -67.844, 1.578, 1, 0, 40005, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Bluebarry', 1, 0, '', '', 0, 0, ''),
(69, 'Franklin_Jonhson', '', 'Felipe', '', '189.6.23.72', '94AD9E949E8CCC5D45C4D4D404CAAC4959059FF4', '', 0, '', '', 1, 1, 1535754318, 0, '21', 2, 1983, 500, 500, 0, 72, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 44, 44, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, '', '', '', '', '', 0, 0, 0, 0, '', 0, 100, 5, 1, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756851, 0, 0, 0, 0, 6, 0, 0, 0, 100, 1256.18, 154.126, 19.654, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Vice City', 1, 0, '', '', 0, 0, ''),
(70, 'Seth_Crowther', '', 'Thom', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 35, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Fort Carson, San Andreas', 1, 0, '', '', 0, 0, ''),
(71, 'Daphne_Smith', '', 'Woozi', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 131, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palominio', 2, 0, '', '', 0, 0, ''),
(72, 'Bryan_Walker', '', 'Darkunite', '', '93.108.195.10', 'FCD5EA88EEE584EC449994EE9EED4EF9C84EF488', '', 0, '', '', 1, 1, 1535754466, 0, '6', 6, 1997, 500, 500, 0, 1, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 13, 13, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535754929, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1355.85, 207.182, 19.811, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'CalifÃ³rnia', 1, 0, '', '', 0, 0, ''),
(73, 'Enzo_Avilov', '', 'Jao', '', '177.141.179.70', 'A9FF4C0D80DA444D595898EC8CC95D8D85C0CA80', '', 0, '', '', 1, 1, 1535757421, 0, '23', 1, 1992, 500, 500, 0, 60, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 38, 38, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535757548, 0, 0, 0, 0, 0, 0, 0, 0, 100, 2512.48, -1724.36, 778.637, 1, 1, 20002, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Las Venturas ', 1, 0, '', '', 0, 0, ''),
(74, 'George_Lewinston', '', 'Maic', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Montgomery', 1, 0, '', '', 0, 0, ''),
(75, 'Kaven_Trout', '', 'Patolino', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 270, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(76, 'Justin_Goodman', '', 'iCore', '', '170.79.169.110', 'DD988E9E8FFF58C8049EEE844ED899C89AFAC4C8', '', 0, '', '', 1, 1, 1535759442, 0, '4', 4, 1995, 500, 500, 0, 98, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 56, 56, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535757802, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1317.8, 255.65, 19.02, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Red County', 1, 0, '', '', 0, 0, ''),
(77, 'Nashawn_Pruitt', '', 'Carlao', '', '189.69.17.177', '4CA8CD4589D5C8ECEEDE494DDF0ED5ED4CECD9AE', '', 0, '', '', 1, 1, 1535756115, 0, '11', 7, 2000, 500, 500, 0, 21, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 3, 3, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756382, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1258.77, 199.046, 19.555, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palomino', 1, 0, '', '', 0, 0, ''),
(78, 'Raphael_Braian', '', '', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Ohio', 1, 0, '', '', 0, 0, ''),
(79, 'Dmitri_Scalovisck', '', 'Axl', '', '131.161.108.199', 'CDCC5F5C9DD8949ED48DEF454EDDF0E09ED88EAE', '', 0, '', '', 1, 1, 1535758415, 0, '30', 6, 1995, 500, 500, 0, 111, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 33, 33, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535760047, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1222.54, 351.826, 19.5, 1, 0, 114, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Las Venturas', 1, 0, '', '', 0, 0, ''),
(80, 'Roger_Pinney', '', 'DaniloX', '', '177.84.96.3', '995E5CD8CADCD88FCAE89EDCACA00DADDC4E49C4', '', 0, '', '', 1, 1, 1535755763, 0, '10', 2, 1992, 500, 500, 0, 1, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 11, 11, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535756524, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1236.72, 178.005, 2091.36, 1, 2, 1, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Angeles', 1, 0, '', '', 0, 0, ''),
(81, 'Kevin_Worley', '', 'LeeoCosta', '', '179.96.152.44', '5F95ECC4C4EF90884088A48AE80E40DF0EE9D489', '', 0, '', '', 1, 1, 1535763122, 0, '15', 9, 1995, 500, 500, 0, 60, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 30, 30, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 5, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535763476, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1639.81, 325.891, 1085.88, 1, 100, 40012, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Angeles, CalifÃ³rnia', 1, 0, '', '', 0, 0, ''),
(82, 'Derek_Drummond', '', 'Sayd', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(83, 'Volg_Tayler', '', 'VolgTayler', '', '131.72.203.136', '9D98CAFE8E49FEF8FA8F98DEF494C889844CCA8D', '', 0, '', '', 1, 1, 1535762979, 0, '7', 12, 1990, 500, 500, 0, 299, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 4, 4, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535763322, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1259.3, 170.364, 19.423, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Italia, MilÃ£o', 1, 0, '', '', 0, 0, ''),
(84, 'Dante_Bellandi', '', 'Edurdo', '', '109.48.182.123', 'C99E89D0EAF9C884C5C5EF898DA5E5CEC55EC9DE', '', 0, '', '', 1, 1, 1535760285, 0, '16', 11, 1956, 500, 500, 0, 20025, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 58, 58, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1000, 1000, 1000, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20010, 20025, 295, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,0,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535762339, 0, 0, 0, 0, 0, 0, 0, 0, 100, 644.238, -493.329, 16.336, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Bolzano', 1, 0, '', '', 0, 0, ''),
(85, 'Raphael_Arandelli', '', '', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Maine', 1, 0, '', '', 0, 0, ''),
(86, 'Joshua_Davis', '', 'Francis', '', '167.249.49.20', 'E9DE8900DCADEDEDADEDD0F45A044489EFE9C489', '', 0, '', '', 1, 1, 1535761286, 0, '20', 2, 1996, 500, 500, 0, 104, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535761392, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Montgomery - Red County', 1, 0, '', '', 0, 0, ''),
(87, 'Keenan_Philips', '', 'manoEL', '', '187.74.187.77', '4945DECED9CAE99DC5E9449E00898D8DCEAD5CD4', '', 0, '', '', 1, 1, 1535764550, 0, '10', 10, 1986, 500, 500, 0, 34, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535764727, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1383.68, 282.495, 19.406, 1, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Red Country', 1, 0, '', '', 0, 0, ''),
(88, 'Mathews_Cezatte', '', 'ElCezatte', '', '179.105.93.81', 'C8C0884F48CE88A9C849EE5F99A449EE8CA88E58', '', 0, '', '', 1, 1, 1535764784, 0, '15', 4, 1995, 500, 500, 0, 21, 1, 0, 3, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 52, 52, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 20, 100, 0, 0, 1, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, '', '', '', '', '', 0, 0, 0, 0, '', 1, 100, 10, 1, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535764727, 0, 0, 0, 0, 6, 0, 0, 0, 100, -153.278, 2167.14, 35.027, 0, 1, 40004, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Vice City', 1, 0, '', '', 0, 0, ''),
(89, 'Aleksey_Kuznetsov', '', 'Struth', '', '45.227.59.246', 'E9988E9495D0DC0D9CC4C4CCD8888AE454DA98DE', '', 0, '', '', 1, 1, 1535764419, 0, '10', 10, 1987, 500, 500, 0, 20051, 1, 0, 3, 1, 0, 0, 0, 0, -1, 1, 9, '', 0, 0, 5, 5, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 20051, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 1535765208, 0, 0, 0, 0, 0, 0, 0, 0, 100, -793.141, -402.428, 1802.03, 1, 6, 3, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Russia', 1, 0, '', '', 0, 0, ''),
(90, 'Moses_Goddard', '', 'Dadiva', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Blueberry', 1, 0, '', '', 0, 0, ''),
(91, 'David_Worsham', '', 'Gusmatador', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palomino Creek', 1, 0, '', '', 0, 0, ''),
(92, 'Jack_Risley', '', 'pblscrim', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Dillimore', 1, 0, '', '', 0, 0, ''),
(93, 'Trevor_Lawson', '', 'ElToddy', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Los Santos', 1, 0, '', '', 0, 0, ''),
(94, 'Oliver_Miller', '', 'Lowis', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 299, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Napa, CA, Estados Unidos', 1, 0, '', '', 0, 0, ''),
(95, 'Jacob_Dunn', '', 'Striker', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 124, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Palomino Creek', 1, 0, '', '', 0, 0, ''),
(96, 'Ernest_Bogard', '', 'clon', '', '', '', '', 0, '', '', 2, 1, 0, 0, '', 0, 0, 500, 500, 0, 50, 1, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 100, 0, 0, -1, '', -1, '', -1, '', -1, '', -1, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '', '', '', '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 'Dillimore', 1, 0, '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pm`
--

CREATE TABLE `pm` (
  `id` int(10) UNSIGNED NOT NULL,
  `pm_to` int(11) NOT NULL,
  `pm_from` int(11) NOT NULL,
  `subject` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `pm_read` int(11) NOT NULL,
  `pm_from_admin` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rentals`
--

CREATE TABLE `rentals` (
  `id` int(12) NOT NULL,
  `Model` int(12) NOT NULL,
  `Color1` int(4) NOT NULL,
  `Color2` int(4) NOT NULL,
  `Mileage` float NOT NULL,
  `Position` varchar(64) NOT NULL,
  `Price` int(12) NOT NULL,
  `RegPlate` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `rentals`
--

INSERT INTO `rentals` (`id`, `Model`, `Color1`, `Color2`, `Mileage`, `Position`, `Price`, `RegPlate`) VALUES
(1, 529, 1, 1, 0, '1238.8151,157.4996,2086.5388,270.8093', 650, 'NE82T4J'),
(2, 445, 1, 1, 0, '1238.748291,153.869522,2086.539550,268.399719', 750, 'VF73L8K'),
(3, 527, 1, 1, 0, '1238.372070,150.466873,2086.380371,268.276824', 350, 'VE88F6T'),
(4, 410, 1, 1, 0, '1238.701660,146.980834,2086.318115,270.734924', 350, 'PH69M8N'),
(5, 489, 1, 1, 0, '1254.850463,146.995803,2086.807128,90.086380', 1000, 'ZA59X3N'),
(6, 436, 1, 1, 0, '1254.646362,150.636001,2086.432861,88.232185', 350, 'HD83P9V');

-- --------------------------------------------------------

--
-- Estrutura para tabela `rpquizonline`
--

CREATE TABLE `rpquizonline` (
  `questionid` int(11) NOT NULL,
  `question` varchar(256) NOT NULL,
  `answer1` varchar(128) NOT NULL,
  `answer2` varchar(128) NOT NULL,
  `answer3` varchar(128) NOT NULL,
  `answer4` varchar(128) NOT NULL,
  `answer` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `saspinactivityreports`
--

CREATE TABLE `saspinactivityreports` (
  `id` int(11) NOT NULL,
  `OfficerSQLID` int(11) NOT NULL,
  `StartDate` varchar(322) NOT NULL,
  `EndDate` varchar(32) NOT NULL,
  `Reason` varchar(256) NOT NULL,
  `ApprovedBySQLID` int(11) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sasplog`
--

CREATE TABLE `sasplog` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `saspsettings`
--

CREATE TABLE `saspsettings` (
  `id` int(11) NOT NULL,
  `maintenance` int(11) NOT NULL,
  `mTitle` varchar(64) NOT NULL,
  `mMessage` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `saspsituationreports`
--

CREATE TABLE `saspsituationreports` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `type` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `officersInvolved` varchar(5000) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `supervisorNotes` varchar(10000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servercars`
--

CREATE TABLE `servercars` (
  `id` int(11) NOT NULL,
  `Mileage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sms`
--

CREATE TABLE `sms` (
  `id` int(11) NOT NULL,
  `TextFrom` int(11) NOT NULL,
  `TextTo` int(11) NOT NULL,
  `TextMessage` varchar(155) NOT NULL,
  `TextTime` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `sms`
--

INSERT INTO `sms` (`id`, `TextFrom`, `TextTo`, `TextMessage`, `TextTime`) VALUES
(21, 2651999, 7713412, 'Olá.', '10:38:49 on the 20th of Agosto 2018');

-- --------------------------------------------------------

--
-- Estrutura para tabela `staffstats`
--

CREATE TABLE `staffstats` (
  `id` int(11) UNSIGNED NOT NULL,
  `Username` int(11) DEFAULT NULL,
  `AssistCount` int(11) DEFAULT NULL,
  `DutyTime` int(11) DEFAULT NULL,
  `AdminScore` int(11) DEFAULT NULL,
  `IncognitoTime` int(11) DEFAULT NULL,
  `AFKDutyTime` int(11) DEFAULT NULL,
  `maAppCount` int(11) DEFAULT NULL,
  `AdminLevel` int(11) DEFAULT NULL,
  `Type` varchar(26) DEFAULT NULL,
  `MonthID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `staffstatsmonths`
--

CREATE TABLE `staffstatsmonths` (
  `id` int(11) UNSIGNED NOT NULL,
  `Month` varchar(32) DEFAULT NULL,
  `StaffCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `storedarmor`
--

CREATE TABLE `storedarmor` (
  `id` int(12) NOT NULL,
  `ArmorType` int(12) NOT NULL,
  `ArmorAmount` int(12) NOT NULL,
  `HouseID` int(12) NOT NULL,
  `TrunkID` int(12) NOT NULL,
  `FCarID` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `strangers`
--

CREATE TABLE `strangers` (
  `StrangerID` int(11) NOT NULL,
  `PlayerName` varchar(24) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `SQLID` int(11) NOT NULL,
  `IP` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `strangers`
--

INSERT INTO `strangers` (`StrangerID`, `PlayerName`, `Timestamp`, `SQLID`, `IP`) VALUES
(1000, 'Vincent_Henderson', 1534745308, 1, '164.163.207.13'),
(1000, 'Rowan_Ballard', 1535497729, 4, '186.225.187.250'),
(1001, 'Vincent_Henderson', 1535497848, 1, '164.163.207.107'),
(1002, 'Rowan_Ballard', 1535497876, 4, '186.225.187.250'),
(1000, 'Vincent_Henderson', 1535604643, 1, '164.163.207.107');

-- --------------------------------------------------------

--
-- Estrutura para tabela `svrchangelogs`
--

CREATE TABLE `svrchangelogs` (
  `id` int(11) NOT NULL,
  `published` int(11) NOT NULL,
  `version` varchar(10) NOT NULL,
  `revision` int(10) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbans`
--

CREATE TABLE `tbans` (
  `id` int(11) NOT NULL,
  `PlayerName` varchar(50) NOT NULL,
  `BannedBy` varchar(25) NOT NULL,
  `BannedIP` varchar(20) NOT NULL,
  `BanReason` varchar(50) NOT NULL,
  `PlayerSQLID` int(11) NOT NULL,
  `MasterAccount` int(11) NOT NULL,
  `UnbanDate` varchar(40) NOT NULL,
  `UnbanD` int(11) NOT NULL,
  `UnbanM` int(11) NOT NULL,
  `UnbanY` int(11) NOT NULL,
  `DaysBanned` int(2) NOT NULL,
  `Unbanned` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `teamspeakchannels`
--

CREATE TABLE `teamspeakchannels` (
  `id` int(11) UNSIGNED NOT NULL,
  `ChannelID` int(11) DEFAULT NULL,
  `ChannelName` varchar(64) DEFAULT NULL,
  `OwnerSQLID` int(11) DEFAULT NULL,
  `UniqueKey` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `MASQLID` int(11) NOT NULL,
  `Admin` int(11) NOT NULL,
  `Subject` varchar(100) NOT NULL,
  `IP` varchar(20) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `LastActivity` int(11) NOT NULL,
  `State` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tickets_posts`
--

CREATE TABLE `tickets_posts` (
  `id` int(11) NOT NULL,
  `TicketID` int(11) NOT NULL,
  `MASQLID` int(11) NOT NULL,
  `IP` varchar(20) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `AdminReply` int(2) NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `toys`
--

CREATE TABLE `toys` (
  `id` int(11) NOT NULL,
  `tPlayer` int(11) NOT NULL,
  `tModelID` int(11) NOT NULL,
  `tOffsetX` float NOT NULL,
  `tOffsetY` float NOT NULL,
  `tOffsetZ` float NOT NULL,
  `tRotX` float NOT NULL,
  `tRotY` float NOT NULL,
  `tRotZ` float NOT NULL,
  `tScaleX` float NOT NULL,
  `tScaleY` float NOT NULL,
  `tScaleZ` float NOT NULL,
  `tBone` int(11) NOT NULL,
  `tColor` int(12) NOT NULL DEFAULT '0',
  `tOpt` int(11) NOT NULL,
  `tMask` int(12) NOT NULL,
  `FactionMask` int(12) NOT NULL,
  `tSpawn` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `toys`
--

INSERT INTO `toys` (`id`, `tPlayer`, `tModelID`, `tOffsetX`, `tOffsetY`, `tOffsetZ`, `tRotX`, `tRotY`, `tRotZ`, `tScaleX`, `tScaleY`, `tScaleZ`, `tBone`, `tColor`, `tOpt`, `tMask`, `FactionMask`, `tSpawn`) VALUES
(1, 1, 19274, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(2, 1, 18923, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(3, 1, 18978, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(4, 1, 19200, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(5, 1, 19514, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(6, 1, 19100, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(7, 1, 18891, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(9, 28, 19039, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(11, 28, 365, -0.059, -0.269, 0.1, -11.9, -94.8, -6.5, 1, 1, 1, 7, 0, 0, 0, 0, 0),
(12, 18, 326, -0.001, 0.031, -0.044, -129.1, 86.3, 78.3, 1, 1, 1, 7, 0, 0, 0, 0, 0),
(13, 23, -3000, 0.092, 0.036, 0.011, 0, 0, 0, 1, 1.115, 1, 1, 0, 0, 0, 0, 0),
(14, 84, 19519, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(15, 84, 19043, 0.028, -0.011, -0.0000005022, -47.5, -110.2, 126.8, 1.35, 0.901, 1, 6, 0, 0, 1, 0, 0),
(16, 81, 326, -0.001, 0.031, -0.044, -129.1, 86.3, 78.3, 1, 1, 1, 7, 0, 0, 0, 0, 0),
(17, 31, 19053, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(18, 31, 19053, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 1, 0, 0),
(19, 88, 365, -0.059, -0.269, 0.1, -11.9, -94.8, -6.5, 1, 1, 1, 7, 0, 0, 0, 0, 0),
(20, 88, 367, 0.207, 0.18, -0.127, 87.4, 179.8, 1.5, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(21, 22, 356, 0, -0.127, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(22, 22, -3000, 0.092, 0.036, 0.011, 0, 0, 0, 1, 1.115, 1, 1, 0, 0, 0, 0, 0),
(23, 22, -3000, 0.093, 0.068, -0.009, 0.9, 0, -0.8, 1, 1.152, 1.153, 1, 0, 0, 0, 0, 0),
(24, 1, 334, -0.004, 0.032, -0.034, 150.4, 85.2, -89.5, 1, 1, 1, 7, 0, 0, 0, 0, 0),
(25, 1, 348, -0.052, 0, 0.117, -106.6, 0, 3.3, 1, 1, 1, 8, 0, 0, 0, 0, 0),
(26, 1, 367, 0.207, 0.18, -0.127, 87.4, 179.8, 1.5, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(27, 22, -3000, 0.089, 0.067, -0.011, 0, 0, 0, 1, 1.115, 1, 1, 0, 0, 0, 0, 0),
(28, 1, 365, -0.059, -0.269, 0.1, -11.9, -94.8, -6.5, 1, 1, 1, 7, 0, 0, 0, 0, 0),
(29, 22, -3000, 0.086, 0.069, -0.013, 0, 0, 0, 1, 1.115, 1, 1, 0, 0, 0, 0, 0),
(30, 22, 348, -0.052, 0, 0.117, -106.6, 0, 3.3, 1, 1, 1, 8, 0, 0, 0, 0, 0),
(31, 22, 334, -0.004, 0.032, -0.034, 150.4, 85.2, -89.5, 1, 1, 1, 7, 0, 0, 0, 0, 0),
(32, 22, 367, 0.207, 0.18, -0.127, 87.4, 179.8, 1.5, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(33, 22, 365, -0.059, -0.269, 0.1, -11.9, -94.8, -6.5, 1, 1, 1, 7, 0, 0, 0, 0, 0),
(34, 22, 351, -0.028, -0.157, 0, 0, 0, 5.7, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(35, 22, 358, -0.052, -0.17, -0.148, 0, 0, 7.8, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(36, 22, 353, 0.119, 0.11, 0.177, 11.3, 148.3, 19.9, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(37, 22, -3000, 0.092, 0.036, 0.011, 0, 0, 0, 1, 1.115, 1, 1, 0, 0, 0, 0, 0),
(38, 22, -3000, 0.092, 0.036, 0.011, 0, 0, 0, 1, 1.115, 1, 1, 0, 0, 0, 0, 0),
(39, 22, -3000, 0.092, 0.036, 0.011, 0, 0, 0, 1, 1.115, 1, 1, 0, 0, 0, 0, 0),
(40, 22, -3000, 0.092, 0.036, 0.011, 0, 0, 0, 1, 1.115, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `traders`
--

CREATE TABLE `traders` (
  `id` int(11) NOT NULL,
  `Type` int(1) NOT NULL,
  `ForSale` int(1) NOT NULL,
  `Price` int(11) NOT NULL,
  `SQLID` int(11) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `checked` int(11) NOT NULL DEFAULT '0',
  `accepted` int(11) NOT NULL,
  `txn_id` varchar(150) NOT NULL,
  `parent_txn_id` varchar(19) DEFAULT NULL,
  `pID` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `receipt_id` varchar(50) DEFAULT NULL,
  `verify_sign` varchar(300) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(2) NOT NULL,
  `address_name` varchar(128) DEFAULT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(40) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) DEFAULT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` int(20) NOT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` int(11) NOT NULL,
  `echeck_time_processed` varchar(100) NOT NULL,
  `exchange_rate` int(11) NOT NULL,
  `mc_currency` varchar(10) NOT NULL,
  `mc_fee` int(11) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `payment_date` varchar(28) NOT NULL,
  `payer_status` varchar(30) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `pending_reason` varchar(50) NOT NULL,
  `reason_code` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpaccesslog`
--

CREATE TABLE `ucpaccesslog` (
  `id` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpacpfeed`
--

CREATE TABLE `ucpacpfeed` (
  `id` int(11) NOT NULL,
  `icon` varchar(40) NOT NULL,
  `value` varchar(250) NOT NULL,
  `masterAcc` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpbugcomments`
--

CREATE TABLE `ucpbugcomments` (
  `id` int(11) NOT NULL,
  `bugID` int(11) NOT NULL,
  `masteracc` int(11) NOT NULL,
  `staff_reply` int(11) NOT NULL DEFAULT '0',
  `developer_reply` int(11) NOT NULL,
  `message` varchar(20000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpbugs`
--

CREATE TABLE `ucpbugs` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `message` varchar(1024) NOT NULL,
  `submittedby` int(11) NOT NULL,
  `assignedto` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `developer_reply` int(11) NOT NULL,
  `date_submitted` date NOT NULL,
  `date_fixed` date NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `deleted_at` date NOT NULL,
  `forumTopic` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpchangelogs`
--

CREATE TABLE `ucpchangelogs` (
  `id` int(11) NOT NULL,
  `published` int(11) NOT NULL,
  `version` varchar(10) NOT NULL,
  `revision` int(10) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpdelete`
--

CREATE TABLE `ucpdelete` (
  `id` int(11) NOT NULL,
  `maID` int(11) NOT NULL,
  `AccID` int(11) NOT NULL,
  `ip` varchar(128) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpfaq`
--

CREATE TABLE `ucpfaq` (
  `id` int(11) NOT NULL,
  `question` varchar(512) NOT NULL,
  `answer` varchar(512) NOT NULL,
  `order` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpfriends`
--

CREATE TABLE `ucpfriends` (
  `id` int(11) NOT NULL,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpip`
--

CREATE TABLE `ucpip` (
  `ID` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `allowedAccs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucplog`
--

CREATE TABLE `ucplog` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpnews`
--

CREATE TABLE `ucpnews` (
  `id` int(11) NOT NULL,
  `headline` varchar(100) NOT NULL,
  `headimg` varchar(100) NOT NULL DEFAULT 'http://lv-rp.com/images/logo.png',
  `shortstory` varchar(2000) NOT NULL DEFAULT 'Nothing',
  `story` varchar(40000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `hasShortstory` int(1) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '1',
  `comments` int(11) NOT NULL,
  `hideHeadline` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpnotices`
--

CREATE TABLE `ucpnotices` (
  `id` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `hideable` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpnotifications`
--

CREATE TABLE `ucpnotifications` (
  `id` int(11) NOT NULL,
  `maID` int(11) NOT NULL,
  `eFriendRequests` int(1) NOT NULL DEFAULT '1',
  `pFriendRequests` int(1) NOT NULL,
  `eAccountComments` int(1) NOT NULL DEFAULT '1',
  `pAccountComments` int(1) NOT NULL,
  `eTicketResponse` int(1) NOT NULL DEFAULT '1',
  `pTicketResponse` int(1) NOT NULL,
  `eAppealResponse` int(11) NOT NULL DEFAULT '1',
  `pAppealResponse` int(11) NOT NULL DEFAULT '0',
  `eStaffTicketNotification` int(1) NOT NULL,
  `pStaffTicketNotification` int(1) NOT NULL,
  `eStaffNewTicket` int(1) NOT NULL,
  `pStaffNewTicket` int(1) NOT NULL,
  `eStaffNewAppeal` int(11) NOT NULL DEFAULT '1',
  `pStaffNewAppeal` int(11) NOT NULL DEFAULT '0',
  `eStaffAppealNotification` int(11) NOT NULL,
  `pStaffAppealNotification` int(11) NOT NULL,
  `eApplicationResponse` int(11) NOT NULL,
  `pApplicationResponse` int(11) NOT NULL,
  `eBannedOffline` int(11) NOT NULL,
  `pBannedOffline` int(11) NOT NULL,
  `eBusinessStock` int(11) NOT NULL,
  `pBusinessStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpplayerscron`
--

CREATE TABLE `ucpplayerscron` (
  `id` int(11) NOT NULL,
  `players` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpquizapps`
--

CREATE TABLE `ucpquizapps` (
  `id` int(11) NOT NULL,
  `maID` int(11) NOT NULL,
  `handler` int(11) NOT NULL,
  `handlerNotes` varchar(6000) NOT NULL,
  `state` int(11) NOT NULL,
  `appSubmitted` int(11) NOT NULL,
  `denyTime` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `q1Title` varchar(100) NOT NULL,
  `q1Answer` varchar(10000) NOT NULL,
  `q2Title` varchar(100) NOT NULL,
  `q2Answer` text NOT NULL,
  `q3Title` varchar(100) NOT NULL,
  `q3Answer` varchar(1000) NOT NULL,
  `q4Title` varchar(100) NOT NULL,
  `q4Answer` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpquizquestions`
--

CREATE TABLE `ucpquizquestions` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `question` varchar(256) NOT NULL,
  `reply1` varchar(256) NOT NULL,
  `reply2` varchar(256) NOT NULL,
  `reply3` varchar(256) NOT NULL,
  `reply4` varchar(256) NOT NULL,
  `answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpsettings`
--

CREATE TABLE `ucpsettings` (
  `id` int(11) NOT NULL,
  `ucpProgress` int(11) NOT NULL,
  `serverProgress` int(11) NOT NULL,
  `development` int(11) NOT NULL,
  `serverIP` varchar(70) NOT NULL,
  `serverPort` int(4) NOT NULL,
  `svrLeadDeveloper` varchar(40) NOT NULL,
  `ucpLeadDeveloper` varchar(40) NOT NULL,
  `serverDeveloper` varchar(40) NOT NULL,
  `ucpDeveloper` varchar(40) NOT NULL,
  `server3rdPartyDev` varchar(128) NOT NULL,
  `ucp3rdPartyDev` varchar(128) NOT NULL,
  `maintenance` int(11) DEFAULT NULL,
  `mTitle` varchar(2566) NOT NULL,
  `mMessage` varchar(2000) NOT NULL,
  `mLastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `aStatsWiped` date NOT NULL,
  `hStatsWiped` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucpticketcomments`
--

CREATE TABLE `ucpticketcomments` (
  `id` int(11) NOT NULL,
  `ticketId` int(11) NOT NULL,
  `masteracc` int(11) NOT NULL,
  `staff_reply` int(11) NOT NULL DEFAULT '0',
  `message` varchar(20000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucptickets`
--

CREATE TABLE `ucptickets` (
  `id` int(11) NOT NULL,
  `masteracc` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `header` varchar(300) NOT NULL,
  `message` varchar(20000) NOT NULL,
  `assigned` int(11) NOT NULL,
  `unread` int(11) NOT NULL,
  `last_response` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ucp_posts`
--

CREATE TABLE `ucp_posts` (
  `ID` int(11) NOT NULL,
  `titulo` varchar(128) NOT NULL,
  `mensagem` varchar(2000) NOT NULL,
  `imagem` varchar(128) NOT NULL,
  `por` varchar(128) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `ucp_posts`
--

INSERT INTO `ucp_posts` (`ID`, `titulo`, `mensagem`, `imagem`, `por`, `data`) VALUES
(5, 'PROGRESSO GERAL', '', 'https://i.imgur.com/ZLnBEXt.png', 'Revolts', '17/08/2018, 17:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `VehicleModel` int(5) NOT NULL DEFAULT '0',
  `FishCrate` int(11) NOT NULL DEFAULT '0',
  `OwnerSQLID` int(11) NOT NULL DEFAULT '0',
  `LastX` varchar(16) NOT NULL DEFAULT '0',
  `LastY` varchar(16) NOT NULL DEFAULT '0',
  `LastZ` varchar(16) NOT NULL DEFAULT '0',
  `Spawned` tinyint(2) NOT NULL,
  `LastRot` varchar(16) NOT NULL DEFAULT '0',
  `RegPlate` varchar(7) NOT NULL DEFAULT '0',
  `Fuel` float NOT NULL DEFAULT '100',
  `Mileage` float NOT NULL DEFAULT '0',
  `LastOilMileage` float NOT NULL DEFAULT '0',
  `IsLocked` int(3) NOT NULL DEFAULT '0',
  `Price` int(11) NOT NULL DEFAULT '0',
  `Color1` int(11) NOT NULL DEFAULT '0',
  `Color2` int(11) NOT NULL DEFAULT '0',
  `ImpoundTime` int(6) NOT NULL DEFAULT '0',
  `ImpoundFee` int(11) NOT NULL DEFAULT '0',
  `ImpoundedBy` int(11) NOT NULL,
  `Impounded` int(11) NOT NULL DEFAULT '0',
  `ImpoundReason` varchar(20) DEFAULT NULL,
  `TicketAmount` int(6) NOT NULL DEFAULT '0',
  `VWorld` int(11) NOT NULL DEFAULT '0',
  `Interior` int(12) NOT NULL,
  `DonatorCar` int(11) NOT NULL DEFAULT '0',
  `TrunkArmour` int(11) NOT NULL DEFAULT '0',
  `TrunkCash` int(11) NOT NULL DEFAULT '0',
  `TrunkWeed` int(11) NOT NULL DEFAULT '0',
  `TrunkCocaine` int(11) NOT NULL DEFAULT '0',
  `TrunkMoonShine` int(11) NOT NULL DEFAULT '0',
  `TrunkLock` int(11) NOT NULL DEFAULT '0',
  `TrunkPhone` int(12) NOT NULL,
  `ForSale` int(3) NOT NULL DEFAULT '0',
  `ForSalePrice` int(11) NOT NULL DEFAULT '0',
  `DamageHealth` float NOT NULL DEFAULT '1000',
  `DamagePanels` int(11) NOT NULL DEFAULT '0',
  `DamageDoors` int(11) NOT NULL DEFAULT '0',
  `DamageLights` int(11) NOT NULL DEFAULT '0',
  `DamageTires` int(11) NOT NULL DEFAULT '0',
  `NeedsRecovery` int(11) NOT NULL DEFAULT '0',
  `GarageRepairID` int(3) NOT NULL DEFAULT '0',
  `GarageCollectTime` int(11) NOT NULL DEFAULT '0',
  `ChangeDVeh` int(11) NOT NULL DEFAULT '0',
  `NextChangable` int(11) NOT NULL DEFAULT '0',
  `VehicleModHyd` int(1) NOT NULL DEFAULT '0',
  `VehicleModNos` int(1) NOT NULL DEFAULT '0',
  `VehicleSaved` int(12) NOT NULL DEFAULT '0',
  `LogPosX` float NOT NULL,
  `LogPosY` float NOT NULL,
  `LogPosZ` float NOT NULL,
  `LogPosA` float NOT NULL,
  `HotwireExpiration` int(12) NOT NULL,
  `PlateToggle` int(12) DEFAULT '0',
  `Mod1` int(12) NOT NULL,
  `Mod2` int(12) NOT NULL,
  `Mod3` int(12) NOT NULL,
  `Mod4` int(12) NOT NULL,
  `Mod5` int(12) NOT NULL,
  `Mod6` int(12) NOT NULL,
  `Mod7` int(12) NOT NULL,
  `Mod8` int(12) NOT NULL,
  `Mod9` int(12) NOT NULL,
  `Mod10` int(12) NOT NULL,
  `Mod11` int(12) NOT NULL,
  `Mod12` int(12) NOT NULL,
  `Mod13` int(12) NOT NULL,
  `Mod14` int(12) NOT NULL,
  `VehiclePaintjob` int(3) DEFAULT '3',
  `BMA` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `vehicles`
--

INSERT INTO `vehicles` (`id`, `VehicleModel`, `FishCrate`, `OwnerSQLID`, `LastX`, `LastY`, `LastZ`, `Spawned`, `LastRot`, `RegPlate`, `Fuel`, `Mileage`, `LastOilMileage`, `IsLocked`, `Price`, `Color1`, `Color2`, `ImpoundTime`, `ImpoundFee`, `ImpoundedBy`, `Impounded`, `ImpoundReason`, `TicketAmount`, `VWorld`, `Interior`, `DonatorCar`, `TrunkArmour`, `TrunkCash`, `TrunkWeed`, `TrunkCocaine`, `TrunkMoonShine`, `TrunkLock`, `TrunkPhone`, `ForSale`, `ForSalePrice`, `DamageHealth`, `DamagePanels`, `DamageDoors`, `DamageLights`, `DamageTires`, `NeedsRecovery`, `GarageRepairID`, `GarageCollectTime`, `ChangeDVeh`, `NextChangable`, `VehicleModHyd`, `VehicleModNos`, `VehicleSaved`, `LogPosX`, `LogPosY`, `LogPosZ`, `LogPosA`, `HotwireExpiration`, `PlateToggle`, `Mod1`, `Mod2`, `Mod3`, `Mod4`, `Mod5`, `Mod6`, `Mod7`, `Mod8`, `Mod9`, `Mod10`, `Mod11`, `Mod12`, `Mod13`, `Mod14`, `VehiclePaintjob`, `BMA`) VALUES
(4, 549, 0, 4, '1167.467', '521.784', '19.482', 1, '152.566', 'GR11C7U', 63.391, 5.37, 0, 1, 19500, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0),
(5, 579, 0, 2, '667.684', '-546.297', '16.266', 1, '267.926', 'TG91N9B', 77.043, 1.34, 0, 0, 70000, 44, 44, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0),
(6, 541, 0, 1, '627.077', '-524.731', '15.884', 0, '86.824', 'BH32B3U', 86.391, 6.91, 0, 0, 0, 79, 79, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1080, 0, 0, 0, 0, 0, 0, 3, 0),
(7, 495, 0, 1, '1431.501', '297.239', '19.583', 1, '254.454', 'RT88B6P', 45.718, 9.8, 0, 0, 250000, 3, 3, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 891, 36700178, 50332162, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0),
(8, 462, 0, 63, '701.816', '-522.657', '15.928', 1, '117.477', 'QR46A1C', 75.348, 1.66, 0, 1, 12000, 79, 79, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 990.07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0),
(9, 420, 0, 1, '643.115', '-501.136', '16.059', 0, '360.0', 'WY41U3T', 59.587, 4.95, 0, 1, 35000, 3, 3, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `warnings`
--

CREATE TABLE `warnings` (
  `id` int(11) NOT NULL,
  `PlayerSQLID` int(7) NOT NULL,
  `AdminName` varchar(20) NOT NULL,
  `Reason` varchar(100) NOT NULL,
  `Datestamp` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `watchlist`
--

CREATE TABLE `watchlist` (
  `id` int(11) NOT NULL,
  `Player` int(11) NOT NULL,
  `AdminSQLID` int(11) NOT NULL,
  `Reason` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `weaponinfo`
--

CREATE TABLE `weaponinfo` (
  `id` int(11) NOT NULL,
  `M4Chance` int(11) NOT NULL,
  `AKChance` int(11) NOT NULL,
  `9mmPrice` int(11) NOT NULL,
  `DeaglePrice` int(11) NOT NULL,
  `ShotgunPrice` int(11) NOT NULL,
  `Tec9Price` int(11) NOT NULL,
  `UziPrice` int(11) NOT NULL,
  `MP5Price` int(11) NOT NULL,
  `AK-47Price` int(11) NOT NULL,
  `M4Price` int(11) NOT NULL,
  `CountryPrice` int(11) NOT NULL,
  `SniperPrice` int(11) NOT NULL,
  `ArmorPrice` int(11) NOT NULL,
  `Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `weaponinfo`
--

INSERT INTO `weaponinfo` (`id`, `M4Chance`, `AKChance`, `9mmPrice`, `DeaglePrice`, `ShotgunPrice`, `Tec9Price`, `UziPrice`, `MP5Price`, `AK-47Price`, `M4Price`, `CountryPrice`, `SniperPrice`, `ArmorPrice`, `Number`) VALUES
(1, 1, 1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 157);

-- --------------------------------------------------------

--
-- Estrutura para tabela `weaponlicenses`
--

CREATE TABLE `weaponlicenses` (
  `id` int(11) NOT NULL,
  `LicenseType` int(11) NOT NULL,
  `OwnerSQLID` int(11) NOT NULL,
  `GivingOfficer` int(11) NOT NULL,
  `Timestamp` int(12) NOT NULL,
  `ExpirationTime` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `weaponrefunds`
--

CREATE TABLE `weaponrefunds` (
  `id` int(11) NOT NULL,
  `masteraccount` int(11) NOT NULL,
  `playeraccount` int(11) NOT NULL,
  `weaponslot1` int(11) NOT NULL,
  `weaponslot2` int(11) NOT NULL,
  `weaponslot3` int(11) NOT NULL,
  `weaponslot4` int(11) NOT NULL,
  `weaponslot5` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `amountrefunded` int(11) NOT NULL,
  `assigned` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `reviewed` int(11) NOT NULL,
  `updated_at` date NOT NULL,
  `last_response` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `weapons`
--

CREATE TABLE `weapons` (
  `id` int(12) NOT NULL,
  `WeaponPossession` int(12) NOT NULL DEFAULT '1',
  `CreatorSQLID` int(12) NOT NULL,
  `OwnerSQLID` int(12) NOT NULL,
  `WeaponID` int(12) NOT NULL,
  `WeaponAmmo` int(12) NOT NULL,
  `WeaponOrigin` int(12) NOT NULL,
  `Timestamp` int(32) NOT NULL,
  `TrunkID` int(12) NOT NULL DEFAULT '-1',
  `FCarID` int(12) NOT NULL DEFAULT '-1',
  `Gunrack` int(12) NOT NULL DEFAULT '-1',
  `HouseID` int(12) NOT NULL DEFAULT '-1',
  `Deleted` int(11) NOT NULL DEFAULT '0',
  `Dropped` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `weapons`
--

INSERT INTO `weapons` (`id`, `WeaponPossession`, `CreatorSQLID`, `OwnerSQLID`, `WeaponID`, `WeaponAmmo`, `WeaponOrigin`, `Timestamp`, `TrunkID`, `FCarID`, `Gunrack`, `HouseID`, `Deleted`, `Dropped`) VALUES
(1, 1, 1, 16, 31, 106, 1, 1534612049, -1, -1, -1, -1, 0, 0),
(2, 1, 16, 16, 46, 5, 7, 1534613865, -1, -1, -1, -1, 0, 0),
(3, 0, 1, 1, 24, 59, 1, 1534698899, -1, -1, -1, -1, 1, 0),
(4, 0, 4, 4, 7, 5, 7, 1534731812, -1, -1, -1, -1, 1, 0),
(5, 0, 1, 13, 24, 61, 1, 1534792654, -1, -1, -1, -1, 1, 0),
(6, 0, 1, 1, 24, 66, 1, 1534796598, -1, -1, -1, -1, 1, 0),
(7, 0, 1, 13, 24, 0, 1, 1534798374, -1, -1, -1, -1, 1, 0),
(8, 0, 1, 1, 17, 10, 3, 1534814284, -1, -1, -1, -1, 1, 0),
(9, 0, 1, 1, 31, 200, 3, 1534814284, -1, -1, -1, -1, 1, 0),
(10, 0, 1, 1, 17, 10, 3, 1534814362, -1, -1, -1, -1, 1, 0),
(11, 0, 1, 1, 31, 200, 3, 1534814362, -1, -1, -1, -1, 1, 0),
(12, 0, 1, 1, 17, 10, 3, 1534814379, -1, -1, -1, -1, 1, 0),
(13, 0, 1, 1, 31, 200, 3, 1534814379, -1, -1, -1, -1, 1, 0),
(14, 0, 1, 1, 17, 10, 3, 1534815073, -1, -1, -1, -1, 1, 0),
(15, 0, 1, 1, 31, 200, 3, 1534815073, -1, -1, -1, -1, 1, 0),
(16, 0, 1, 1, 17, 10, 3, 1534815109, -1, -1, -1, -1, 1, 0),
(17, 0, 1, 1, 31, 200, 3, 1534815109, -1, -1, -1, -1, 1, 0),
(18, 0, 1, 1, 17, 10, 3, 1534815740, -1, -1, -1, -1, 1, 0),
(19, 0, 1, 1, 31, 200, 3, 1534815741, -1, -1, -1, -1, 1, 0),
(20, 0, 1, 1, 17, 10, 3, 1534816580, -1, -1, -1, -1, 1, 0),
(21, 0, 1, 1, 31, 200, 3, 1534816580, -1, -1, -1, -1, 1, 0),
(22, 0, 1, 1, 17, 10, 3, 1534816617, -1, -1, -1, -1, 1, 0),
(23, 0, 1, 1, 31, 200, 3, 1534816618, -1, -1, -1, -1, 1, 0),
(24, 0, 1, 1, 17, 10, 3, 1534816650, -1, -1, -1, -1, 1, 0),
(25, 0, 1, 1, 31, 200, 3, 1534816650, -1, -1, -1, -1, 1, 0),
(26, 0, 1, 1, 31, 0, 1, 1534801113, -1, -1, -1, -1, 1, 0),
(27, 0, 1, 4, 24, 62, 1, 1534994648, -1, -1, -1, -1, 1, 0),
(28, 1, 69, 69, 46, 5, 7, 1535754517, -1, -1, -1, -1, 0, 0),
(29, 1, 32, 32, 46, 5, 7, 1535754849, -1, -1, -1, -1, 0, 0),
(30, 1, 28, 28, 46, 5, 7, 1535755334, -1, -1, -1, -1, 0, 0),
(31, 1, 28, 28, 41, 999, 7, 1535755367, -1, -1, -1, -1, 0, 0),
(32, 1, 41, 41, 46, 5, 7, 1535756356, -1, -1, -1, -1, 0, 0),
(33, 1, 41, 41, 5, 5, 7, 1535756369, -1, -1, -1, -1, 0, 0),
(34, 1, 18, 18, 46, 5, 7, 1535756953, -1, -1, -1, -1, 0, 0),
(35, 1, 18, 18, 15, 5, 7, 1535756988, -1, -1, -1, -1, 0, 0),
(36, 1, 60, 60, 46, 5, 7, 1535757760, -1, -1, -1, -1, 0, 0),
(37, 1, 81, 81, 46, 5, 7, 1535760739, -1, -1, -1, -1, 0, 0),
(38, 1, 81, 81, 15, 5, 7, 1535760744, -1, -1, -1, -1, 0, 0),
(39, 1, 88, 88, 41, 1000, 7, 1535763661, -1, -1, -1, -1, 0, 0),
(40, 1, 88, 88, 6, 5, 7, 1535763748, -1, -1, -1, -1, 0, 0),
(41, 1, 88, 88, 46, 5, 7, 1535763774, -1, -1, -1, -1, 0, 0),
(42, 1, 88, 88, 5, 5, 7, 1535763945, -1, -1, -1, -1, 0, 0),
(43, 1, 88, 88, 43, 50, 7, 1535764565, -1, -1, -1, -1, 0, 0),
(44, 0, 22, 22, 17, 10, 3, 1535759609, -1, -1, -1, -1, 1, 0),
(45, 0, 22, 22, 31, 200, 3, 1535759609, -1, -1, -1, -1, 1, 0),
(46, 0, 1, 1, 24, 70, 3, 1535761087, -1, -1, -1, -1, 1, 0),
(47, 0, 1, 1, 3, 50, 3, 1535761087, -1, -1, -1, -1, 1, 0),
(48, 0, 1, 1, 43, 50, 3, 1535761087, -1, -1, -1, -1, 1, 0),
(49, 0, 1, 1, 24, 70, 3, 1535762258, -1, -1, -1, -1, 1, 0),
(50, 0, 1, 1, 3, 50, 3, 1535762258, -1, -1, -1, -1, 1, 0),
(51, 0, 1, 1, 41, 5000, 3, 1535762258, -1, -1, -1, -1, 1, 0),
(52, 0, 1, 1, 24, 70, 3, 1535762279, -1, -1, -1, -1, 1, 0),
(53, 0, 1, 1, 3, 50, 3, 1535762279, -1, -1, -1, -1, 1, 0),
(54, 0, 1, 1, 43, 50, 3, 1535762279, -1, -1, -1, -1, 1, 0),
(55, 0, 22, 22, 24, 70, 3, 1535762488, -1, -1, -1, -1, 1, 0),
(56, 0, 22, 22, 3, 50, 3, 1535762488, -1, -1, -1, -1, 1, 0),
(57, 0, 22, 22, 43, 50, 3, 1535762489, -1, -1, -1, -1, 1, 0),
(58, 0, 22, 22, 24, 70, 3, 1535762498, -1, -1, -1, -1, 1, 0),
(59, 0, 22, 22, 3, 50, 3, 1535762498, -1, -1, -1, -1, 1, 0),
(60, 0, 22, 22, 41, 5000, 3, 1535762498, -1, -1, -1, -1, 1, 0),
(61, 0, 1, 1, 24, 70, 3, 1535762555, -1, -1, -1, -1, 1, 0),
(62, 0, 1, 1, 3, 50, 3, 1535762555, -1, -1, -1, -1, 1, 0),
(63, 0, 1, 1, 41, 5000, 3, 1535762555, -1, -1, -1, -1, 1, 0),
(64, 0, 22, 22, 27, 70, 3, 1535762643, -1, -1, -1, -1, 1, 0),
(65, 0, 22, 22, 34, 50, 3, 1535762786, -1, -1, -1, -1, 1, 0),
(66, 0, 22, 22, 29, 150, 3, 1535762801, -1, -1, -1, -1, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `weed`
--

CREATE TABLE `weed` (
  `id` int(11) NOT NULL,
  `HouseSQLID` int(11) NOT NULL,
  `Growth` int(11) NOT NULL,
  `Water` int(11) NOT NULL,
  `FurnSQLID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `account_comments`
--
ALTER TABLE `account_comments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `adminlog`
--
ALTER TABLE `adminlog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `adminrecord`
--
ALTER TABLE `adminrecord`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `apikeys`
--
ALTER TABLE `apikeys`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `article_comments`
--
ALTER TABLE `article_comments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `assists`
--
ALTER TABLE `assists`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bizz`
--
ALTER TABLE `bizz`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bizzmods`
--
ALTER TABLE `bizzmods`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `efurniture`
--
ALTER TABLE `efurniture`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `email_tokens`
--
ALTER TABLE `email_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `factionlog`
--
ALTER TABLE `factionlog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fishcrates`
--
ALTER TABLE `fishcrates`
  ADD UNIQUE KEY `FishWeight` (`FishWeight`);

--
-- Índices de tabela `fmotd`
--
ALTER TABLE `fmotd`
  ADD UNIQUE KEY `fid` (`fid`);

--
-- Índices de tabela `fuel`
--
ALTER TABLE `fuel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Model` (`Model`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Índices de tabela `fveh`
--
ALTER TABLE `fveh`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `HouseSQLID` (`HouseSQLID`);

--
-- Índices de tabela `hfurniture`
--
ALTER TABLE `hfurniture`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Description` (`Description`);

--
-- Índices de tabela `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `interiors`
--
ALTER TABLE `interiors`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `masters`
--
ALTER TABLE `masters`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdc`
--
ALTER TABLE `mdc`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdcassociatedcasefiles`
--
ALTER TABLE `mdcassociatedcasefiles`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdccasefileevidence`
--
ALTER TABLE `mdccasefileevidence`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdccasefiles`
--
ALTER TABLE `mdccasefiles`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdccasefilescharges`
--
ALTER TABLE `mdccasefilescharges`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdcnavbar`
--
ALTER TABLE `mdcnavbar`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `mdcpersonsdb`
--
ALTER TABLE `mdcpersonsdb`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdcpersonslog`
--
ALTER TABLE `mdcpersonslog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdcpersonslogchanges`
--
ALTER TABLE `mdcpersonslogchanges`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mdcsettings`
--
ALTER TABLE `mdcsettings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `motd`
--
ALTER TABLE `motd`
  ADD UNIQUE KEY `motdid` (`motdid`);

--
-- Índices de tabela `motel`
--
ALTER TABLE `motel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `namechanges`
--
ALTER TABLE `namechanges`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `phonecontacts`
--
ALTER TABLE `phonecontacts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PhoneNumber` (`PhoneNumber`);

--
-- Índices de tabela `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Índices de tabela `pm`
--
ALTER TABLE `pm`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rpquizonline`
--
ALTER TABLE `rpquizonline`
  ADD PRIMARY KEY (`questionid`);

--
-- Índices de tabela `saspinactivityreports`
--
ALTER TABLE `saspinactivityreports`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sasplog`
--
ALTER TABLE `sasplog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `saspsettings`
--
ALTER TABLE `saspsettings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `saspsituationreports`
--
ALTER TABLE `saspsituationreports`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servercars`
--
ALTER TABLE `servercars`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Índices de tabela `sms`
--
ALTER TABLE `sms`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `staffstats`
--
ALTER TABLE `staffstats`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `staffstatsmonths`
--
ALTER TABLE `staffstatsmonths`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `storedarmor`
--
ALTER TABLE `storedarmor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `svrchangelogs`
--
ALTER TABLE `svrchangelogs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbans`
--
ALTER TABLE `tbans`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `teamspeakchannels`
--
ALTER TABLE `teamspeakchannels`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tickets_posts`
--
ALTER TABLE `tickets_posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `toys`
--
ALTER TABLE `toys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `traders`
--
ALTER TABLE `traders`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpaccesslog`
--
ALTER TABLE `ucpaccesslog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpacpfeed`
--
ALTER TABLE `ucpacpfeed`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpbugcomments`
--
ALTER TABLE `ucpbugcomments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `ucpbugs`
--
ALTER TABLE `ucpbugs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpchangelogs`
--
ALTER TABLE `ucpchangelogs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpdelete`
--
ALTER TABLE `ucpdelete`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpfaq`
--
ALTER TABLE `ucpfaq`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpfriends`
--
ALTER TABLE `ucpfriends`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpip`
--
ALTER TABLE `ucpip`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `ucplog`
--
ALTER TABLE `ucplog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpnews`
--
ALTER TABLE `ucpnews`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpnotices`
--
ALTER TABLE `ucpnotices`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `ucpnotifications`
--
ALTER TABLE `ucpnotifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpplayerscron`
--
ALTER TABLE `ucpplayerscron`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpquizapps`
--
ALTER TABLE `ucpquizapps`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpquizquestions`
--
ALTER TABLE `ucpquizquestions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucpsettings`
--
ALTER TABLE `ucpsettings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucptickets`
--
ALTER TABLE `ucptickets`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ucp_posts`
--
ALTER TABLE `ucp_posts`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Player` (`Player`);

--
-- Índices de tabela `weaponinfo`
--
ALTER TABLE `weaponinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `weaponlicenses`
--
ALTER TABLE `weaponlicenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `weaponrefunds`
--
ALTER TABLE `weaponrefunds`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `weed`
--
ALTER TABLE `weed`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `account_comments`
--
ALTER TABLE `account_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `adminlog`
--
ALTER TABLE `adminlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2890;
--
-- AUTO_INCREMENT de tabela `adminrecord`
--
ALTER TABLE `adminrecord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `apikeys`
--
ALTER TABLE `apikeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `article_comments`
--
ALTER TABLE `article_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `assists`
--
ALTER TABLE `assists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT de tabela `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `bizz`
--
ALTER TABLE `bizz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de tabela `bizzmods`
--
ALTER TABLE `bizzmods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `connections`
--
ALTER TABLE `connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1575;
--
-- AUTO_INCREMENT de tabela `contract`
--
ALTER TABLE `contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `efurniture`
--
ALTER TABLE `efurniture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `email_tokens`
--
ALTER TABLE `email_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `factionlog`
--
ALTER TABLE `factionlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `factions`
--
ALTER TABLE `factions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de tabela `fuel`
--
ALTER TABLE `fuel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de tabela `furniture`
--
ALTER TABLE `furniture`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;
--
-- AUTO_INCREMENT de tabela `fveh`
--
ALTER TABLE `fveh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT de tabela `garages`
--
ALTER TABLE `garages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `hfurniture`
--
ALTER TABLE `hfurniture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de tabela `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT de tabela `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `interiors`
--
ALTER TABLE `interiors`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT de tabela `masters`
--
ALTER TABLE `masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT de tabela `mdc`
--
ALTER TABLE `mdc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de tabela `mdcassociatedcasefiles`
--
ALTER TABLE `mdcassociatedcasefiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mdccasefileevidence`
--
ALTER TABLE `mdccasefileevidence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mdccasefiles`
--
ALTER TABLE `mdccasefiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mdccasefilescharges`
--
ALTER TABLE `mdccasefilescharges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mdcnavbar`
--
ALTER TABLE `mdcnavbar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mdcpersonsdb`
--
ALTER TABLE `mdcpersonsdb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mdcpersonslog`
--
ALTER TABLE `mdcpersonslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mdcpersonslogchanges`
--
ALTER TABLE `mdcpersonslogchanges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mdcsettings`
--
ALTER TABLE `mdcsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `motel`
--
ALTER TABLE `motel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT de tabela `namechanges`
--
ALTER TABLE `namechanges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de tabela `phonecontacts`
--
ALTER TABLE `phonecontacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de tabela `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT de tabela `pm`
--
ALTER TABLE `pm`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `rentals`
--
ALTER TABLE `rentals`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `saspinactivityreports`
--
ALTER TABLE `saspinactivityreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `sasplog`
--
ALTER TABLE `sasplog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `saspsettings`
--
ALTER TABLE `saspsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `saspsituationreports`
--
ALTER TABLE `saspsituationreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de tabela `staffstats`
--
ALTER TABLE `staffstats`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `staffstatsmonths`
--
ALTER TABLE `staffstatsmonths`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `storedarmor`
--
ALTER TABLE `storedarmor`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `svrchangelogs`
--
ALTER TABLE `svrchangelogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `tbans`
--
ALTER TABLE `tbans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `teamspeakchannels`
--
ALTER TABLE `teamspeakchannels`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `tickets_posts`
--
ALTER TABLE `tickets_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `toys`
--
ALTER TABLE `toys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de tabela `traders`
--
ALTER TABLE `traders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpaccesslog`
--
ALTER TABLE `ucpaccesslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpacpfeed`
--
ALTER TABLE `ucpacpfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpbugcomments`
--
ALTER TABLE `ucpbugcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpbugs`
--
ALTER TABLE `ucpbugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpchangelogs`
--
ALTER TABLE `ucpchangelogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpdelete`
--
ALTER TABLE `ucpdelete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpfaq`
--
ALTER TABLE `ucpfaq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpfriends`
--
ALTER TABLE `ucpfriends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpip`
--
ALTER TABLE `ucpip`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucplog`
--
ALTER TABLE `ucplog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpnews`
--
ALTER TABLE `ucpnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpnotices`
--
ALTER TABLE `ucpnotices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpnotifications`
--
ALTER TABLE `ucpnotifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpplayerscron`
--
ALTER TABLE `ucpplayerscron`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpquizapps`
--
ALTER TABLE `ucpquizapps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpquizquestions`
--
ALTER TABLE `ucpquizquestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucpsettings`
--
ALTER TABLE `ucpsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucptickets`
--
ALTER TABLE `ucptickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ucp_posts`
--
ALTER TABLE `ucp_posts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de tabela `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `weaponlicenses`
--
ALTER TABLE `weaponlicenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `weaponrefunds`
--
ALTER TABLE `weaponrefunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT de tabela `weed`
--
ALTER TABLE `weed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
