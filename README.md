# AK4Y VIPSystemV2 - ESX Donate & VIP Menu

A modern and customizable donate/VIP shop system for ESX-based FiveM servers.  
Players can buy VIP coins, redeem codes, purchase bundles, vehicles, items, and more through an in-game menu.

---

## 🎬 Preview

[![Preview Video](https://img.youtube.com/vi/qSKxl5bK1r4/0.jpg)](https://www.youtube.com/watch?v=qSKxl5bK1r4&ab_channel=ak4yscripts)

---

## Features

- ESX (1.9.4+) support
- oxmysql and ghmattimysql compatible
- Coin/credit system for in-game purchases
- Admin commands to add/remove credits
- Promo code system for giveaways
- Bundles (multiple items/vehicles in one pack)
- Easy to translate and customize
- Clean UI

---

## Installation

1. **Upload Files:**  
   Upload the entire resource folder to your FiveM `resources` directory.

2. **Dependencies:**  
   - ESX (at least v1.9.4 recommended)
   - oxmysql or ghmattimysql
   - (Optional) gksphone or gcphone for phone number features

3. **Database:**  
   Execute these queries in your database:

   ```sql
   CREATE TABLE IF NOT EXISTS `ak4y_vipsystemv2` (
     `id` int(11) NOT NULL AUTO_INCREMENT,
     `identifier` varchar(255) NOT NULL DEFAULT '0',
     `coinAmount` int(11) NOT NULL DEFAULT 0,
     PRIMARY KEY (`id`),
     UNIQUE KEY `identifier` (`identifier`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

   CREATE TABLE IF NOT EXISTS `ak4y_vipsystemv2_codes` (
     `code` varchar(255) NOT NULL,
     `coinAmount` int(11) NOT NULL DEFAULT 0,
     PRIMARY KEY (`code`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
