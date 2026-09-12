-- ========================================================
-- Casino Management Data Inserts (Seed Data)
-- Extracted from casinomanagement_09SEP2026.sql
-- ========================================================

SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Dumping data for table `cage`
INSERT INTO `cage` (`cage_id`, `name`, `type`, `status`, `terminal`, `balance`, `last_change`, `changed_by`, `gaming_day_id`, `floor_id`, `chip_balance`, `opening_balance`, `opening_chip_balance`, `online_balance`, `tito_balance`, `total_in`, `total_out`, `macaddress`, `defaultFloat`, `threshold`, `registered`) VALUES
(1, 'CAGE_1', 'FULL', 'OPEN', NULL, 1195000.000000000000000000000000000000, '2026-09-09 11:46:55.007', 6, 6, 1, 13095000.000000000000000000000000000000, 1000000.000000000000000000000000000000, 13280000.000000000000000000000000000000, 110000.000000000000000000000000000000, 0.000000000000000000000000000000, 340000.000000000000000000000000000000, 35000.000000000000000000000000000000, '192.168.225.199', 1, 100000.000000000000000000000000000000, 1),
(2, 'LEVEL_1_W2', 'FULL', 'CLOSED', NULL, 0.000000000000000000000000000000, NULL, NULL, NULL, 1, 0.000000000000000000000000000000, 0.000000000000000000000000000000, 0.000000000000000000000000000000, 0.000000000000000000000000000000, 0.000000000000000000000000000000, 0.000000000000000000000000000000, 0.000000000000000000000000000000, NULL, 1, 100000.000000000000000000000000000000, 0);


-- Dumping data for table `cagechipdenomination`
INSERT INTO `cagechipdenomination` (`id`, `cage_id`, `gaming_day_id`, `chip_denomination`, `chip_color`, `quantity`, `total_value`, `recorded_at`, `chip_id`, `type_of_chip`) VALUES
(1, 1, 6, 50000.000000000000000000000000000000, '', 0, 0.000000000000000000000000000000, '2026-09-08 17:50:27.578', 12, 'Cash_Chips'),
(2, 1, 6, 25000.000000000000000000000000000000, '', -1300, -32500000.000000000000000000000000000000, '2026-09-09 14:42:38.286', 11, 'Cash_Chips'),
(3, 1, 6, 25000.000000000000000000000000000000, '', 100, 2500000.000000000000000000000000000000, '2026-09-08 13:32:36.397', 16, 'Cash_Chips'),
(4, 1, 6, 10000.000000000000000000000000000000, '', -1300, -13000000.000000000000000000000000000000, '2026-09-09 14:42:38.286', 5, 'Cash_Chips'),
(5, 1, 6, 10000.000000000000000000000000000000, '', 100, 1000000.000000000000000000000000000000, '2026-09-08 13:32:36.397', 15, 'Cash_Chips'),
(6, 1, 6, 5000.000000000000000000000000000000, '', -1300, -6500000.000000000000000000000000000000, '2026-09-09 14:42:38.286', 10, 'Cash_Chips'),
(7, 1, 6, 5000.000000000000000000000000000000, '', 100, 500000.000000000000000000000000000000, '2026-09-08 13:32:36.397', 14, 'Cash_Chips'),
(8, 1, 6, 1000.000000000000000000000000000000, '', -1300, -1300000.000000000000000000000000000000, '2026-09-09 14:42:38.286', 9, 'Cash_Chips'),
(9, 1, 6, 1000.000000000000000000000000000000, '', 100, 100000.000000000000000000000000000000, '2026-09-08 13:32:36.397', 13, 'Cash_Chips'),
(10, 1, 6, 500.000000000000000000000000000000, '', -10, -5000.000000000000000000000000000000, '2026-09-09 11:46:55.035', 8, 'Cash_Chips'),
(11, 1, 6, 200.000000000000000000000000000000, '', 0, 0.000000000000000000000000000000, '2026-09-08 17:50:27.578', 6, 'Cash_Chips'),
(12, 1, 6, 100.000000000000000000000000000000, '', -1900, -190000.000000000000000000000000000000, '2026-09-08 14:12:25.370', 7, 'Cash_Chips');


-- Dumping data for table `cagesession`
INSERT INTO `cagesession` (`session_id`, `cage_id`, `terminal`, `started_at`, `ended_at`, `opened_by`, `closed_by`, `transaction_count`, `total_amount`, `status`, `gaming_day_id`) VALUES
(1, 1, NULL, '2026-09-08 13:32:36.376', NULL, 3, NULL, 0, 14280000.000000000000000000000000000000, 'OPEN', 6);


-- Dumping data for table `cagetransaction`
INSERT INTO `cagetransaction` (`transaction_id`, `cage_id`, `player_id`, `amount`, `transaction_type`, `payment_method`, `is_manual`, `requires_verification`, `verified_by`, `performed_by`, `session_start`, `session_end`, `timestamp`, `notes`, `session_id`, `gaming_day_id`) VALUES
(1, 1, NULL, 1000000.000000000000000000000000000000, 'CAGE_OPEN', 'VAULT_TRANSFER', 0, 0, 3, 3, NULL, NULL, '2026-09-08 13:32:36.376', 'Cage Opening Balance - Cash Entry', NULL, 6),
(2, 1, NULL, 13280000.000000000000000000000000000000, 'CAGE_OPEN', 'VAULT_TRANSFER', 0, 0, 3, 3, NULL, NULL, '2026-09-08 13:32:36.376', 'Cage Opening Balance - Chips Entry', NULL, 6),
(3, 1, 1, 200000.000000000000000000000000000000, 'CHIP_PURCHASE', 'Cash', 0, 0, 6, 6, NULL, NULL, '2026-09-08 14:12:25.345', 'Player 1 bought Chips worth 200000', NULL, 6),
(4, 1, NULL, 14470000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 17:50:27.524', 'Stop session: moved Cash 1200000, Chips 13270000, Online 0, TITO 0', NULL, 6),
(5, 1, NULL, 5300000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 17:50:34.234', 'Stop session: moved Cash 1200000, Chips 4100000, Online 0, TITO 0', NULL, 6),
(6, 1, NULL, 5300000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 17:50:40.354', 'Stop session: moved Cash 1200000, Chips 4100000, Online 0, TITO 0', NULL, 6),
(7, 1, 1, 10000.000000000000000000000000000000, 'MONEY_CREDIT', 'Cash', 0, 0, 6, 6, NULL, NULL, '2026-09-08 17:51:03.590', 'Player 1 loaded card with INR 10000', NULL, 6),
(8, 1, 1, 10000.000000000000000000000000000000, 'MONEY_CREDIT', 'Cash', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:10:40.073', 'Player 1 loaded card with INR 10000', NULL, 6),
(9, 1, 1, 10000.000000000000000000000000000000, 'MONEY_DEBIT', 'Cash', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:11:16.521', 'Player 1 encashed card for INR 10000', NULL, 6),
(10, 1, 1, 10000.000000000000000000000000000000, 'CHIP_REDEEM', 'Chips', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:12:40.759', 'Player 1 redeemed Chips worth 10000', NULL, 6),
(11, 1, 1, 10000.000000000000000000000000000000, 'MONEY_CREDIT', 'Cash', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:16:49.227', 'Player 1 loaded card with INR 10000', NULL, 6),
(12, 1, 1, 100000.000000000000000000000000000000, 'MONEY_CREDIT', 'UPI', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:19:46.829', 'Player 1 loaded card with INR 100000', NULL, 6),
(13, 1, 1, 10000.000000000000000000000000000000, 'CHIP_REDEEM', 'Chips', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:20:14.891', 'Player 1 redeemed Chips worth 10000', NULL, 6),
(14, 1, NULL, 5420000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:21:26.349', 'Stop session: moved Cash 1200000, Chips 4120000, Online 100000, TITO 0', NULL, 6),
(15, 1, NULL, 5400000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:21:31.193', 'Stop session: moved Cash 1200000, Chips 4100000, Online 100000, TITO 0', NULL, 6),
(16, 1, NULL, 5400000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:21:58.487', 'Stop session: moved Cash 1200000, Chips 4100000, Online 100000, TITO 0', NULL, 6),
(17, 1, NULL, 5400000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:22:56.177', 'Stop session: moved Cash 1200000, Chips 4100000, Online 100000, TITO 0', NULL, 6),
(18, 1, NULL, 5400000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:23:03.327', 'Stop session: moved Cash 1200000, Chips 4100000, Online 100000, TITO 0', NULL, 6),
(19, 1, NULL, 5400000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:24:38.455', 'Stop session: moved Cash 1200000, Chips 4100000, Online 100000, TITO 0', NULL, 6),
(20, 1, NULL, 5400000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:24:49.283', 'Stop session: moved Cash 1200000, Chips 4100000, Online 100000, TITO 0', NULL, 6),
(21, 1, NULL, 5400000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-08 18:25:02.047', 'Stop session: moved Cash 1200000, Chips 4100000, Online 100000, TITO 0', NULL, 6),
(22, 1, NULL, 5400000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-09 11:44:54.376', 'Stop session: moved Cash 1200000, Chips 4100000, Online 100000, TITO 0', NULL, 6),
(23, 1, 1, 10000.000000000000000000000000000000, 'CHIP_PURCHASE', 'PLAYER_CARD', 0, 0, 6, 6, NULL, NULL, '2026-09-09 11:46:12.379', 'Player 1 bought Chips worth 10000', NULL, 6),
(24, 1, 1, 5000.000000000000000000000000000000, 'CHIP_REDEEM', 'Chips', 0, 0, 6, 6, NULL, NULL, '2026-09-09 11:46:55.007', 'Player 1 redeemed Chips worth 5000', NULL, 6),
(25, 1, NULL, 5405000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-09 11:51:06.495', 'Stop session: moved Cash 1195000, Chips 4100000, Online 110000, TITO 0', NULL, 6),
(26, 1, NULL, 5405000.000000000000000000000000000000, 'VAULT_MONEY_CREDIT', 'VAULT_TRANSFER', 0, 0, 6, 6, NULL, NULL, '2026-09-09 14:42:37.914', 'Stop session: moved Cash 1195000, Chips 4100000, Online 110000, TITO 0', NULL, 6);


-- Dumping data for table `casinosettings`
INSERT INTO `casinosettings` (`id`, `casino_name`, `default_gaming_day_reset_time`, `default_currency`, `timezone`, `contact_email`, `maintenance_mode`, `logo_url`, `created_at`, `updated_at`) VALUES
(1, 'GameXpro Casino', '04:00', 'INR', 'Asia/Kolkata', 'admin@gamexprocasino.com', 0, '/uploads/casino-logo.png', '2026-09-06 18:45:27.000', NULL);


-- Dumping data for table `defaultfloat`
INSERT INTO `defaultfloat` (`id`, `module`, `type`, `quantity`, `created_at`, `updated_at`, `amount`, `chip_denomination_id`, `reference_id`) VALUES
(65, 'CAGE', 'CASH', NULL, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', 1000000.000000000000000000000000000000, NULL, 1),
(66, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 5, 1),
(67, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 6, 1),
(68, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 7, 1),
(69, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 8, 1),
(70, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 9, 1),
(71, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 10, 1),
(72, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 11, 1),
(73, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 12, 1),
(74, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 13, 1),
(75, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 14, 1),
(76, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 15, 1),
(77, 'CAGE', 'CHIP', 100, '2026-09-07 20:02:54.803', '2026-09-07 20:02:54.803', NULL, 16, 1),
(78, 'CAGE', 'CHIP', 100000, '2026-09-09 11:43:53.106', '2026-09-09 11:43:53.106', NULL, 7, 2);


-- Dumping data for table `employee`
INSERT INTO `employee` (`employee_id`, `user_id`, `username`, `password_hash`, `role`, `access_level`, `rfid_number`, `company_id`, `pin`, `gender`) VALUES
(1, 3, 'admin', 'cd75ee7fcfe5f2871aa892a5768136313c7af0e70f75b21f5c738e09cdae5dae', 'Admin', 6, '0000502902', NULL, NULL, 'Male'),
(2, 4, 'USER000004', 'cd75ee7fcfe5f2871aa892a5768136313c7af0e70f75b21f5c738e09cdae5dae', 'Reception_Executive', 0, NULL, 'v12345', NULL, 'Male'),
(3, 5, 'USER000005', 'cd75ee7fcfe5f2871aa892a5768136313c7af0e70f75b21f5c738e09cdae5dae', 'Cage_Manager', 0, NULL, 'V01537', '8552b874fd59a64333e862c0a1eda2cf54fa62e3ebb0710c7fb6b82858ede198', 'Male'),
(4, 6, 'USER000006', 'cd75ee7fcfe5f2871aa892a5768136313c7af0e70f75b21f5c738e09cdae5dae', 'Cage_Executive', 0, '0000518031', 'v01223', NULL, 'Male'),
(5, 7, 'USER000007', 'cd75ee7fcfe5f2871aa892a5768136313c7af0e70f75b21f5c738e09cdae5dae', 'Slot_Supervisor', 0, '0000439292', 'V123457', NULL, 'Male');


-- Dumping data for table `floatbalance`
INSERT INTO `floatbalance` (`id`, `module`, `cage_id`, `table_id`, `gaming_day_id`, `opening_cash`, `opening_chips`, `opening_total`, `opening_denominations`, `opening_recorded_by`, `opening_recorded_at`, `closing_cash`, `closing_chips`, `closing_total`, `closing_denominations`, `closing_recorded_by`, `closing_recorded_at`, `status`, `notes`, `created_at`, `updated_at`, `closing_online`, `closing_tito`) VALUES
(1, 'CAGE', 1, NULL, 6, 1000000.00, 13280000.00, 14280000.00, '{\"chips\":[{\"chip_id\":12,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":50000,\"quantity\":100,\"total\":5000000},{\"chip_id\":11,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":25000,\"quantity\":100,\"total\":2500000},{\"chip_id\":16,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":25000,\"quantity\":100,\"total\":2500000},{\"chip_id\":5,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":10000,\"quantity\":100,\"total\":1000000},{\"chip_id\":15,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":10000,\"quantity\":100,\"total\":1000000},{\"chip_id\":10,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":5000,\"quantity\":100,\"total\":500000},{\"chip_id\":14,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":5000,\"quantity\":100,\"total\":500000},{\"chip_id\":9,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":1000,\"quantity\":100,\"total\":100000},{\"chip_id\":13,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":1000,\"quantity\":100,\"total\":100000},{\"chip_id\":8,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":500,\"quantity\":100,\"total\":50000},{\"chip_id\":6,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":200,\"quantity\":100,\"total\":20000},{\"chip_id\":7,\"type_of_chip\":\"Cash_Chips\",\"chip_color\":\"\",\"chip_value\":100,\"quantity\":100,\"total\":10000}]}', 3, '2026-09-08 13:32:33.183', NULL, NULL, NULL, NULL, NULL, NULL, 'OPEN', 'Cage Open', '2026-09-08 13:32:33.183', '2026-09-08 13:32:33.183', NULL, NULL);


-- Dumping data for table `floor`
INSERT INTO `floor` (`floor_id`, `name`) VALUES
(1, 'LEVEL_1'),
(2, 'LEVEL_2');


-- Dumping data for table `gamingday`
INSERT INTO `gamingday` (`gaming_day_id`, `start_time`, `end_time`, `status`, `closed_by`, `closed_at`, `created_at`, `updated_at`, `isAdminClosed`) VALUES
(1, '2026-08-30 18:30:00.000', '2026-08-31 18:29:59.000', 'CLOSED', NULL, '2026-09-01 12:35:46.086', '2026-08-31 09:18:01.776', '2026-09-01 12:35:46.111', 0),
(2, '2026-08-31 18:30:00.000', '2026-09-03 18:29:59.000', 'CLOSED', NULL, '2026-09-03 19:18:08.697', '2026-09-01 12:35:46.115', '2026-09-03 19:18:08.765', 0),
(3, '2026-09-03 18:30:00.000', '2026-09-04 18:29:59.000', 'CLOSED', NULL, '2026-09-04 21:42:56.173', '2026-09-03 19:18:08.768', '2026-09-04 21:42:56.202', 0),
(4, '2026-09-04 18:30:00.000', '2026-09-06 18:29:59.000', 'CLOSED', NULL, '2026-09-07 12:59:15.418', '2026-09-04 21:42:56.207', '2026-09-07 12:59:15.453', 0),
(5, '2026-09-06 18:30:00.000', '2026-09-07 18:29:59.000', 'CLOSED', NULL, '2026-09-07 18:30:01.953', '2026-09-07 12:59:15.463', '2026-09-07 18:30:01.957', 0),
(6, '2026-09-07 18:30:00.000', '2026-09-08 18:29:59.000', 'CLOSED', NULL, '2026-09-09 11:42:53.042', '2026-09-07 18:30:01.960', '2026-09-09 11:42:53.070', 0),
(7, '2026-09-08 18:30:00.000', '2026-09-09 18:29:59.000', 'CLOSED', NULL, '2026-09-09 18:30:56.829', '2026-09-09 11:42:53.083', '2026-09-09 18:30:56.845', 0),
(8, '2026-09-09 18:30:00.000', NULL, 'OPEN', NULL, NULL, '2026-09-09 18:30:56.848', '2026-09-09 18:30:56.848', 0);


-- Dumping data for table `identificationproof`
INSERT INTO `identificationproof` (`identification_id`, `name`) VALUES
(1, 'ADHAR CARD'),
(2, 'PASSPORT NO'),
(3, 'VOTER CARD NO');


-- Dumping data for table `playercard`
INSERT INTO `playercard` (`card_id`, `user_id`, `rfid_number`, `pin`, `balance`, `loyalty_points`, `tier`) VALUES
(3, 1, '0000205332', '1234', 100000.000000000000000000000000000000, 0, 'Bronze');


-- Dumping data for table `playerentrylog`
INSERT INTO `playerentrylog` (`id`, `player_id`, `login_time`, `logout_time`, `tier`, `status`, `gaming_day_id`) VALUES
(1, 1, '2026-09-07 20:25:22.293', NULL, 'Bronze', 'INSIDE', 6),
(2, 1, '2026-09-09 11:54:30.981', NULL, 'Bronze', 'INSIDE', 7);


-- Dumping data for table `table`
INSERT INTO `table` (`table_id`, `name`, `status`, `chip_balance`, `opening_chip_balance`, `last_change`, `changed_by`, `gaming_day_id`, `floor_id`, `cash_drop_balance`, `defaultFloat`, `macaddress`, `registered`, `threshold`, `currency`, `number_of_players`, `shape`) VALUES
(1, 'ROULETTE', 'CLOSED', 0.000000000000000000000000000000, 0.000000000000000000000000000000, '2026-08-31 11:14:34.707', NULL, 1, 1, 0.000000000000000000000000000000, 0, NULL, 1, 100000.000000000000000000000000000000, 'INR', 6, 'Left Roulette'),
(2, 'BACCARAT', 'CLOSED', 0.000000000000000000000000000000, 0.000000000000000000000000000000, '2026-08-31 11:15:51.480', NULL, 1, 1, 0.000000000000000000000000000000, 0, NULL, 1, 100000.000000000000000000000000000000, 'INR', 6, 'D-Shaped');


-- Dumping data for table `tablegameassignment`
INSERT INTO `tablegameassignment` (`id`, `table_id`, `game_id`, `assigned_by`, `assigned_at`, `active`, `notes`) VALUES
(1, 2, 2, NULL, '2026-08-31 11:15:51.494', 1, NULL);


-- Dumping data for table `tablegames`
INSERT INTO `tablegames` (`game_id`, `name`, `description`, `created_at`) VALUES
(1, 'ROULETTE', NULL, '2026-08-31 11:11:46.999'),
(2, 'BACCARAT', NULL, '2026-08-31 11:11:55.476'),
(3, 'ANDAR BAHAR', NULL, '2026-08-31 11:12:02.954'),
(4, 'BALCK JACK', NULL, '2026-08-31 11:12:08.916'),
(5, '3 CARD POKER', NULL, '2026-08-31 11:12:20.906'),
(6, 'CARABIAN STUD POKER', NULL, '2026-08-31 11:12:30.202'),
(7, 'MINI FLUSH', NULL, '2026-08-31 11:12:39.672'),
(8, 'CASINO WAR', NULL, '2026-08-31 11:12:53.573');


-- Dumping data for table `tiertable`
INSERT INTO `tiertable` (`tierid`, `tiername`, `loyality_percentage`, `threshold_amount`, `created_at`, `updated_at`) VALUES
(1, 'GOLD', 2.00, 100000.00, '2026-08-31 11:13:22.085', '2026-08-31 11:13:22.085'),
(2, 'DIAMOND', 3.00, 500000.00, '2026-08-31 11:13:36.130', '2026-08-31 11:13:36.130'),
(3, 'PLATINUM', 5.00, 1000000.00, '2026-08-31 11:14:13.881', '2026-08-31 11:14:13.881');


-- Dumping data for table `user`
INSERT INTO `user` (`user_id`, `full_name`, `address`, `date_of_birth`, `govt_id_number`, `govt_id_type`, `photo_url`, `email`, `phone`, `role`, `status`, `created_at`, `govt_id_proof`, `tier`, `barringNotes`, `firstName`, `lastName`, `favouriteGames`) VALUES
(1, 'RAM NAIK', 'ribandar', NULL, '123456', 'Aadhaar', NULL, 'krutik.thegodsparticles@gmail.com', '7875085986', 'Player', 'Active', '2026-01-03 21:36:19.486', NULL, 'Bronze', '', 'RAM', 'NAIK', NULL),
(3, 'Sam Smith', '789 Oak Rd, Springfield', '1990-05-15 00:00:00.000', 'PASS1234XY', 'Passport', NULL, 'sam.smith@example.com', '7777711111', 'Admin', 'Active', '2025-04-26 04:20:59.000', NULL, 'Bronze', NULL, NULL, NULL, NULL),
(4, 'Krutik Harmalkar', '', NULL, 'DUMMY_ID_ 0.7986356555306652', NULL, NULL, 'krutik harmalkar0.33332820672004004@casino.com', '2119980473', 'Reception_Executive', 'Active', '2026-08-31 09:46:36.582', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'xavier dcruz', '', NULL, 'DUMMY_ID_ 0.3734981018492429', NULL, NULL, 'xavier dcruz0.24660870466578533@casino.com', '1324726952', 'Cage_Manager', 'Active', '2026-09-03 19:19:16.868', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'cashier cashier', '', NULL, 'DUMMY_ID_ 0.4351031109307736', NULL, NULL, 'cashier cashier0.008304543153353383@casino.com', '2092379937', 'Cage_Executive', 'Active', '2026-09-05 08:22:21.238', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'cage_supervisor supervisor', '', NULL, 'DUMMY_ID_ 0.8917223737994476', NULL, NULL, 'cage_supervisor supervisor0.6828947039596677@casino.com', '3030754529', 'Slot_Supervisor', 'Active', '2026-09-07 20:06:39.770', NULL, NULL, NULL, NULL, NULL, NULL);


-- Dumping data for table `userpermissions`
INSERT INTO `userpermissions` (`permission_id`, `role_name`, `can_create`, `can_edit`, `can_view`, `created_at`, `module_name`, `updated_at`, `can_action`, `role_group`) VALUES
(1, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Dashboard', '2025-10-25 05:21:42.823', 0, NULL),
(2, 'Reception_Executive', 1, 1, 1, '2025-10-25 05:21:42.823', 'Reception', '2025-10-25 05:21:42.823', 0, NULL),
(3, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Vault', '2025-10-25 05:21:42.823', 0, NULL),
(4, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Employees', '2025-10-25 05:21:42.823', 0, NULL),
(5, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Players', '2025-10-25 05:21:42.823', 0, NULL),
(6, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Cages', '2025-10-25 05:21:42.823', 0, NULL),
(7, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Slot Machines', '2025-10-25 05:21:42.823', 0, NULL),
(8, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Tables', '2025-10-25 05:21:42.823', 0, NULL),
(9, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Casino Configuration', '2025-10-25 05:21:42.823', 0, NULL),
(10, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Access Control', '2025-10-25 05:21:42.823', 0, NULL),
(11, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Notifications', '2025-10-25 05:21:42.823', 0, NULL),
(12, 'Reception_Executive', 0, 0, 0, '2025-10-25 05:21:42.823', 'Transactions', '2025-10-25 05:21:42.823', 0, NULL),
(13, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Dashboard', '2025-10-25 05:59:03.634', 0, NULL),
(14, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Reception', '2025-10-25 05:59:03.634', 0, NULL),
(15, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Vault', '2025-10-25 05:59:03.634', 0, NULL),
(16, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Employees', '2025-10-25 05:59:03.634', 0, NULL),
(17, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Players', '2025-10-25 05:59:03.634', 0, NULL),
(18, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Cages', '2025-10-25 05:59:03.634', 0, NULL),
(19, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Slot Machines', '2025-10-25 05:59:03.634', 0, NULL),
(20, 'Dealer', 1, 1, 1, '2025-10-25 05:59:03.634', 'Tables', '2025-10-25 05:59:03.634', 1, NULL),
(21, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Casino Configuration', '2025-10-25 05:59:03.634', 0, NULL),
(22, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Access Control', '2025-10-25 05:59:03.634', 0, NULL),
(23, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Notifications', '2025-10-25 05:59:03.634', 0, NULL),
(24, 'Dealer', 0, 0, 0, '2025-10-25 05:59:03.634', 'Transactions', '2025-10-25 05:59:03.634', 0, NULL),
(25, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Dashboard', '2025-10-25 06:33:34.083', 0, NULL),
(26, 'Reception_Supervisor', 1, 1, 1, '2025-10-25 06:33:34.083', 'Reception', '2025-10-25 06:33:34.083', 1, NULL),
(27, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Vault', '2025-10-25 06:33:34.083', 0, NULL),
(28, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Employees', '2025-10-25 06:33:34.083', 0, NULL),
(29, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Players', '2025-10-25 06:33:34.083', 0, NULL),
(30, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Cages', '2025-10-25 06:33:34.083', 0, NULL),
(31, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Slot Machines', '2025-10-25 06:33:34.083', 0, NULL),
(32, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Tables', '2025-10-25 06:33:34.083', 0, NULL),
(33, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Casino Configuration', '2025-10-25 06:33:34.083', 0, NULL),
(34, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Access Control', '2025-10-25 06:33:34.083', 0, NULL),
(35, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Notifications', '2025-10-25 06:33:34.083', 0, NULL),
(36, 'Reception_Supervisor', 0, 0, 0, '2025-10-25 06:33:34.083', 'Transactions', '2025-10-25 06:33:34.083', 0, NULL),
(37, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Dashboard', '2025-10-25 07:39:22.482', 0, NULL),
(38, 'Reception_Manager', 1, 1, 1, '2025-10-25 07:39:22.482', 'Reception', '2025-10-25 07:39:22.482', 1, NULL),
(39, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Vault', '2025-10-25 07:39:22.482', 0, NULL),
(40, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Employees', '2025-10-25 07:39:22.482', 0, NULL),
(41, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Players', '2025-10-25 07:39:22.482', 0, NULL),
(42, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Cages', '2025-10-25 07:39:22.482', 0, NULL),
(43, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Slot Machines', '2025-10-25 07:39:22.482', 0, NULL),
(44, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Tables', '2025-10-25 07:39:22.482', 0, NULL),
(45, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Casino Configuration', '2025-10-25 07:39:22.482', 0, NULL),
(46, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Access Control', '2025-10-25 07:39:22.482', 0, NULL),
(47, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Notifications', '2025-10-25 07:39:22.482', 0, NULL),
(48, 'Reception_Manager', 0, 0, 0, '2025-10-25 07:39:22.482', 'Transactions', '2025-10-25 07:39:22.482', 0, NULL),
(49, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 0, NULL),
(50, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 0, NULL),
(51, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(52, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 0, NULL),
(53, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 0, NULL),
(54, 'Cage_Executive', 1, 1, 1, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 0, NULL),
(55, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 0, NULL),
(56, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 0, NULL),
(57, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(58, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 0, NULL),
(59, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 0, NULL),
(60, 'Cage_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 0, NULL),
(61, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 0, NULL),
(62, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 0, NULL),
(63, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(64, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 0, NULL),
(65, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 0, NULL),
(66, 'Cage_Supervisor', 1, 1, 1, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 1, NULL),
(67, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 0, NULL),
(68, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 0, NULL),
(69, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(70, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 0, NULL),
(71, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 0, NULL),
(72, 'Cage_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 0, NULL),
(73, 'Cage_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 1, NULL),
(74, 'Cage_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 1, NULL),
(75, 'Cage_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(76, 'Cage_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 0, NULL),
(77, 'Cage_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 1, NULL),
(78, 'Cage_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 1, NULL),
(79, 'Cage_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 0, NULL),
(80, 'Cage_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 1, NULL),
(81, 'Cage_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(82, 'Cage_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 1, NULL),
(83, 'Cage_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 0, NULL),
(84, 'Cage_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 0, NULL),
(85, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 0, NULL),
(86, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 0, NULL),
(87, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(88, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 0, NULL),
(89, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 0, NULL),
(90, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 0, NULL),
(91, 'Slot_Executive', 1, 1, 1, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 0, NULL),
(92, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 0, NULL),
(93, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(94, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 0, NULL),
(95, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 0, NULL),
(96, 'Slot_Executive', 0, 0, 0, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 0, NULL),
(97, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 0, NULL),
(98, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 0, NULL),
(99, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(100, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 0, NULL),
(101, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 0, NULL),
(102, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 0, NULL),
(103, 'Slot_Supervisor', 1, 1, 1, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 1, NULL),
(104, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 0, NULL),
(105, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(106, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 0, NULL),
(107, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 0, NULL),
(108, 'Slot_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 0, NULL),
(109, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 0, NULL),
(110, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 0, NULL),
(111, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(112, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 0, NULL),
(113, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 0, NULL),
(114, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 0, NULL),
(115, 'Slot_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 1, NULL),
(116, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 0, NULL),
(117, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(118, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 0, NULL),
(119, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 0, NULL),
(120, 'Slot_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 0, NULL),
(121, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 0, NULL),
(122, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 0, NULL),
(123, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(124, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 0, NULL),
(125, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 0, NULL),
(126, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 0, NULL),
(127, 'Pit_Supervisor', 1, 1, 1, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 1, NULL),
(128, 'Pit_Supervisor', 1, 1, 1, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 1, NULL),
(129, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(130, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 0, NULL),
(131, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 0, NULL),
(132, 'Pit_Supervisor', 0, 0, 0, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 0, NULL),
(133, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 0, NULL),
(134, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 0, NULL),
(135, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(136, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 0, NULL),
(137, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 0, NULL),
(138, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 0, NULL),
(139, 'Inspector', 1, 1, 1, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 1, NULL),
(140, 'Inspector', 1, 1, 1, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 1, NULL),
(141, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(142, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 0, NULL),
(143, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 0, NULL),
(144, 'Inspector', 0, 0, 0, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 0, NULL),
(145, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 1, NULL),
(146, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 1, NULL),
(147, 'Casino_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 0, NULL),
(148, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 1, NULL),
(149, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 1, NULL),
(150, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 1, NULL),
(151, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 1, NULL),
(152, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 1, NULL),
(153, 'Casino_Manager', 0, 0, 0, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 0, NULL),
(154, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 1, NULL),
(155, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 1, NULL),
(156, 'Casino_Manager', 1, 1, 1, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 1, NULL),
(157, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 1, NULL),
(158, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 1, NULL),
(159, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 1, NULL),
(160, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 1, NULL),
(161, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 1, NULL),
(162, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 1, NULL),
(163, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 1, NULL),
(164, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 1, NULL),
(165, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 1, NULL),
(166, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 1, NULL),
(167, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 1, NULL),
(168, 'Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 1, NULL),
(169, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Dashboard', '2025-10-25 07:41:30.262', 1, NULL),
(170, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Reception', '2025-10-25 07:41:30.262', 1, NULL),
(171, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Vault', '2025-10-25 07:41:30.262', 1, NULL),
(172, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Employees', '2025-10-25 07:41:30.262', 1, NULL),
(173, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Players', '2025-10-25 07:41:30.262', 1, NULL),
(174, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Cages', '2025-10-25 07:41:30.262', 1, NULL),
(175, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Slot Machines', '2025-10-25 07:41:30.262', 1, NULL),
(176, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Tables', '2025-10-25 07:41:30.262', 1, NULL),
(177, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Casino Configuration', '2025-10-25 07:41:30.262', 1, NULL),
(178, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Access Control', '2025-10-25 07:41:30.262', 1, NULL),
(179, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Notifications', '2025-10-25 07:41:30.262', 1, NULL),
(180, 'Super_Admin', 1, 1, 1, '2025-10-25 07:41:30.262', 'Transactions', '2025-10-25 07:41:30.262', 1, NULL),
(313, 'Admin', 1, 1, 1, '2026-01-24 21:07:33.585', 'Reports', '2026-01-24 21:07:33.585', 1, NULL),
(314, 'Super_Admin', 1, 1, 1, '2026-01-24 21:07:33.622', 'Reports', '2026-01-24 21:07:33.622', 1, NULL),
(315, 'Reception_Executive', 0, 0, 0, '2026-01-24 21:12:43.425', 'Reports', '2026-01-24 21:12:43.425', 0, NULL),
(316, 'Dealer', 0, 0, 0, '2026-01-24 21:12:43.461', 'Reports', '2026-01-24 21:12:43.461', 0, NULL),
(317, 'Reception_Supervisor', 0, 0, 0, '2026-01-24 21:12:43.462', 'Reports', '2026-01-24 21:12:43.462', 0, NULL),
(318, 'Reception_Manager', 0, 0, 0, '2026-01-24 21:12:43.464', 'Reports', '2026-01-24 21:12:43.464', 0, NULL),
(319, 'Cage_Executive', 0, 0, 0, '2026-01-24 21:12:43.465', 'Reports', '2026-01-24 21:12:43.465', 0, NULL),
(320, 'Cage_Supervisor', 0, 0, 0, '2026-01-24 21:12:43.466', 'Reports', '2026-01-24 21:12:43.466', 0, NULL),
(321, 'Cage_Manager', 1, 1, 1, '2026-01-24 21:12:43.466', 'Reports', '2026-01-24 21:12:43.466', 0, NULL),
(322, 'Slot_Executive', 0, 0, 0, '2026-01-24 21:12:43.467', 'Reports', '2026-01-24 21:12:43.467', 0, NULL),
(323, 'Slot_Supervisor', 0, 0, 0, '2026-01-24 21:12:43.468', 'Reports', '2026-01-24 21:12:43.468', 0, NULL),
(324, 'Slot_Manager', 0, 0, 0, '2026-01-24 21:12:43.469', 'Reports', '2026-01-24 21:12:43.469', 0, NULL),
(325, 'Pit_Supervisor', 0, 0, 0, '2026-01-24 21:12:43.471', 'Reports', '2026-01-24 21:12:43.471', 0, NULL),
(326, 'Inspector', 0, 0, 0, '2026-01-24 21:12:43.472', 'Reports', '2026-01-24 21:12:43.472', 0, NULL),
(327, 'Casino_Manager', 1, 1, 1, '2026-01-24 21:12:43.474', 'Reports', '2026-01-24 21:12:43.474', 0, NULL);


-- Dumping data for table `vaultbalance`
INSERT INTO `vaultbalance` (`vault_id`, `location_name`, `currency_code`, `total_cash`, `total_chips`, `total_assets`, `last_updated`, `total_online`, `total_tito`) VALUES
(1, 'Main Vault', 'INR', 10000000.000000000000000000000000000000, 2148000000.000000000000000000000000000000, 2158000000.000000000000000000000000000000, '2026-09-09 14:42:38.071', 0.000000000000000000000000000000, 0.000000000000000000000000000000);


-- Dumping data for table `vaultchipdenomination`
INSERT INTO `vaultchipdenomination` (`id`, `vault_id`, `chip_denomination`, `chip_color`, `quantity`, `total_value`, `chip_image`, `actual_quantity`, `last_updated`, `type_of_chip`) VALUES
(5, 1, 10000.000000000000000000000000000000, NULL, 10000, 23000000.000000000000000000000000000000, '/uploads/chip-images/cwtyv474uiko0006kktvslh7h.png', 10000, '2026-09-04 10:13:59.252', 'Cash_Chips'),
(6, 1, 200.000000000000000000000000000000, NULL, 10000, 1980000.000000000000000000000000000000, '/uploads/chip-images/otje2x8t56kcg4l6zp2i9ppph.png', 10000, '2026-09-04 12:47:12.448', 'Cash_Chips'),
(7, 1, 100.000000000000000000000000000000, NULL, 10000, 990000.000000000000000000000000000000, '/uploads/chip-images/hm4piz3zz05gnxpjqzeuxzlye.png', 10000, '2026-09-04 12:48:07.861', 'Cash_Chips'),
(8, 1, 500.000000000000000000000000000000, NULL, 10000, 4950000.000000000000000000000000000000, '/uploads/chip-images/tmubgzuaaxjp2cc9t3l9z1yin.png', 10000, '2026-09-04 21:50:28.823', 'Cash_Chips'),
(9, 1, 1000.000000000000000000000000000000, NULL, 10000, 11300000.000000000000000000000000000000, '/uploads/chip-images/lpheuim0rdeutvc77f9jqrhkn.png', 10000, '2026-09-04 21:50:47.072', 'Cash_Chips'),
(10, 1, 5000.000000000000000000000000000000, NULL, 10000, 50200000.000000000000000000000000000000, '/uploads/chip-images/fu9smzpp7iehjdmopc3ytu5ft.png', 10000, '2026-09-04 21:51:12.896', 'Cash_Chips'),
(11, 1, 25000.000000000000000000000000000000, NULL, 10000, 125000000.000000000000000000000000000000, '/uploads/chip-images/wsqhc5qihomr8mmdwcr80apss.png', 10000, '2026-09-04 21:51:58.491', 'Cash_Chips'),
(12, 1, 50000.000000000000000000000000000000, NULL, 10000, 250000000.000000000000000000000000000000, '/uploads/chip-images/swcgxaxvxe97ajy8p5x06q3op.png', 10000, '2026-09-04 21:52:13.960', 'Cash_Chips'),
(13, 1, 1000.000000000000000000000000000000, NULL, 10000, 900000.000000000000000000000000000000, '/uploads/chip-images/x1uuvapxxzdps2kejt2osfoy1.png', 10000, '2026-09-04 21:54:20.797', 'Cash_Chips'),
(14, 1, 5000.000000000000000000000000000000, NULL, 10000, 11500000.000000000000000000000000000000, '/uploads/chip-images/c52zvw7xiecia4lyqzrlu57ui.png', 10000, '2026-09-04 21:54:35.994', 'Cash_Chips'),
(15, 1, 10000.000000000000000000000000000000, NULL, 10000, 9000000.000000000000000000000000000000, '/uploads/chip-images/qdofgzmk4bhwxb5vvit7vle7w.png', 10000, '2026-09-04 21:54:55.133', 'Cash_Chips'),
(16, 1, 25000.000000000000000000000000000000, NULL, 10000, 57500000.000000000000000000000000000000, '/uploads/chip-images/rr58vbew0z6heqzsa0f1240p6.png', 10000, '2026-09-04 21:55:35.750', 'Cash_Chips'),
(17, 1, 1000.000000000000000000000000000000, NULL, 10000, 1000000.000000000000000000000000000000, '/uploads/chip-images/bf2pjmoyl2epqts0ga0hksrjj.png', 10000, '2026-09-07 20:16:39.810', 'NonNegotiable_NN'),
(18, 1, 5000.000000000000000000000000000000, NULL, 10000, 5000000.000000000000000000000000000000, '/uploads/chip-images/hdoho3j7pmwi2g8ow8jh5gjwb.png', 10000, '2026-09-07 20:17:03.247', 'NonNegotiable_NN'),
(19, 1, 10000.000000000000000000000000000000, NULL, 10000, 10000000.000000000000000000000000000000, '/uploads/chip-images/c0qyvjsjybnof9qa4wneai7iy.png', 10000, '2026-09-07 20:17:22.892', 'NonNegotiable_NN'),
(20, 1, 25000.000000000000000000000000000000, NULL, 10000, 25000000.000000000000000000000000000000, '/uploads/chip-images/i6apvdniov11hi6q4ixfcumab.png', 10000, '2026-09-07 20:17:41.384', 'NonNegotiable_NN'),
(21, 1, 1000.000000000000000000000000000000, NULL, 10000, 1000000.000000000000000000000000000000, '/uploads/chip-images/f4gtbhg6jokvqq5kqdrabqgiq.png', 10000, '2026-09-07 20:18:05.136', 'JunketChip_JC'),
(22, 1, 5000.000000000000000000000000000000, NULL, 10000, 5000000.000000000000000000000000000000, '/uploads/chip-images/mt8776yjmkjnub9rpxqtgyji2.png', 10000, '2026-09-07 20:18:22.879', 'JunketChip_JC'),
(23, 1, 10000.000000000000000000000000000000, NULL, 10000, 10000000.000000000000000000000000000000, '/uploads/chip-images/l1lmtj71oxf59ufskkwulroax.png', 10000, '2026-09-07 20:18:46.242', 'JunketChip_JC'),
(24, 1, 25000.000000000000000000000000000000, NULL, 10000, 25000000.000000000000000000000000000000, '/uploads/chip-images/i17k6vtsqkapc2fvekzvy1gur.png', 10000, '2026-09-07 20:19:22.751', 'JunketChip_JC');


-- Dumping data for table `vaulttransaction`
INSERT INTO `vaulttransaction` (`transaction_id`, `vault_id`, `transaction_type`, `asset_type`, `denomination`, `quantity`, `total_value`, `currency_code`, `source`, `destination`, `reference_id`, `authorized_by`, `performed_by`, `transaction_time`, `notes`, `gaming_day_id`, `cage_id`, `table_id`) VALUES
(1, 1, 'TRANSFER', 'CASH', 0.000000000000000000000000000000, 0, 1000000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', 'Cash of INR 1000000 added to Cage 1', 6, 1, 0),
(2, 1, 'TRANSFER', 'CHIP', 50000.000000000000000000000000000000, 100, 5000000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 50000 Denomination added to Cage 1', 6, 1, 0),
(3, 1, 'TRANSFER', 'CHIP', 25000.000000000000000000000000000000, 100, 2500000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 25000 Denomination added to Cage 1', 6, 1, 0),
(4, 1, 'TRANSFER', 'CHIP', 25000.000000000000000000000000000000, 100, 2500000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 25000 Denomination added to Cage 1', 6, 1, 0),
(5, 1, 'TRANSFER', 'CHIP', 10000.000000000000000000000000000000, 100, 1000000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 10000 Denomination added to Cage 1', 6, 1, 0),
(6, 1, 'TRANSFER', 'CHIP', 10000.000000000000000000000000000000, 100, 1000000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 10000 Denomination added to Cage 1', 6, 1, 0),
(7, 1, 'TRANSFER', 'CHIP', 5000.000000000000000000000000000000, 100, 500000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 5000 Denomination added to Cage 1', 6, 1, 0),
(8, 1, 'TRANSFER', 'CHIP', 5000.000000000000000000000000000000, 100, 500000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 5000 Denomination added to Cage 1', 6, 1, 0),
(9, 1, 'TRANSFER', 'CHIP', 1000.000000000000000000000000000000, 100, 100000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 1000 Denomination added to Cage 1', 6, 1, 0),
(10, 1, 'TRANSFER', 'CHIP', 1000.000000000000000000000000000000, 100, 100000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 1000 Denomination added to Cage 1', 6, 1, 0),
(11, 1, 'TRANSFER', 'CHIP', 500.000000000000000000000000000000, 100, 50000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 500 Denomination added to Cage 1', 6, 1, 0),
(12, 1, 'TRANSFER', 'CHIP', 200.000000000000000000000000000000, 100, 20000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 200 Denomination added to Cage 1', 6, 1, 0),
(13, 1, 'TRANSFER', 'CHIP', 100.000000000000000000000000000000, 100, 10000.000000000000000000000000000000, 'INR', 'Vault', 'Cage 1', '1788874356548-FLFQAS', 3, 3, '2026-09-08 13:32:36.376', '100 Quantity of 100 Denomination added to Cage 1', 6, 1, 0);

UPDATE CasinoManagementActual.VaultChipDenomination
SET quantity = 10000, actual_quantity = 10000, total_value = chip_denomination * quantity;

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;
    