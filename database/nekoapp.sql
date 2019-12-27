-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Dez-2019 às 19:45
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
  `mensagem` varchar(255) NOT NULL,
  `mencionar` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `msg`
--

CREATE TABLE `msg` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_quem` int(11) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `id_quem` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `ativo` int(11) NOT NULL,
  `aceito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'CS:GO', 1, 'https://img.quizur.com/f/img5c65856f53ad66.55801313.jpg?lastEdited=1550157170');

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
  `avatar` text COLLATE utf8_unicode_ci NOT NULL,
  `oque` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reputacao` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `idcry`, `email`, `senha`, `nome`, `admin`, `status`, `config`, `avatar`, `oque`, `reputacao`) VALUES
(1, 'ee4d948890afd75b72c3863ae45ddad93a6577cf', 'xande1231231@hotmail.com', 'a0b48bf6735b085374fa984535372a8025210e45', 'Alexandre Silva', 0, 1, 0, '', 'Aluno', 0),
(2, 'ee4d948890afd75b72c3863ae45ddad93a6577cf', 'pedro@hotmail.com', 'a0b48bf6735b085374fa984535372a8025210e45', 'Pedro Silva', 0, 1, 0, '', 'Professor', 0);

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
(10, 10, '34433', 1),
(11, 11, '78600', 1),
(12, 12, '68488', 1),
(13, 13, '9068', 1),
(14, 100001, '12388', 1),
(15, 100002, '66376', 1),
(16, 100003, '82401', 1),
(17, 100004, '99642', 1),
(18, 100005, '9917', 1),
(19, 100006, '76852', 1),
(20, 100007, '99555', 1),
(21, 100008, '94971', 1),
(22, 100009, '82519', 1),
(23, 100010, '45525', 1),
(24, 100011, '57703', 1),
(25, 100012, '48898', 1),
(26, 100013, '29973', 1),
(27, 100014, '12135', 1),
(28, 100015, '77411', 1),
(29, 100016, '83016', 1),
(30, 1, '53319', 1),
(31, 1, '78271', 1),
(32, 1, '77024', 1),
(33, 1, '83365', 1);

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
-- Índices para tabela `msg`
--
ALTER TABLE `msg`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `notifications`
--
ALTER TABLE `notifications`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `msg`
--
ALTER TABLE `msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `postagem`
--
ALTER TABLE `postagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `server`
--
ALTER TABLE `server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `verificar`
--
ALTER TABLE `verificar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
