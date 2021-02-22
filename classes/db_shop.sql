-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2021 at 07:11 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPass` varchar(32) NOT NULL,
  `lavel` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminUser`, `adminEmail`, `adminPass`, `lavel`) VALUES
(1, 'Kalani Nirasha Amarasinghe', 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(1, 'adidas'),
(2, 'Nike'),
(3, 'Boss'),
(4, 'Kingsley Ryan'),
(5, 'Gucci');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(1, 'Bags & Purses'),
(15, 'Hair Accessories'),
(16, 'Belts'),
(17, 'Hats & Caps'),
(18, 'Jewellery'),
(19, 'Watches'),
(20, 'Face Covering'),
(21, 'Ties'),
(22, 'Shoes'),
(23, 'Sunglasses'),
(24, 'Socks & Tights'),
(25, 'Scarves');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `address`, `city`, `country`, `zip`, `phone`, `email`, `pass`) VALUES
(1, 'Delwar J Imran', 'Malibagh, Dhaka', 'Dhaka', 'Bangladesh', '1219', '01974353555', 'monirdhk.it@gmail.com', '202cb962ac59075b964b07152d234b70'),
(2, 'Dilshan Dilanga', '152/17, Nugemulla , Rukmale , Pannipitiya.', 'Pannipitiya', 'sri lanka', '511', '0771621489', 'dilshanfernando738@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `cmrId`, `productId`, `productName`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(12, 1, 8, 'Vintage-inspired sunglasses with bridge logo', 1, 550, 'upload/pic-sun.png', '2018-03-02 12:29:03', 2),
(13, 19, 9, 'Gucci Women\'s watch', 3, 5000, 'upload/pic-u.jpg', '2018-03-02 12:29:03', 1),
(14, 2, 8, 'Vintage-inspired sunglasses with bridge logo', 2, 1100, 'upload/pic-sun.png', '2021-02-21 21:02:24', 0),
(15, 2, 7, 'Nike futura heritage cap in cream', 1, 880, 'upload/feature-pica.png', '2021-02-21 21:02:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `body` text NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `body`, `price`, `image`, `type`) VALUES
(1, '\r\nCasio G-Shock unisex digital watch', 4, 3, 'Watch by Casio\r\n\r\nModel number: GM-6900SCM-1ER\r\nTransparent strap \r\nSilver-tone bezel\r\nDate window \r\nDigital display\r\nPin-buckle fastening\r\nTwin keepers\r\n2ATM – water resistant to 20 metres (66 feet)\r\nSplash and rain-resistant \r\n2 years manufacturer warranty \r\nComes in a branded box\r\n\r\nBRAND\r\n\r\nWhen it comes to watches, Casio\'s are about as classic as they come. The Japanese brand’s range of watches pairs go-with-everything design with functionality – you remember the calculator tool, right? Keep it classic with the all-black digital option, or explore analogue styles updated with leather straps, date windows and gold-tone bezels.', 2500, 'upload/feature-pica.png', 0),
(2, 'Nike Hayward backpack in navy', 1, 2, 'Backpack by Nike\r\n\r\n<li>Two straps are better than one \r\n<li>Grab handl', 620.87, 'upload/feature-picb.png', 0),
(3, '    \r\n\r\nNike Accessories-  Baller Blkyellow', 18, 2, 'Nike Accessories | Baller Blkyellow\r\n', 220.97, 'upload/feature-picc.pmg', 0),
(4, 'Nike Watch', 19, 2, 'Watch by Nike\r\n\r\n<li>Let your wrist do the talking\r\n<li>Stainless-steel strap and case\r\n\r\n\r\n', 600, 'upload/feature-pick.png', 0),
(5, 'Chimes Authentic Crystals from Swarovski Designer Pendant', 18, 5, '<p>Crystal From Swarovski Made with Original Swarovski Elements. This Crystal pendant set is a Unique Love Heart Pendant Piece for the Special Lady Perfect for Modern style Latest Fashion looks Comes in Premium packaging box perfect for gifting. Valentines Special Gift Purpose Angel Wings Purple Heart Crystal Pendant Set.</p>\r\n', 550, 'upload/feture-pici.png', 1),
(6, 'Crystal Double earrings', 18, 4, 'A signature emblem of the House, the initials of its founder Kingsley Ryan  define these earrings. Adding a refined feel, clear crystals frame the logo crafted from metal with an aged gold finish.\r\n\r\n<li>Metal with aged gold finish\r\n<li>Double G with clear crystals\r\n<li>Clip closure\r\n<li>Width .9\"\r\n<li>Made in Italy\r\n', 660, 'upload/pic-earing.jpg', 0),
(7, 'Nike futura heritage cap in cream', 17, 2, 'Cap by Nike\r\n\r\n<li>Put a lid on it\r\n<li>Panelled crown\r\n\r\n<p>LOOK AFTER ME</p>\r\n\r\nWipe clean with a damp cloth or sponge\r\n\r\n', 880, 'upload/feature-pica.png', 0),
(8, 'Vintage-inspired sunglasses with bridge logo', 23, 3, '<li>Front material: Acetate\r\n<li>Temple material: Metal\r\n<li>Hinge type: Regular\r\n<li>Lens: Full Colour\r\n<li>Lens material: Nylon\r\n<li>Size lens: 61 mm (0 inches)\r\n<li>Size bridge: 12 mm (0 inch.)\r\n<li>\r\nTemple length: 145 mm (0 inches)', 550, 'upload/pic-sun.png', 0),
(9, 'Gucci Women\'s watch', 19, 5, 'Watch by Gucci\r\n<li>Steel case with engraved Interlocking Gs, 3 windows indicating hour, minute and date, steel bracelet with Interlocking Gs\r\n<li>Ronda quartz movement\r\n<li>Water resistance: 3 ATM (100 feet/30 meters)\r\n<li>YA157410', 5000, 'upload/pic-u.jpg', 1),
(10, 'Kingsley Ryan gold plated knot detail ring in sterling silver', 18, 4, '<p>Mix up your jewellery game with Kingsley Ryan\'s fresh and innovative designs. Inspired by fashion and street trends, expect everything from minimal earrings to stackable rings, as well as embellished body jewellery and ear climbers from the brand’s sterling silver and gold-plated collections.</p>\r\n<p>Ring by Kingsley Ryan</p>\r\n\r\n<li>A little something\r\n<li>Minimal knot design\r\n<li>Fine band', 550, 'upload/pic-ring.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wlist`
--

CREATE TABLE `tbl_wlist` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wlist`
--

INSERT INTO `tbl_wlist` (`id`, `cmrId`, `productId`, `productName`, `price`, `image`) VALUES
(4, 19, 4, 'Nike Watch', 600.00, 'upload/feature-pick.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
