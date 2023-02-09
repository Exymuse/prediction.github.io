-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2023 at 07:56 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nandoor`
--

-- --------------------------------------------------------

--
-- Table structure for table `master_province`
--

CREATE TABLE `master_province` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_province`
--

INSERT INTO `master_province` (`id`, `name`, `latitude`, `longitude`, `date_create`, `status`) VALUES
(1, 'Daerah Istimewa Aceh', 4.000000000000057, 97.00000000000006, '2022-05-31 07:30:38', 1),
(2, 'Sumatera Utara', 2.184782003000066, 99.05788490400005, '2022-05-17 16:16:05', 1),
(3, 'Sumatera Barat', -0.8522741819999737, 100.46646807500008, '2022-05-17 16:02:50', 0),
(4, 'Riau', 0.5105287110000631, 101.81288489000008, '2022-06-07 09:17:03', 0),
(5, 'Jambi', -1.617809999999963, 103.59924000000007, '2022-06-07 09:16:44', 0),
(6, 'Sumatera Selatan', -3.2133205179999322, 104.17031431400005, '2022-06-07 09:17:23', 0),
(7, 'Bengkulu', -3.791159999999934, 102.26312000000007, '2022-06-07 09:17:34', 0),
(8, 'Lampung', -4.910359820532264, 105.1226806640625, '2022-06-07 09:17:45', 0),
(9, 'Kepulauan Bangka Belitung', -2.252956410999957, 105.98694808200008, '2022-06-07 08:44:08', 0),
(10, 'Kepulauan Riau', 3.9159472360000223, 108.20222888600006, '2022-06-07 09:19:33', 0),
(11, 'Jawa Barat', -6.919958632999965, 107.60276787200007, '2022-06-07 20:57:28', 0),
(12, 'Jawa Tengah, Central Java', -7.499999999999943, 110.00000000000006, '2022-06-07 20:57:55', 0),
(13, 'DI Yogyakarta', -7.89501364399996, 110.44536739700004, '2022-06-07 20:58:14', 0),
(14, 'Jawa Timur, East Java', -7.739399999999932, 112.50990000000002, '2022-06-07 20:58:33', 0),
(15, 'Banten', -6.456166810999946, 106.10922386400006, '2022-06-07 20:59:57', 0),
(16, 'Bali', -8.369774965999966, 115.13165412100011, '2022-06-07 21:00:19', 0),
(17, 'Nusa Tenggara Barat', -8.606652087999976, 117.50686241000005, '2022-06-07 21:01:06', 0),
(18, 'Nusa Tenggara Timur', -8.604843331999973, 121.14182916800007, '2022-06-07 21:01:24', 0),
(19, 'Kalimantan Barat', -0.08562324899997975, 111.12133073700005, '2022-06-07 21:01:39', 0),
(20, 'Kalimantan Tengah', -1.6017787029999795, 113.41641285600008, '2022-06-07 21:02:21', 0),
(21, 'Kalimantan Selatan', -2.9985717719999343, 115.44085439500009, '2022-06-07 21:02:38', 0),
(22, 'Kalimantan Timur', 0.46212252700001955, 116.47014484200008, '2022-06-07 21:02:54', 0),
(23, 'Kalimantan Utara', 2.8969571910000695, 116.2212790860001, '2022-06-07 21:03:07', 0),
(24, 'Sulawesi Utara', 1.2861024470000757, 124.53540173300007, '2022-06-07 21:04:00', 0),
(25, 'Sulawesi Tengah', -1.4592149539999468, 120.44959250000011, '2022-06-07 21:04:15', 0),
(26, 'Sulawesi Selatan', -3.762976225999978, 120.14014669800008, '2022-06-07 21:04:32', 0),
(27, 'Sulawesi Tenggara', -4.132804016999955, 122.07867804700004, '2022-06-07 21:04:50', 0),
(28, 'Gorontalo', 0.5370700000000284, 123.06184000000007, '2022-06-07 21:05:04', 0),
(29, 'Sulawesi Barat', -2.4619026169999643, 119.34347117100003, '2022-06-07 21:05:24', 0),
(30, 'Maluku', -5.780596057404711, 132.73887634277347, '2022-06-08 18:37:14', 0),
(31, 'Maluku Utara', 0.8693389330000514, 128.0159293800001, '2022-06-07 21:05:59', 0),
(32, 'Papua Barat', -2.041723074999936, 132.96834145600008, '2022-06-07 21:06:20', 0),
(33, 'Papua', -4.668250318999981, 138.69374323500006, '2022-06-07 21:06:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_user`
--

CREATE TABLE `master_user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','USER') NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_user`
--

INSERT INTO `master_user` (`id`, `email`, `username`, `password`, `role`, `create_date`, `create_by`, `status`) VALUES
(1, 'admin@nandoor.id', 'admin', 'admin', 'ADMIN', '2022-06-01 19:48:22', 'admin', 1),
(2, 'user@mail', 'user', 'user', 'USER', '2022-06-01 19:48:51', 'admin', 1),
(3, 'jono@mail', 'jono', 'jono', 'ADMIN', '2022-05-15 16:00:43', 'admin', 0),
(4, 'user2@mail', 'user2', 'user2', 'USER', '2022-07-18 07:41:41', 'admin', 0),
(5, 'admin1@mail', 'admin1', 'admin1', 'ADMIN', '2022-07-18 07:42:00', 'admin', 0),
(6, 'user3@mail', 'user3', 'user3', 'USER', '2022-07-18 07:42:19', 'admin', 0),
(40, 'tes2@mai.com', 'tes2', 'tes2', 'ADMIN', '2022-07-18 07:43:04', 'admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `year` year(4) NOT NULL,
  `province_id` int(11) NOT NULL,
  `production` int(21) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`year`, `province_id`, `production`, `date_create`, `status`) VALUES
(2013, 1, 48282, '2022-06-07 22:14:16', 0),
(2013, 2, 58345, '2022-06-07 08:47:59', 0),
(2013, 3, 32559, '2022-06-07 08:48:41', 0),
(2013, 4, 2601, '2022-06-07 08:48:57', 0),
(2013, 5, 13326, '2022-06-07 08:49:16', 0),
(2013, 6, 139754, '2022-06-07 08:49:29', 0),
(2013, 7, 56450, '2022-06-07 08:47:40', 0),
(2013, 8, 127073, '2022-06-07 08:50:09', 0),
(2013, 9, 3, '2022-06-07 21:10:36', 0),
(2013, 10, 3, '2022-06-07 22:14:49', 1),
(2013, 11, 16654, '2022-06-07 21:54:10', 1),
(2013, 12, 20313, '2022-06-07 21:54:31', 1),
(2013, 13, 736, '2022-06-07 21:55:08', 1),
(2013, 14, 56986, '2022-06-07 21:56:57', 1),
(2013, 15, 2608, '2022-06-07 21:57:09', 1),
(2013, 16, 17331, '2022-06-07 21:57:22', 1),
(2013, 17, 4312, '2022-06-07 21:58:15', 1),
(2013, 18, 21801, '2022-06-07 21:58:39', 1),
(2013, 19, 3841, '2022-06-07 21:59:00', 1),
(2013, 20, 825, '2022-06-07 21:59:20', 1),
(2013, 21, 1385, '2022-06-07 21:59:58', 1),
(2013, 22, 1365, '2022-06-07 22:00:16', 1),
(2013, 23, 0, '2022-06-15 08:12:50', 1),
(2013, 24, 3023, '2022-06-07 22:09:21', 1),
(2013, 25, 3164, '2022-06-07 22:10:41', 1),
(2013, 26, 30239, '2022-06-07 22:11:40', 1),
(2013, 27, 2868, '2022-06-07 22:11:57', 1),
(2013, 28, 826, '2022-06-07 22:12:29', 1),
(2013, 29, 6779, '2022-06-07 22:13:03', 1),
(2013, 30, 402, '2022-06-07 22:13:14', 1),
(2013, 31, 427, '2022-06-07 22:13:29', 1),
(2013, 32, 128, '2022-06-07 22:13:37', 1),
(2013, 33, 1472, '2022-06-07 22:13:47', 1),
(2014, 1, 49823, '2022-06-07 08:45:01', 0),
(2014, 2, 58951, '2022-06-07 08:50:40', 0),
(2014, 3, 33557, '2022-06-07 08:50:51', 0),
(2014, 4, 2465, '2022-06-07 08:51:02', 0),
(2014, 5, 13583, '2022-06-07 08:51:26', 0),
(2014, 6, 135287, '2022-06-07 08:51:38', 0),
(2014, 7, 56460, '2022-06-07 08:51:55', 0),
(2014, 8, 92111, '2022-06-07 22:24:36', 0),
(2014, 9, 4, '2022-06-07 22:24:53', 0),
(2014, 10, 1, '2022-06-07 21:43:31', 1),
(2014, 11, 17532, '2022-06-07 22:16:25', 1),
(2014, 12, 24883, '2022-06-07 22:16:48', 1),
(2014, 13, 441, '2022-06-07 22:17:49', 1),
(2014, 14, 58135, '2022-06-07 22:18:17', 1),
(2014, 15, 2511, '2022-06-07 22:18:25', 1),
(2014, 16, 15920, '2022-06-07 22:18:54', 1),
(2014, 17, 4818, '2022-06-07 22:19:05', 1),
(2014, 18, 21508, '2022-06-07 22:19:15', 1),
(2014, 19, 3720, '2022-06-07 22:19:25', 1),
(2014, 20, 371, '2022-06-07 22:19:34', 1),
(2014, 21, 1284, '2022-06-07 22:19:42', 1),
(2014, 22, 562, '2022-06-07 22:19:52', 1),
(2014, 23, 306, '2022-06-07 22:20:05', 1),
(2014, 24, 2993, '2022-06-07 22:20:14', 1),
(2014, 25, 3572, '2022-06-07 22:20:25', 1),
(2014, 26, 30107, '2022-06-07 22:20:37', 1),
(2014, 27, 2921, '2022-06-07 22:20:46', 1),
(2014, 28, 954, '2022-06-07 22:20:56', 1),
(2014, 29, 6361, '2022-06-07 22:21:10', 1),
(2014, 30, 432, '2022-06-07 22:21:19', 1),
(2014, 31, 384, '2022-06-07 22:21:27', 1),
(2014, 32, 128, '2022-06-07 22:21:37', 1),
(2014, 33, 1771, '2022-06-07 22:22:30', 1),
(2015, 1, 47444, '2022-06-07 08:45:17', 0),
(2015, 2, 60194, '2022-06-07 08:53:09', 0),
(2015, 3, 34059, '2022-06-07 08:53:25', 0),
(2015, 4, 2843, '2022-06-07 08:54:20', 0),
(2015, 5, 13447, '2022-06-07 08:54:37', 0),
(2015, 6, 110352, '2022-06-07 08:54:53', 0),
(2015, 7, 56556, '2022-06-07 08:55:26', 0),
(2015, 8, 110318, '2022-06-07 08:55:56', 0),
(2015, 9, 3, '2022-06-07 22:29:34', 1),
(2015, 10, 0, '2022-06-15 08:08:18', 1),
(2015, 11, 17461, '2022-06-07 22:44:30', 1),
(2015, 12, 22790, '2022-06-07 22:44:45', 1),
(2015, 13, 441, '2022-06-07 22:49:05', 1),
(2015, 14, 65961, '2022-06-07 22:49:28', 1),
(2015, 15, 2551, '2022-06-07 22:50:58', 1),
(2015, 16, 17345, '2022-06-07 22:51:05', 1),
(2015, 17, 4637, '2022-06-07 22:51:16', 1),
(2015, 18, 21324, '2022-06-07 22:51:24', 1),
(2015, 19, 3790, '2022-06-07 22:51:37', 1),
(2015, 20, 416, '2022-06-07 22:51:47', 1),
(2015, 21, 1840, '2022-06-07 22:51:59', 1),
(2015, 22, 399, '2022-06-07 22:52:52', 1),
(2015, 23, 547, '2022-06-07 22:52:40', 1),
(2015, 24, 3044, '2022-06-07 22:53:03', 1),
(2015, 25, 3070, '2022-06-07 22:53:19', 1),
(2015, 26, 30548, '2022-06-07 22:53:37', 1),
(2015, 27, 3072, '2022-06-07 22:53:45', 1),
(2015, 28, 474, '2022-06-07 22:53:57', 1),
(2015, 29, 1854, '2022-06-07 22:54:08', 1),
(2015, 30, 448, '2022-06-07 22:54:18', 1),
(2015, 31, 133, '2022-06-07 22:54:30', 1),
(2015, 32, 33, '2022-06-07 22:54:40', 1),
(2015, 33, 2018, '2022-06-07 22:54:49', 1),
(2016, 1, 65231, '2022-06-07 08:46:20', 0),
(2016, 2, 65926, '2022-06-07 22:56:26', 1),
(2016, 3, 22771, '2022-06-07 22:56:39', 1),
(2016, 4, 2782, '2022-06-07 22:56:51', 1),
(2016, 5, 13395, '2022-06-07 22:57:06', 1),
(2016, 6, 120904, '2022-06-07 22:57:16', 1),
(2016, 7, 56968, '2022-06-07 22:57:45', 1),
(2016, 8, 115524, '2022-06-07 22:57:59', 1),
(2016, 9, 3, '2022-06-07 22:58:06', 1),
(2016, 10, 0, '2022-06-15 08:15:09', 1),
(2016, 11, 17684, '2022-06-07 22:58:19', 1),
(2016, 12, 18911, '2022-06-07 22:58:28', 1),
(2016, 13, 465, '2022-06-07 22:58:40', 1),
(2016, 14, 63568, '2022-06-07 22:58:50', 1),
(2016, 15, 1770, '2022-06-07 22:59:01', 1),
(2016, 16, 17165, '2022-06-07 22:59:11', 1),
(2016, 17, 4641, '2022-06-07 22:59:21', 1),
(2016, 18, 22335, '2022-06-07 22:59:30', 1),
(2016, 19, 3736, '2022-06-07 22:59:40', 1),
(2016, 20, 472, '2022-06-07 22:59:51', 1),
(2016, 21, 1929, '2022-06-07 22:59:59', 1),
(2016, 22, 392, '2022-06-07 23:01:15', 1),
(2016, 23, 276, '2022-06-07 23:01:32', 1),
(2016, 24, 3291, '2022-06-07 23:01:45', 1),
(2016, 25, 2927, '2022-06-07 23:02:01', 1),
(2016, 26, 31901, '2022-06-07 23:02:14', 1),
(2016, 27, 2677, '2022-06-07 23:02:24', 1),
(2016, 28, 182, '2022-06-07 23:02:34', 1),
(2016, 29, 3152, '2022-06-07 23:02:44', 1),
(2016, 30, 411, '2022-06-07 23:02:53', 1),
(2016, 31, 83, '2022-06-07 23:03:06', 1),
(2016, 32, 128, '2022-06-07 23:03:15', 1),
(2016, 33, 2271, '2022-06-07 23:03:25', 1),
(2017, 1, 68507, '2022-06-07 08:46:58', 0),
(2017, 2, 66044, '2022-06-07 23:05:05', 1),
(2017, 3, 21799, '2022-06-07 23:05:21', 1),
(2017, 4, 2913, '2022-06-07 23:05:31', 1),
(2017, 5, 14034, '2022-06-07 23:06:34', 1),
(2017, 6, 120792, '2022-06-07 23:06:02', 1),
(2017, 7, 59575, '2022-06-07 23:13:52', 1),
(2017, 8, 116345, '2022-06-07 23:07:03', 1),
(2017, 9, 3, '2022-06-07 23:07:17', 1),
(2017, 11, 16760, '2022-06-07 23:07:32', 1),
(2017, 12, 18665, '2022-06-07 23:07:47', 1),
(2017, 13, 485, '2022-06-07 23:08:41', 1),
(2017, 14, 65027, '2022-06-07 23:08:51', 1),
(2017, 15, 1874, '2022-06-07 23:08:59', 1),
(2017, 16, 17315, '2022-06-07 23:09:06', 1),
(2017, 17, 4752, '2022-06-07 23:10:12', 1),
(2017, 18, 22143, '2022-06-07 23:10:20', 1),
(2017, 19, 3925, '2022-06-07 23:10:29', 1),
(2017, 20, 493, '2022-06-07 23:15:43', 1),
(2017, 21, 2035, '2022-06-07 23:10:46', 1),
(2017, 22, 409, '2022-06-07 23:11:27', 1),
(2017, 23, 286, '2022-06-07 23:11:44', 1),
(2017, 24, 2934, '2022-06-07 23:11:53', 1),
(2017, 25, 3065, '2022-06-07 23:12:04', 1),
(2017, 26, 29767, '2022-06-07 23:12:13', 1),
(2017, 27, 2804, '2022-06-07 23:12:21', 1),
(2017, 28, 196, '2022-06-07 23:12:30', 1),
(2017, 29, 3107, '2022-06-07 23:12:50', 1),
(2017, 30, 430, '2022-06-07 23:12:58', 1),
(2017, 31, 87, '2022-06-07 23:13:09', 1),
(2017, 32, 112, '2022-06-07 23:13:19', 1),
(2017, 33, 1991, '2022-06-07 23:13:28', 1),
(2018, 1, 70774, '2022-06-07 23:19:59', 1),
(2018, 2, 71023, '2022-06-07 23:20:09', 1),
(2018, 3, 18452, '2022-06-07 23:20:18', 1),
(2018, 4, 3029, '2022-06-07 23:20:30', 1),
(2018, 5, 15461, '2022-06-07 23:20:47', 1),
(2018, 6, 193507, '2022-06-07 23:21:02', 1),
(2018, 7, 60346, '2022-06-07 23:22:17', 1),
(2018, 8, 110597, '2022-06-07 23:22:25', 1),
(2018, 9, 9, '2022-06-07 23:21:10', 1),
(2018, 11, 21119, '2022-06-07 23:22:32', 1),
(2018, 12, 23686, '2022-06-07 23:22:48', 1),
(2018, 13, 483, '2022-06-07 23:22:54', 1),
(2018, 14, 64529, '2022-06-07 23:23:03', 1),
(2018, 15, 2564, '2022-06-07 23:22:40', 1),
(2018, 16, 15243, '2022-06-07 23:23:09', 1),
(2018, 17, 5058, '2022-06-07 23:23:16', 1),
(2018, 18, 23737, '2022-06-07 23:23:22', 1),
(2018, 19, 3617, '2022-06-07 23:23:30', 1),
(2018, 20, 397, '2022-06-07 23:23:36', 1),
(2018, 21, 1517, '2022-06-07 23:23:46', 1),
(2018, 22, 297, '2022-06-07 23:23:54', 1),
(2018, 23, 173, '2022-06-07 23:24:07', 1),
(2018, 24, 3892, '2022-06-07 23:24:14', 1),
(2018, 25, 2817, '2022-06-07 23:24:28', 1),
(2018, 26, 34716, '2022-06-07 23:24:37', 1),
(2018, 27, 2492, '2022-06-07 23:24:57', 1),
(2018, 28, 165, '2022-06-07 23:24:22', 1),
(2018, 29, 3198, '2022-06-07 23:24:47', 1),
(2018, 30, 400, '2022-06-07 23:25:05', 1),
(2018, 31, 10, '2022-06-07 23:25:13', 1),
(2018, 32, 1, '2022-06-07 23:25:35', 1),
(2018, 33, 2742, '2022-06-07 23:25:28', 1),
(2019, 1, 72652, '2022-06-07 23:26:17', 1),
(2019, 2, 74922, '2022-06-07 23:26:32', 1),
(2019, 3, 15316, '2022-06-07 23:26:45', 1),
(2019, 4, 2588, '2022-06-07 23:26:52', 1),
(2019, 5, 16393, '2022-06-07 23:27:02', 1),
(2019, 6, 191081, '2022-06-07 23:27:10', 1),
(2019, 7, 62567, '2022-07-21 20:49:53', 1),
(2019, 8, 117111, '2022-06-07 23:27:34', 1),
(2019, 9, 11, '2022-06-07 23:27:19', 1),
(2019, 11, 21014, '2022-06-07 23:27:43', 1),
(2019, 12, 24732, '2022-06-07 23:27:59', 1),
(2019, 13, 513, '2022-06-07 23:28:11', 1),
(2019, 14, 49157, '2022-06-07 23:29:10', 1),
(2019, 15, 2558, '2022-06-07 23:27:51', 1),
(2019, 16, 15255, '2022-06-07 23:28:30', 1),
(2019, 17, 5369, '2022-06-07 23:30:20', 1),
(2019, 18, 24088, '2022-06-07 23:30:27', 1),
(2019, 19, 3802, '2022-06-07 23:30:35', 1),
(2019, 20, 405, '2022-06-07 23:30:47', 1),
(2019, 21, 1349, '2022-06-07 23:30:55', 1),
(2019, 22, 224, '2022-06-07 23:31:13', 1),
(2019, 23, 174, '2022-06-07 23:31:23', 1),
(2019, 24, 3730, '2022-06-07 23:31:35', 1),
(2019, 25, 2588, '2022-06-07 23:31:53', 1),
(2019, 26, 34665, '2022-06-07 23:32:01', 1),
(2019, 27, 2765, '2022-06-07 23:32:19', 1),
(2019, 28, 139, '2022-06-07 23:31:43', 1),
(2019, 29, 4132, '2022-06-07 23:32:09', 1),
(2019, 30, 411, '2022-06-07 23:32:30', 1),
(2019, 31, 14, '2022-06-07 23:32:39', 1),
(2019, 32, 1, '2022-06-07 23:32:54', 1),
(2019, 33, 2789, '2022-06-07 23:32:47', 1),
(2020, 1, 126289, '2022-06-07 23:36:44', 1),
(2020, 3, 25358, '2022-06-07 23:37:06', 1),
(2020, 4, 4213, '2022-06-07 23:37:17', 1),
(2020, 5, 30603, '2022-06-07 23:37:34', 1),
(2020, 6, 250305, '2022-06-07 23:37:41', 1),
(2020, 7, 85702, '2022-06-07 23:37:57', 1),
(2020, 8, 156460, '2022-06-07 23:38:04', 1),
(2020, 9, 111, '2022-06-07 23:37:49', 1),
(2020, 10, 19, '2022-06-07 23:37:26', 1),
(2020, 11, 49825, '2022-06-07 23:38:11', 1),
(2020, 12, 47757, '2022-06-07 23:38:28', 1),
(2020, 13, 1728, '2022-06-07 23:39:32', 1),
(2020, 14, 90735, '2022-06-07 23:39:41', 1),
(2020, 15, 6233, '2022-06-07 23:38:20', 1),
(2020, 16, 34746, '2022-06-07 23:39:48', 1),
(2020, 17, 13365, '2022-06-07 23:39:56', 1),
(2020, 18, 72919, '2022-06-07 23:40:03', 1),
(2020, 19, 11904, '2022-06-07 23:40:16', 1),
(2020, 20, 2490, '2022-06-07 23:40:27', 1),
(2020, 21, 2928, '2022-06-07 23:40:38', 1),
(2020, 22, 2088, '2022-06-07 23:40:49', 1),
(2020, 23, 1293, '2022-06-07 23:41:05', 1),
(2020, 24, 7834, '2022-06-07 23:41:11', 1),
(2020, 25, 10191, '2022-06-07 23:41:25', 1),
(2020, 26, 79393, '2022-06-07 23:41:33', 1),
(2020, 27, 8521, '2022-06-07 23:42:06', 1),
(2020, 28, 1437, '2022-06-07 23:41:18', 1),
(2020, 29, 16272, '2022-06-07 23:42:19', 1),
(2020, 30, 1262, '2022-06-07 23:42:42', 1),
(2020, 31, 414, '2022-06-07 23:42:48', 1),
(2020, 32, 206, '2022-06-07 23:43:04', 1),
(2020, 33, 12375, '2022-06-07 23:42:57', 1),
(2021, 1, 126490, '2022-06-07 23:44:42', 1),
(2021, 2, 95680, '2022-06-07 23:44:52', 1),
(2021, 3, 24400, '2022-06-07 23:44:58', 1),
(2021, 4, 4197, '2022-06-07 23:45:05', 1),
(2021, 5, 30750, '2022-06-07 23:45:23', 1),
(2021, 6, 251529, '2022-06-07 23:45:29', 1),
(2021, 7, 85284, '2022-06-07 23:46:18', 1),
(2021, 8, 156396, '2022-06-07 23:46:25', 1),
(2021, 9, 222, '2022-06-07 23:45:45', 1),
(2021, 10, 22, '2022-06-07 23:45:14', 1),
(2021, 11, 50588, '2022-06-07 23:46:32', 1),
(2021, 12, 49397, '2022-06-07 23:46:56', 1),
(2021, 13, 1726, '2022-06-07 23:47:05', 1),
(2021, 14, 91005, '2022-06-07 23:47:14', 1),
(2021, 15, 6237, '2022-06-07 23:46:49', 1),
(2021, 16, 34051, '2022-06-07 23:47:21', 1),
(2021, 17, 14268, '2022-06-07 23:47:29', 1),
(2021, 18, 80743, '2022-06-07 23:47:35', 1),
(2021, 19, 11852, '2022-06-07 23:47:43', 1),
(2021, 20, 2649, '2022-06-07 23:47:53', 1),
(2021, 21, 2855, '2022-06-07 23:48:06', 1),
(2021, 22, 1957, '2022-06-07 23:48:13', 1),
(2021, 23, 1028, '2022-06-07 23:48:25', 1),
(2021, 24, 8018, '2022-06-07 23:49:54', 1),
(2021, 25, 10340, '2022-06-07 23:50:13', 1),
(2021, 26, 76687, '2022-06-07 23:50:24', 1),
(2021, 27, 8615, '2022-06-07 23:51:09', 1),
(2021, 28, 1425, '2022-06-07 23:50:05', 1),
(2021, 29, 16240, '2022-06-07 23:50:35', 1),
(2021, 30, 1265, '2022-06-07 23:51:20', 1),
(2021, 31, 404, '2022-06-07 23:51:28', 1),
(2021, 32, 213, '2022-06-07 23:51:46', 1),
(2021, 33, 12445, '2022-06-07 23:51:36', 1),
(2022, 1, 127464, '2022-06-07 23:53:15', 1),
(2022, 2, 96365, '2022-06-07 23:53:31', 1),
(2022, 3, 25594, '2022-06-07 23:53:39', 1),
(2022, 4, 4253, '2022-06-07 23:53:48', 1),
(2022, 5, 30888, '2022-06-07 23:54:03', 1),
(2022, 6, 252634, '2022-06-07 23:54:10', 1),
(2022, 7, 86499, '2022-06-07 23:54:25', 1),
(2022, 8, 157915, '2022-06-07 23:54:32', 1),
(2022, 9, 112, '2022-06-07 23:54:19', 1),
(2022, 10, 20, '2022-06-07 23:53:55', 1),
(2022, 11, 50289, '2022-06-07 23:55:12', 1),
(2022, 12, 48201, '2022-06-07 23:55:29', 1),
(2022, 13, 1744, '2022-06-07 23:55:38', 1),
(2022, 14, 92195, '2022-06-07 23:55:46', 1),
(2022, 15, 6291, '2022-06-07 23:55:19', 1),
(2022, 16, 35069, '2022-06-07 23:55:53', 1),
(2022, 17, 13490, '2022-06-07 23:56:01', 1),
(2022, 18, 73598, '2022-06-07 23:56:09', 1),
(2022, 19, 12015, '2022-06-07 23:56:15', 1),
(2022, 20, 2514, '2022-06-07 23:56:25', 1),
(2022, 21, 2955, '2022-06-07 23:56:35', 1),
(2022, 22, 2107, '2022-06-07 23:56:45', 1),
(2022, 23, 1305, '2022-06-07 23:56:56', 1),
(2022, 24, 7907, '2022-06-07 23:57:06', 1),
(2022, 25, 10286, '2022-06-07 23:57:29', 1),
(2022, 26, 80132, '2022-06-07 23:57:37', 1),
(2022, 27, 8600, '2022-06-07 23:57:59', 1),
(2022, 28, 1450, '2022-06-07 23:57:16', 1),
(2022, 29, 16423, '2022-06-07 23:57:45', 1),
(2022, 30, 1274, '2022-06-07 23:58:08', 1),
(2022, 31, 418, '2022-06-07 23:58:17', 1),
(2022, 32, 207, '2022-06-07 23:58:32', 1),
(2022, 33, 12379, '2022-06-07 23:58:25', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_province`
--
ALTER TABLE `master_province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_user`
--
ALTER TABLE `master_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`year`,`province_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_province`
--
ALTER TABLE `master_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `master_user`
--
ALTER TABLE `master_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
