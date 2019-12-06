-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Dez-2019 às 22:30
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nekoapp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `busca_recente`
--

CREATE TABLE `busca_recente` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `busca` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ativo` int(11) NOT NULL,
  `idquem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idpost` int(11) NOT NULL,
  `datec` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem_server`
--

CREATE TABLE `mensagem_server` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_server` int(11) NOT NULL,
  `mensagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mensagem_server`
--

INSERT INTO `mensagem_server` (`id`, `id_user`, `id_server`, `mensagem`) VALUES
(2, 5, 15, 'Oi meu'),
(3, 3, 15, 'Oi anelise'),
(4, 3, 15, 'tudo bom?'),
(5, 5, 15, 'Tudo e vc? Está kkkkkkkķnjhshdisishevheieodhrveheheieikejsbsbsheuieiekejshbegwuwisihwhwhwh'),
(6, 3, 15, 'uhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsahuduhuhdsa'),
(11, 8, 16, 'gdgdf'),
(12, 4, 17, 'E ai'),
(34, 10, 20, 'ola'),
(35, 4, 20, 'E ai azor'),
(36, 4, 20, 'Curti seu server'),
(37, 4, 20, 'Podes ver que tens um icone em cima da sua foto de perfil'),
(38, 4, 20, 'Isso indicia que vc é dono do server'),
(39, 9, 20, 'Eae azor ja tem o server que vc sempre sonhou'),
(40, 10, 20, 'a sim'),
(41, 4, 20, 'Tão vendo, que é em tempo real as paradas?'),
(42, 10, 20, 'essas msg são automaticas ? kk'),
(43, 4, 20, 'kkk'),
(44, 4, 20, 'É meio travadinho ainda'),
(45, 4, 20, 'Mas da para melhorar'),
(46, 10, 20, 'não ta bom, não da pra perceber kk'),
(47, 9, 20, ':L'),
(48, 4, 20, 'Vou por comandos'),
(49, 4, 20, 'Tipo /clear'),
(50, 10, 20, 'daora o projeto mano'),
(51, 9, 20, '/clear /ban  /kick'),
(52, 4, 20, 'ss'),
(53, 10, 20, 'quando pudermos conversar daquele outro projeto la me chama, mas sucesso ai brother. Tu é foda como programador'),
(54, 4, 20, 'Blz, valeu'),
(59, 4, 15, '/clear'),
(64, 4, 1, 'As mensagems foram apagadas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `postagem`
--

CREATE TABLE `postagem` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `texto` text COLLATE utf8_unicode_ci NOT NULL,
  `datec` date NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server`
--

CREATE TABLE `server` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `server`
--

INSERT INTO `server` (`id`, `name`, `owner`, `imagem`) VALUES
(1, 'Global', 4, 'https://logodownload.org/wp-content/uploads/2017/11/discord-logo-icone.png'),
(14, 'XandeCo', 4, ''),
(15, 'Meu', 5, ''),
(16, 'tete', 8, ''),
(17, 'testeee', 8, ''),
(18, '', 9, ''),
(19, 'kk', 9, ''),
(20, 'Azor Server', 10, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `idcry` varchar(2551) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nome` text COLLATE utf8_unicode_ci NOT NULL,
  `admin` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `config` int(11) NOT NULL,
  `avatar` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `idcry`, `email`, `senha`, `nome`, `admin`, `status`, `config`, `avatar`) VALUES
(1, 'fc0f7ac1def4240ba5a77a0b1348191f60dbc309', 'thekaway404@gmail.com', 'a0b48bf6735b085374fa984535372a8025210e45', 'Alexandre Silva', 0, 1, 0, ''),
(2, '613f112a36c9057fbb19ff2d2ff26cd884fadf15', 'smollhtml1996@gmail.com', '5880194514ce16c17526bfcae48e784088997e32', 'Richard Silva', 0, 1, 0, ''),
(3, 'dfd22d81d69d38cc3026a4ef11517a41341c7ed1', 'xande@hotmail.com', 'a0b48bf6735b085374fa984535372a8025210e45', 'Alexandre Silva', 0, 1, 0, ''),
(4, 'ee4d948890afd75b72c3863ae45ddad93a6577cf', 'xande1231231@hotmail.com', 'a0b48bf6735b085374fa984535372a8025210e45', 'Alexandre Silva', 0, 1, 0, ''),
(5, '87da29302b2c46e12b4b64856cb32eb87bae1f0f', 'anelisenaiara@gmail.com', 'a873d476f684dd7a02e0ff310c060f547e3b1459', 'Anelise Naiara', 0, 1, 0, ''),
(6, '6bc86383d9369ba9e85855eae96ebcc7c9551014', 'dsfsd', '27939c7ff0111bb70705a2781915ffd3d0d809c9', 'fsdfsdfsd fsdfsd', 0, 0, 0, ''),
(7, 'd7d4a5945417d23647416344b56bccc1adb6240d', 'dsfsdfsdsf@gmail.com', '2e6f9b0d5885b6010f9167787445617f553a735f', 'teste teste', 0, 0, 0, ''),
(8, 'c1118c54758b09ddfa8ae6c84386ba5e05c4bec0', 'luisfelipepoint@gmail.com', '21f811b181c75e43f9493d2a7bf35f4820550793', 'luis felipe', 0, 1, 0, ''),
(9, '15e7b626023e92812e2f537b68f131148a1f399e', 'nerdspirit2k19@gmail.com', '0cecea31958d95701975514ad427c54d07fb579a', 'Rullez WC', 0, 1, 0, ''),
(10, '847163ec8bdcb3d003298aafca4e425f0274ade9', 'artefinal@ph2grafica.com.br', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'Azor Ahai', 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `verificar`
--

CREATE TABLE `verificar` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ativo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `verificar`
--

INSERT INTO `verificar` (`id`, `iduser`, `code`, `ativo`) VALUES
(1, 1, '63327', 1),
(2, 2, '29646', 1),
(3, 3, '10305', 1),
(4, 4, '48527', 1),
(5, 5, '88483', 1),
(6, 6, '66532', 1),
(7, 7, '72172', 1),
(8, 8, '37303', 1),
(9, 9, '79961', 1),
(10, 10, '34433', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `busca_recente`
--
ALTER TABLE `busca_recente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mensagem_server`
--
ALTER TABLE `mensagem_server`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `postagem`
--
ALTER TABLE `postagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `verificar`
--
ALTER TABLE `verificar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `busca_recente`
--
ALTER TABLE `busca_recente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mensagem_server`
--
ALTER TABLE `mensagem_server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de tabela `postagem`
--
ALTER TABLE `postagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `server`
--
ALTER TABLE `server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `verificar`
--
ALTER TABLE `verificar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
