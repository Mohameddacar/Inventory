-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2024 at 08:39 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system_inventory`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `categories_proc` (IN `cat_name_sp` VARCHAR(40), IN `description_sp` TEXT, IN `oper` VARCHAR(50), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM categories WHERE cat_name = cat_name_sp AND description = description_sp) THEN
                SELECT CONCAT(cat_name_sp, ' ', description_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO categories (cat_name, description) VALUES (cat_name_sp, description_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;
        
        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM categories WHERE cat_name = cat_name_sp AND description = description_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM categories WHERE cat_id = num) THEN
                UPDATE categories SET cat_name = cat_name_sp, description = description_sp WHERE cat_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM categories WHERE cat_id = num) THEN
                DELETE FROM categories WHERE cat_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Customers_proc` (IN `customer_name_sp` VARCHAR(40), IN `phone_sp` VARCHAR(50), IN `address_sp` VARCHAR(50), IN `email_sp` VARCHAR(50), IN `oper` VARCHAR(50), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM customers WHERE customer_name = customer_name_sp AND phone = phone_sp AND address = address_sp AND email = email_sp) THEN
                SELECT CONCAT(customer_name_sp, ' ', phone_sp, ' ', address_sp, ' ', email_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO customers (customer_name, phone, address, email) VALUES (customer_name_sp, phone_sp, address_sp, email_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;
        
        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM customers WHERE customer_name = customer_name_sp AND phone = phone_sp AND address = address_sp AND email = email_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM customers WHERE customer_id = num) THEN
                UPDATE customers SET customer_name = customer_name_sp, phone = phone_sp, address = address_sp, email = email_sp WHERE customer_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM customers WHERE customer_id = num) THEN
                DELETE FROM customers WHERE customer_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `products_proc` (IN `Prod_name_sp` VARCHAR(40), IN `description_sp` VARCHAR(50), IN `Price_sp` DOUBLE, IN `cat_id_sp` VARCHAR(50), IN `oper` VARCHAR(50), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM products WHERE Prod_name = Prod_name_sp AND description = description_sp AND Price = Price_sp  AND cat_id = cat_id_sp) THEN
                SELECT CONCAT(Prod_name_sp, ' ', description_sp, ' ', Price_sp,' ', cat_id_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO products (Prod_name, description, Price, cat_id) VALUES (Prod_name_sp, description_sp, Price_sp, cat_id_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;

        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM products WHERE Prod_name = Prod_name_sp AND description = description_sp AND Price = Price_sp  AND cat_id = cat_id_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM products WHERE prod_id = num) THEN
                UPDATE products 
                SET Prod_name = Prod_name_sp, description = description_sp, Price = Price_sp,cat_id = cat_id_sp
                WHERE prod_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM products WHERE prod_id = num) THEN
                DELETE FROM products WHERE prod_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Purchase_pro` (IN `order_date_sp` DATE, IN `status_sp` VARCHAR(50), IN `quantity_sp` DOUBLE(30,2), IN `unit_price_sp` DOUBLE(30,2), IN `supplier_id_sp` INT, IN `user_id_sp` INT, IN `oper` VARCHAR(50), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM purchase_orders WHERE order_date = order_date_sp AND status = status_sp AND quantity = quantity_sp AND unit_price = unit_price_sp AND supplier_id = supplier_id_sp AND user_id = user_id_sp) THEN
                SELECT CONCAT(order_date_sp, ' ', status_sp, ' ', quantity_sp, ' ', unit_price_sp, ' ', supplier_id_sp, ' ', user_id_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO purchase_orders (order_date, status, quantity, unit_price, supplier_id, user_id)
                VALUES (order_date_sp, status_sp, quantity_sp, unit_price_sp, supplier_id_sp, user_id_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;

        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM purchase_orders WHERE order_date = order_date_sp AND status = status_sp AND quantity = quantity_sp AND unit_price = unit_price_sp AND supplier_id = supplier_id_sp AND user_id = user_id_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM purchase_orders WHERE purch_order_id = num) THEN
                UPDATE purchase_orders 
                SET order_date = order_date_sp, status = status_sp, quantity = quantity_sp, unit_price = unit_price_sp, supplier_id = supplier_id_sp, user_id = user_id_sp 
                WHERE purch_order_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;

        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM purchase_orders WHERE purch_order_id = num) THEN
                DELETE FROM purchase_orders WHERE purch_order_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;

        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Purchase_proc` (IN `order_date_sp` DATE, IN `status_sp` VARCHAR(50), IN `quantity_sp` DOUBLE(30,2), IN `unit_price_sp` DOUBLE(30,2), IN `supplier_id_sp` INT, IN `user_id_sp` INT, IN `oper` VARCHAR(50), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM purchase_orders WHERE order_date =order_date_sp and status = status_sp AND quantity = quantity_sp and unit_price =unit_price_sp AND supplier_id = supplier_id_sp AND user_id = user_id_sp) THEN
                SELECT CONCAT(order_date_sp,' ',status_sp,' ',quantity_sp,' ', unit_price_sp, ' ', supplier_id_sp, ' ', user_id_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO purchase_orders VALUES (order_date_sp,status_sp,quantity_sp,
                                           unit_price_sp,  supplier_id_sp,user_id_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;
        
        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM purchase_orders WHERE order_date=order_date_sp and status =status_sp and quantity = quantity_sp AND unit_price = unit_price_sp AND supplier_id = supplier_id_sp AND user_id = user_id_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM purchase_orders WHERE purch_order_id = num) THEN
                UPDATE purchase_orders SET order_date=order_date_sp and status=status_sp and quantity = quantity_sp, unit_price = unit_price_sp, supplier_id = supplier_id_sp, user_id = user_id_sp WHERE purch_order_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM purchase_orders WHERE purch_order_id = num) THEN
                DELETE FROM purchase_orders WHERE purch_order_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Purchase_sp` (IN `order_date_sp` DATE, IN `status_sp` VARCHAR(50), IN `quantity_sp` INT, IN `unit_price_sp` DECIMAL(10,2), IN `customer_id_sp` INT, IN `user_id_sp` INT, IN `prod_id_sp` INT, IN `oper` VARCHAR(10), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM purchase_orders 
                       WHERE order_date = order_date_sp 
                       AND status = status_sp 
                       AND quantity = quantity_sp 
                       AND unit_price = unit_price_sp 
                       AND customer_id = customer_id_sp 
                       AND user_id = user_id_sp 
                       AND prod_id = prod_id_sp) THEN
                SELECT CONCAT(order_date_sp, ' ', status_sp, ' ', quantity_sp, ' ', unit_price_sp, ' ', supplier_id_sp, ' ', user_id_sp, ' ', prod_id_sp,' ',customer_id_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO purchase_orders (order_date, status, quantity, unit_price, customer_id, user_id, prod_id) 
                VALUES (order_date_sp, status_sp, quantity_sp, unit_price_sp, customer_id_sp, user_id_sp, prod_id_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;
        
        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM purchase_orders 
                       WHERE order_date = order_date_sp 
                       AND status = status_sp 
                       AND quantity = quantity_sp 
                       AND unit_price = unit_price_sp 
                       AND customer_id = customer_id_sp 
                       AND user_id = user_id_sp 
                       AND prod_id = prod_id_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM purchase_orders WHERE purch_order_id = num) THEN
                UPDATE purchase_orders 
                SET order_date = order_date_sp, 
                    status = status_sp, 
                    quantity = quantity_sp, 
                    unit_price = unit_price_sp, 
                    customer_id = customer_id_sp, 
                    user_id = user_id_sp, 
                    prod_id = prod_id_sp 
                WHERE purch_order_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM purchase_orders WHERE purch_order_id = num) THEN
                DELETE FROM purchase_orders WHERE purch_order_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sells_pro` (IN `order_date_sp` DATE, IN `status_sp` VARCHAR(50), IN `quantity_sp` DOUBLE(30,2), IN `unit_price_sp` DOUBLE(30,2), IN `customer_id_sp` INT, IN `user_id_sp` INT, IN `oper` VARCHAR(50), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM sells_order WHERE order_date = order_date_sp AND status = status_sp AND quantity = quantity_sp AND unit_price = unit_price_sp AND customer_id = customer_id_sp AND user_id = user_id_sp) THEN
                SELECT CONCAT(order_date_sp, ' ', status_sp, ' ', quantity_sp, ' ', unit_price_sp, ' ', customer_id_sp, ' ', user_id_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO sells_order (order_date, status, quantity, unit_price, customer_id, user_id)
                VALUES (order_date_sp, status_sp, quantity_sp, unit_price_sp, customer_id_sp, user_id_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;

        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM sells_order WHERE order_date = order_date_sp AND status = status_sp AND quantity = quantity_sp AND unit_price = unit_price_sp AND customer_id = customer_id_sp AND user_id = user_id_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM sells_order WHERE sells_id = num) THEN
                UPDATE purchase_orders 
                SET order_date = order_date_sp, status = status_sp, quantity = quantity_sp, unit_price = unit_price_sp, customer_id = customer_id_sp, user_id = user_id_sp 
                WHERE sells_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;

        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM sells_order WHERE sells_id = num) THEN
                DELETE FROM sells_order WHERE sells_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;

        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sells_sp` (IN `order_date_sp` DATE, IN `status_sp` VARCHAR(50), IN `quantity_sp` INT, IN `unit_price_sp` DECIMAL(10,2), IN `customer_id_sp` INT, IN `user_id_sp` INT, IN `prod_id_sp` INT, IN `oper` VARCHAR(10), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM sells_order 
                       WHERE order_date = order_date_sp 
                       AND status = status_sp 
                       AND quantity = quantity_sp 
                       AND unit_price = unit_price_sp 
                       AND customer_id = customer_id_sp 
                       AND user_id = user_id_sp 
                       AND prod_id = prod_id_sp) THEN
                SELECT CONCAT(order_date_sp, ' ', status_sp, ' ', quantity_sp, ' ', unit_price_sp, ' ', customer_id_sp, ' ', user_id_sp, ' ', prod_id_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO sells_order (order_date, status, quantity, unit_price, customer_id, user_id, prod_id) 
                VALUES (order_date_sp, status_sp, quantity_sp, unit_price_sp, customer_id_sp, user_id_sp, prod_id_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;
        
        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM sells_order 
                       WHERE order_date = order_date_sp 
                       AND status = status_sp 
                       AND quantity = quantity_sp 
                       AND unit_price = unit_price_sp 
                       AND customer_id = customer_id_sp 
                       AND user_id = user_id_sp 
                       AND prod_id = prod_id_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM sells_order WHERE sells_id = num) THEN
                UPDATE sells_order 
                SET order_date = order_date_sp, 
                    status = status_sp, 
                    quantity = quantity_sp, 
                    unit_price = unit_price_sp, 
                    customer_id = customer_id_sp, 
                    user_id = user_id_sp, 
                    prod_id = prod_id_sp 
                WHERE sells_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM sells_order WHERE sells_id = num) THEN
                DELETE FROM sells_order WHERE sells_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `supplier_proc` (IN `supplier_name_sp` VARCHAR(40), IN `phone_sp` VARCHAR(50), IN `address_sp` VARCHAR(50), IN `email_sp` VARCHAR(50), IN `oper` VARCHAR(50), IN `num` INT)   BEGIN
    CASE
        WHEN oper = 'insert' THEN
            IF EXISTS (SELECT * FROM suppliers WHERE supplier_name_sp = supplier_name_sp AND phone = phone_sp AND address = address_sp AND email = email_sp) THEN
                SELECT CONCAT(supplier_name_sp, ' ', phone_sp, ' ', address_sp, ' ', email_sp, ' already exists') AS msg;
            ELSE
                INSERT INTO suppliers (supplier_name, phone, address, email) VALUES (supplier_name_sp, phone_sp, address_sp, email_sp);
                SELECT 'inserted successfully' AS msg;
            END IF;
        
        WHEN oper = 'update' THEN
            IF EXISTS (SELECT * FROM suppliers WHERE supplier_name = supplier_name_sp AND phone = phone_sp AND address = address_sp AND email = email_sp) THEN
                SELECT 'The information already exists, please update the details' AS msg;
            ELSEIF EXISTS (SELECT * FROM suppliers WHERE supplier_id = num) THEN
                UPDATE suppliers SET supplier_name = supplier_name_sp, phone = phone_sp, address = address_sp, email = email_sp WHERE supplier_id = num;
                SELECT 'updated successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        WHEN oper = 'delete' THEN
            IF EXISTS (SELECT * FROM suppliers WHERE supplier_id = num) THEN
                DELETE FROM suppliers WHERE supplier_id = num;
                SELECT 'deleted successfully' AS msg;
            ELSE
                SELECT CONCAT(num, ' does not exist') AS msg;
            END IF;
        
        ELSE
            SELECT 'Invalid operation' AS msg;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users_proc` (IN `user_name_sp` VARCHAR(40), IN `email_sp` VARCHAR(50), IN `role_sp` VARCHAR(50), IN `oper` VARCHAR(50), IN `num` INT)   BEGIN
CASE
WHEN oper='insert' THEN
IF EXISTS(SELECT * FROM users WHERE user_name=user_name_sp AND email=email_sp and role=role_sp) THEN
SELECT concat(user_name_sp,' ',email_sp,' ',role_sp,' already exist') AS msg;
ELSE
INSERT into users VALUES(null,user_name_sp,email_sp,role_sp);
SELECT 'inserted successfully' AS msg;
END IF;
WHEN oper='update' THEN
IF EXISTS(SELECT * FROM users WHERE user_name=user_name_sp AND email=email_sp and role= role_sp) THEN
SELECT ' xogta marka hore wax ka badal' AS msg;
ELSEIF EXISTS(SELECT * FROM users WHERE user_id=num) THEN
UPDATE users SET user_name=user_name_sp,email=email_sp, role = role_sp WHERE user_id=num;
SELECT 'updated successfully' AS msg;
ELSE
SELECT concat(num,' is not exists') AS msg;
END IF;
WHEN oper='delete' THEN
if EXISTS(SELECT * FROM users WHERE user_id=num) THEN
DELETE FROM users WHERE user_id=num;
SELECT 'deleted successfull' AS msg;
END IF;
ELSE
SELECT concat(num,' is not exists') AS msg;
END CASE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `description`) VALUES
(1, 'computers', 'computers and other gadgets'),
(2, 'smart watches', 'watches'),
(3, 'iphones', 'all iphones'),
(6, 'pcs', 'ps -12');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `phone`, `address`, `email`) VALUES
(2, 'osama', '999999', 'heliwa', 'osama98@gmail.com'),
(3, 'Majid Ali', '770977602', 'DS', 'Alimajid@gmail.com'),
(4, 'Nasro', '618988888', 'yaqshid', 'nasroo3@gmail.com'),
(5, 'abdi isse', '7698000', 'gurceel', 'abdiise@gmail.com'),
(7, 'Nasro Abdi', '618980000', 'karaan', 'nasroAbdi2@gmail.com'),
(8, 'moha ali', '45678987', 'yaqshid', 'mohali@gmail.com'),
(9, 'qalid', '617876788', 'karaaan', 'qalid@gmail.com'),
(10, 'ahmed ali', '78987657', 'bakaro  v', 'ahmed2@gmail.com'),
(12, 'sahra', '619801483', 'hodan', 'saara@gmail.com'),
(13, 'samira', '61766983', 'hodan', 'samira@gmail.com'),
(14, 'mumin', '890987', 'madiina', 'mumin9989@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `Prod_name` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `Price` double(30,2) DEFAULT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `Prod_name`, `description`, `Price`, `cat_id`) VALUES
(1, 'core i7', 'core i7 flexible', 380.00, 1),
(3, 'Smartwatch', 'watches', 20.00, 2),
(4, 'iphone 15', 'iphone 15 pro max', 1200.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `purch_order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` varchar(40) DEFAULT NULL,
  `quantity` varchar(40) DEFAULT NULL,
  `unit_price` double(30,2) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`purch_order_id`, `order_date`, `status`, `quantity`, `unit_price`, `customer_id`, `user_id`, `prod_id`) VALUES
(2, '2024-07-25', 'exists', '80', 2900.00, 4, 2, NULL),
(4, '2024-07-24', 'exist', '8', 20.00, 2, 2, NULL),
(5, '2024-07-02', 'pending', '8', 80.00, 2, 1, 1),
(6, '2024-07-26', 'pending', '8', 400.00, 2, 2, 3),
(7, '0000-00-00', 'pending', '4', 800.00, 5, 2, 3),
(8, '2024-07-25', 'pending', '10', 10000.00, 3, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sells_order`
--

CREATE TABLE `sells_order` (
  `sells_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `quantity` double(30,2) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sells_order`
--

INSERT INTO `sells_order` (`sells_id`, `order_date`, `status`, `quantity`, `unit_price`, `customer_id`, `user_id`, `prod_id`) VALUES
(2, '2024-07-17', 'exist', 10.00, '100.00', 2, 2, NULL),
(4, '2024-07-25', 'exist', 10.00, '200.00', 3, 2, NULL),
(5, '2024-07-31', 'completed', 10.00, '100.00', 7, 1, 1),
(6, '2024-07-25', 'completed', 3.00, '3000.00', 3, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `phone`, `address`, `email`) VALUES
(2, 'ahmed abdi', '617876788', 'karaaan', 'ahmed45678@gmail.com'),
(4, 'osmam', '78900000', 'yaqshid', 'osman@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `role`, `password`) VALUES
(1, 'muse', 'muse0@gmail.com', 'user', '1212'),
(2, 'Abdi', 'abdi@gmail.com', 'user', '1122');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `cat_index` (`cat_name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_index` (`customer_name`,`phone`,`address`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `prod_index` (`Prod_name`,`Price`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`purch_order_id`),
  ADD KEY `purch_order_index` (`order_date`,`status`,`quantity`),
  ADD KEY `supplier_id` (`customer_id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_prod` (`prod_id`);

--
-- Indexes for table `sells_order`
--
ALTER TABLE `sells_order`
  ADD PRIMARY KEY (`sells_id`),
  ADD KEY `Sells_index` (`quantity`,`order_date`,`unit_price`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_prod1` (`prod_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supplier_index` (`supplier_name`,`phone`,`address`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_index` (`user_name`,`email`,`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `purch_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sells_order`
--
ALTER TABLE `sells_order`
  MODIFY `sells_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_prod` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sells_order`
--
ALTER TABLE `sells_order`
  ADD CONSTRAINT `fk_prod1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `sells_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
